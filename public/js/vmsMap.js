dojo.require("dijit.layout.BorderContainer");
    dojo.require("esri.dijit.InfoWindow");
    dojo.require("dijit.layout.ContentPane");
    dojo.require("esri.map");
    var currentBuses;
    var refreshInterval;
    var refreshIntervalCount =  10 * 1000;
    var showTextTooltip = true;
    var bindMapinitDataTimeout;
    var autoShowInfoWindowTimeout;
    var autoShowInfoWindowCount = 0;
	
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

    function showCoordinates(evt) {
        var mp = evt.mapPoint;
        //dojo.byId("info").innerHTML = "Location: " + mp.x + ", " + mp.y;
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
    	//var loading = dojo.byId("loadingImg"); // loading image, id
    	
        var initExtent = getExtentForLevelnCenter(centerPoint, 1);
        
        map = new esri.Map(map_id,{extent:initExtent});
        map.enableMapNavigation();

//		//在地图更新开始的时候显示 Loading 图标
//        dojo.connect(map, "onUpdateStart", function(){
//        	esri.show(loading);
//        	map.disableMapNavigation();
//        	map.hideZoomSlider();
//        });
//        
//        //在地图更新完成的时候隐藏 Loading 图标
//        dojo.connect(map, "onUpdateEnd", function(){
//        	esri.hide(loading);
//        	map.enableMapNavigation();
//        	map.showZoomSlider();
//        });
        //Add the world street map layer to the map. View the ArcGIS Online site for services http://arcgisonline/home/search.html?t=content&f=typekeywords:service

        map.addLayer(new OM.CustomTileServiceLayer());

        var tooltipLayer = new esri.layers.GraphicsLayer();
        map.addLayer(tooltipLayer);
        map.tooltipLayer = tooltipLayer;
        map.showTextTooltip = true;
    }
    
    dojo.addOnLoad(init);

	function bindMapinitData(objstr){
		//alert("bindMapinitData===" + objstr);
		if(map.loaded){
			clearTimeout(bindMapinitDataTimeout);
			eval(objstr);
		}else{
			bindMapinitDataTimeout = setTimeout('bindMapinitData("'+objstr+'")',500);
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

    function addMarker(getCurrentDataUrlStr){
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
                url: getCurrentDataUrlStr,
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
                    refreshInterval = setTimeout("initRefreshInterval('"+getCurrentDataUrlStr+"')", refreshIntervalCount);
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
            var gm = new esri.geometry.Point(bus.xCoord, bus.yCoord, new esri.SpatialReference({ wkid: 3414 }));
            var sbl = new esri.symbol.TextSymbol("");
             var attr;
             var it;
            if(bus.busPlateNumber){
            	if($("#ShowBus").attr("checked") != "checked" && bus.vehicleType == "bus"){
					bus.activeStatus = "off";
				}
				if($("#ShowCar").attr("checked") != "checked" && bus.vehicleType == "car"){
					bus.activeStatus = "off";
				}
            	attr = {
            	id:bus.id,
                xCoord:bus.xCoord,
                yCoord:bus.yCoord,
                busPlateNumber:bus.busPlateNumber,
                driver:bus.driver,
                serviceNumber:bus.serviceNumber,
                currentSpeed:bus.currentSpeed,
                activeStatus:bus.activeStatus,
                vehicleType:bus.vehicleType
	            };
	
	            it = new esri.InfoTemplate("Vehicle Information","Driver: ${driver}<br/>Service No.: ${serviceNumber}<br/>Plate Number: ${busPlateNumber}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>")

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
	
	            it = new esri.InfoTemplate("Event Information","Name: ${name}<br/>TechName.: ${techName}<br/>Current Speed: ${currentSpeed}<br/>Status: ${activeStatus}<br/>")

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

