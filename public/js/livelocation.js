// Values of MAP_CENTER_LAT, MAP_CENTER_LNG, and MAP_ZOOM to be obtained from
// /js/constant.js.

var map = null;
var shadow = null;
var fixed_icon = null;
var moving_icon = null;
var run = true;
var device_map = {};
var point_map = {};

$(function(){
    $('li .live-location').addClass("active").mouseenter();
    $('#menu ul.menu-liveview').show();

    var MAPFILES_URL = 'http://maps.gstatic.com/intl/en_us/mapfiles/';
    var MAPICONS_URL = '/public/' + theme + '/images/mapicons/';

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

    google.maps.event.addListener(map, 'dragstart', function() {
        run = false;
    });
    google.maps.event.addListener(map, 'dragend', function() {
        run = true;
    });
    /*
    google.maps.event.addListener(map, 'bounds_changed', function() {
        run = false;
    });
    */

    shadow = new google.maps.MarkerImage(
        MAPFILES_URL + "shadow50.png",
        new google.maps.Size(37, 34),
        new google.maps.Point(0, 0),
        new google.maps.Point(10, 34)
    );

    fixed_icon = new google.maps.MarkerImage(
        MAPICONS_URL + "cctv.png"
    );
    moving_icon = new google.maps.MarkerImage(
        MAPICONS_URL + "car.png"
    );

    $(document).everyTime(2000, function() {
        if (run) {
            disableViewPortTriggers();
            var bounds = map.getBounds();
            if (bounds) {
                nept = bounds.getNorthEast();
                swpt = bounds.getSouthWest();
                ajaxGet("/api/location/view_port/list_devices_full/" + swpt.lat() + "/" + swpt.lng() + "/" + nept.lat() + "/" + nept.lng(), null, updateMarkers, enableViewPortTriggers);
            } else {
                enableViewPortTriggers();
            }
        }
    }, 0);
});

function disableViewPortTriggers () {
    run = false;
}

function enableViewPortTriggers () {
    run = true;
}

function attachInfoWindow(marker) {
    var infowindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function() {
        for (var device_id in device_map) {
            var device = device_map[device_id];
            device.infowindow.close();
        }
        infowindow.open(map, marker);
    });
    return infowindow;
}

function updateMarkers(plist) {
    var bounds = new google.maps.LatLngBounds();

    // Mark all devices as not current.
    for (var device_id in device_map) {
        var device = device_map[device_id];
        device.current = false;
    }

    // Update device map from plist. Each device in plist will be marked
    // current.
    for (var i = 0; i < plist.length; i++) {
        var p = plist[i];

        // Skip points without lat or lng, device data, or id.
        if (p.lat == 0 && p.lng == 0)
            continue;
        if (p.data == undefined)
            continue;
        var device_id = p.data.device_id;
        if (device_id == undefined)
            continue;

        var device_name;
        if (p.data.device_name) {
            device_name = p.data.device_name;
        }
        else {
            device_name = 'Device ' + device_id;
        }

        var fixed = p.fixed;
        var icon = (fixed ? fixed_icon : moving_icon);

        var latlng = new google.maps.LatLng(p.lat, p.lng);
        bounds.extend(latlng);

        var device = device_map[device_id];
        if (device == undefined) {
            var marker = new google.maps.Marker({
                'position': latlng,
                'map': map,
                'icon': icon
            });
            var infowindow = attachInfoWindow(marker);
            device = {
                marker: marker,
                infowindow: infowindow
            };
            device_map[device_id] = device;
        }
        device.current = true;
        device.lat = p.lat;
        device.lng = p.lng;
        device.name = device_name;
        if (p.data != null) {
            if (p.data.device_url != null && p.data.liveview_unavailable) {
                device.device_url = p.data.device_url;
            }
            if (p.data.channels != null && !p.data.liveview_unavailable) {
                device.channels = p.data.channels;
            }
        }
        device.marker.setPosition(latlng);
        device.marker.setIcon(icon);
    }

    // Remove from device map the devices that are not current.
    for (var device_id in device_map) {
        var device = device_map[device_id];
        if (!device.current) {
            device.marker.setMap(null);
            delete device_map[device_id];
        }
    }

    // Construct point map, consolidating all devices that are at the
    // exact same lat and lng.
    point_map = {};
    for (var device_id in device_map) {
        var device = device_map[device_id];
        var point_id = device.lat + ',' + device.lng;
        var point = point_map[point_id];
        if (point == null) {
            point = {
                device_ids: []
            };
            point_map[point_id] = point;
        }
        point.device_ids.push(device_id);
    }

    // For each point, construct the marker title and info window HTML.
    for (var point_id in point_map) {
        var point = point_map[point_id];
        var title = '';
        var infohtml = '';
        for (var i = 0; i < point.device_ids.length; i++) {
            var device_id = point.device_ids[i];
            var device = device_map[device_id];
            var html = '<p class="live-location-text"><b>' + device.name + '</b></p>';
            var links = [];
//            if (device.channels) {
//                links.push('<a href="/live/1?view_config=' + device_id + ',0">Live View</a>');
//            }
            if (device.device_url) {
                links.push('<a onclick="window.open(\'' + device.device_url + '\');">Go to device</a>');
            }
            html = html + '<p class="live-location-text">' + links.join(' | ') + '</p>';
            if (i == 0) {
                title = device.name;
                infohtml = html;
            }
            else {
                title = title + ', ' + device.name;
                infohtml = infohtml + '<br />' + html;
            }
        }
        point.title = title;
        point.infohtml = infohtml;
    }

    // Add marker title and info window HTML to each device.
    for (var device_id in device_map) {
        var device = device_map[device_id];
        var point_id = device.lat + ',' + device.lng;
        var point = point_map[point_id];
        device.marker.setTitle(point.title);
        if (device.infowindow.getContent() != point.infohtml) {
            device.infowindow.setContent(point.infohtml);
        }
    }

    //map.fitBounds(bounds);
    enableViewPortTriggers();
}
