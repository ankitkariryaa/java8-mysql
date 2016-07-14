$(document)
		.ready(
				function() {

					// BEGIN - resizable columns and rows implementation
					var $leftColumn = $(".left-column");
					var $rightColumn = $(".right-column");
					// this 1px is necessary for some browsers,
					// otherwise columns will break after resize
					if ($leftColumn.length > 0) {
						$leftColumn.width($leftColumn.width() - 1);
					}
					if ($rightColumn.length > 0) {
						// just to have fixed width property
						$rightColumn.width($rightColumn.width() - 15);
					}
					var resizeDashboardColumns = function(delta) {
						$leftColumn.width($leftColumn.width() - delta);
						$rightColumn.width($rightColumn.width() + delta);
						CREEDO.dataviewcontainer.drawPointCloud();
					};

					$("#column-resizer")
							.draggable(
									{
										axis : "x",
										stop : function(e, ui) {
											resizeDashboardColumns(ui.originalPosition.left
													- ui.position.left);
											$("#column-resizer").css("left",
													"-2px");
										}
									});

					var resizeDashboardRows = function(delta) {
						var $bottomRow = $("#analysis-patterns");
						$bottomRow.height($bottomRow.height() + delta);

						ensureUnscrollableLayout();

						/*
						 * var tables = [ window.mainTable, window.metadataTable ]; $
						 * .each( tables, function(idx, table) { if (table) {
						 * var oSettings = table .fnSettings();
						 * oSettings.oScroll.sY = calcTableHeight() + 'px';
						 * table.fnDraw(); } });
						 */
						CREEDO.dataviewcontainer.drawPointCloud();
					};
					$("#row-resizer").draggable(
							{
								axis : "y",
								stop : function(e, ui) {
									resizeDashboardRows(ui.originalPosition.top
											- ui.position.top);
									$("#row-resizer").css("top", "-4px");
								}
							});
					// END - resizable columns and rows implementation

					// $("body").on(
					// "click",
					// ".detailed-view",
					// function(e) {
					// e.preventDefault();
					// // var $pattern = $(this).parents(".pattern");
					// // var patternId = $pattern.prop("id");
					// var link = $(this).prop("href");
					// window.open(link, "_blank",
					// "scrollbars=1,toolbar=0,location=0,menubar=0,status=0,height="
					// + screen.height + ",width="
					// + screen.width);
					// });

					// make analysis patterns sortable
					$("#analysis-patterns").sortable({
						items : "> .pattern",
						tolerance : "pointer"
					});

					// enable bootstrap tooltip and popover
					$("[data-toggle=tooltip]").tooltip();
					$("[data-toggle=popover]").popover();

					// calculate remaining height for table considering other
					// elements
					/*
					 * var calcTableHeight = function() { // ensure that there
					 * is no scroll in mining dashboard // need to be adjusted
					 * when there is change in the // design var footerHeight =
					 * $("#footer").height(); var headerHeight =
					 * $("#sub-header").height() + $(".navbar").height(); var
					 * analysisHeight = $("#analysis-patterns").height(); var
					 * theRest = 135; // margins, etc
					 * 
					 * return $(window).height() - headerHeight - analysisHeight -
					 * footerHeight - theRest; };
					 */

					// adjust #candidate-patterns container's height
					var adjustCandidatePatternsHeight = function() {
						var theRest = 143; // margins, etc
						$("#candidate-patterns").css(
								"max-height",
								$(window).height() - $("#header").height()
										- $("#footer").height() - theRest);

					};

					// adjust candidate patterns container height
					// on load
					adjustCandidatePatternsHeight();

					// get current window width
					var currentWindowWidth = $(window).width();

					// automatically resize elements in the dashboard
					// to fit current window height
					var ensureUnscrollableLayout = function() {
						// adjust heights
						var newTableHeight = calcTableHeight() + 'px';
						// var tables = [ window.mainTable ];
						var tables = [ CREEDO.dataviewcontainer.mainTable ];

						// var tables = [ window.mainTable, window.metadataTable
						// ];
						$.each(tables, function(idx, table) {
							if (table) {
								var oSettings = table.fnSettings();
								$('.dataTables_scrollBody').css('height',
										newTableHeight);
								table.fnAdjustColumnSizing();
								table.fnDraw();
							}
						});

						adjustCandidatePatternsHeight();

						// adjust widths
						var newWindowWidth = $(window).width();
						var delta = currentWindowWidth - newWindowWidth;
						$leftColumn.width($leftColumn.width() - delta);
						currentWindowWidth = newWindowWidth;
					};

					// whenever browser window resize
					// re-adjust element heights
					$(window).resize(ensureUnscrollableLayout);

					$('.pattern')
							.click(
									function(e) {
										if ($(this).find(".selectable").length > 0) {

											if ($(this).hasClass(
													"selected-for-rating")) {
												;
											} else {
												$(".selected-for-rating")
														.removeClass(
																"selected-for-rating");

												$(this).addClass(
														"selected-for-rating");

												var $patternSelect = $(this)
														.attr('id');
												$
														.get(
																'ratingdashboard/retrieve_rating.htm',
																{
																	dashboardId : window.analysisSessionId,
																	patternSelect : $patternSelect
																},
																function(data) {
																	var ratings = data
																			.split(",");
																	$(
																			'.btn-group')
																			.each(
																					function(
																							counter) {
																						$(
																								'.ratingOption_'
																										+ counter)
																								.each(
																										function(
																												e) {
																											$(
																													this)
																													.parent()
																													.removeClass(
																															"active");
																											if ($(
																													this)
																													.attr(
																															'id') == ratings[counter]
																													.trim()) {
																												$(
																														this)
																														.parent()
																														.addClass(
																																"active");
																												$(
																														this)
																														.attr(
																																'checked',
																																'checked');
																											}
																										});
																					});
																});
											}
										} else {
											;
										}

									});

					// set the first pattern in the analysis area as default
					$('.ratingPatterns').children().first().trigger('click');

					$('input:radio[class^=ratingOption]').change(
							function() {
								var $patternSelect = $(".selected-for-rating")
										.attr('id');
								var $metricSelect = this.name;
								var $optionSelect = this.id;
								$.post('ratingdashboard/submit_rating.htm', {
									dashboardId : window.analysisSessionId,
									patternSelect : $patternSelect,
									metricSelect : $metricSelect,
									optionSelect : $optionSelect
								}, function(status) {
									if (status != "0") {
										alert(status);
									}
								});
							});

					// set the checkbox in the custom dashboard as buttons.
					/*
					 * $(function() { $("#miningAlgorithmSelect").buttonset();
					 * });
					 */

					$("form#customMiningForm")
							.submit(
									function() {

										var formData = new FormData($(this)[0]);

										/*
										 * The tab that was open when the form
										 * was submitted determines whether to
										 * try to load a datatable from the DB
										 * or to try to load from files.
										 */
										var activeTab = $(this).find(
												'.nav-tabs li.active');

										// 0 = Database, 1 = Files
										var selectedTabIndex = $(this).find(
												'.nav-tabs li')
												.index(activeTab);

										formData.append("selectedTabIndex",
												selectedTabIndex);

										var targetWin = CREEDO.core
												.getNewPopUpWindow("loading.htm");

										$
												.ajax({
													url : 'customDash/createCustomDashboard.htm',
													type : 'POST',
													data : formData,
													async : false,
													cache : false,
													contentType : false,
													processData : false,
													success : function(url) {
														targetWin.location
																.replace(url);
														targetWin.focus();
													},
													error : function(request,
															status, error) {
														targetWin.close();
														alert("Status: "
																+ status
																+ ": "
																+ request.responseText);
													}
												});

										return false;
									});

					$('.toggleActiveAction')
							.click(
									function(e) {
										e.preventDefault();
										var userId = $(this).attr('userid');
										$
												.post(
														'toggleActive.htm',
														{
															userId : userId
														},
														function(activeStatus) {
															alert("Status toggled. New status: "
																	+ activeStatus
																	+ " Reload to see changes in effect.");
														})
									});


					// Start pinging the server
					// pingToServer();
				});

function calcTableHeight() {
	// ensure that there is no scroll in mining dashboard
	// need to be adjusted when there is change in the
	// design
	var footerHeight = $("#footer").height();
	var headerHeight = $("#sub-header").height() + $(".navbar").height();
	var analysisHeight = $("#analysis-patterns").height();
	var theRest = 135; // margins, etc

	var total = $(window).height() - headerHeight - analysisHeight
			- footerHeight - theRest;

	return total;
}
