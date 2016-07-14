/**
 * @author Mario Boley
 * 
 * @since 0.1.2
 * 
 * @version 0.1.2.16
 * 
 */

CREEDO.namespace("CREEDO.dataviewcontainer");

CREEDO.dataviewcontainer = (function() {

	console.log("loading module: CREEDO.dataviewcontainer");

	var creedoCore = CREEDO.core;

	var dataViewContainerId = $("#creedo-dataviewcontainer")
			.attr("componentId");

	var updatePointCloudActionId = $("#creedo-dataviewcontainer").attr(
			"updatePointCloudActionId");

	var mainTable = $("#content-table .datatable");
	var fixedColumnsTable;
	var metadataTable = $("#content-metadata .datatable");

	// the point objects to plot received from server
	var pointCloudData;
	var pointCloudAxesTitles;

	var viewFilter = {};

	/**
	 * Exported; Filter objects have string members "id", "name", and array
	 * member "content" with data ids passing the filter
	 */
	var addFilter = function(filter) {
		viewFilter[filter.id] = filter;
	};

	/**
	 * Exported;
	 */
	var removeFilter = function(id) {
		delete viewFilter[id];
	}

	function filterArray() {
		var result = [];
		for ( var id in viewFilter) {
			if (!viewFilter.hasOwnProperty(id)) {
				continue;
			}
			result.push(viewFilter[id]);
		}
		return result;
	}

	var datatableFilter = function(settings, data, index) {
		var filters;

		if (settings.oInstance.selector !== "#content-table .datatable") {
			// we apply filtering only to main table
			return true;
		}

		filters = filterArray();
		for (var i = 0; i < filters.length; i++) {
			if ($.inArray(index, filters[i].content) === -1) {
				return false;
			}
		}
		return true;
	};

	var scatterCategorySymbols = {
		0 : "circle",
		1 : "square",
		2 : "triangle",
		3 : "triangle-down",
		4 : "diamond"
	};

	var processColumnTooltips = function(tooltips) {
		var $columns = $(".datatable-column");
		$.each($columns, function(index, column) {
			$(column).tooltip({
				container : "body",
				placement : "bottom",
				title : tooltips[index],
				trigger : "hover",
				html : "true"
			});
		});
	}

	var processDescription = function(description) {
		$("#datasetNameElement").tooltip({
			container : "body",
			placement : "bottom",
			title : description,
			trigger : "hover",
			html : "true"
		});
	}

	var processTableData = function(data) {
		mainTable.removeClass("hide").dataTable({
			"scrollX" : true,
			"scrollY" : calcTableHeight() + 'px',
			"scrollCollapse" : true,
			"bSortClasses" : false,
			"bLengthChange" : false,
			"iDisplayLength" : 40,
			"bScrollCollapse" : false,
			"fnDrawCallback" : function() {
				if (fixedColumnsTable != null) {
					fixedColumnsTable.fnRedrawLayout();
				}
			}
		});

		fixedColumnsTable = new $.fn.dataTable.FixedColumns(mainTable);

		/*
		 * Here an index is given to each row in the table The index corresponds
		 * to the index of the data received from the server side
		 */
		$.each(data, function(idx, row) {
			mainTable.fnAddData(row, false);
		});
		$("#content-table .loader").addClass("hide");
		mainTable.fnDraw();
		fixedColumnsTable.fnUpdate();
		fixedColumnsTable.fnRedrawLayout();
	};

	// var renderDatatable = function() {
	// // render content(dataset) datatable
	// if (mainTable.length > 0) {
	// console.time('datatable render');
	// creedoCore.requestData(dataViewContainerId, "tableData",
	// processTableData);
	// console.timeEnd('datatable render');
	//
	// }
	// };

	var openSetupDialog = function() {

		var dialogContent = $('<div/>');

		bootbox.dialog({
			title : "Set visualization parameters",
			message : dialogContent,
			buttons : {
				success : {
					/**
					 * @required String this button's label
					 */
					label : "Draw",

					/**
					 * @optional String an additional class to apply to the
					 *           button
					 */
					className : "btn-success disabled creedo-redraw-button",

					callback : function() {
						pointCloudAxesTitles = null;
						pointCloudData = null;
						drawPointCloud();
					}
				},
			}
		});

		var redrawButton = $('.creedo-redraw-button');

		dialogContent.load = function() {
			creedoCore.requestData(dataViewContainerId, "pointParameters",
					function(params) {
						var allValid = CREEDO.parameters.renderParameters(
								dialogContent, params);
						if (allValid) {
							redrawButton.removeClass('disabled');
						} else {
							redrawButton.addClass('disabled');
						}
					});
		};

		dialogContent.on('creedo:param-changed', function(event, paramName,
				paramValue) {
			creedoCore.performAction(dataViewContainerId,
					updatePointCloudActionId, [ paramName, paramValue ],
					function() {
						dialogContent.load();
					});
		});

		dialogContent.load();

	};

	var drawPointCloud = function() {
		var $container = $('#content-point-cloud');
		if ($container.length == 0) {
			return;
		}
		// $container.height($('#content-table').height());
		$container.height(calcTableHeight());

		if (pointCloudAxesTitles == null) {
			CREEDO.core.requestData(dataViewContainerId, "pointAxesTitles",
					function(axesTitles) {
						pointCloudAxesTitles = axesTitles;
						draw();
					});
		} else {
			draw();
		}

		// Only request point-cloud-data if not already present
		function draw() {
			if (pointCloudData == null) {
				CREEDO.core.requestData(dataViewContainerId, "pointData",
						function(data) {
							pointCloudData = data;
							processPointCloudData();
						});
			} else {
				processPointCloudData();
			}
		}

		function processPointCloudData() {
			$container
					.highcharts({
						chart : {
							type : 'scatter',
							zoomType : 'xy'
						},
						title : {
							text : ''
						},
						xAxis : {
							title : {
								text : pointCloudAxesTitles[0],
								style : {
									color : 'black',
									fontSize : '14px'
								}
							},
							labels : {
								style : {
									color : 'black',
									fontSize : '13px'
								}
							},
							lineColor : '#000000',
							tickColor : '#000000'
						},
						yAxis : {
							title : {
								text : pointCloudAxesTitles[1],
								style : {
									color : 'black',
									fontSize : '14px'
								}
							},
							lineColor : '#000000',
							labels : {
								style : {
									color : 'black',
									fontSize : '13px'
								}
							},
							lineWidth : 1,
							gridLineWidth : 0,
							tickWidth : 1,
							tickColor : '#000000'
						},
//						legend : {
//							enabled : true,
//							reversed : true,
//							itemStyle : {
//								fontSize : '14px'
//							}
//						},
						tooltip : {
							formatter : function() {
								return this.point.objName
										+ "<br>"
										+ (this.point.creedoCategoryName ? ("<b>category:</b> "
												+ this.point.creedoCategoryName + "<br>")
												: "") + "<b>x:</b> "
										+ this.point.x + "<br>" + "<b>y:</b> "
										+ this.point.y;
							}
						},
						series : generateSeries(),
						plotOptions : {
							series : {
								marker : {
									lineColor : 'rgba(20, 20, 20, .5)',
									lineWidth : 1,
									radius : 3,
									symbol : scatterCategorySymbols[0]
								},
								dataLabels : {
									enabled : pointCloudData.length <= 10000,
									formatter : function() {
										return this.point.showLabel ? this.point.objName
												: null;
									},
									style : {
										fontSize : '13px'
									}
								},
								point : {
									events : {
										click : pointCloudData.length <= 10000 ? function(
												e) {
											if (!this.showLabel) {
												this.update({
													showLabel : true
												});
											} else {
												this.update({
													showLabel : false
												});
											}
											console.log(this);
										}
												: null
									}
								}
							}
						},
					});
		}

		function seriesForTwoFilters(filter1, filter2) {
			var seriesAll = [];
			var seriesOnlyFirst = [];
			var seriesOnlySecond = [];
			var seriesNone = [];

			$.each(pointCloudData, function(index, item) {
				var inFirst = $.inArray(item.id, filter1.content) !== -1;
				var inSecond = $.inArray(item.id, filter2.content) !== -1;
				item.marker = {
					symbol : scatterCategorySymbols[item.category]
				};
				if (inFirst && inSecond) {
					seriesAll.push(item);
				} else if (inFirst) {
					seriesOnlyFirst.push(item);
				} else if (inSecond) {
					seriesOnlySecond.push(item);
				} else {
					seriesNone.push(item);
				}
			});

			return [ {
				turboThreshold : 0,
				name : 'rest',
				color : 'rgba(155, 155, 155, .5)',
				data : seriesNone
			}, {
				turboThreshold : 0,
				name : filter1.name + " ONLY",
				color : 'rgba(255, 255, 0, .5)',
				data : seriesOnlyFirst
			}, {
				turboThreshold : 0,
				name : filter2.name + " ONLY",
				color : 'rgba(255, 0, 255, .5)',
				data : seriesOnlySecond
			}, {
				turboThreshold : 0,
				name : filter1.name + " AND " + filter2.name,
				color : 'rgba(255, 0, 0, .5)',
				data : seriesAll
			} ];
		}

		function seriesForOneFilter(filter) {
			var rest = [];
			var selected = [];
			$.each(pointCloudData, function(index, item) {
				item.marker = {
					symbol : scatterCategorySymbols[item.category]
				};
				if ($.inArray(item.id, filter.content) === -1) {
					rest.push(item);
				} else {
					selected.push(item);
				}
			});
			return [ {
				turboThreshold : 0,
				name : 'rest',
				color : 'rgba(155, 155, 155, .5)',
				data : rest
			}, {
				turboThreshold : 0,
				name : filter.name,
				color : 'rgba(255, 0, 0, .5)',
				data : selected
			} ];
		}

		function seriesForNoFilter() {
			$.each(pointCloudData, function(index, item) {
				item.marker = {
					symbol : scatterCategorySymbols[item.category]
				};
			});
			return [ {
				turboThreshold : 0,
				name : 'all data',
				color : 'rgba(0, 0, 255, .5)',
				data : pointCloudData
			} ];
		}

		function seriesForArbitraryNumberOfFilters(filters) {
			function numberOfSatisfiedFilters(index) {
				var result = 0;
				for (var i = 0; i < filters.length; i++) {
					if ($.inArray(index, filters[i].content) !== -1) {
						result = result + 1;
					}
				}
				return result;
			}

			var seriesAll = [];
			var seriesSome = [];
			var seriesNone = [];

			$.each(pointCloudData, function(index, item) {
				item.marker = {
					symbol : scatterCategorySymbols[item.category]
				};
				var numberOfFilters = numberOfSatisfiedFilters(index);
				if (numberOfFilters === 0) {
					seriesNone.push(item);
				} else if (numberOfFilters === filters.length) {
					seriesAll.push(item);
				} else {
					seriesSome.push(item);
				}
			});

			return [ {
				turboThreshold : 0,
				name : 'rest',
				color : 'rgba(155, 155, 155, .5)',
				data : seriesNone
			}, {
				turboThreshold : 0,
				name : 'selected by some',
				color : 'rgba(255, 0, 255, .5)',
				data : seriesSome
			}, {
				turboThreshold : 0,
				name : 'selected by all',
				color : 'rgba(255, 0, 0, .5)',
				data : seriesAll
			} ];
		}

		function generateSeries() {
			var filters = filterArray();
			if (filters.length == 0) {
				return seriesForNoFilter();
			} else if (filters.length == 1) {
				return seriesForOneFilter(filters[0]);
			} else if (filters.length == 2) {
				return seriesForTwoFilters(filters[0], filters[1]);
			} else {
				return seriesForArbitraryNumberOfFilters(filters);
			}
		}
	};

	var redrawFilteringDependentViews = function() {
		mainTable.fnDraw();
		drawPointCloud();
	};

	$(document)
			.ready(
					function() {

						console.log("init module: CREEDO.dataviewcontainer");

						$.fn.dataTable.ext.search.push(datatableFilter);

						// renderDatatable();
						creedoCore.requestData(dataViewContainerId,
								"tableData", processTableData);
						creedoCore.requestData(dataViewContainerId,
								"columnTooltips", processColumnTooltips);
						creedoCore.requestData(dataViewContainerId,
								"description", processDescription);

						Highcharts.setOptions({
							chart : {
								plotBorderWidth : 0,
								plotBorderColor : 'black',
								ignoreHiddenSeries: false
							},
							legend : {
								enabled : true,
								reversed : true,
								itemStyle : {
									fontSize : '14px'
								}
							},
							credits : {
								enabled : false
							},
							navigation : {
								buttonOptions : {
									verticalAlign : 'bottom'
								}
							},
							exporting : {
								sourceWidth : 1280,
								sourceHeight : 960,
								scale : 1,
								chartOptions : {
									chart : {
										plotBorderWidth : 0,
									},
									xAxis : {
										title : {
											style : {
												fontSize : '36px'
											}
										},
										labels : {
											style : {
												fontSize : '34px'
											}
										},
										tickPixelInterval : 200,
										lineWidth : 2,
										tickWidth : 2
									},
									yAxis : {
										title : {
											style : {
												fontSize : '36px'
											}
										},
										labels : {
											style : {
												fontSize : '34px'
											}
										},
										tickPixelInterval : 180,
										lineWidth : 2,
										tickWidth : 2
									},
									legend : {
										itemStyle : {
											// color : '#000000',
											fontSize : '36px'
										},
										symbolPadding : 16,
									},
									plotOptions : {
										series : {
											marker : {
												lineWidth : 2,
												radius : 8,
											},
											dataLabels : {
												style : {
													fontSize : '34px'
												}
											},
										}
									}
								}
							}

						});

						Highcharts.getOptions().exporting.buttons.contextButton.menuItems
								.unshift({
									text : 'Change parameters',
									onclick : openSetupDialog
								});
						Highcharts.getOptions().exporting.buttons.contextButton.menuItems
								.unshift({
									text : 'Open data window',
									onclick : function() {
										var chart = $('#content-point-cloud')
												.highcharts();
										// console.log(chart.series[1]);

										var w = window.open();
										$(w.document.body)
												.html(
														"<pre><code>"
																+ JSON
																		.stringify(
																				{
																					"xData selected" : chart.series[1].xData,
																					"yData selected" : chart.series[1].yData,
																					"xData rest" : chart.series[1].xData,
																					"yData rest" : chart.series[1].yData
																				},
																				null,
																				'\t')
																+ "</code></pre>");
									}
								});

						$('#tab-content').on('shown.bs.tab', function(e) {
							mainTable.fnDraw();
						});
						$('#tab-point-cloud').on('shown.bs.tab', function(e) {
							drawPointCloud();
						});
						// render metadata table
						$('#tab-metadata').on('shown.bs.tab', function(e) {
							$target = $(e.target);
							if (!$target.data('tableRendered')) {

								metadataTable.dataTable({
									"scrollY" : calcTableHeight() + 'px',
									"scrollCollapse" : true,
									"bSortClasses" : false,
									"bLengthChange" : false,
									"bFilter" : false,
									"paging" : false,
									"bScrollCollapse" : false
								});
								$target.data('tableRendered', true);
							}
							metadataTable.fnDraw();
						});

					});

	return {
		mainTable : mainTable,
		redrawFilteringDependentViews : redrawFilteringDependentViews,
		drawPointCloud : drawPointCloud,
		addFilter : addFilter,
		removeFilter : removeFilter
	};

}());