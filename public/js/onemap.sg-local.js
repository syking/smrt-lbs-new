//Declare the variables to be used in the REST URL as parameters.
document.write('<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>');
document.write('<script type="text/javascript">djConfig = { parseOnLoad: true }</script>');
document.write('<link rel="stylesheet" type="text/css" href="http://t2.onemap.sg/arcgis_js_api/library/2.6/arcgis/js/dojo/dijit/themes/tundra/tundra.css"/>');
document.write('<script type="text/javascript" src="http://t2.onemap.sg/arcgis_js_api/library/2.6/arcgis/"></script>');








var host = "http://www.onemap.sg";
var baseMapHost = host + "/ArcGIS/rest/services/";
var baseMapURL = baseMapHost + "basemap/MapServer";
var tileHost1 = "http://t1.onemap.sg/ArcGIS/rest/services/"
var tileHost2 = "http://t2.onemap.sg/ArcGIS/rest/services/"
var baseMapURL1 = tileHost1 + "basemap/MapServer";
var baseMapURL2 = tileHost2 + "basemap/MapServer";
var centerPoint = "28968.103,33560.969";
var oneMapGlobalToken='j7AA+Fe8XwNVeWm9KgxEbM8XqecVE9dTf2F5zeWv5p6YNyZbP+c2jPWOSVjOSnTg7nTQ5rS3cbxLy3ke58f3dbKs5ktr8I33';


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

