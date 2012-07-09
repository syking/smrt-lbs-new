	dojo.require("dijit.layout.BorderContainer");
    dojo.require("esri.dijit.InfoWindow");
    dojo.require("dijit.layout.ContentPane");
    dojo.require("esri.map");
    dojo.require("esri.tasks.route");
	var map;
    var currentBuses;
    var currentLocations;
    var refreshInterval;
    var refreshIntervalCount =  10 * 1000;
    var showTextTooltip = true;
    var bindMapinitDataTimeout;
    var autoShowInfoWindowTimeout;
    var autoShowInfoWindowCount = 0;
    
	
    // 30038.224073575475, 32851.37626763501
	
    esriConfig.defaults.map.slider = { left: "15px", top: "10px", width: null, height: "200px" };

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
    
    
    // 个人测试类
    function addGraphic() 
    {
    	// 20330.697191855073, 28666.438497759475
    	 var s = [];
    	
    	 for(var i = 0; i<5; i++)
    	{
    		 var x = 20330.697191855073 + Math.random() * 500;
    		 var y = 28666.438497759475 + Math.random() * 500;
			
	        var symbol = new esri.symbol.PictureMarkerSymbol('http://www.baidu.com/img/baidu_sylogo1.gif', 42, 42);
	
	        var geometry = new esri.geometry.Point(x, y, new esri.SpatialReference({ wkid: 3414 }));
		      var attr = {
		  			id: 'ids'+i,
					xCoord:x,
					yCoord:y,
					activeStatus:'on',
					vehicleType:'baidu',
					busPlateNumber:'ids_01'+i
		    };
	        graphic = new esri.Graphic(geometry, symbol ,attr);
	       
	        s.push(graphic);
    	}
    	var layer = new esri.ux.layers.ClusterLayer({
            displayOnPan: false,
            map: map,
            features: s,
            infoWindow:
            {
            	template : new esri.InfoTemplate("Location Information","Status: <br/>")
            	},
            flareLimit: 15,
            flareDistanceFromCenter: 21
        });

        map.locationLayer = layer;
        map.addLayer(layer);
    }
    
    function closeInfoWindow(evt){
        map.infoWindow.hide();
        //showCoordinates(evt);
    }

    function bindGraphicWithInfoWindow(evt){
        map.selectedGraphic = evt.graphic;
        try{
        	var id = map.selectedGraphic.attributes.id;
        	selectGridWithMapClick(id);
        }catch(e){
        	
        }
    }
	
    function init() {
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
        addGraphic();
    }
    
    function generateLocations(locations, depotSbl, busStopSbl){
    	var locationGraphics = [];
    	for(var i = 0; i < locations.length; i++){
			
			 var loc = locations[i];
			 
	        var geometry = new esri.geometry.Point(loc.xCoord-6000, loc.yCoord-4000, new esri.SpatialReference({ wkid: 3414 }));
		      var attr = {
		  			id: loc.id,
					xCoord:loc.xCoord - 6000,
					yCoord:loc.yCoord - 4000,
					activeStatus:'on',
					vehicleType:loc.vehicleType,
					busPlateNumber:loc.busPlateNumber
		    };
	        graphic = new esri.Graphic(geometry,  new esri.symbol.PictureMarkerSymbol('http://www.baidu.com/img/baidu_sylogo1.gif', 42, 42) ,attr);
	       
	      //  locationGraphics.push(graphic);
			
			
			/*
            var loc = locations[i];
			
            var gm = new esri.geometry.Point(loc.xCoord, loc.yCoord, new esri.SpatialReference({ wkid: 3414 }));
            var attr;
            var it;
            
			
        	if($("#ShowBusStop").attr("checked") != "checked" && bus.vehicleType == "bus-stop"){
				loc.activeStatus = "off";
			}
        	
			if($("#ShowDepot").attr("checked") != "checked" && bus.vehicleType == "depot"){
				loc.activeStatus = "off";
			}
			//alert(loc.vehicleType);
        	attr = {
        			id:loc.id,
        			xCoord:loc.xCoord,
        			yCoord:loc.yCoord,
        			activeStatus:loc.activeStatus,
        			vehicleType:loc.vehicleType,
        			busPlateNumber:loc.busPlateNumber
            };

            it = new esri.InfoTemplate("Location Information","Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>type: ${vehicleType}<br/>name: ${busPlateNumber}<br/>")

            
          //  alert(JSON.stringify(attr.vehicleType));
            var graphic ;
            /*
            if (loc.vehicleType = 'depot'){
            	graphic = new esri.Graphic(gm, depotSbl, attr, it);
            	 attr.iconType = 'depot';
            }else if(loc.vehicleType = 'busStop'){
            	graphic = new esri.Graphic(gm, depotSbl, attr, it);
           	 attr.iconType = 'depot';
            }else{
            	
            	graphic = new esri.Graphic(gm, depotSbl, attr, it);
           	 attr.iconType = 'depot';
            }*/
			/*
            graphic = new esri.Graphic(gm, new esri.symbol.PictureMarkerSymbol('/public/images/bus-32.png', 32, 32), attr, it);
          	// attr.iconType = 'bus';
            

            if(loc.activeStatus == 'on'){
            	graphic.visible = true;
            }else{
            	graphic.visible = false;
            }
			*/
            locationGraphics.push(graphic);
        }
    	
        return locationGraphics
    }
    
    function loadLocationGPS(){
    	//return;
    	var url = "locations/gps";

    	var depotIcon = new esri.symbol.PictureMarkerSymbol('/public/images/depot.png', 32, 32);
    	var busStopIcon = new esri.symbol.PictureMarkerSymbol('/public/images/bus-stop.png', 32, 32);
    	
    	$.getJSON(url,{},function(json){
    		//alert(JSON.stringify(json));
    		currentLocations = json;
    		var locations = generateLocations(json, depotIcon, busStopIcon);
			
			
			
			//alert(JSON.stringify(locations[0]))
			 var s = [];
			 
    	
    	 for(var i = 0; i<20; i++)
    	{
    		 var x = 20330.697191855073 + Math.random() * 20000;
    		 var y = 28666.438497759475 + Math.random() * 20000;
			
	        var symbol = new esri.symbol.PictureMarkerSymbol('http://www.baidu.com/img/baidu_sylogo1.gif', 42, 42);
	
	        var geometry = new esri.geometry.Point(x, y, new esri.SpatialReference({ wkid: 3414 }));
		      var attr = {
		  			id: 'ids'+i,
					xCoord:x,
					yCoord:y,
					activeStatus:'on',
					vehicleType:'baidu',
					busPlateNumber:'ids_01'+i
		    };
	        graphic = new esri.Graphic(geometry, symbol ,attr);
	       
	       s.push(graphic);
    	}
		//alert(JSON.stringify(s[0]))
		//return;
    	var layer = new esri.ux.layers.ClusterLayer({
            displayOnPan: false,
            map: map,
            features: locations,
            infoWindow:
            {
            	template : new esri.InfoTemplate("Location Information","Status: <br/>")
            	},
            flareLimit: 15,
            flareDistanceFromCenter: 21
        });

        map.locationLayer = layer;
        map.addLayer(layer);
		
		
			/*
    		var layer = new esri.ux.layers.ClusterLayer({
                displayOnPan: false,
                map: map,
                features: locations,
                infoWindow: {
                	template : locations[0].infoTemplate
                },
                flareLimit: 15,
                flareDistanceFromCenter: 21
            });

            map.locationLayer = layer;
            map.addLayer(layer);*/
    	});
    }
    
    dojo.addOnLoad(init);

    function changeLevelHandler(evt){
    	if (map){
    		map.setLevel(2);
    		map.centerAt(new esri.geometry.Point(28757.9, 34860.4, new esri.SpatialReference({ wkid: 3414 })));
    	}
    }
    
	function bindMapinitData(url){
		//alert("bindMapinitData===" + url);
		if(map.loaded){
			clearTimeout(bindMapinitDataTimeout);
			eval(url);
		}else{
			bindMapinitDataTimeout = setTimeout('bindMapinitData("'+url+'")',500);
		}
	}
	
	function autoShowInfoWindow(id,level){
		//frist time will be showCurrentInfoWindow falid
		if(map.loaded){
			// if(map.infoWindow.isShowing){
				// clearTimeout(autoShowInfoWindowTimeout);
			// }
			if (level)
				map.setLevel(level);
			
			autoShowInfoWindowCount++;
			if(autoShowInfoWindowCount>1){
				showCurrentInfoWindow(id);
				clearTimeout(autoShowInfoWindowTimeout);
			}else{
				autoShowInfoWindowTimeout = setTimeout('autoShowInfoWindow("'+id+'","'+level + '")',500);
			}
		}else{
			autoShowInfoWindowTimeout = setTimeout('autoShowInfoWindow("'+id+'","'+level + '")',500);
		}
	}

    function refreshGraphics(getCurrentDataUrlStr){
        if(currentBuses.length > 0 && map.loaded){
        	
            $.ajax({
                url: getCurrentDataUrlStr,
                dataType: 'json',
                success: function(data){
                    currentBuses = data;
                    var newGraphics = generateGraphics(currentBuses);
                    map.clusterLayer.refreshFeatures(newGraphics.vehicles);
                }
            });
            /*
        	currentBuses = [{"id":12,"busPlateNumber":"SMRT60012","serviceNumber":"197","driver":"60012","currentSpeed":35,"xCoord":19621.54623058727,"yCoord":32255.02633334452,"vehicleType":"bus","activeStatus":"on","direction":"down"}];
        	var newGraphics = generateGraphics(currentBuses);
            map.clusterLayer.refreshFeatures(newGraphics.vehicles);
            */
   		}
    }

    function initRefreshInterval(getCurrentDataUrlStr){
        refreshGraphics(getCurrentDataUrlStr);
        refreshInterval = setTimeout("initRefreshInterval('"+getCurrentDataUrlStr+"')", refreshIntervalCount);
    }

    function addMarker(url){
    	//return;
        clearTimeout(refreshInterval);
        if($("#textBox").val()){
        	refreshIntervalCount = $("#textBox").val() * 1000;
        }
        
        if(map.loaded){
            map.graphics.clear();
            map.tooltipLayer.clear();
            if (map.infoWindow.isShowing) {
	            map.infoWindow.hide();
	        }
            
            $.ajax({
                url: url,
                dataType: 'json',
                success: function(data){
                    currentBuses = data;
                    if(data == null || data == "" || data.length <1){
                    	return;
                    }
                    var newGraphics = generateGraphics(currentBuses);
					//alert(JSON.stringify(newGraphics.vehicles));
					//alert(JSON.stringify(newGraphics.vehicles[0].infoTemplate));
                    if(typeof map.clusterLayer == "undefined"){
                        var cL = new esri.ux.layers.ClusterLayer({
                            displayOnPan: false,
                            map: map,
                            features: newGraphics.vehicles,
                            infoWindow: {
                            	template : newGraphics.vehicles[0].infoTemplate
                            	//template: new esri.InfoTemplate("Vehicle Information","ID: ${id}<br/>Driver: ${driver}<br/>Service No.: ${serviceNumber}<br/>Plate Number: ${busPlateNumber}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>")
                            },
                            flareLimit: 15,
                            flareDistanceFromCenter: 20
                        });

                        map.clusterLayer = cL;
                        map.addLayer(cL);
                    }
                    else{
                        map.clusterLayer.clear();
                        map.clusterLayer.refreshFeatures(newGraphics.vehicles);
                    }
					dojo.connect(map.clusterLayer, "onClick", bindGraphicWithInfoWindow);
                    refreshInterval = setTimeout("initRefreshInterval('"+url+"')", refreshIntervalCount);
                }
            });
            
            //dojo.connect(map, "onMouseDrag", showCoordinates);
			 dojo.connect(map, "onMouseDrag", showCoordinates);
            dojo.connect(map, "onClick", closeInfoWindow);
			
            dojo.connect(map, "onClick", closeInfoWindow);
        }

    }

    
    /**
     * 
     * @param buses
     */
    function generateGraphics(buses){
        var gras = {};
        var vehicleGras = [];
        var tooltipGras = [];
       // alert(JSON.stringify(buses));
        //[{"id":1,"busPlateNumber":"SMB77P","driver":"Jack","currentSpeed":3,"xCoord":"34765.206346922685","yCoord":"36102.84347778058","vehicleType":"bus","activeStatus":"on","direction":"down"},
        for(var i=0; i<buses.length; i++){
   
            var bus = buses[i];
            var gm = new esri.geometry.Point(bus.xCoord-6000, bus.yCoord-8000, new esri.SpatialReference({ wkid: 3414 }));
            var sbl = new esri.symbol.PictureMarkerSymbol('/public/images/depot.png', 32, 32);
			
             var attr;
             var it;
            if(bus.busPlateNumber){
            	if($("#ShowBus").attr("checked") != "checked" && bus.vehicleType == "bus"){
					bus.activeStatus = "off";
				}
				if($("#ShowCar").attr("checked") != "checked" && bus.vehicleType == "car"){
					bus.activeStatus = "off";
				}
				//alert(JSON.stringify(bus));
            	attr = {
            			id: bus.id,
            			xCoord:bus.xCoord-6000,
            			yCoord:bus.yCoord-8000,
            			busPlateNumber: bus.busPlateNumber,
            			driver:bus.driver,
            			serviceNumber: bus.serviceNumber,
            			currentSpeed:bus.currentSpeed,
            			activeStatus:bus.activeStatus,
            			vehicleType:bus.vehicleType
	            };
	
	            it = new esri.InfoTemplate("Vehicle Information","Driver: ${driver}<br/>Service No.: ${serviceNumber}<br/>Plate Number: ${busPlateNumber}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>")

            }else{
            	attr = {
            	id:bus.id,
                xCoord:bus.xCoord,
                yCoord:bus.yCoord,
                name:bus.name,
                techName:bus.techName,
                currentSpeed:bus.currentSpeed,
                activeStatus:bus.activeStatus,
	            };
	
	            it = new esri.InfoTemplate("Event Information","Name: ${name}<br/>TechName.: ${techName}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>")

            }
            //alert(JSON.stringify(attr));
           attr.iconType = 'vehicle';
            var gra = new esri.Graphic(gm, sbl, attr, it);

            if(bus.activeStatus == 'on'){
                gra.visible = true;
            }
            else{
                gra.visible = false;
            }

            vehicleGras.push(gra);
        }
        gras.vehicles = vehicleGras;
        gras.tooltips = tooltipGras;
        return gras;
    }

    function showAllIcon(){
        $.each(map.clusterLayer.graphics, function(index, g){
            g.show();
        });

        $.each(map.tooltipLayer.graphics, function(index, g){
            if(showTextTooltip){
                g.show();
            }
        });

        $.each(currentBuses, function(index, b){
            b.activeStatus = 'on';
        });

    }
	
    function hideAllIcon(){
        $.each(map.clusterLayer.graphics, function(index, g){
            g.hide();
        });
        $.each(map.tooltipLayer.graphics, function(index, g){
            g.hide();
        });
        $.each(currentBuses, function(index, b){
            b.activeStatus = 'off';
        });
    }
    
    function hideEventTypeIcon(type){
    	if (map.infoWindow.isShowing) {
            map.infoWindow.hide();
        }
        
        $.each(map.clusterLayer.graphics, function(index, g){
        	if(g.attributes.techName == type){
            	g.hide();
           }
        });
        $.each(map.tooltipLayer.graphics, function(index, g){
           if(g.attributes.techName == type){
            	g.hide();
           }
        });
        $.each(currentBuses, function(index, b){
        	if(b.techName == type){
        		b.activeStatus = 'off';
        	}
            
        });
    }
    
    function showEventTypeIcon(type){
        $.each(map.clusterLayer.graphics, function(index, g){
        	if(g.attributes.techName == type){
            	g.show();
           }
        });
        $.each(map.tooltipLayer.graphics, function(index, g){
           if(g.attributes.techName == type){
            	g.show();
           }
        });
        $.each(currentBuses, function(index, b){
        	if(b.techName == type){
        		b.activeStatus = 'on';
        	}
            
        });
    }
    
    function showLocationIcon(vehicleType){
        $.each(currentLocations, function(index, g){
            if(currentLocations[index].vehicleType == vehicleType){
            	currentLocations[index].activeStatus = 'on';
            }
        });

        $.each(map.locationLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == vehicleType){
                g.show();
            }
        });

        $.each(map.tooltipLayer.graphics, function(index, g){
            if(g.attributes.vehicleType == vehicleType){
                g.show();
            }
        });
    }
    
    function hideLocationIcon(vehicleType){
    	if (map.infoWindow.isShowing) {
            map.infoWindow.hide();
        }
        $.each(currentLocations, function(index, g){
            if(currentLocations[index].vehicleType == vehicleType){
            	currentLocations[index].activeStatus = 'off';
            }
        });

        $.each(map.locationLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == vehicleType){
                g.hide();
            }
        });

        $.each(map.tooltipLayer.graphics, function(index, g){
            if(g.attributes.vehicleType == vehicleType){
                g.hide();
            }
        });
    }
    
    function showVehicleIcon(vehicleType){
        $.each(currentBuses, function(index, g){
            if(currentBuses[index].vehicleType == vehicleType){
                currentBuses[index].activeStatus = 'on';
            }
        });

        $.each(map.clusterLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == vehicleType){
                g.show();
            }
        });

        $.each(map.tooltipLayer.graphics, function(index, g){
            if(g.attributes.vehicleType == vehicleType){
                g.show();
            }
        });
    }
    
    function hideVehicleIcon(vehicleType){
    	if (map.infoWindow.isShowing) {
            map.infoWindow.hide();
        }
        $.each(currentBuses, function(index, g){
            if(currentBuses[index].vehicleType == vehicleType){
                currentBuses[index].activeStatus = 'off';
            }
        });

        $.each(map.clusterLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == vehicleType){
                g.hide();
            }
        });

        $.each(map.tooltipLayer.graphics, function(index, g){
            if(g.attributes.vehicleType == vehicleType){
                g.hide();
            }
        });
    }
    
    
    function showBusOnly(){
        $.each(currentBuses, function(index, g){
            if(currentBuses[index].vehicleType == "bus"){
                currentBuses[index].activeStatus = 'on';
            }
            else{
                currentBuses[index].activeStatus = 'off';
            }

        });

        $.each(map.clusterLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == "bus"){
                g.show();
            }
            else{
                g.hide();
            }
        });

        $.each(map.tooltipLayer.graphics, function(index, g){
            if(g.attributes.vehicleType == "bus" && showTextTooltip){
                g.show();
            }
            else{
                g.hide();
            }
        });
    }

    function showCarOnly(){
        $.each(currentBuses, function(index, g){
            if(currentBuses[index].vehicleType == "car"){
                currentBuses[index].activeStatus = 'on';
            }
            else{
                currentBuses[index].activeStatus = 'off';
            }
        });
        $.each(map.clusterLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == "car"){
                g.show();
            }
            else{
                g.hide();
            }
        });
        $.each(map.tooltipLayer.graphics, function(index, g){
            if(g.attributes.vehicleType == "car" && showTextTooltip){
                g.show();
            }
            else{
                g.hide();
            }
        });
    }
    
    function showDepotOnly(){
        $.each(currentLocations, function(index, g){
            if(currentLocations[index].vehicleType == "depot"){
            	currentLocations[index].activeStatus = 'on';
            }
            else{
            	currentLocations[index].activeStatus = 'off';
            }
        });
        $.each(map.locationLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == "depot"){
                g.show();
            }
            else{
                g.hide();
            }
        });
        $.each(map.tooltipLayer.graphics, function(index, g){
            if(g.attributes.vehicleType == "depot" && showTextTooltip){
                g.show();
            }
            else{
                g.hide();
            }
        });
    }

    function showTooltip(){
        $.each(map.tooltipLayer.graphics, function(index, g){
            g.show();
        });
        map.showTextTooltip = true;
    }
    function hideTooltip(){
        $.each(map.tooltipLayer.graphics, function(index, g){
            g.hide();
        });
        map.showTextTooltip = false;
    }
    
    function showCurrentInfoWindow(keyword){
    	var graphic = null;
    	$.each(map.tooltipLayer.graphics, function(index, g){
            if(typeof g.attributes != 'undefined' && typeof g.attributes.id != 'undefined' && g.attributes.id == keyword){
              graphic = g;
              showInfoWindow(keyword);
              return;
            }
        });
        if(graphic == null && map.getLevel() < 2){
        	map.setLevel(map.getLevel()+2);
        }
    	
    	$.each(currentBuses, function(index, g){
            if(currentBuses[index].id  == keyword){
            	var cPoint=new esri.geometry.Point(currentBuses[index].xCoord, currentBuses[index].yCoord, new esri.SpatialReference({ wkid:3414 }));
            	map.centerAt(cPoint);
    			setTimeout('showInfoWindow("'+keyword+'")',1000);
     			return;
    		}
        });
    }
    
    //shows info window for specified graphic
    function showInfoWindow(keyword) {
    	var graphic;
    	$.each(map.tooltipLayer.graphics, function(index, g){
        	//alert(g.attributes.id);
            if(typeof g.attributes != 'undefined' && typeof g.attributes.id != 'undefined' && g.attributes.id == keyword){
              graphic = g;
            }
        });
        map.infoWindow.setContent(graphic.getContent());
        map.infoWindow.setTitle(graphic.getTitle());
        map.infoWindow.resize(map.infoWindowWidth, map.infoWindowHeight);
        var graphicCenterSP = esri.geometry.toScreenGeometry(map.extent, map.width, map.height, graphic.geometry);
        map.infoWindow.show(graphicCenterSP, map.getInfoWindowAnchor(graphicCenterSP));
        map.selectedGraphic = graphic;
        
    }

