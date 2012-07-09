dojo.require("dijit.layout.BorderContainer");
dojo.require("esri.dijit.InfoWindow");
dojo.require("dijit.layout.ContentPane");
dojo.require("esri.map");
dojo.require("esri.tasks.route");
var currentBuses;
var currentLocations;
var refreshInterval;
var refreshIntervalCount =  10 * 1000;
var showTextTooltip = true;
var bindMapinitDataTimeout;
var autoShowInfoWindowTimeout;
var autoShowInfoWindowCount = 0;
var vmsMap;
var map;
	
vmsMap = {
	/*控件类型*/
	symbol:{
		BUS: 'bus',
		BUSSTOP: 'bus-stop',
		DEPOT: 'depot',
		CAR: 'car'
	},
	
	/*初始化*/
	init: function()
	{
		var chageLevelBtn = dojo.byId("change-level-btn");
    	
        var initExtent = getExtentForLevelnCenter(centerPoint, 1);
        
        map = new esri.Map(map_id,{extent:initExtent});
        map.enableMapNavigation();

        dojo.connect(map, "onUpdateStart", function(){
        	esri.hide(chageLevelBtn);
        	map.disableMapNavigation();
        	map.hideZoomSlider();
        });
        
        dojo.connect(map, "onUpdateEnd", function(){
        	esri.show(chageLevelBtn);
        	map.enableMapNavigation();
        	map.showZoomSlider();
        });
        
        map.addLayer(new OM.CustomTileServiceLayer());

        var tooltipLayer = new esri.layers.GraphicsLayer();
        map.addLayer(tooltipLayer);
        map.tooltipLayer = tooltipLayer;
        map.showTextTooltip = true;
        
        loadLocationGPS();
	},
	
};
