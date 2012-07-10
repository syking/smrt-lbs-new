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
    
    // map config
    var MapCnf = {
    		// 注意增加新的控件后需要在getsymboltype增加， 如果是新的类型就需要symbolType增加
    		symbol:
			{
				BUS: 'bus',
				CAR: 'car',
				
				BUSSTOP: 'bus-stop',
				DEPOT: 'depot'
			},
			symbolType:
			{
				LOCATIONS: 'locations',
				GRAPHIC:'graphic'
			},
			getSymbolType: function(symbolType)
			{
				switch(symbolType)
				{
					case MapCnf.symbol.BUS:
					case MapCnf.symbol.CAR:
						return MapCnf.symbolType.GRAPHIC;
						
					case MapCnf.symbol.BUSSTOP:
					case MapCnf.symbol.DEPOT:
						return MapCnf.symbolType.LOCATIONS;
				}
			},
    		getSymbol: function (symbolType)
    		{
    			switch(symbolType)
    			{
    				case MapCnf.symbol.BUS:
    					return new esri.symbol.PictureMarkerSymbol('/public/images/bus-32.png', 32, 32);
    					
    				case MapCnf.symbol.CAR:
    					return new esri.symbol.PictureMarkerSymbol('/public/images/car-32.png', 32, 32);
    					
    				case MapCnf.symbol.BUSSTOP:
    					return new esri.symbol.PictureMarkerSymbol('/public/images/bus-stop.png', 32, 32);
    					
    				case MapCnf.symbol.DEPOT:
    					return new esri.symbol.PictureMarkerSymbol('/public/images/depot.png', 32, 32);
    					
    				default:
    					return null;
    			}
    		},
			setDefaultActiveStatus: function(symbolType, defaultValue)
			{
    			return $(".selectSymbol[value='"+symbolType+"']").attr("checked") != 'checked'?'off':defaultValue;
			},
			getInfoTemplate: function (type){
				switch(type)
				{
					case 'LocationsInfoTemplate':
						return new esri.InfoTemplate("Location Information","Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>type: ${vehicleType}<br/>name: ${busPlateNumber}<br/>");
					
					case 'GraphicsPlateNumberInfoTemplate':
						return new esri.InfoTemplate("Vehicle Information","Driver: ${driver}<br/>Service No.: ${serviceNumber}<br/>Plate Number: ${busPlateNumber}<br/>Current"+
													 	"Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>");
					case 'GraphicsInfoTemplate':
						return new esri.InfoTemplate("Event Information","Name: ${name}<br/>TechName.: ${techName}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>");
					
					default:
						return null;
				}
			},
			// symbolType, view default:show, isOnly default: false
			setSymbolViews: function(symbolType, view, isOnly)
			{
				view = typeof view == 'undefined' ? 'show': view;
				isOnly = typeof isOnlye == 'undefined'? false:isOnly;
				
				//
				if (map.infoWindow.isShowing && view == 'hide') {
		            map.infoWindow.hide();
		        }
				
				var type = MapCnf.getSymbolType(symbolType);
				// alert(symbolType+'=='+type)
				if(type == MapCnf.symbolType.LOCATIONS)
				{
					
					$.each(currentLocations, function(index, g){
			            if(currentLocations[index].vehicleType == symbolType){
			            	if(view == 'show')
			                {
			            		currentLocations[index].activeStatus = 'on';
			                }else{
			                	currentLocations[index].activeStatus = 'off';
			                }
			            	
			            }else{
				            if(isOnly)
				            {
				            	if(view == 'show')
				                {
				            		currentLocations[index].activeStatus = 'off';
				                }else{
				                	currentLocations[index].activeStatus = 'on';
				                }
				            }
			            }
			        });
					
					$.each(map.locationLayer.graphics, function(index, g){
			            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == symbolType){
			                if(view == 'show')
			                {
			                	g.show();
			                }else{
			                	g.hide();
			                }
			            }else{
			            	if(isOnly)
			            	{
			            		 if(view == 'show')
				                {
				                	g.hide();
				                }else{
				                	g.show();
				                }
			            	}
			            }
			        });
					
					//
				}else if(type == MapCnf.symbolType.GRAPHIC)
				{
					$.each(currentBuses, function(index, g){
			            if(currentBuses[index].vehicleType == symbolType){
			            	if(view == 'show')
			                {
			            		currentBuses[index].activeStatus = 'on';
			                }else{
			                	currentBuses[index].activeStatus = 'off';
			                }
			            	
			            }else{
				            if(isOnly)
				            {
				            	if(view == 'show')
				                {
				            		currentBuses[index].activeStatus = 'off';
				                }else{
				                	currentBuses[index].activeStatus = 'on';
				                }
				            }
			            }
			        });
					
					$.each(map.clusterLayer.graphics, function(index, g){
			            if(typeof g.attributes != 'undefined' && typeof g.attributes.vehicleType != 'undefined' && g.attributes.vehicleType == symbolType){
			                if(view == 'show')
			                {
			                	g.show();
			                }else{
			                	g.hide();
			                }
			            }else{
			            	if(isOnly)
			            	{
			            		 if(view == 'show')
				                {
				                	g.hide();
				                }else{
				                	g.show();
				                }
			            	}
			            }
			        });
				}
	
		        $.each(map.tooltipLayer.graphics, function(index, g){
		            if(g.attributes.vehicleType == symbolType){
		            	if(view == 'show')
		                {
		                	g.show();
		                }else{
		                	g.hide();
		                }
		            }else{
		            	if(isOnly)
		            	{
		            		if(view == 'show')
			                {
			                	g.hide();
			                }else{
			                	g.show();
			                }
		            	}
		            }
		        });
				
			}
    }
	
	
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
        	try{
        	esri.hide(chageLevelBtn);
        	}catch(e){}
        	map.disableMapNavigation();
        	map.hideZoomSlider();
        });
        
        dojo.connect(map, "onUpdateEnd", function(){
        	try{
        	esri.show(chageLevelBtn);
        	}catch(e){}
        	map.enableMapNavigation();
        	map.showZoomSlider();
        });
        
        map.addLayer(new OM.CustomTileServiceLayer());

        var tooltipLayer = new esri.layers.GraphicsLayer();
       
        map.addLayer(tooltipLayer);
        map.tooltipLayer = tooltipLayer;
        map.showTextTooltip = true;
        
        loadLocationGPS();
    }
    
    function generateLocations(locations, depotSbl, busStopSbl){
        var locationGraphics = [];
    	for(var i = 0; i < locations.length; i++){
            var loc = locations[i];

            loc.xCoord = parseFloat(loc.xCoord);
            loc.yCoord = parseFloat(loc.yCoord);

            var gm = new esri.geometry.Point(loc.xCoord, loc.yCoord, new esri.SpatialReference({ wkid: 3414 }));
            var attr;
            var it;
			
			loc.activeStatus = MapCnf.setDefaultActiveStatus(loc.vehicleType, loc.activeStatus);
			/*
        	if($("#ShowBusStop").attr("checked") != "checked" && loc.vehicleType == "bus-stop"){
				loc.activeStatus = "off";
			}
        	
			if($("#ShowDepot").attr("checked") != "checked" && loc.vehicleType == "depot"){
				loc.activeStatus = "off";
			}
			*/
        	attr = {
        			id:loc.id,
        			xCoord:loc.xCoord,
        			yCoord:loc.yCoord,
        			activeStatus:loc.activeStatus,
        			vehicleType:loc.vehicleType,
        			busPlateNumber:loc.busPlateNumber,
        			symbol: MapCnf.getSymbol(loc.vehicleType)
            };
			/*
            it = new esri.InfoTemplate("Location Information","Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>type: ${vehicleType}<br/>name: ${busPlateNumber}<br/>")
			*/
			it = MapCnf.getInfoTemplate('LocationsInfoTemplate');
            var graphic ;
            
            /*
            if (loc.vehicleType == 'depot'){
            	graphic = new esri.Graphic(gm, depotSbl, attr, it);
            	 attr.iconType = 'depot';
            }else{
            	graphic = new esri.Graphic(gm, busStopSbl, attr, it);
            	 attr.iconType = 'busStop';
            }
			*/
            
            //
            graphic = new esri.Graphic(gm, MapCnf.getSymbol(loc.vehicleType), attr, it);
       	 	attr.iconType = loc.vehicleType;
            
       	 	graphic.visible = loc.activeStatus == 'on'?true:false;

            locationGraphics.push(graphic);
        }
    	
        return locationGraphics
    }
    
    function loadLocationGPS(){
    	var url = "locations/gps";
    	/*
    	var depotIcon = new esri.symbol.PictureMarkerSymbol('/public/images/depot.png', 32, 32);
    	var busStopIcon = new esri.symbol.PictureMarkerSymbol('/public/images/bus-stop.png', 32, 32);
    	*/
    	$.getJSON(url,{},function(json){
    		
    		currentLocations = json;
    		var locations = generateLocations(json/*, depotIcon, busStopIcon*/);
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
            map.addLayer(layer);
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
           // alert(url);
            $.ajax({
                url: url,
                dataType: 'json',
                success: function(data){
                    currentBuses = data;
                    if(data == null || data == "" || data.length <1){
                    	return;
                    }
                    var newGraphics = generateGraphics(currentBuses);
                    
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
            dojo.connect(map, "onClick", closeInfoWindow);
        }

    }

    function generateGraphics(buses){
        var gras = {};
        var vehicleGras = [];
        var tooltipGras = [];
        //alert(JSON.stringify(buses));
        //[{"id":1,"busPlateNumber":"SMB77P","driver":"Jack","currentSpeed":3,"xCoord":"34765.206346922685","yCoord":"36102.84347778058","vehicleType":"bus","activeStatus":"on","direction":"down"},
        for(var i=0; i<buses.length; i++){
            var bus = buses[i];

            bus.xCoord = parseFloat(bus.xCoord);
            bus.yCoord = parseFloat(bus.yCoord);

            var gm = new esri.geometry.Point(bus.xCoord, bus.yCoord, new esri.SpatialReference({ wkid: 3414 }));
            var sbl = new esri.symbol.TextSymbol("");
            var attr;
            var it;
            if(bus.busPlateNumber){
					
					bus.activeStatus = MapCnf.setDefaultActiveStatus( bus.vehicleType,bus.activeStatus);
					/*
					if($("#ShowBus").attr("checked") != "checked" && bus.vehicleType == "bus"){
						bus.activeStatus = "off";
					}
					if($("#ShowCar").attr("checked") != "checked" && bus.vehicleType == "car"){
						bus.activeStatus = "off";
					}*/
            	attr = {
            			id: bus.id,
            			xCoord: bus.xCoord,
            			yCoord: bus.yCoord,
            			busPlateNumber: bus.busPlateNumber,
            			driver: bus.driver,
            			serviceNumber: bus.serviceNumber,
            			currentSpeed: bus.currentSpeed,
            			activeStatus: bus.activeStatus,
            			vehicleType: bus.vehicleType,
            			symbol: MapCnf.getSymbol(bus.vehicleType)

	            };
            	
				/*
	            it = new esri.InfoTemplate("Vehicle Information","Driver: ${driver}<br/>Service No.: ${serviceNumber}<br/>Plate Number: ${busPlateNumber}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>")*/
				it = MapCnf.getInfoTemplate('GraphicsPlateNumberInfoTemplate');

            }else{
            	attr = {
					id: bus.id,
					xCoord: bus.xCoord,
					yCoord: bus.yCoord,
					name: bus.name,
					techName: bus.techName,
					currentSpeed: bus.currentSpeed,
					activeStatus: bus.activeStatus,
					symbol: MapCnf.getSymbol(bus.vehicleType)
	            };
				
				/*
	            it = new esri.InfoTemplate("Event Information","Name: ${name}<br/>TechName.: ${techName}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>XCoord: ${xCoord}<br/>YCoord: ${yCoord}<br/>")
				*/
				it = MapCnf.getInfoTemplate('GraphicsInfoTemplate');
            }
            //alert(JSON.stringify(attr));
            attr.iconType = bus.vehicleType;
			
            var gra = new esri.Graphic(gm, sbl, attr, it);
			gra.visible = bus.activeStatus == 'on'?true:false;

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
    
    /*
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
    
    /*
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
    }*/

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

