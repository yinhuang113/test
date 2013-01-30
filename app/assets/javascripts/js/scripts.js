var openstreetmap = null;
var storeBound = {'topLeft': [37.559300918984185, -77.43330359458923],
			'bottomRight': [37.5568344300483, -77.43166208267212]};
var storeCenter = [37.558335595969446, -77.43252038955687];
var storeZoom = 18;
var elementBtn = null;
var preHrOpsSelector = null;
var leftPanelScroller = null;
var testA = 1;
var scrollContMaxWidth = 0;
var dropZoneName = null;
$('.sub-group').on('show',function(){
	$(this).prev().children("i").removeClass("icon-plus").addClass("icon-minus");
});
$('.sub-group').on('hide',function(){
	$(this).prev().children("i").removeClass("icon-minus").addClass("icon-plus");
});
$('.sub-group2').on('show',function(){
	$(this).prev().children("i").removeClass("icon-plus").addClass("icon-minus");
});
$('.sub-group2').on('hide',function(){
	$(this).prev().children("i").removeClass("icon-minus").addClass("icon-plus");
});


jQuery(document).ready(function(e){
	$(".btn-leftsider-toggle").click(function(){
		var newWidth = 0;
		if($(this).hasClass("active")) {
			$("#leftpanel").css("left","-561px");
			$("#mapbuttons").css("left", "0px");
			$("#map_area").css("left", "0px");
//					newWidth = $(window).width();
//					$("#map_area").width(newWidth);
			if(openstreetmap) {
//						var center = openstreetmap.getCenter();
//						var zoom = openstreetmap.getZoom();
				//openstreetmap.setView( center, zoom, true );
//						openstreetmap.fitBounds([[center.lat-1, center.lng-1],[center.lat+1, center.lng+1]]);
			}
		} else {
			$("#leftpanel").css("left","0px");
			$("#mapbuttons").css("left", "560px");
			$("#map_area").css("left", "560px");
//					newWidth = $(window).width() - 560;
//					$("#map_area").width(newWidth);
		}
	});
	$(".btn-map-openstreet").click(function(){
		if($(this).hasClass("active")) {
			$("#map_openmaparea").hide();
		} else {
			$("#map_openmaparea").show();
			if(openstreetmap == null) {
/*						openstreetmap = L.map('map_openmaparea',{zoomControl: false})
								.setView([51.505, -0.09], 13)
								.addLayer(new L.TileLayer("http://{s}.tile.cloudmade.com/…/998/256/{z}/{x}/{y}.png"));
				L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
					attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
					maxZoom: 18
				}).addTo(openstreetmap);

				$(map.getPanes().overlayPane).html("<svg><g></g></svg>");
				var bounds = d3.geo.bounds(collection),
				bottomLeft = project(bounds[0]),
				topRight = project(bounds[1]);
*/
				openstreetmap = new L.Map('map_openmaparea',{zoomControl: false})
						//.setView(new L.LatLng(37.8, -96.9), 8)
						.setView(new L.LatLng(storeCenter[0], storeCenter[1]), storeZoom)
						.addLayer(new L.TileLayer("http://{s}.tile.cloudmade.com/1a1b06b230af4efdbb989ea99e9841af/998/256/{z}/{x}/{y}.png"));
				openstreetmap.on("click",function(d){//console.log(d);
				});

				L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
					attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
					maxZoom: 18
				}).addTo(openstreetmap);

				$(openstreetmap.getPanes().overlayPane).append("<svg id='overlaystore' width='640px' height='950px'>"+window.storeSVG+"</svg>");
				//$("#overlaystore").html(window.storeSVG);
				//console.log(window.storeSVG);
				//console.log($("#overlaystore"));
				/*openstreetmap.on("viewreset", reset);
				reset();

				function reset() {
					var bottomLeft = project(bounds[0]),
						topRight = project(bounds[1]);

					svg.attr("width", topRight[0] - bottomLeft[0])
						.attr("height", bottomLeft[1] - topRight[1])
						.style("margin-left", bottomLeft[0] + "px")
						.style("margin-top", topRight[1] + "px");
					
					g.attr("transform", "translate(" + -bottomLeft[0] + "," + -topRight[1] + ")");

					feature.attr("d", path);
				}*/

//						d3.json("us-states.json", function(collection) {
/*							var bounds = d3.geo.bounds(window.collection);//[storeBound.topLeft, storeBound.bottomRight];
					var path = d3.geo.path().projection(project);
					

					var feature = g.selectAll("path")
								.data(window.collection.features)
								.enter().append("path");

					openstreetmap.on("viewreset", reset);
					reset();

					// Reposition the SVG to cover the features.
					function reset() {
						var bottomLeft = project(bounds[0]),
						topRight = project(bounds[1]);

						svg.attr("width", topRight[0] - bottomLeft[0])
							.attr("height", bottomLeft[1] - topRight[1])
							.style("margin-left", bottomLeft[0] + "px")
							.style("margin-top", topRight[1] + "px");
						
						g.attr("transform", "translate(" + -bottomLeft[0] + "," + -topRight[1] + ")");

						feature.attr("d", path);
					}
*/
					// Use Leaflet to implement a D3 geographic projection.
/*							function project(x) {
						var point = openstreetmap.latLngToLayerPoint(new L.LatLng(x[1], x[0]));
						//console.log(point);
						return [point.x, point.y];
					}
//						});*/
			}
		}
	});
	//$('#venue').jScrollPane({showArrows: true});

/*	$('.styledCheckbox').checkbox({
		cls:'jqueryCheckbox',
		empty:'img/empty.png'
	});

	$('.styledRadio').checkbox({
		cls:'jqueryRadio',
		empty:'img/empty.png'
	});
 */
	//console.log($('.scroll-box-wrap').offset());
	updateLeftPanelScrollCont();
	if ($('.scroll-box-wrap').length) {
	leftPanelScroller = $('.scroll-box-wrap').antiscroll().data('antiscroll');
	}
	//console.log($(".tab-pane").css("height"));
	//scrollContMaxWidth = $('.scroll-box-wrap .antiscroll-inner:first').width();
	//$('.scroll-box-wrap .antiscroll-inner').css({'width':parseInt($('.scroll-box-wrap .antiscroll-inner:first').width())+'px'});
	$('#myTab a').click(function (e) {
		e.preventDefault();
		$(this).tab('show');
		//console.log($(this).attr('href'));
		if (leftPanelScroller != null) {
			leftPanelScroller.destroy();
			updateLeftPanelScrollCont();		
			$($(this).attr('href')).find('.antiscroll-inner').css({'height':'100%','width':'100%'});
			leftPanelScroller = $($(this).attr('href')).find('.scroll-box-wrap').antiscroll().data('antiscroll');		
			leftPanelScroller.refresh();
		}
	});
	
	$('.selectpicker').selectpicker();
	$('.userTable').find('.btn-comment').click(function(e) {
		var parentContainerTable = $(this).parentsUntil('table').parent();
		var parentContainerCell = parentContainerTable.parent().parent();
		var emailLinkObj = parentContainerTable.find('.emailLink');
		//console.log(parentContainerCell);
		if ($($(this).attr('href')).height() == 0) {
			parentContainerCell.css({'background':'none'});
			emailLinkObj.css({'display':'none'});
			$(this).css({'background':'#9dd000'});
		} else {
			parentContainerCell.removeAttr('style');
			emailLinkObj.css({'display':'block'});
			$(this).removeAttr('style');				}
	});	 
	
	/*$('.hrOfOps').click(function(){
		if ($($(this).attr('href')).height() == 0) {
			//$($(this).attr('href')).css({'overflow':'visible', '':''});
			//if body visible
		} else {
			//$($(this).attr('href')).css({'overflow':'hidden','':''});				
			//if hide
		}
	});*/
	
	$(".togglecontainer").hide(); 
	$(".floorheader").click(function(){
		$(this).toggleClass("active1").next().slideToggle("slow");
		return false; 
	});
	makeLeftpanelFitable();
	
	if ($('#dp3,#dp4,#dp5').length) {
	$('#dp3,#dp4,#dp5').datepicker()
	}
	/*$('.timepicker').timepicker({
		minuteStep: 1,
		showSeconds: false,
		showMeridian: true,
		
	}); */
	
	$('.btn-map-zoomin').click(function(){
		if(openstreetmap != null) {
			openstreetmap.zoomIn();
		}
	});
	$('.btn-map-zoomout').click(function(){
		if(openstreetmap != null) {
			openstreetmap.zoomOut();
		}
	});
	
	$('.btngroupContainer button').click(function(e) {
		
        if ($(this).hasClass('active')) {
			$(this).removeClass('active');
		} else {
			$(this).parent().find('.active').removeClass('active');			
			$(this).addClass('active');
		}
    });
	
	$(".add-schedule-mapbuilder").click(function() {
			
		$(".hidden-for-all:first-child").clone(true).appendTo(".schedule-comand-line-container");
		$(".hidden-for-all:last-child").css("display", "block");
		$(".hidden-for-all:last-child").css("background-color", "#EEEEEE");
		
		$(".hidden-for-all:last-child").find('.hrOpsBlockTitle').css({'display':'none'});
		
		updateLeftPanelScrollCont();
		leftPanelScroller.refresh();
		
	});
	$(".collapse-manual").click(function(){
		if($(this).hasClass("selected")){
			$(this).removeClass("selected");
			$(this).closest(".hidden-for-all").css({"background-color": "#FFF", 'margin-bottom':0});
		} else{
			$(this).addClass("selected");
			$(this).closest(".hidden-for-all").css({"background-color" : "#EEEEEE", 'margin-bottom':'20px'});
		}
		
		
		$(this).closest(".hidden-for-all").find(".operationBlock").slideToggle(1);
		//console.log($(this).closest(".hidden-for-all").find('.hrOpsBlockTitle'));
		if ($(this).closest(".hidden-for-all").find(".operationBlock").height() == 1) {
			$(this).closest(".hidden-for-all").find('.hrOpsBlockTitle').css({'display':'none'});
			$(this).closest(".hidden-for-all").find('.hrOpsBlockTitle').next().css({'display':'block'});
			
		} else {
			$(this).closest(".hidden-for-all").find('.hrOpsBlockTitle').css({'display':'block'});	
			$(this).closest(".hidden-for-all").find('.hrOpsBlockTitle').next().css({'display':'none'});
		}
		
	})
	$(".hidden-inner-collapse .selectpicker").change(function(){
		
		var currHrOpsSelector = $(this).children('option:selected').val();
		var currHrOpsText = $(this).children('option:selected').text();
		
		$(this).parentsUntil('.common-block').parent().find('.hidden-tabs-schedule').each(function(index,ele){
			
			if ($(ele).css('display') == 'block') {
				$(ele).hide();	
			}
		});
		
		$(this).parentsUntil('.hidden-for-all').parent().find('.hrOpsBlockTitle').children('span').html('<em>[No schedule selected]</em>');
		if (currHrOpsSelector) {
			$(this).parentsUntil('.hidden-for-all').parent().find('.hrOpsBlockTitle').children('span').text(currHrOpsText);
			$(this).parentsUntil('.common-block').parent().find('#'+currHrOpsSelector).show();
			if ($('.common-block').length) {
				$('.common-block').each(function(commBlockIndex, commBlock){
					if (commBlockIndex > 1) {
						var datepickerIconCal = $(commBlock).find('.datepickerIconCal');
						if (datepickerIconCal.length) {
							//console.log($(commBlock).find('.datepickerIconCal'));	
							$(commBlock).find('.datepickerIconCal').each(function(index, ele){
								//console.log(commBlockIndex);
								var dpClass = 'tbDatePicker-' + commBlockIndex + '-' + index;
								var dpIconClass = 'datepickerIconCal-' + commBlockIndex + '-' + index;
								
								if (!($(ele).parent().prev('.tbDatePicker').hasClass(dpClass))) {
									$(ele).parent().prev('.tbDatePicker').addClass(dpClass);
									$('.'+dpClass).datepicker({
										dateFormat : 'mm-dd-yy'
									});
								}
								
								if (!($(ele).hasClass(dpIconClass))) {
									$(ele).addClass(dpIconClass);
									$('.'+dpClass).datepicker({
										dateFormat : 'mm-dd-yy'
									});
									
									$("."+dpIconClass).click(function(e) {
										var dp = $(this).parent().prev('.'+dpClass);
										if (dp.datepicker('widget').is(':hidden')) {
											dp.datepicker("show");
										} else {
											//dp.hide();
										}
									
										e.preventDefault();
									});									
								}
							});
						}
						
						var styledChk = $(commBlock).find('.hrOpsStyledCheckbox');
						if (styledChk.length) {
							$(commBlock).find('.hrOpsStyledCheckbox').each(function(chkInd, chkEle){
								var chkClass = 'hrOpsStyledCheckbox-' + commBlockIndex + '-' + chkInd;
								if (!($(chkEle).hasClass(chkClass))) {
									$(chkEle).addClass(chkClass);									
									$('.'+chkClass).checkbox({
										cls:'jqueryCheckbox',
										empty:'img/empty.png'
									});
									$('.'+chkClass).click(function(e) {
                                        if (!$(this).is(':checked')){
											$(this).parentsUntil('.singleInfoRow').parent('.singleInfoRow').find('.timeTextField').attr('disabled', 'disabled');	
										} else {
											$(this).parentsUntil('.singleInfoRow').parent('.singleInfoRow').find('.timeTextField').removeAttr('disabled');		
										}
									});
									/*if ($('.'+chkClass).is(':checked')) {	
										console.log($('.'+chkClass));
									}*/
								}
							});
						}
						/*
						$('.styledCheckbox').checkbox({
							cls:'jqueryCheckbox',
							empty:'img/empty.png'
						});
						*/
					}	
				});
			}
		}
	});
	$(".hidden-inner-collapse").change(function(){
		//$(this).closest(".accordion-body").find(".hidden-tabs-schedule").show();	
	});
	
	$('.delete-manual').click(function() {
		$(this).closest('.common-block').remove();
	});
	$('.typeahead').typeahead();
	
	////////// add Store ///////////////
	$('.addStoreBtn').click(function() {			
		$(".storeInfoToCloneHead").clone(true).appendTo(".storeListTable");
		$(".storeInfoToCloneHead:last-child").removeClass('hide');
		$(".storeInfoToCloneHead:last-child").addClass('storeInfoHead');
		$(".storeInfoToCloneHead:last-child").removeClass('storeInfoToCloneHead');
		$(".storeInfoToCloneBody").clone(true).appendTo(".storeListTable");
		//$(".storeInfoToCloneHead:last-child").css({"display" : "block"});		
		$(".storeInfoToCloneBody:last-child").removeClass('hide');	
		$(".storeInfoToCloneBody:last-child").addClass('storeInfoBody');	
		$(".storeInfoToCloneBody:last-child").removeClass('storeInfoToCloneBody');
		
		//$(".hidden-for-all:last-child").css("background-color", "#EEEEEE");
		
		//$(".hidden-for-all:last-child").find('.hrOpsBlockTitle').css({'display':'none'});
		
		$('.storeInfoCollapse').unbind('click');
		$('.storeInfoCollapse').click(function(e) { 
			$(this).parentsUntil(".storeInfoBody").parent(".storeInfoBody").removeClass("storeInfoBodyActive");
		   if($(this).hasClass("selected")){
				$(this).removeClass("selected");
				$(this).parentsUntil(".storeInfoBody").parent().css({"background-color": "#FFF", 'color':'#333'});
				
			} else{
				$(this).addClass("selected");
				$(this).parentsUntil(".storeInfoBody").parent().css({"background-color" : "#eee"});
			}
			var collapseBody = $(this).parentsUntil('.storeInfoBody');
			collapseBody.find('.collapseInfo').slideToggle(1); 			
			if (collapseBody.find('.collapseInfo').height() == 30) {
				collapseBody.find('.stroreInfoTitle').css({'display':'none'});
			} else {
				var tmpTitle = collapseBody.find('.vendorTitle').val();
				tmpTitle = tmpTitle != '' ? tmpTitle : '[no vendor selected yet]';				
				collapseBody.find('.stroreInfoTitle').text(tmpTitle);
				collapseBody.find('.stroreInfoTitle').css({'display':'block'});
			}
		});
		$('.storeInfoDelete').unbind('click');
		$('.storeInfoDelete').click(function(e) {
			$(this).parentsUntil(".storeInfoBody").parent().remove();
		});
		
		$('.storeInfoBody').unbind('click');
		$('.storeInfoBody').click(function(e) {
			//$("a:Event(click)");
			
			var currentTag = $(e.target)[0].tagName.toLowerCase();
			//console.log(currentTag)
			if ($(e.target).hasClass('stroreInfoTitle') || currentTag == 'td') {
				if ($(this).hasClass("storeInfoBodyActive")) {
					$(this).removeClass("storeInfoBodyActive");	
		   			$(this).css({"background-color": "#FFF"});
					$(this).children().css({"background-color": "#FFF", 'color':'#333'});				
				} else {
					$(this).addClass("storeInfoBodyActive");	
            		$(this).css({"background-color": "#0086c9 "});
					$(this).children().css({"background-color": "#0086c9", 'color':'#FFF'});
				}
			}
		});
		
		
		$('.storeInfoBody').mouseenter(function(e) {
		if (!($(this).hasClass("storeInfoBodyActive")) && ($(this).find('.collapseInfo').css('display') == 'none')) {
			$(this).css({"background-color": "#f5f5f5 "});
			$(this).children().css({"background-color": "#f5f5f5", 'color':'#333'});
			//console.log($(this).children().css('background-color'));
		}
		//$(this).children().css({'color':'#FFF'});
		}).mouseleave(function(e) {
		   if (!($(this).hasClass("storeInfoBodyActive")) && ($(this).find('.collapseInfo').css('display') == 'none')) {
				$(this).css({"background-color": "#FFF"});
				$(this).children().css({"background-color": "#FFF", 'color':'#333'}); 
				
		   }
		   //$(this).children().css({'color':'#333'}); 
		});	
		/*$('.storeInfoCollapse').each(function(index, ele){
			$(ele).unbind('click');
			$(ele).click(function(e) {
			   if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					//$(this).closest(".storeInfoBody").css({"background-color": "#FFF", 'margin-bottom':0});
				} else{
					$(this).addClass("selected");
					//$(this).closest("storeInfoBody").css({"background-color" : "#EEEEEE", 'margin-bottom':'20px'});
				}
				//console.log($(this).parentsUntil('.storeInfoHead').parent().find('.stroreInfoTitle'));
				//console.log($(this).parentsUntil('.storeInfoHead').parent().next('.storeInfoBody').find('.collapseInfo'));
				//$(this).parentsUntil('.storeInfoHead').parent().next('.storeInfoBody').find('.collapseInfo').slideToggle();
				var collapseBody = $(this).parentsUntil('.storeInfoHead').parent().next('.storeInfoBody').find('.collapseInfo');
				collapseBody.slideToggle();  
				//console.log($(this).closest(".storeListTable").find('.stroreInfoTitle'));
				if (collapseBody.height() == 1) {
					$(this).parentsUntil(".storeInfoHead").find('.stroreInfoTitle').css({'display':'none'});
				} else {
					//$(this).closest(".hidden-for-all").find('.hrOpsBlockTitle').css({'display':'block'});	
					//$(this).closest(".hidden-for-all").find('.hrOpsBlockTitle').next().css({'display':'none'});
					$(this).parentsUntil(".storeInfoHead").find('.stroreInfoTitle').css({'display':'block'});
				}
			});
		});*/
		
		/*$('.storeInfoVendoeSel').change(function() {
			//console.log($(this).children('option:selected').val())
			var storeOptopnVal = $(this).children('option:selected').val();
			var storeOptopnText = $(this).children('option:selected').text();
			if (storeOptopnVal != '' && storeOptopnVal != null) {
				$(this).parentsUntil(".storeInfoBody").parent().find('.stroreInfoTitle').text(storeOptopnText);	
			} else {
				$(this).parentsUntil(".storeInfoBody").parent().find('.stroreInfoTitle').text('[no vendor selected yet]');		
			}
		})*/
		
		updateLeftPanelScrollCont();
		leftPanelScroller.refresh();
		
	});
	/////// Store add process end //////////////
	////////add floor//////
	$('.addFloorBtn').click(function(e) {
		//(".floorInfoList").each(function(fInd,fEle) {
			//$(fEle).find();	
		//});
		//$(".floorInfoList").find('.floorInfoBody').css({'display':'none'});
		
		$(".floorInfoList").find('.floorInfoDetailsBtns').find('.btn-hselect').trigger('click');
		
		$('.floorInfoList').find('.floorInfo').removeClass("floorInfoActive");
		$('.floorInfoList').find('.floorInfo').css({"background-color": "#FFF"});
		$('.floorInfoList').find('.floorInfo').children().css({"background-color": "#FFF", 'color':'#333'});	
					
		
		$(".floorInfoToClone").clone(true).prependTo(".floorInfoList");//.appendTo(".floorInfoList");
		var floorInfoListFirstChild = $(".floorInfoList").children().first();
		floorInfoListFirstChild.find('.' + floorInfoListFirstChild.find('.floorInfoDetailsBtns').children().first().attr('rel')).removeClass('hide');
		floorInfoListFirstChild.css({'margin-bottom':'20px'});
		floorInfoListFirstChild.removeClass('hide');
		floorInfoListFirstChild.addClass('floorInfo');
		floorInfoListFirstChild.removeClass('floorInfoToClone');
		//floorInfoListFirstChild.find('.floorAttrToClone').remove();
		updateFloorInfoListTitle();
		updateSVGdropZone();
		//addFileUploader();
		floorInfoListFirstChild.find('.sliderBar').slider({
			orientation: "horizontal",
			range: "min",
			max: 100,
			value: 0,
			step: 1	
		});
				
		$(".floorInfoList").children().first().find('.floorInfoDetailsBtns').children().each(function(btnIndex, btnElement) {
			if ($(btnElement).attr('rel') != null && $(btnElement).attr('rel') != '') {
				$(btnElement).unbind('click');
				$(btnElement).click(function(e) {
				var showFloorInfoBody = false;
				$(this).siblings().removeClass("btn-hselect"); 
				
				$(this).parentsUntil('.floorInfo').parent('.floorInfo').siblings().find('.floorInfoDetailsBtns').find('.btn-hselect').trigger('click');
				
				$(this).parentsUntil('.floorInfo').parent('.floorInfo').siblings().removeClass("floorInfoActive");
				$(this).parentsUntil('.floorInfo').parent('.floorInfo').siblings().css({"background-color": "#FFF"});
				$(this).parentsUntil('.floorInfo').parent('.floorInfo').siblings().children().css({"background-color": "#FFF", 'color':'#333'});	
				
				//$(".floorInfoList").find('.floorInfoDetailsBtns').find('.btn-hselect').trigger('click');
				
				if($(this).hasClass("btn-hselect")){
					$(this).removeClass("btn-hselect");
					$(this).parentsUntil(".floorInfo").parent('.floorInfo').removeClass('selectedfloor');				
				} else{
					$(this).addClass("btn-hselect");
					$(this).parentsUntil(".floorInfo").parent('.floorInfo').addClass('selectedfloor');	
					$(this).parentsUntil(".floorInfo").parent('.floorInfo').removeAttr('style');
					$(this).parentsUntil(".floorInfo").parent('.floorInfo').removeClass('floorInfoActive');		
					$(this).parentsUntil(".floorInfo").parent('.floorInfo').children().removeAttr('style');
					//$(this).parentsUntil(".floorInfo").parent('.floorInfo').children().css({'color':'#333'});
					$(this).parentsUntil(".floorInfo").parent('.floorInfo').css({'margin-bottom':'20px'});
					showFloorInfoBody = true;
				}
				var floorInfo = $(this).parentsUntil('.floorInfo').parent('.floorInfo');
				var collapseBody = floorInfo.find('.floorInfoBody');
				collapseBody.children().addClass('hide');
				if ($(this).attr('rel') != null && $(this).attr('rel') != '') {
					collapseBody.children('.'+$(this).attr('rel')).removeClass('hide');
				}
				if (showFloorInfoBody) {
					if (collapseBody.css('display') == 'none') {
						collapseBody.slideDown(1);	
						floorInfo.css({'margin-bottom':'20px'});
					}
				} else {
					collapseBody.slideUp(1);
					floorInfo.css({'margin-bottom':'0'});
				}
			});
			}
    });
		
		$('.floorInfo').unbind('click');
		$('.floorInfo').click(function(e) {
			//$("a:Event(click)");
			if ($(this).find('.floorInfoBody').css('display') == 'none') {
				var currentTag = $(e.target)[0].tagName.toLowerCase();
				//console.log(e.target)
				//$(e.target).hasClass('stroreInfoTitle') || 
				if (currentTag != 'i') {
					$(this).siblings().removeClass("floorInfoActive");
					$(this).siblings().css({"background-color": "#FFF"});
					$(this).siblings().children().css({"background-color": "#FFF", 'color':'#333'});	
						
					if ($(this).hasClass("floorInfoActive")) {
						$(this).removeClass("floorInfoActive");	
							$(this).css({"background-color": "#FFF"});
						$(this).children().css({"background-color": "#FFF", 'color':'#333'});				
					} else {
						$(this).addClass("floorInfoActive");	
									$(this).css({"background-color": "#0086c9 "});
						$(this).children().css({"background-color": "#0086c9", 'color':'#FFF'});
					}
				}
			}
		});
		
		$('.floorInfo').mouseenter(function(e) {
		if (!($(this).hasClass("floorInfoActive")) && ($(this).find('.floorInfoBody').css('display') == 'none')) {
			$(this).css({"background-color": "#f5f5f5 "});
			$(this).children().css({"background-color": "#f5f5f5"});
			//console.log($(this).children().css('background-color'));
		}
		//$(this).children().css({'color':'#FFF'});
		}).mouseleave(function(e) {
		   if (!($(this).hasClass("floorInfoActive")) && ($(this).find('.floorInfoBody').css('display') == 'none')) {
				$(this).css({"background-color": "#FFF"});
				$(this).children().css({"background-color": "#FFF"}); 				
		   }
		   //$(this).children().css({'color':'#333'}); 
		});	
		
		$('.floorInfoFixedAttrComment').unbind('click');
		$('.floorInfoFixedAttrComment').click(function(e) {
			//$(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr').remove();
			/*if ($(this).siblings('.floorInfoFixedAttrEye').hasClass('btn-hselect')) {
				$(this).siblings('.floorInfoFixedAttrEye').trigger('click');
			}*/
			$(this).siblings('.btn-hselect').removeClass('btn-hselect');
			var floorInfoAttrParent = $(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr');
			if (floorInfoAttrParent.find('.floorInfoAttrTitleField').css('display') == 'none') {
				floorInfoAttrParent.find('.floorInfoAttrTitle').css({'display':'none'});
				floorInfoAttrParent.find('.floorInfoAttrTitleField').css({'display':'block'});
				$(this).addClass('btn-hselect');
			} else {
				floorInfoAttrParent.find('.floorInfoAttrTitleField').css({'display':'none'});
				var floorInfoAttrTitleField = floorInfoAttrParent.find('.floorInfoAttrTitleField').children('input[type=text]').val();
				floorInfoAttrTitleField = (floorInfoAttrTitleField != null && floorInfoAttrTitleField != '' ? floorInfoAttrTitleField : '[no title]' );
				floorInfoAttrParent.find('.floorInfoAttrTitle').text(floorInfoAttrTitleField);
				floorInfoAttrParent.find('.floorInfoAttrTitle').css({'display':'inline'});
				$(this).removeClass('btn-hselect');
			}
		});
		
		$('.floorInfoFixedAttrDelete').unbind('click');
		$('.floorInfoFixedAttrDelete').click(function(e) {
			$(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr').remove();
		});
		
		updateVisibilityOptionBtn();
		updateFloorInfoSubAttrShowHide();
		
		
		$('.floorInfoSubAttrComment').unbind('click');
		$('.floorInfoSubAttrComment').click(function(e) {
			//$(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr').remove();
			$(this).siblings('.btn-hselect').removeClass('btn-hselect');
			var floorInfoAttrParent = $(this).parentsUntil(".floorInfoSubAttr").parent('.floorInfoSubAttr');
			if (floorInfoAttrParent.find('.floorInfoSubAttrTitleField').css('display') == 'none') {
				floorInfoAttrParent.find('.floorInfoSubAttrTitle').css({'display':'none'});
				floorInfoAttrParent.find('.floorInfoSubAttrTitleField').css({'display':'block'});
				$(this).addClass('btn-hselect');
			} else {
				floorInfoAttrParent.find('.floorInfoSubAttrTitleField').css({'display':'none'});
				var floorInfoAttrTitleField = floorInfoAttrParent.find('.floorInfoSubAttrTitleField').children('input[type=text]').val();
				floorInfoAttrTitleField = (floorInfoAttrTitleField != null && floorInfoAttrTitleField != '' ? floorInfoAttrTitleField : '[no title]' );
				floorInfoAttrParent.find('.floorInfoSubAttrTitle').text(floorInfoAttrTitleField);
				floorInfoAttrParent.find('.floorInfoSubAttrTitle').css({'display':'block'});
				$(this).removeClass('btn-hselect');
			}
		});
		$('.floorInfoSubAttrDelete').unbind('click');
		$('.floorInfoSubAttrDelete').click(function(e) {
			$(this).parentsUntil(".floorInfoSubAttr").parent('.floorInfoSubAttr').remove();
		});
		
		$('.floorInfoCheckBtn').unbind('click');
		$('.floorInfoCheckBtn').click(function(e) {
			var floorInfoParent = $(this).parentsUntil(".floorInfo").parent('.floorInfo');
			floorInfoParent.siblings('.floorInfo').find('.floorInfoCheckBtn').removeClass('active');
		});	
		
		$('.addFloorAttrBtn').unbind('click');
		$('.addFloorAttrBtn').click(function(e) {	
			var floorInfoParentBody = $(this).parentsUntil(".floorInfo").parent('.floorInfo');		
			var floorInfoAttrListBody = floorInfoParentBody.find('.floorInfoAttrList');
			
			
			//$(".floorAttrToClone").clone(true).appendTo(floorInfoAttrListBody);
			var floorAttrToClone = floorInfoParentBody.find('.floorAttrToClone').children().first();
			floorAttrToClone.clone(true).appendTo(floorInfoAttrListBody);
			var floorInfoAttrNewChild = floorInfoAttrListBody.children().last();
			floorInfoAttrNewChild.removeClass('hide');
			floorInfoAttrNewChild.addClass('floorInfoAttr');
			if (!floorAttrToClone.hasClass('defaultFloorInfoAttr')) {
				floorAttrToClone.remove();
			}
			//floorInfoAttrNewChild.removeClass('floorAttrToClone');
			updateVisibilityOptionBtn();
			updateFloorInfoSubAttrShowHide();
			
			$('.floorInfoAttrComment').unbind('click');
			$('.floorInfoAttrComment').click(function(e) {
				//$(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr').remove();
				$(this).siblings('.btn-hselect').removeClass('btn-hselect');
				var floorInfoAttrParent = $(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr');
				if (floorInfoAttrParent.find('.floorInfoAttrTitleField').css('display') == 'none') {
					floorInfoAttrParent.find('.floorInfoAttrTitle').css({'display':'none'});
					floorInfoAttrParent.find('.floorInfoAttrTitleField').css({'display':'block'});
					$(this).addClass('btn-hselect');
				} else {
					floorInfoAttrParent.find('.floorInfoAttrTitleField').css({'display':'none'});
					var floorInfoAttrTitleField = floorInfoAttrParent.find('.floorInfoAttrTitleField').children('input[type=text]').val();
					floorInfoAttrTitleField = (floorInfoAttrTitleField != null && floorInfoAttrTitleField != '' ? floorInfoAttrTitleField : '[no title]' );
					floorInfoAttrParent.find('.floorInfoAttrTitle').text(floorInfoAttrTitleField);
					floorInfoAttrParent.find('.floorInfoAttrTitle').css({'display':'block'});
					$(this).removeClass('btn-hselect');
				}
			});
			
			$('.floorInfoAttrDelete').unbind('click');
			$('.floorInfoAttrDelete').click(function(e) {
				$(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr').remove();
			});
			
		});
		$('.floorInfoAttrDelete').unbind('click');
		$('.floorInfoAttrDelete').click(function(e) {
			$(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr').remove();
		});
		$('.floorInfoDelete').unbind('click');
		$('.floorInfoDelete').click(function(e) {
			$(this).parentsUntil(".floorInfo").parent('.floorInfo').remove();
			updateFloorInfoListTitle();
			updateSVGdropZone();
		});
		
		updateLeftPanelScrollCont();
		leftPanelScroller.refresh();
  });
		
		
	$(window).resize(function(e) {
		//console.log(testA);
		//console.log(leftPanelScroller);
		if (leftPanelScroller) {
			//leftPanelScroller.destroy();
			//updateLeftPanelScrollCont();	
			//$('.tab-pane .active').find('.antiscroll-inner').css({'height':'100%','width':'100%'});
			//leftPanelScroller = $('.tab-pane .active').find('.scroll-box-wrap').antiscroll().data('antiscroll');		
			//leftPanelScroller.refresh();
		}
  });
		
	
		
	/*$('.fileupload1').fileupload({
			dropZone: $('.dropzone1'),
      dataType: 'json',
			done: function (e, data) {
				console.log($(this));
				console.log(data);
				console.log(e);
            $.each(data.result.files, function (index, file) {
							//console.log(file);
                //$('<p/>').text(file.url).appendTo(document.body);
								//console.log($(this));
								//$('<img src="'+file.url+'" />').appendTo(document.body);
            });
        }
	});*/
	/*$('.addEvent').modal({
		 keyboard: false	
	});*/
	
	$('.myselectpicker').selectpicker();
	/*$('.mydatepicker input').datepicker({
		autoclose : true	
	})*/
	if ($('.contactDatepickerIconCal').length) {		
		$('.contactDatepickerIconCal').each(function(index, ele){
			//console.log(commBlockIndex);
			var dpClass = 'tbDatePicker-' + index;
			var dpIconClass = 'datepickerIconCal-' + index;
			
			if (!($(ele).parent().prev('.tbDatePicker').hasClass(dpClass))) {
				$(ele).parent().prev('.tbDatePicker').addClass(dpClass);
				$('.'+dpClass).datepicker({
					dateFormat : 'mm-dd-yy'
				});
			}
			
			if (!($(ele).hasClass(dpIconClass))) {
				$(ele).addClass(dpIconClass);
				$('.'+dpClass).datepicker({
					dateFormat : 'mm-dd-yy'
				});
				
				$("."+dpIconClass).click(function(e) {
					var dp = $(this).parent().prev('.'+dpClass);
					if (dp.datepicker('widget').is(':hidden')) {
						dp.datepicker("show");
					} else {
						//dp.hide();
					}
				
					e.preventDefault();
				});									
			}
		});
	}
	if ($('.contactStyledCheckbox').length) {
		$('.contactStyledCheckbox').each(function(chkInd, chkEle){
			var chkClass = 'contactStyledCheckbox-' + chkInd;
			if (!($(chkEle).hasClass(chkClass))) {
				$(chkEle).addClass(chkClass);									
				$('.'+chkClass).checkbox({
					cls:'jqueryCheckbox',
					empty:'img/empty.png'
				});
				/*$('.'+chkClass).click(function(e) {
					if (!$(this).is(':checked')){
						$(this).parentsUntil('.singleInfoRow').parent('.singleInfoRow').find('.timeTextField').attr('disabled', 'disabled');	
					} else {
						$(this).parentsUntil('.singleInfoRow').parent('.singleInfoRow').find('.timeTextField').removeAttr('disabled');		
					}
				});*/
				
				
			}
		});
	}
});

function updateVisibilityOptionBtn() {
	/*$('.floorInfoFixedAttrEye').unbind('click');
	$('.floorInfoFixedAttrEye').click(function(e) {
			//if ($(this).hasClass('btn-hselect'))
			
	});*/
}

function updateFloorInfoSubAttrShowHide() {
	$('.floorInfoSubAttrInfoShowHide').unbind('click');
	$('.floorInfoSubAttrInfoShowHide').click(function(e) {
		//var floorInfoAttrParent = $(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr');
		//floorInfoAttrParent.find('.floorInfoFixedAttrEye').trigger('click');
		
		var floorInfoAttrParent = $(this).parentsUntil(".floorInfoAttr").parent('.floorInfoAttr');
		/*if ($(this).siblings('.floorInfoFixedAttrComment').hasClass('btn-hselect')) {
			$(this).siblings('.floorInfoFixedAttrComment').trigger('click');
		}*/
		if (floorInfoAttrParent.find('.floorInfoSubAttrInfo').css('display') == 'none') {
			floorInfoAttrParent.find('.floorInfoSubAttrInfo').slideDown(1);
			$(this).addClass('icon-minus');	
		} else {
			floorInfoAttrParent.find('.floorInfoSubAttrInfo').slideUp(1);	
			$(this).removeClass('icon-minus');
		}
	});
}

function updateSVGdropZone() {
	
	if ($('.floorInfoList').children().length) {
				$('.svgDropZone').each(function(index, element) {
					//console.log(pindex);
						var newDropZoneClassName = 'dropzone-'+index;
						var newDropZoneFileUpClassName = 'fileupload-'+index;
						$(element).find('.svgDropHere').attr('class', 'svgDropHere');
						if (!($(element).find('.svgDropHere').hasClass(newDropZoneClassName))) {
							$(element).find('.svgDropHere').addClass(newDropZoneClassName);
							$(element).find('.fileupload').addClass(newDropZoneFileUpClassName);
							$('.'+newDropZoneFileUpClassName).fileupload({
								dropZone: $('.'+newDropZoneClassName),
								dataType: 'json',
								done: function (e, data) {
									dropZoneName = data.dropZone.selector;
									//console.log(dropZoneName);
											$.each(data.result.files, function (index, file) {
													var dropZoneParent = $(dropZoneName).parent();
													//console.log(dropZoneParent);
													dropZoneParent.html('<img src="'+file.url+'" style="width:250px; height:87px;" />');
											});
									}
							});
						}
				});
	}
	
	
	
	$('.svgDropZone').each(function(index, element) {
		//console.log($(element));
		if (index>1) {
			var newDropZoneClassName = 'dropzone-'+index;
			var newDropZoneFileUpClassName = 'fileupload-'+index;
			if (!($(element).find('.svgDropHere').hasClass(newDropZoneClassName))) {
				$(element).find('.svgDropHere').addClass(newDropZoneClassName);
				$(element).find('.fileupload').addClass(newDropZoneFileUpClassName);
				$('.'+newDropZoneFileUpClassName).fileupload({
					dropZone: $('.'+newDropZoneClassName),
					dataType: 'json',
					done: function (e, data) {
						dropZoneName = data.dropZone.selector;
						console.log(dropZoneName);
								$.each(data.result.files, function (index, file) {
										var dropZoneParent = $(dropZoneName).parent();
										console.log(dropZoneParent);
										//dropZoneParent.html('<img src="'+file.url+'" style="width:250px; height:87px;" />');
								});
						}
				});
			}
		}
  });	
}

function updateLeftPanelScrollCont() {
	//console.log($('.scroll-box-wrap').width());
	var scrollContHeight =  parseInt($(window).height()) - 175;//parseInt($('.scroll-box-wrap').offset().top);
	var scrollContWidth =  parseInt($('.scroll-box-wrap').width());
	//parseInt($(".tab-pane.active").css("height"));//
	//console.log($(window).height());
	//console.log(scrollContWidth);
	$('.scroll-box-wrap .scroll-box, .scroll-box-wrap .scroll-box .antiscroll-inner').css({'height':scrollContHeight+'px', 'overflow-x':'hidden'});
	//leftPanelScroller.refresh();
}
function updateFloorInfoListTitle() {
	if ($('.floorInfoList').children().length) {
		var floorInfoListLength = $('.floorInfoList').children().length;
		$('.floorInfoList').children().each(function(index, element) {
			//console.log(floorInfoListLength-index);
			$(element).find('.floorInfoTitle').children().text(floorInfoListLength-index);
		});
	}
}
window.onresize = function(event) {
	//console.log('resized');
	makeLeftpanelFitable();
	
	updateLeftPanelScrollCont();
	//$('.tab-pane .active').find('.antiscroll-inner').css({'height':'100%','width':'100%'});
	
		
}
makeLeftpanelFitable = function() {
	var newHeight = $(window).height() - 175;// - 195;
	$(".l-mapbuilder .tab-pane").css("height", newHeight+"px");

	/*newHeight = $(window).height() - 80;
	$(".custom-container").css("height", newHeight+"px");*/
}
