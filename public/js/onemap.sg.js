//Declare the variables to be used in the REST URL as parameters.
document.write('<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>');
document.write('<script type="text/javascript">djConfig = { parseOnLoad: true }</script>');


var oneMapGif = "http://www.onemap.sg/plugin/images/Red_glow.gif";
var host = "http://www.onemap.sg/";
var _baseMapHost = "http://www.onemap.sg/ArcGIS/rest/services/";
var _baseMapURL = _baseMapHost + "basemap/MapServer";
var tileHost1 = "http://t1.onemap.sg/ArcGIS/rest/services/"
var tileHost2 = "http://t2.onemap.sg/ArcGIS/rest/services/"
var _baseMapURL1;
var _baseMapURL2;
//var _OneMapGlobalToken="";
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





//
var restResponse;
var parsedJSON;
var url;
var XYGraphicsLayer;

var restURL = "";

var OneMap;
var NewOneMap;
var _OneMapDiv;


function GetOneMap(divName, baseMap, optionalProps) {

    try { var center = optionalProps.center; } catch (err) { }
    try { var level = optionalProps.level; } catch (err) { }
    try { var layer = optionalProps.layer; } catch (err) { }

if (baseMap.toUpperCase() == "SM") {
        _baseMapURL = _baseMapHost + "basemap" + "/MapServer";
	_baseMapURL1=tileHost1 + "basemap" + "/MapServer";
	_baseMapURL2=tileHost2 + "basemap" + "/MapServer";
    }
    else if (baseMap.toUpperCase() == "LL") {
        _baseMapURL = _baseMapHost + "LOT_VIEW" + "/MapServer";
	_baseMapURL1=tileHost1 + "LOT_VIEW" + "/MapServer";
	_baseMapURL2=tileHost2 + "LOT_VIEW" + "/MapServer";
    }
    else {
        _baseMapURL = _baseMapHost + baseMap + "/MapServer";
	_baseMapURL1=tileHost1 + baseMap + "/MapServer";
	_baseMapURL2=tileHost2 + baseMap + "/MapServer";

    }

    NewOneMap = this;
    _OneMapDiv = divName
    dojo.require("esri.map");



    esriConfig.defaults.map.slider = { left: "5px", top: "5px", width: null, height: "100px" };

var tiledMapServiceLayer =new  esri.layers.ArcGISTiledMapServiceLayer(_baseMapURL,{tileServers:[_baseMapURL1,_baseMapURL2]});

    dojo.addOnLoad(function() {
        var OneMap3;
        var startExtent = getExtentForLevelnCenter(center, level);
        var OneMap3 = new esri.Map(_OneMapDiv, { extent: startExtent });


        
	
////////////////added to get tiles from AWS//////////////////

dojo.declare("OM.CustomTileServiceLayer", esri.layers.TiledMapServiceLayer, {
        constructor: function() {
          this.spatialReference = new esri.SpatialReference({ wkid:3414 });
          this.initialExtent = (this.fullExtent = new esri.geometry.Extent(-4589.0529981345, 8065.64251572593, 96370.1129604966, 57234.9694430107, this.spatialReference));
          this.tileInfo = new esri.layers.TileInfo({
            "rows" : 256,
            "cols" : 256,
            "dpi" : 96,
            "format" : "JPEG",
            "origin" : {
              "x" : -5878011.89743302,
              "y" : 10172511.897433
            },
            "spatialReference" : {
              "wkid" : 3414
            },
            "lods" : [
              {"level" : 0, "resolution" : 76.4372195411057, "scale" : 288896},
              {"level" : 1, "resolution" : 38.2186097705529, "scale" : 144448},
              {"level" : 2, "resolution" : 19.1093048852764, "scale" : 72224},
              {"level" : 3, "resolution" : 9.55465244263822, "scale" : 36112},
              {"level" : 4, "resolution" : 4.77732622131911, "scale" : 18056},
              {"level" : 5, "resolution" : 2.38866311065955, "scale" : 9028},
              {"level" : 6, "resolution" : 1.19433155532978, "scale" : 4514},
              {"level" : 7, "resolution" : 0.597165777664889, "scale" : 2257},
              {"level" : 8, "resolution" : 0.298450596901194, "scale" : 1128}
            ]
          });

          this.loaded = true;
          this.onLoad(this);
        },

        getTileUrl: function(level, row, col) {
          return "http://cf1.onemap.sg/BASEMAP/Layers/_alllayers/" +
                  "L" + dojo.string.pad(level, 2, '0') + "/" +
                  "R" + dojo.string.pad(row.toString(16), 8, '0') + "/" +
                  "C" + dojo.string.pad(col.toString(16), 8, '0') + "." +
                  "jpg";
        }
      });
////////////////added to get tiles from AWS/////////////////////////////

        if (baseMap.toUpperCase() == "SM")
        {
            OneMap3.addLayer(new OM.CustomTileServiceLayer());
        }
        else
        {
            OneMap3.addLayer(tiledMapServiceLayer);
        }
////////////////added to get tiles from AWS/////////////////////////////

        //OneMap3.addLayer(tiledMapServiceLayer);

        XYGraphicsLayer = new esri.layers.GraphicsLayer();

        if ((layer != undefined) || (layer != null))
            OneMap3.addLayer(layer);
        NewOneMap.map = OneMap3;

        //custom methods
        NewOneMap.showLocation = showLocation;
        NewOneMap.mashupTheme = mashupTheme;
        NewOneMap.overlayKML = overlayKML;
        NewOneMap.clearGraphics = clearGraphics;
        NewOneMap.GetMultipleInfo = GetMultipleInfo;
        NewOneMap.onOneMapExtentChange = extentChangeAction;

        //dojo.connect(OneMap3, "onLoad", function() {

            var newdiv = document.createElement('div');

            var divIdName = 'OneMapLogo';
            newdiv.setAttribute('id', divIdName);
            //newdiv.setAttribute('onclick', function() { window.open('http://www.onemap.sg/home') });
 	    newdiv.setAttribute('onclick',"window.open('http://www.onemap.sg/home')");
            newdiv.setAttribute('style', "cursor:hand");
            newdiv.setAttribute('style', "cursor:pointer");
    
            document.getElementById(OneMap3.id+'_root').appendChild(newdiv);
            document.getElementById('OneMapLogo').innerHTML="<img src='" + host + "api/js/imap_small_logo.gif'  /><img src='http://www.onemap.sg/plugin/images/copyright.gif'>2012 OneMap";

            var t = $('#' + OneMap3.id+'_root').position().top;
            var l = $('#' + OneMap3.id+'_root').position().left;
            var ht = parseInt(document.getElementById(OneMap3.id).style.height.replace('px', ''))
            document.getElementById("OneMapLogo").style.top = (ht - 35) + 'px';
            //document.getElementById("OneMapLogo").style.left =  l + 'px';
            document.getElementById("OneMapLogo").style.position="absolute";
            document.getElementById("OneMapLogo").style.zIndex=100
          
       // });
    });

}


function getMultipleFactor(level) {

    var zoomLevel1 = 76.4372195411057
    var zoomLevel2 = 38.2186097705529
    var zoomLevel3 = 19.1093048852764
    var zoomLevel4 = 9.55465244263822
    var zoomLevel5 = 4.77732622131911
    var zoomLevel6 = 2.38866311065955
    var zoomLevel7 = 1.19433155532978
    var zoomLevel8 = 0.597165777664889
    var zoomLevel9 = 0.298450596901194
    var factor;
    factor = 200 * eval("zoomLevel" + level)
    return factor
}


function getExtentForPoint(x, y, buffer) {

    var xLocation1 = parseFloat(x) - buffer
    var yLocation1 = parseFloat(y) - buffer
    var xLocation2 = parseFloat(x) + buffer
    var yLocation2 = parseFloat(y) + buffer
    var startExtent = new esri.geometry.Extent({ xmin: xLocation1, ymin: yLocation1, xmax: xLocation2, ymax: yLocation2, spatialReference: { wkid: 3414} });
    return startExtent
}

function getExtentForLevelnCenter(center, level) {
    var buffer = 200;
    var xLocation
    var yLocation
    if ((center == null) || (center == undefined)) {
        center = "28968.103,33560.969";
        xLocation = center.split(",")[0]
        yLocation = center.split(",")[1]

        if ((level != null) || (level != undefined))
            buffer = getMultipleFactor(level);
        else
            buffer = getMultipleFactor(1);
    }
    else {
        //            var xLocation=center.split(",")[0]
        //            var yLocation=center.split(",")[1]

        if ((level != null) || (level != undefined))
            buffer = getMultipleFactor(level);
        else
            buffer = getMultipleFactor(1);
    }
    xLocation = center.split(",")[0]
    yLocation = center.split(",")[1]
    var extent = getExtentForPoint(xLocation, yLocation, buffer)
    return extent
}

function showLocation(xVal, yVal) {

    var OneMap2 = this.map;
    OneMap2.addLayer(XYGraphicsLayer);
    XYGraphicsLayer.clear();
    var xval = xVal;
    var yval = yVal;
    if (isNaN(xval) && isNaN(yval)) {
    }
    else {
        var XYsymbol = new esri.symbol.PictureMarkerSymbol(oneMapGif, 20, 20)
        var XYLocation = new esri.geometry.Point(xval, yval, new esri.SpatialReference({ wkid: 3414 }))
        var XYGraphic = new esri.Graphic(XYLocation, XYsymbol);
        XYGraphicsLayer.add(XYGraphic);
       

        var Srchpoint = new esri.geometry.Extent(XYLocation.x - 150, XYLocation.y - 150, XYLocation.x + 150, XYLocation.y + 150, new esri.SpatialReference({ wkid: 4326 }));
        OneMap2.setExtent(Srchpoint);
        
    }

}


//----------------extentChangeAction

function extentChangeAction(functionName) {

    var OneMap = this.map
    dojo.connect(OneMap, "onExtentChange", functionName)
}

//-------------- init xmlhttp -------------------------------------------------
var xmlhttp;
var xmlhttp2;
function GetXmlHttpObject() {
    if (window.XMLHttpRequest) {  // code for IE7+, Firefox, Chrome, Opera, Safari
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject) {  // code for IE6, IE5
        return new ActiveXObject("Microsoft.XMLHTTP");
    } return null;
}


//-------------- Basic Search -------------------------------------------------

function BasicSearch() {

    this.token = "";
    this.searchVal = "";
    this.whereClause = "";
    this.otptFlds = "";
    this.returnGeom = "";
    this.rset = "";
    this.GetSearchResults = GetSearchResults;
}


function GetSearchResults(callback) {

    var obj = this;

    var token = obj.token;
    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }
    var searchval = obj.searchVal;
    var whereclause = obj.whereClause;
    var otptFlds = obj.otptFlds;
    var returngeom = obj.returnGeom;
    var rset = obj.rset;

    url = host + "API/services.svc/basicSearch?token=" + token

    if (searchval != "") {
        url = url + "&searchVal=" + searchval;
    }
    if (whereclause != "") {

        url = url + "&wc=" + whereclause;
    }
    if (otptFlds != "") {

        url = url + "&otptFlds=" + otptFlds;
    }
    if (returngeom != "") {

        url = url + "&returnGeom=" + returngeom;
    }
    if (rset != "") {

        url = url + "&rset=" + rset;
    }

    $.getJSON(url + "&callback=?", function(parsedJSON) {
        var outPutResults = new Object;
        outPutResults.nop = parsedJSON.SearchResults[0].PageCount;
        outPutResults.results = parsedJSON.SearchResults.splice(1, parsedJSON.SearchResults.length);
        if (outPutResults.results.length == 0) { outPutResults.results = "No results"; }
        callback(outPutResults);
    });
}



//-------------- Event Details -------------------------------------------------
function EventData() {
    this.token = "";
    this.extent = "";
    this.rset = "";
    this.GetEventData = GetEventData;
}

var htmlString;

function GetEventData(callback) {
    var obj = this;
    var token = obj.token;
    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }

    var extent = obj.extent;
    var rset = obj.rset;

    url = host + "API/services.svc/getevents?token=" + token + "&extents=" + extent

    restURL = url;

    $.getJSON(url + "&callback=?", function(parsedJSON) {
        var outPutResults = new Object;
        outPutResults.nop = parsedJSON.SearchResults[0].PageCount;
        outPutResults.results = parsedJSON.SearchResults.splice(1, parsedJSON.SearchResults.length);
        if (outPutResults.results.length == 0) { outPutResults.results = "No results"; }
        callback(outPutResults);
    });

}


//-------------- Reverse Geocode -------------------------------------------------
function GetAddressInfo() {
    this.token = "";
    this.Postalcode = "";
    this.XY = "";
    this.GetAddress = GetAddress;
}

function GetAddress(callback) {
    var obj = this;
    var token = obj.token;
    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }

    var Postalcode = obj.Postalcode;
    var XY = obj.XY;
    url = host + "API/services.svc/revgeocode?token=" + token

    if ((Postalcode == "") && (XY == "")) {
        var outPutResults = new Object;
        outPutResults.results = "No results";
        callback(outPutResults);
        return
    }

    if (XY != "") {
        url = url + "&location=" + XY;
    }
    else if (Postalcode != "") {
        url = url + "&Postalcode=" + Postalcode;
    }

    restURL = url;

    $.getJSON(url + "&callback=?", function(parsedJSON) {
        var outPutResults = new Object;
        outPutResults.results = parsedJSON.GeocodeInfo;
        if (outPutResults.results.length == 0) { outPutResults.results = "No results"; }
        callback(outPutResults);
    });
}

//-------------- Static Map -------------------------------------------------
function StaticMap() {
    this.token = "";
    this.bmap = "";
    this.center = "";
    this.lyrIds = "";
    this.size = "";
    this.level = "";
    this.points = "";
    this.lines = "";
    this.polys = "";
    this.weight = "";
    this.color = "";
    this.fillColor = "";
    this.GetStaticMap = GetStaticMap
}

function GetStaticMap() {
    var obj = this;
    var token = obj.token;
    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }
    var bmap = obj.bmap;
    var center = obj.center;
    var lyrids = obj.lyrIds;
    var size = obj.size;
    var level = obj.level;
    var points = obj.points;
    var lines = obj.lines;
    var polys = obj.polys;

    var weight = obj.weight;
    var color = obj.color;
    var fillcolor = obj.fillcolor;

    if (points == "" && lines == "" && polys == "") {

        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids;
    }
    else if (points != "" && lines == "" && polys == "") {
        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids + "&points=" + points;
    }
    else if (points == "" && lines != "" && polys == "") {
        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids + "&lines=" + lines;
    }
    else if (points == "" && lines == "" && polys != "") {
        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids + "&polys=" + polys;
    }
    else if (points != "" && lines != "" && polys != "") {
        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids + "&points=" + points + "&polys=" + polys + "&lines=" + lines;
    }
    else if (points != "" && lines != "" && polys == "") {
        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids + "&points=" + points + "&lines=" + lines;
    }
    else if (points != "" && lines == "" && polys != "") {
        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids + "&points=" + points + "&polys=" + polys;
    }
    else if (points == "" && lines != "" && polys != "") {
        url = host + "API/services.svc/getMap?token=" + token + "&bmap=" + bmap + "&size=" + size + "&level=" + level + "&center=" + center + "&lyrIds=" + lyrids + "&polys=" + polys + "&lines=" + lines;
    }


    //For the weight, color and fill Color.
    if (lines != "" && polys != "") {
        if (weight != "")
        { url = url + "&weight=" + weight; }
        if (color != "")
        { url = url + "&color=" + color; }
        if (fillcolor != "")
        { url = url + "&fillColor=" + fillcolor; }
    }

    restURL = url;

    return url;


}


//--------------- Map Route --------------------------------------

function Route() {
    this.token = "";
    this.routeStops = "";
    this.routeMode = "";
    this.avoidERP = "";
    this.routeOption = "";
    this.barriers = "";
    this.GetRoute = GetRoute;
}

function GetRoute(callback) {

    var token = this.token;
    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }
    var routestops = this.routeStops;
    var routemode = this.routeMode;
    var avoiderp = this.avoidERP;
    var routeOption = this.routeOption;
    var barriers = this.barriers;

    url = host + "API/services.svc/route/solve?token=" + token + "&routeStops=" + routestops + "&routeMode=" + routemode + "&avoidERP=" + avoiderp + "&routeOption=" + routeOption + "&barriers=" + barriers;

    restURL = url;


    $.getJSON(url + "&callback=?", function(parsedJSON) {
        var outPutResults = new Object;
        outPutResults.results = parsedJSON

	    try{
       	    if (outPutResults.results.error.message != null){
	    if (outPutResults.results.error.message=="Error solving route")
	    {
	    outPutResults.results = "No results";
	    }
	    else if (outPutResults.results.error.message==""){
	        outPutResults.results = "No results";
	    }
	    else if (outPutResults.results.error.message=="stops exceed"){
	        outPutResults.results = "Stops more than nine";
	    }
	    }
        
         }
        catch(err)
        {
        callback(outPutResults);
        }

        
        //if (outPutResults.results.length == 0) { outPutResults.results = "No results"; }
        callback(outPutResults);
    });
}



//-------------- Theme Search -------------------------------------------------

function ThemeSearch() {

    this.token = "";
    this.searchVal = "";
    this.returnGeom = "";
    this.otptFlds = "";
    this.rset = "";
    this.GetThemeSearchResults = GetThemeSearchResults;
}

function GetThemeSearchResults(callback) {


    var obj = this;
    var token = obj.token;
    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }
    var searchval = obj.searchVal;
    var otptFlds = obj.otptFlds;
    var returnGeom = obj.returnGeom;
    var rset = obj.rset;
    url = host;
    if (searchval != "") {
        url = url + "API/services.svc/themeSearch?token=" + token + "&searchVal=" + searchval;
    }
    //Search Value and page numnber
    if (otptFlds != "") {

        url = url + "&otptFlds=" + otptFlds;
    }

    if (returnGeom != "") {

        url = url + "&returnGeom=" + returnGeom;
    }

    if (rset != "") {

        url = url + "&rset=" + rset;
    }

    restURL = url;

    $.getJSON(url + "&callback=?", function(parsedJSON) {
        var outPutResults = new Object;

        outPutResults.nop = parsedJSON.SearchResults[0].PageCount;
        outPutResults.results = parsedJSON.SearchResults.splice(1, parsedJSON.SearchResults.length);

        if (outPutResults.results.length == 0) { outPutResults.results = "No results"; }
        callback(outPutResults);
    });

}



//-------------- Mashup API  -- WIth all params -------------------------------------------------
var layerData = "-";


function GetLayerInfoClass() {
    this.themeName = "";
    this.ExtracLayerInfo = ExtracLayerInfo;

}

function ExtracLayerInfo(callback) {
    layerName = this.themeName
    var url = host + "API/services.svc/layerinfoDM?layername=" + layerName;

    restURL = url;

    $.getJSON(url + "&callback=?", function(parsedJSON) {
        var outPutResults = new Object;
        var firstRecord = parsedJSON.LayerInfo[0]
        outPutResults.RelatedTabName = firstRecord.ADD_TABLE_NAM

        if (firstRecord.ADD_TABLE_NAM != "") {
            var callOutURL = host + "API/services.svc/" + firstRecord.ADD_TABLE_NAM + "/" + firstRecord.CALLOUTFIELDNAME + "/"

            outPutResults.calloutURL = callOutURL;
        }
        else {
            outPutResults.calloutURL = firstRecord.CALLOUTURL;
        }

        outPutResults.calloutFieldName = firstRecord.CALLOUTFIELDNAME
        outPutResults.Category = firstRecord.CATEGORY
        outPutResults.FeatureType = firstRecord.FEATTYPE;
        outPutResults.MinLevel = firstRecord.MINLEVEL
        outPutResults.MaxLevel = firstRecord.MAXLEVEL
        outPutResults.IconPath = firstRecord.IconPath
        outPutResults.AgencyName = firstRecord.AGENCY
        outPutResults.FieldNames = firstRecord.FIELD_NAM_T
        outPutResults.Icon = firstRecord.ICON_NAM_T
        outPutResults.MapTipFieldName = firstRecord.FIELD_NAM_T.split(",")[0];
        outPutResults.visibleFields = firstRecord.SHOWNATTRIBS;
        outPutResults.pointColour = firstRecord.COLOR_T;
        outPutResults.color = firstRecord.COLOR
        outPutResults.outlineColor = firstRecord.OUTLINECOLOR
        outPutResults.lineThickness = firstRecord.LINETHICKNESS

        callback(outPutResults)
    });
}


function MashupData(oneMap) {
    this.token = "";
    this.themeName = "";
    this.outputFields = "";
    this.whereClause = "";
    this.extendedWhereClause = "";
    this.extent = "";
    this.map = "";
    this.graphicLayer = "";
    this.GetMashupData = GetMashupData;
    this.layerData = "";
    this.GetDataForCallout = GetDataForCallout;
}


function GetDataForCallout(graphic, wc, callback) {
    var mashupObj = this;
    var layerInfo = mashupObj.layerData;
    var calloutURL = layerInfo.calloutURL;

    if (calloutURL != "") {

        calloutURL = calloutURL + graphic.attributes[layerInfo.calloutFieldName];
        calloutURL = calloutURL + "?token=" + _OneMapGlobalToken
        if (wc != "") { calloutURL = calloutURL + "?wc=" + wc }

        $.getJSON(calloutURL + "&callback=?", function(parsedJSON) {
            var outPutResults = new Object;
            outPutResults = parsedJSON.SearchResults;
            callback(outPutResults);
        })
    }
    else {
        var outPutResults = new Array;

        outPutResults[0] = graphic.attributes;
        callback(outPutResults);
    }
}


function GetMashupData(callback) {

    var obj = this;
    var token = obj.token;
    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } else { _OneMapGlobalToken = token } } catch (err) { }
    var themename = obj.themeName;
    var otptFlds = obj.outputFields;
    var whereclause = obj.whereClause;
    var extent = obj.extent;
    var extendedWhereClause = obj.extendedWhereClause;
    var graphicLayer = obj.graphicLayer;
    var OneMap = obj.map

    url = host + "API/services.svc/mashupData";

    if (themename != "")
        url = url + "?token=" + token + "&themeName=" + themename;

    if (otptFlds != "")
        url = url + "&otptFlds=" + otptFlds;

    if (whereclause != "")
        url = url + "&wc=" + whereclause;

    if (extent != "")
        url = url + "&extents=" + extent;

    if (extendedWhereClause != "")
        url = url + "&exwc=" + extendedWhereClause;
    restURL = url;

    if ((obj.layerData == undefined) || (obj.layerData == "")) {
        var extractData = new GetLayerInfoClass()
        extractData.themeName = themename

        var extractedLayerData = extractData.ExtracLayerInfo(function(results) {
            layerData = results
        })
    }

    $.getJSON(url + "&callback=?", function(parsedJSON) {

        var outPutResults = new Object;
        if (parsedJSON.SrchResults.length == 1) {
            outPutResults.results = "No results";
            callback(outPutResults);
            return
        }

        outPutResults.count = parsedJSON.SrchResults[0].FeatCount;
        outPutResults.results = parsedJSON.SrchResults.splice(1, parsedJSON.SrchResults.length - 1);
        outPutResults.theme = themename;

        if ((obj.layerData == undefined) || (obj.layerData == "")) {
            obj.layerData = layerData;
        }
        else {
            layerData = obj.layerData;
        }

        var calloutFieldName = layerData.calloutFieldName
        var calloutFields = layerData.calloutFields;
        var calloutURL = layerData.calloutURL;
        var calloutUniqueFld = layerData.calloutUniqueFld;
        var iconPath = layerData.IconPath
        var featType = layerData.FeatureType
        var color = layerData.color

        outPutResults.calloutFieldName = calloutFieldName
        outPutResults.calloutURL = calloutURL
        outPutResults.calloutUniqueFld = calloutUniqueFld
        outPutResults.iconPath = iconPath
        outPutResults.featType = featType
        outPutResults.graphicLayer = graphicLayer;

        if ((layerData.color != undefined) && (layerData.color != undefined)) {
            outPutResults.color = hexToRGB(layerData.color);
        }
        else {
            outPutResults.color = '255,255,255';
        }

        if ((layerData.outlineColor != undefined) && (layerData.outlineColor != undefined)) {
            outPutResults.outlineColor = hexToRGB(layerData.outlineColor);
        }
        else {
            outPutResults.outlineColor = '255,255,255';
        }

        if ((layerData.lineThickness != undefined) && (layerData.lineThickness != undefined)) {
            outPutResults.lineThickness = layerData.lineThickness;
        }
        else {
            outPutResults.lineThickness = '1';
        }
        callback(outPutResults);
    });

}

function GetMultipleInfo(url, results) {

    $.getJSON(url + "?token=" + _OneMapGlobalToken + "&callback=?", function(parsedJSON) {

        var outPutResults = new Object;
        outPutResults = parsedJSON.SearchResults;
        results(outPutResults);

    })

}

function cutHex(h) { return (h.charAt(0) == "#") ? h.substring(1, 7) : h }

function hexToRGB(hexValue) {
    var h = hexValue;
    var r = parseInt((cutHex(h)).substring(0, 2), 16);
    var g = parseInt((cutHex(h)).substring(2, 4), 16);
    var b = parseInt((cutHex(h)).substring(4, 6), 16);
    return (r + ',' + g + ',' + b)
}


//---------------------------------------KML ------------------------------- 









//-------------------------------------- Overlay KML End here------------------------------- 
var OneMapKML;
function overlayKML(kmlFilePath) {



    OneMapKML = this.map;
    var pointcoordinates = new String();
    var linecoordinates = new String();
    var isFirefox = false;
    var url = kmlFilePath;
    var xmlDoc;
    
    if (url.indexOf('160.96.187.80')>0){url=host+"api/Services.svc/overlayKML?path=" + url}
    if (url.indexOf('www.onemap.sg')>0){url=host+"api/Services.svc/overlayKML?path=" + url}
    
    if (xmlDoc != null) return;
    if (document.implementation && document.implementation.createDocument) {

        var request = new XMLHttpRequest();
        request.open("GET", url, false);
        request.send(null);
        xmlDoc = (new DOMParser()).parseFromString(request.responseText, "text/xml");

        GetStringFromKML(xmlDoc);

    }
    else if (window.ActiveXObject) {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.onreadystatechange = function() {
            if (xmlDoc.readyState == 4) { isFirefox = false; GetStringFromKML(xmlDoc); }
        };
    }
    else {
        var request = new XMLHttpRequest();
        request.open("GET", url, false);
        request.send(null);
        xmlDoc = (new DOMParser()).parseFromString(request.responseText, "text/xml");
        GetStringFromKML(xmlDoc);
    }
    xmlDoc.load(url);


}


function verify() {
    if (xmlDoc.readyState != 4) {
        return false;
    }
}
var RootNode;
function GetStringFromKML(xmlDoc) {

   
    var nodeList = xmlDoc.XmlNodeList;

    var strng = new String();
    var str = String;
    str = "";
    var linestr = String;
    linestr = "";
    var nameValue = String;
    nameValue = ""
    RootNode= xmlDoc.documentElement;
    var nodelist1 = xmlDoc.getElementsByTagName("Placemark")

    if (nodelist1.length == 0) {
        alert("Sorry.No feature found in KML file.")
        return
    }

    for (var i = 0; i < nodelist1.length; i++) {
        linestr = "";
        str = "";
        nameValue="";
     
        var nodelist2 = nodelist1[i].getElementsByTagName("Point")
        var nodelist3 = nodelist1[i].getElementsByTagName("LinearRing")
        var nodelist4 = nodelist1[i].getElementsByTagName("LineString")

        if (nodelist2.length != 0) {
            var PointNode = nodelist1[i].getElementsByTagName("Point")[0].getElementsByTagName("coordinates")[0].childNodes[0].nodeValue;
                
            var infoWindowContent=GetInfoWindowContent(nodelist1[i]);
            
            var iconName=GetIconNameFromKMLNode(nodelist1[i]);
     
            addPointToMap(PointNode,infoWindowContent,iconName)
            str = ""
            
            }

        if (nodelist3.length != 0) {
            var LineNode = nodelist1[i].getElementsByTagName("LinearRing")[0].getElementsByTagName("coordinates")[0].text;
            
            try{
                   var description = nodelist1[i].getElementsByTagName("description")[0].childNodes[0].nodeValue;
                   var checkforname =nodelist1[i].xml;
                   if (checkforname.indexOf("<name>")>=0)
                   {
                      var name =nodelist1[i].getElementsByTagName("name")[0].childNodes[0].nodeValue;
                       if (name!=null && name!="" && name!=undefined)
                        {
                            nameValue=name+"<br/>"
                        }
                        if (description!=null && description!="" && description!=undefined)
                        {
                            nameValue+=description+"<br/>";
                        }
                    }
                   else
                   {
                       nameValue=description;
                   }
              }
            catch (err) 
            {
         
            }
            
            linestr += LineNode + "~"
            splitDataandAddPoint(str, linestr, nameValue);

            }

        if (nodelist4.length != 0) {
            var LineNode = nodelist1[i].getElementsByTagName("LineString")[0].getElementsByTagName("coordinates")[0].text;
            //var nameValue = nodelist1[i].getElementsByTagName("description")[0].childNodes[0].nodeValue
           try{
                   var description = nodelist1[i].getElementsByTagName("description")[0].childNodes[0].nodeValue;
                   var checkforname =nodelist1[i].xml;
                   if (checkforname.indexOf("<name>")>=0)
                   {
                      var name =nodelist1[i].getElementsByTagName("name")[0].childNodes[0].nodeValue;
                       if (name!=null && name!="" && name!=undefined)
                        {
                            nameValue=name+"<br/>"
                        }
                        if (description!=null && description!="" && description!=undefined)
                        {
                            nameValue+=description+"<br/>";
                        }
                    }
                   else
                   {
                        if (description!=null && description!="" && description!=undefined)
                        {
                            nameValue=description;
                        }
                   }
              }
            catch (err) 
            {
         
            }
            linestr += LineNode + "~"
            splitDataandAddLines(linestr, nameValue);

            }
    }

}

function GetIconNameFromKMLNode(inputNode)
{
    var iconName=""
    try 
    {
         
         try
         {
          var stylelist = RootNode.getElementsByTagName("Style");
         
          for (var i = 0; i < stylelist.length; i++) 
          {
              var styleurl = inputNode.getElementsByTagName("styleUrl")[0].text;
              styleurl=styleurl.replace('#','');
              var styleid= RootNode.getElementsByTagName("Style")[i].attributes.getNamedItem("id").nodeValue;
              if (styleurl==styleid)
              {
                 iconName=RootNode.getElementsByTagName("Style")[i].getElementsByTagName("IconStyle")[0].getElementsByTagName("Icon")[0].getElementsByTagName("href")[0].childNodes[0].nodeValue;
                 try
                 {
                 iconName+=","+RootNode.getElementsByTagName("Style")[i].getElementsByTagName("IconStyle")[0].getElementsByTagName("Icon")[0].getElementsByTagName("width")[0].childNodes[0].nodeValue;
                 iconName+=","+ RootNode.getElementsByTagName("Style")[i].getElementsByTagName("IconStyle")[0].getElementsByTagName("Icon")[0].getElementsByTagName("height")[0].childNodes[0].nodeValue;
                 }
                 catch(err)
                 {
                 iconName+=",20,20";
                 }
                 break;
              }
          
          }
         
         }
         catch(err)
         {
         iconName=inputNode.getElementsByTagName("Style")[0].getElementsByTagName("IconStyle")[0].getElementsByTagName("Icon")[0].getElementsByTagName("href")[0].childNodes[0].nodeValue;
         try
          {
           iconName+=","+RootNode.getElementsByTagName("Style")[i].getElementsByTagName("IconStyle")[0].getElementsByTagName("Icon")[0].getElementsByTagName("width")[0].childNodes[0].nodeValue;
           iconName+=","+ RootNode.getElementsByTagName("Style")[i].getElementsByTagName("IconStyle")[0].getElementsByTagName("Icon")[0].getElementsByTagName("height")[0].childNodes[0].nodeValue;
          }
         catch(err)
         {
         iconName+=",20,20";
         }
         }
        
         
         
         
    }
    catch (err) 
    {
         iconName=""
    }
    return iconName
           
}

function GetInfoWindowContent(inputNode)

{

 
    var nValue = "";
    var nameValue="";
   
    try {
     
        nValue = inputNode.getElementsByTagName("name")[0].childNodes[0].nodeValue;
        if (nValue!=null && nValue!="" && nValue!=undefined)
        {
        nameValue +=nValue + "</BR>"
        }
        else
        {
            nValue = inputNode.getElementsByTagName("name")[0].childNodes[0].text;
            if (nValue!=null && nValue!="" && nValue!=undefined)
            {
            nameValue +=nValue + "</BR>"
        }
        
        }
    }
    catch (err) {
         
    }

    try {
    
        nValue = inputNode.getElementsByTagName("description")[0].childNodes[0].nodeValue;
        
        if (nValue!=null && nValue!="" && nValue!=undefined)
        {
           nameValue += nValue + "</BR>";
           
        }
        else
        {
            nValue = inputNode.getElementsByTagName("description")[0].childNodes[0].text;
            
            if (nValue!=null && nValue!="" && nValue!=undefined)
            {
               nameValue += nValue + "</BR>";
            }
        
        }
        
    }
    catch (err) {
         
    }
    return nameValue
                    
}


function splitDataandAddLines(lineCord, nameValue) {


    if (lineCord.length != 0) {

        addPolylineToMap(lineCord.split(' '), nameValue)
    }

}


function splitDataandAddPoint(xyCord, lineCord, nameValue) {



    if (xyCord.length != 0) {
        inputXY = xyCord;
        var strLen = inputXY.length;
        inputXY = inputXY.slice(0, strLen - 1);
        var coords = new Array();
        coords = inputXY.split("~")
        for (var i = 0; i < coords.length; i++) {
            var coords1 = coords[i]
            var crds = new Array();
            crds = coords1.split("|")
            var crd = crds[0]
            var crd1 = crds[1]
            var nV = crd1.slice(0, crd1.length - 1)
            var fnV = new Array();
            fnV = nV.split("^@")
            var fnVfinal = fnV[i]
            var xCord = crd.split(",")[0]
            var yCord = crd.split(",")[1]
            addPointToMap(xCord, yCord, fnVfinal)
        }
    }

    if (lineCord.length != 0) {

        addPolygonToMap(lineCord.split(' '), nameValue)
    }

}


function addPointToMap(XY,infoWindowContent,iconURL)
{
    var lon, lat;
    lon=XY.split(",")[0]
    lat=XY.split(",")[1]
    var pointSymbol;
    if (iconURL==""){
        pointSymbol = new esri.symbol.SimpleMarkerSymbol().setSize(10).setColor(new dojo.Color([255, 0, 0]));   
    }
    else 
    { 
        try
        {
        pointSymbol = new esri.symbol.PictureMarkerSymbol(iconURL.split(",")[0], iconURL.split(",")[1], iconURL.split(",")[2]);
        }
        catch(err)
        {
        pointSymbol = new esri.symbol.PictureMarkerSymbol(iconURL,20,20);
        }
        
    }
    
    gsvc = new esri.tasks.GeometryService(host + "ArcGIS/rest/services/Geometry/GeometryServer");
    var geomPoint = new esri.geometry.Point(lon, lat, new esri.SpatialReference({ wkid: 4326 }));

    var graphic = new esri.Graphic(geomPoint, pointSymbol);
    var npr = new esri.SpatialReference({ wkid: 3414 });


    var infoTemplate1 = new esri.InfoTemplate();
    infoTemplate1.setTitle("KML Info");
    infoTemplate1.setContent("<div style='overflow-x:scroll;height:112px; width:200px'>" + infoWindowContent + "</div>");

    if (lon.split(".")[0] > 999) { 

        var graphic1 = new esri.Graphic(geomPoint, pointSymbol);

        graphic1.setInfoTemplate(infoTemplate1);
        OneMapKML.graphics.add(graphic1);
    }
    else {
        gsvc.project([geomPoint ], npr, function(featres) {
           var geomPoint1 = featres[0].geometry;
		var XYLocation = new esri.geometry.Point(featres[0].x, featres[0].y, new esri.SpatialReference({ wkid: 3414 }));

            var graphic1 = new esri.Graphic(XYLocation  , pointSymbol);
            graphic1.setInfoTemplate(infoTemplate1);
            OneMapKML.graphics.add(graphic1);
        });
    }
    

}

var tempPoint;

function addPolygonToMap(polyPath, nameValue) {


    var color = "255,0,0";
    var lineThickness = "1.2";
    var outlineColor = "0,0,255";

    gsvc = new esri.tasks.GeometryService(host + "ArcGIS/rest/services/Geometry/GeometryServer");
    var npr = new esri.SpatialReference({ wkid: 3414 });
    var poly;

    var coordType = 0
    var lngraphic = new esri.Graphic();

    var point1;
    var pointSymbol = new esri.symbol.SimpleMarkerSymbol().setSize(10).setColor(new dojo.Color([255, 0, 0]));

    var symbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID, new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color(outlineColor.split(",")), lineThickness), new dojo.Color((color + ",0.5").split(",")));
    var pntArr = new Array;

    var factor = 1;
    //Added for other KML
    if (polyPath[0].split(",")[0]> 200)
    {
    coordType = 1
    }
    if (polyPath.length > 30) { factor = 2 }
    for (var l = 0; l < polyPath.length; l=l+factor) {
    
        point1 = new esri.geometry.Point(polyPath[l].split(",")[0].replace('~', ''), polyPath[l].split(",")[1].replace('~', ''), new esri.SpatialReference({ wkid: 4326 }))
        pntArr.push(point1)

    }

    var polygon = new esri.geometry.Polygon(new esri.SpatialReference({ wkid: 4326 }));
    polygon.addRing(pntArr);
    lngraphic.geometry = polygon;
    var infoTemplate1 = new esri.InfoTemplate();
    infoTemplate1.setTitle("KML Info");

    infoTemplate1.setContent("<div style='overflow-x:scroll;height:112px; width:242px'>" + nameValue + "</div>");

    //coordType = 0
    if (coordType == 1) {
         lngraphic.setSymbol(symbol)

        lngraphic.setInfoTemplate(infoTemplate1);
        OneMapKML.graphics.add(lngraphic);
    }
    else {

        gsvc.project([lngraphic], npr, function(features) {
            var geomPoint1 = features[0].geometry;
            var graphic1 = new esri.Graphic(geomPoint1, symbol);
            graphic1.setInfoTemplate(infoTemplate1);
            OneMapKML.graphics.add(graphic1);
        });
    }

}


function addPolylineToMap(polyPath, nameValue) {
    
  
    var color = "255,0,0";
    var lineThickness = "1.2";
    var outlineColor = "0,0,255";

    gsvc = new esri.tasks.GeometryService(host + "ArcGIS/rest/services/Geometry/GeometryServer");
    var npr = new esri.SpatialReference({ wkid: 3414 });
    var poly;

    var coordType = 0
    var lngraphic = new esri.Graphic();

    var point1;
    //var pointSymbol = new esri.symbol.SimpleMarkerSymbol().setSize(10).setColor(new dojo.Color([255, 0, 0]));

    var symbol = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_DASH, new dojo.Color([255,0,0]), 3); //new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color(color.split(",")), 1.1);

    var pntArr = new Array;

    var factor = 1;
     if (polyPath[0].split(",")[0]> 200)
    {
    coordType = 1
    }
    if (polyPath.length > 30) { factor = 2 }
    for (var l = 0; l < polyPath.length; l = l + factor) {
        point1 = new esri.geometry.Point(polyPath[l].split(",")[0].replace('~', ''), polyPath[l].split(",")[1].replace('~', ''), new esri.SpatialReference({ wkid: 4326 }))

        pntArr.push(point1)

    }

    var polygon = new esri.geometry.Polyline(new esri.SpatialReference({ wkid: 4326 }));
    polygon.addPath(pntArr);
    lngraphic.geometry = polygon;
    var infoTemplate1 = new esri.InfoTemplate();
    infoTemplate1.setTitle("KML Info");

    infoTemplate1.setContent("<div style='overflow-x:scroll;height:112px; width:242px'>" + nameValue + "</div>");

    //coordType = 0
    if (coordType == 1) {
        lngraphic.setSymbol(symbol)

        lngraphic.setInfoTemplate(infoTemplate1);
        OneMapKML.graphics.add(lngraphic);
    }
    else {

        gsvc.project([lngraphic], npr, function(features) {
            var geomPoint1 = features[0].geometry;
            var graphic1 = new esri.Graphic(geomPoint1, symbol);
            graphic1.setInfoTemplate(infoTemplate1);
            OneMapKML.graphics.add(graphic1);
        });
    }

}



function clearGraphics() {
    var OneMap = this.map;
    try {
        OneMap.graphics.clear();
    }
    catch (Error) {
    }

}


//-------------- mashupTheme-------------------------------------------------
var _OneMapCurrExtents = "";

function mashupDataOnExtentChnage(extent) {
    _OneMapCurrExtents = extent.xmin + "," + extent.ymin + "," + extent.xmax + "," + extent.ymax;

    var mashupOneMap = this
    for (var i = 0; i < mashupOneMap.graphicsLayerIds.length; i++) {
        var mashupObject = new MashupData();
        var themeName = mashupOneMap.graphicsLayerIds[i]
        mashupObject.token = _OneMapGlobalToken
        mashupObject.themeName = themeName;
        mashupObject.extent = _OneMapCurrExtents;
        var _OneMapThemeGraphicsLayer = mashupOneMap._layers[themeName];
        mashupObject.graphicLayer = _OneMapThemeGraphicsLayer;
        mashupObject.GetMashupData(function(mashupResults) {
            var results = mashupResults.results;
            if (results == "No results") {
                return
            }

            var featcount = mashupResults.count;
            var themeName = mashupResults.theme
            var calloutFields = mashupResults.calloutFields;
            var calloutURL = mashupResults.calloutURL;
            var calloutUniqueFld = mashupResults.calloutUniqueFld;
            var iconPath = mashupResults.iconPath
            var featType = mashupResults.featType;
            var color = mashupResults.color
            var outlineColor = mashupResults.outlineColor
            var lineThickness = mashupResults.lineThickness
            var themeGraphicsLayer_1 = mashupResults.graphicLayer

            themeGraphicsLayer_1.clear();

            if (results.length == 0) { return }

            for (var i = 0; i < results.length; i++) {
                if (calloutURL != "") {
                    calloutURL = calloutURL.replace("intranet.onemap.gov.sg", "www.onemap.sg")

                    var multipleDataURL = calloutURL + results[i][calloutUniqueFld.toUpperCase()]
                    var nameVal = "";
                    nameVal = "<iFrame src='" + multipleDataURL + "'></iFrame>"
                    infoTemplate1.setContent(nameVal);
                }
                else {
                    var infoTemplate1 = new esri.InfoTemplate();
                    infoTemplate1.setTitle(themeName);
                    var nameVal = "";
                    nameVal += "<strong>" + results[i]["NAME"] + "</strong>" + "<br/>"
                    nameVal += results[i]["DESCRIPTION"] + "<br/>"
                    nameVal += "<a href=" + results[i]["HYPERLINK"] + " target='_blank'>More Info</a>"
                    nameVal += "<img src=" + results[i]["PHOTOURL"] + "></img>" + "<br/>"
                    nameVal += results[i]["ADDRESSBLOCKHOUSENUMBER"] + " " + results[i]["ADDRESSSTREETNAME"] + " " + results[i]["ADDRESSBUILDINGNAME"] + " " + results[i]["ADDRESSFLOORNUMBER"] + " " + results[i]["ADDRESSUNITNUMBER"] + "<br/>"
                    nameVal += "Singapore " + results[i]["ADDRESSPOSTALCODE"] + "<br/>"
                    infoTemplate1.setContent(nameVal);
                }
                var graphic;
                if (featType.toUpperCase() == "LINE") {
                    graphic = generateLineGraphic(results[i].XY, color, lineThickness)
                }
                else if (featType.toUpperCase() == "POLYGON") {
                    graphic = generatePolygonGraphic(results[i].XY, color, outlineColor, lineThickness)
                }
                else if (featType.toUpperCase() == "POINT") {
                    graphic = generatePointGraphic(results[i].XY, results[i].ICON_NAME, iconPath)
                }

                graphic.setInfoTemplate(infoTemplate1);
                themeGraphicsLayer_1.add(graphic);
            }
        }
        );

    }
}

function mashupTheme(themeName, token) {
    if (themeName == "") { return }

    var mashupOneMap = this;
    var mashupObject = new MashupData();

    try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }
    mashupObject.token = token;

    mashupObject.themeName = themeName;
    mashupObject.extent = mashupOneMap.map.extent.xmin + "," + mashupOneMap.map.extent.ymin + "," + mashupOneMap.map.extent.xmax + "," + mashupOneMap.map.extent.ymax;

    var _OneMapThemeGraphicsLayer = new esri.layers.GraphicsLayer();

    _OneMapThemeGraphicsLayer.id = themeName

    mashupOneMap.map.addLayer(_OneMapThemeGraphicsLayer);

    mashupObject.graphicLayer = _OneMapThemeGraphicsLayer;
    mashupObject.GetMashupData(overlayData_1)

    mashupOneMap.onOneMapExtentChange(mashupDataOnExtentChnage)
    return _OneMapThemeGraphicsLayer
}


function overlayData_1(mashupResults) {

    var results = mashupResults.results;

    if (results == "No results") {
        return
    }

    var featcount = mashupResults.count;
    var themeName = mashupResults.theme
    var calloutFields = mashupResults.calloutFields;
    var calloutURL = mashupResults.calloutURL;
    var calloutUniqueFld = mashupResults.calloutUniqueFld;
    var iconPath = mashupResults.iconPath
    var featType = mashupResults.featType;
    var color = mashupResults.color
    var outlineColor = mashupResults.outlineColor
    var lineThickness = mashupResults.lineThickness
    var themeGraphicsLayer_1 = mashupResults.graphicLayer

    themeGraphicsLayer_1.clear();

    if (results.length == 0) {
        return
    }


    for (var i = 0; i < results.length; i++) {
        if (calloutURL != "") {
            calloutURL = calloutURL.replace("intranet.onemap.gov.sg", "www.onemap.sg")

            var multipleDataURL = calloutURL + results[i][calloutUniqueFld.toUpperCase()]
            var nameVal = "";
            nameVal = "<iFrame src='" + multipleDataURL + "'></iFrame>"
            infoTemplate1.setContent(nameVal);
        }
        else {
            var infoTemplate1 = new esri.InfoTemplate();
            infoTemplate1.setTitle(themeName);
            var nameVal = "";
            nameVal += "<strong>" + results[i]["NAME"] + "</strong>" + "<br/>"
            nameVal += results[i]["DESCRIPTION"] + "<br/>"
            nameVal += "<a href=" + results[i]["HYPERLINK"] + " target='_blank'>More Info</a>"
            nameVal += "<img src=" + results[i]["PHOTOURL"] + "></img>" + "<br/>"
            nameVal += results[i]["ADDRESSBLOCKHOUSENUMBER"] + " " + results[i]["ADDRESSSTREETNAME"] + " " + results[i]["ADDRESSBUILDINGNAME"] + " " + results[i]["ADDRESSFLOORNUMBER"] + " " + results[i]["ADDRESSUNITNUMBER"] + "<br/>"
            nameVal += "Singapore " + results[i]["ADDRESSPOSTALCODE"] + "<br/>"
            infoTemplate1.setContent(nameVal);
        }
        var graphic;
        if (featType.toUpperCase() == "LINE") {
            graphic = generateLineGraphic(results[i].XY, color, lineThickness)
        }
        else if (featType.toUpperCase() == "POLYGON") {
            graphic = generatePolygonGraphic(results[i].XY, color, outlineColor, lineThickness)
        }
        else if (featType.toUpperCase() == "POINT") {
            graphic = generatePointGraphic(results[i].XY, results[i].ICON_NAME, iconPath)
        }

        graphic.setInfoTemplate(infoTemplate1);
        themeGraphicsLayer_1.add(graphic);
    }
}


function generatePointGraphic(XY, iconNam, iconPath) {
    var coords = new Array();
    coords = XY.split(",")
    var xCord = coords[0]
    var yCord = coords[1]
    //var iconNam = singleRecord.ICON_NAME
    var iconURL = iconPath + iconNam//singleRecord.ICON_NAME
    if (iconURL != "") {
        iconURL = iconURL.replace("www.onemap.sg", "www.onemap.sg")
        var thmSymbol = new esri.symbol.PictureMarkerSymbol(iconURL, 20, 20)
    }
    var PointLocation = new esri.geometry.Point(xCord, yCord, new esri.SpatialReference({ wkid: 3414 }))
    var PointGraphic = new esri.Graphic(PointLocation, thmSymbol);
    return PointGraphic
}


function generateLineGraphic(linePath, color, lineThickness) {

    var splitLine = linePath.toString().split("|");
    var point1;
    var lineSymbol = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color(color.split(",")), lineThickness);

    var points = new Array(splitLine.length);
    var LineArr = new Array;
    for (var l = 0; l < splitLine.length; l++) {
        point1 = new esri.geometry.Point(splitLine[l].split(",")[0], splitLine[l].split(",")[1], new esri.SpatialReference({ wkid: 3414 }))
        LineArr.push(point1)
    }
    var polyline = new esri.geometry.Polyline(new esri.SpatialReference({ wkid: 3414 }))
    polyline.addPath(LineArr)

    var lngraphic = new esri.Graphic(polyline, lineSymbol);
    return lngraphic//ln
}


function generatePolygonGraphic(polyPath, color, outlineColor, lineThickness) {

    var pntArr = new Array;
    var poly;
    var polysymbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID, new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color(outlineColor.split(",")), lineThickness), new dojo.Color((color + ",0.5").split(",")));

    xyArr = polyPath.toString().split("|");
    for (j = 0; j < xyArr.length; j++) {
        poly = new esri.geometry.Point(xyArr[j].split(",")[0], xyArr[j].split(",")[1], new esri.SpatialReference({ wkid: 3414}))
        pntArr.push(poly)
    }
    var polygon = new esri.geometry.Polygon(new esri.SpatialReference({ wkid: 3414}));
    polygon.addRing(pntArr);
    var polygraphic1 = new esri.Graphic(polygon, polysymbol);
    return polygraphic1
}




function OneMapLayerInfo(layerName) {

    this.themeName = layerName;
    this.GetLayerInfo = GetLayerInfo;
}

function GetLayerInfo(callback) {

    layerName = this.themeName
    var url = host + "API/services.svc/layerinfo?token=" + token + "layername=" + layerName;

    xmlhttp = GetXmlHttpObject();
    if (xmlhttp == null) {
        return;
    }

    restURL = url;

    $.getJSON(url + "&callback=?", function(parsedJSON) {
        var outPutResults = new Object;
        var firstRecord = parsedJSON.LayerInfo[0]
        outPutResults.Category = firstRecord.CATEGORY
        outPutResults.FeatureType = firstRecord.FEATTYPE;
        outPutResults.MinLevel = firstRecord.MINLEVEL
        outPutResults.MaxLevel = firstRecord.MAXLEVEL
        outPutResults.IconPath = firstRecord.IconPath
        outPutResults.AgencyName = firstRecord.AGENCY
        outPutResults.FieldNames = firstRecord.FIELD_NAM_T
        outPutResults.Icon = firstRecord.ICON_NAM_T
        outPutResults.MapTipFieldName = firstRecord.FIELD_NAM_T.split(",")[0];
        outPutResults.calloutURL = firstRecord.CALLOUTURL;
        outPutResults.calloutUniqueFld = firstRecord.CALLOUTFIELDNAME;
        outPutResults.visibleFields = firstRecord.SHOWNATTRIBS;
        outPutResults.pointColour = firstRecord.COLOR_T;

        if (outPutResults.results.length == 0) { outPutResults.results = "No results"; }
        callback(outPutResults);
    });


}


//-------------- mashupTheme end -------------------------------------------------

function nullCheck(input) {
    if (input == undefined)
        return '-'
    if (input == "")
        return '-'
    return input
}



function CoordConvertor() {
    this.ConvertCoordinate = ConvertCoordinate
}

function ConvertCoordinate(inputXYList, inputSR, outputSR, callback) {
    var gsvc = new esri.tasks.GeometryService(host + "ArcGIS/rest/services/Geometry/GeometryServer");
    var graphic
    var nsr = new esri.SpatialReference({ wkid: outputSR });

    if (inputXYList.split(",").length == 2) {
        var pointSymbol = new esri.symbol.SimpleMarkerSymbol().setSize(10).setColor(new dojo.Color([255, 0, 0]));
        var geomPoint = new esri.geometry.Point(inputXYList.split(",")[0], inputXYList.split(",")[1], new esri.SpatialReference({ wkid: inputSR }));
        graphic = new esri.Graphic(geomPoint, pointSymbol);

        //gsvc.project([graphic], nsr, function(outXY) {
          //  callback(outXY[0].geometry.x + "," + outXY[0].geometry.y)
        //})
	gsvc.project([geomPoint], nsr, function(outXY) {
	callback(outXY[0].x + "," + outXY[0].y)
	})
    }
    else {
        graphic = getLineGraphic(inputXYList, inputSR)
        gsvc.project([graphic], nsr, function(outXY) {

            var geometry = outXY[0].geometry.paths[0];
            var outputGeoms = "";

            for (var l = 0; l < geometry.length; l++) {
                outputGeoms = outputGeoms + "," + geometry[l][0] + "," + geometry[l][1]
            }
            if (outputGeoms != "") { outputGeoms = outputGeoms.substring(1) }
            callback(outputGeoms)
        })
    }
}


function getLineGraphic(linePath, inputSR) {
    //var linePath = singleRecord.XY;
    var splitLine = linePath.toString().split(",");
    var point1;

    var points = new Array(splitLine.length);
    var LineArr = new Array;
    for (var l = 0; l < splitLine.length; l = l + 2) {
        point1 = new esri.geometry.Point(splitLine[l], splitLine[l + 1], new esri.SpatialReference({ wkid: inputSR }))
        LineArr.push(point1)
    }
    var polyline = new esri.geometry.Polyline(new esri.SpatialReference({ wkid: inputSR }))
    polyline.addPath(LineArr)
    var lngraphic = new esri.Graphic();
    lngraphic.geometry = polyline;

    return lngraphic
};



//Get Url Response for REST Samples only

function GetURLResponse(url, callback) {


    $.getJSON(url + "&callback=?", function(parsedJSON) {

        var outPutResults = "";
        outPutResults = parsedJSON.toString();

        results(outPutResults);

    })
}

function RegisterAPI() {

this.token = "";
this.name = "";
this.email = "";
this.phone = "";
this.url = "";
this.authkey = "";
this.commUse = "";
this.GetRegisterAPIResults = GetRegisterAPIResults;
}


function GetRegisterAPIResults(callback) {

var obj = this;

var token = obj.token;
try { if (_OneMapGlobalToken != '') { token = _OneMapGlobalToken; } } catch (err) { }
var token = obj.token;
var nam = obj.name;
var email = obj.email;
var phone = obj.phone;
var url = obj.url;
var authKey = obj.authkey;
var commercialUse = obj.commUse;


url = host + "RegisterAPI/services.svc/registerApi?url="+url+"&usrname="+nam+"&email="+email+"&phone="+phone+"&commercialuse="+commercialUse+"&authkey="+authKey;

$.getJSON(url + "&callback=?", function(parsedJSON) {
var outPutResults = new Object;
outPutResults.results = parsedJSON.Results[0].Message;
callback(outPutResults);
});
}

var _OneMapGlobalToken='';
var _OneMapGlobalToken='j7AA+Fe8XwNVeWm9KgxEbM8XqecVE9dTf2F5zeWv5p6YNyZbP+c2jPWOSVjOSnTg7nTQ5rS3cbxLy3ke58f3dbKs5ktr8I33';