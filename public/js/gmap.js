// Values of MAP_CENTER_LAT, MAP_CENTER_LNG, and MAP_ZOOM to be obtained from
// /js/constant.js.

var MAPFILES_URL = "http://maps.gstatic.com/intl/en_us/mapfiles/";
var MAPICONS_URL = "http://google-maps-icons.googlecode.com/files/";

var colorList = ["marker", "marker_orange", "marker_green", "marker_yellow", "marker_white", "marker_purple", "marker_grey"];

var geocoder = null;
var map = null;
var shadow = null;
var selected  = null;
var dragged  = null;
var infowindow = null;

var markers = new Array();
var deviceids = new Array();
var idtopos = new Array();

$(function(){
    var page = window.location.pathname;
    geocoder = new google.maps.Geocoder();
    //init();
});

function init() {
    var latlng = new google.maps.LatLng(MAP_CENTER_LAT, MAP_CENTER_LNG);
    var myOptions = {
        zoom: MAP_ZOOM,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
        }
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    shadow = new google.maps.MarkerImage(
        MAPFILES_URL + "shadow50.png",
        new google.maps.Size(37, 34),
        new google.maps.Point(0, 0),
        new google.maps.Point(10, 34)
    );

    infowindow = new google.maps.InfoWindow({
        'size': new google.maps.Size(292, 120)
    });

    ajaxGet(searchDevice_url, null, populateMap);
}

function toggleListPanel() {
    if ($("#device-list-td").css("display") == "none") {
        $("#device-list-td").show();
        $("#togglebtn").html("&raquo;");
        $("#map").attr("width", "75%");
    } else {
        $("#device-list-td").hide();
        $("#togglebtn").html("&laquo;");
        $("#map").attr("width", "100%");
    }
}

function refreshPosition() {
    ajaxGet(getLedDetails_api, "data={\"sessionid\":\""+sessionid+"\"}", updateMarkers);
}

function updateMarkers(obj) {
    for (var i=0; i<obj.devices.length; i++) {
        var pos = idtopos[obj.devices[i].deviceid];

        // setting led message
        deviceids[pos].ledmsg = obj.devices[i].ledmsg;
        deviceids[pos].updatedtime = obj.devices[i].updatedtime;

        // setting position of marker
        var latlng = new google.maps.LatLng(obj.devices[i].lat, obj.devices[i].lng);
        markers[pos].setPosition(latlng);
        
    }
    if (selected != null)
        google.maps.event.trigger(markers[selected], 'click');
}

function populateMap(obj) {
    var resultsListHtml = "";
    var bounds = new google.maps.LatLngBounds();


    for (var i=0; i<obj.devices.length; i++) {
        // do not show on map if lat and lng is zero
        ///if (obj.devices[i].lat == 0 && obj.devices[i].lng == 0)
        //   continue;
        
        var icon = new google.maps.MarkerImage(
            getMarkerImageUrl(i),
            new google.maps.Size(20, 34),
            new google.maps.Point(0, 0),
            new google.maps.Point(10, 34)
        );

        var latlng = new google.maps.LatLng(obj.devices[i].lat,obj.devices[i].lng);
        bounds.extend(latlng);
        markers[i] = new google.maps.Marker({
            'position': latlng,
            'map': map,
            //'icon':icon,
            'shadow':shadow
        });
        deviceids[i] = obj.devices[i];
        idtopos[obj.devices[i].id] = i;

        //google.maps.event.addListener(markers[i], 'dragend', openUpdatePositionWindow(i, obj.devices[i], markers[i]));
        google.maps.event.addListener(markers[i], 'click', openInfoWindow(i, obj.devices[i], markers[i]));

        var desc_html = "";
        if (obj.devices[i].name != null){
            desc_html += '<table width="100%" class="font-sub-menu "><tbody>';
            desc_html += '<tr><td colspan="2"><div class="location-icon LED-image"></div> <label>'+obj.devices[i].name+'</label></td></tr>';
            //desc_html += '<tr><td><label>Service No.</label></td><td><span>'+obj.devices[i].bus_service+'</span></td></tr>';
            desc_html += '<tr><td colspan="2"><div class="tip msg-device-icon LED-image" alt="Send immediate message to LED" style="display:none" onClick="openShadow(\''+obj.devices[i].name+'\', \''+sendLedMsg_page+'?id='+obj.devices[i].id+'\', 500,300)"></div>';
            desc_html += '<div class="tip in-service" alt="Turn on testing mode" onclick="toggleTestingMode(this,\''+obj.devices[i].name+'\');"></div>';
            desc_html += '<div class="clear"></div></td></tr></tbody></table>';
        }
        resultsListHtml += getResultsListItem(i, desc_html);
    }

    map.fitBounds (bounds);
    $("#device-List").html(resultsListHtml);
    setTimeout('$(".msg-device-icon").css("display","")',1500);

    $('.tip').qtip({
        show: 'mouseover',
        position: { target: 'mouse' },
        hide: 'mouseout',
        style: { name: 'light', tip: true }
    });
}

function toggleTestingMode(elem, name) {
    

    if ($(elem).attr("class") == "in-service") {
        if (!confirm(ROUTE_SETTEST_CONFIRM.replace("#{mode}", "TESTING").replace("#{name}", name))) {
            return;
        }
        ajaxPost(setDeviceStatus_api, "status=testing",
            function(responseObj) {
                if (responseObj.status == STATUS_SUCCESS) {
                    $(elem).attr("class", "under-testing");
                } else {
                    setMessage(ERROR + " " + responseObj.reason, true);
                }
            });
        
    } else {

        if (!confirm(ROUTE_SETTEST_CONFIRM.replace("#{mode}", "OPERATION").replace("#{name}", name))) {
            return;
        }
        ajaxPost(setDeviceStatus_api, "status=operation",
            function(responseObj) {
                if (responseObj.status == STATUS_SUCCESS) {
                    $(elem).attr("class", "under-service");
                } else {
                    setMessage(ERROR + " " + responseObj.reason, true);
                }
            });
    }
}

function openInfoWindow(resultNum, result, marker) {
    return function() {
        if (selected != null) 
            $("#p" + selected).attr("class", "map-list-item");
   
        //var bounds = new google.maps.LatLngBounds();
        //bounds.extend(marker.getPosition());
        //map.fitBounds(bounds);
        if (map.getZoom() < 11) {
            map.setZoom(11);
        }

        if (result.ledmsg == null)
            result.ledmsg = "";

        if (result.updatedtime == null)
            result.updatedtime = "";
        
        var content = '<div class="map-bubble"><table width="100%"><tbody>';
        content += '<tr><td><label>'+result.name+'</label></td></tr>';
        //content += '<tr><td><label>Service No.</label></td><td><span>'+result.bus_service+'</span></td></tr>';
        content += '<tr><td colspan="2"><span>'+result.ledmsg+'</span></td></tr>';
        content += '<tr><td colspan="2"><span>'+result.updatedtime+'</span></td></tr>';
        content += '<tr><td colspan="2"><div></div></td></tr>';
        content += '</tbody></table></div>';

        //content+="<a onclick=\"openShadow("+result.deviceid+", '"+result.devicename+"');\" href=\"javascript:void(0);\" rel=\"shadowbox;height=470;width=650\">See Live View</a>"
        infowindow.setContent(content);
        infowindow.open(map, marker);

        //$("#camList").scrollTop = $("#p" + resultNum).offsetTop - $("#camList").offsetTop;
        document.getElementById('device-List').scrollTop = document.getElementById('p' + resultNum).offsetTop - document.getElementById('device-List').offsetTop;
        selected = resultNum;
        $("#p" + selected).attr("class", "map-list-item-selected");
    };
}

function openUpdatePositionWindow(resultNum, result, marker) {
    return function() {
        if (dragged != null) {
            revertPosition(deviceids[dragged],markers[dragged]);
        }
        var content = "<div style=\"padding:10px;\" class=\"font-normal\"><b><p>Update position of "+result.name+"?</p></b></div>";
        content += "<div id=\"updateWindowBtns\"><input type=\"button\" value=\"Yes\" onclick=\"setNewPos(true,"+resultNum+");\"/> ";
        content += "<input type=\"button\" value=\"No\" onclick=\"setNewPos(false,"+resultNum+");\"/></div>";
        infowindow.setContent(content);
        infowindow.open(map, marker);
        var listener = google.maps.event.addListener(infowindow, 'closeclick', function() {
            revertPosition(result,marker);
            google.maps.event.removeListener(listener);
            dragged = null;
        });
        dragged = resultNum;
    };
}

function setNewPos(toSave, arrNum) {
    if (toSave) {
        var deviceObj = deviceids[arrNum];
        
        var object = deviceObj;
        object.sessionid = sessionid;
        object.lat = markers[arrNum].getPosition().lat();
        object.lng = markers[arrNum].getPosition().lng();
        $("#updateWindowBtns").html("<span class=\"font-normal\"><img src=\""+loader_url+"\"/> Updating...</span>");

        ajaxPost(editDevice_url, "data="+JSON.stringify(object),
            function(responseObj) {
                if (responseObj.status == STATUS_SUCCESS) {
                    setMessage(DEVICE_UPDATED.replace("#{name}", deviceObj.name));

                    deviceObj.lat = object.lat;
                    deviceObj.lng = object.lng;
                    deviceids[arrNum] = deviceObj;
                    infowindow.close();
                } else {
                    setMessage(ERROR + " " + responseObj.reason, true);
                    revertPosition(deviceids[arrNum], markers[arrNum]);
                    infowindow.close();
                }
            },
            function() {
                revertPosition(deviceids[arrNum], markers[arrNum]);
                setMessage(FAIL_TO_CONNECT, true);
                infowindow.close();
            }
        );
    } else {
        revertPosition(deviceids[arrNum], markers[arrNum]);
        infowindow.close();
    }
    dragged = null;
}

function revertPosition (deviceobj, marker) {
    var latlng = new google.maps.LatLng(deviceobj.lat, deviceobj.lng);
    marker.setPosition(latlng);
}

function selectMarker(n) {
    google.maps.event.trigger(markers[n], 'click');
}

function getMarkerImageUrl(resultNum) {
    return MAPFILES_URL + colorList[Math.floor(resultNum/26)] + String.fromCharCode(65 + resultNum%26) + ".png";

/*var strNum = "";
    if (resultNum < 10) {
        strNum = "0" + resultNum
    } else
        strNum = ""+resultNum;
    return MAPICONS_URL + "red" + strNum + ".png";*/
}

function getResultsListItem(resultNum, resultDescription) {
    var html  = '<a onclick="selectMarker(' + resultNum + ')">';
    html += '<div class="map-list-item" id="p' + resultNum + '">';
    html += '<table><tr valign="top">';
    html += '<td style="padding: 2px">' + resultDescription + '</td>';
    html += '</tr></table>';
    html += '</div></a>';
    return html;
}


function geocode(request, containers) {
    geocoder.geocode(request, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            value = results[0].geometry.location.toString();
            value = value.replace('(', '');
            value = value.replace(')', '');
            var coords = value.split(',');
            lat = parseFloat(coords[0]);
            lng = parseFloat(coords[1]);
            containers.lat.val(lat);
            containers.lng.val(lng);
            $("#geocode-error").hide();
        } else if(status == google.maps.GeocoderStatus.ZERO_RESULTS) {
            $("#geocode-error").show();
            $("#geocode-error").html("Address not in database, please input manually.");
            //setMessage("We could not locate the place you have entered. You may want to enter the latitude and longitude yourself", true);
        } else {
            $("#geocode-error").show();
            $("#geocode-error").html("Address not in database, please input manually");
            //setMessage("We could not find the coordinates for the following reason: " + status, true);
        }
        $("#finding-geo").hide();
    });
}

