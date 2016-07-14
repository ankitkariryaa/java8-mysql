/**
 * <p>
 * creedo-miningrunner.js v0.1.2.1
 * </p>
 * <p>
 * defines: module CREEDO.miningrunner
 * </p>
 * 
 * @author Ruofan Xu
 * @author Mario Boley
 * 
 */

CREEDO.namespace("CREEDO.miningrunner");

CREEDO.miningrunner = (function() {

	var core = CREEDO.core;

	var miningLauncherComponentId = $("#creedo-mininglauncher").attr(
			"creedoComponentId");
	var requestStopOfCurrentAlgorithmActionId = $("#creedo-mininglauncher")
			.attr("requestStopOfCurrentAlgorithmActionId");
	var analyticsDashboardId = $("#creedo-analytics-dashboard").attr(
			"creedoComponentId");
	var runAlgorithmActionId = $("#creedo-analytics-dashboard").attr(
			"runAlgorithmActionId");
	var savePatternActionId = $("#creedo-analytics-dashboard").attr(
			"savePatternActionId");

	var mineButton = $('#btn-start-mining');
	var stopButton = $('#btn-stop-mining');
	var executeButton = $('#refExecuteButton');

	var categoriesSelect = $('#algorithmCategoriesSelect');
	var algorithmsSelect = $('#algorithmSelect');
	var algorithmsArea = $('#refAlgorithmsArea');
	var parametersArea = $('#refParametersArea');

	var candidatesContainer = $("#candidate-patterns");
	var miningErrorNotification = $("#mining-error-notification");
	var showErrorDetailsIcon = $("#mining-error-notification-icon");

	/**
	 * Removes all patterns from candidate area and display a general error
	 * message below the mine-button with an additional icon to display specific
	 * cause of error.
	 * 
	 * @param stackTrace
	 *            Specific error message to be displayed when specific cause is
	 *            requested
	 */
	var showMiningError = function(stackTrace) {
		showErrorDetailsIcon.off("click");
		showErrorDetailsIcon.on("click", function() {
			core.showMessage(stackTrace, "Algorithm failure");
		});
		miningErrorNotification.removeClass("hidden");
		candidatesContainer.html("");
	};

	// published
	var setCandidates = function(data) {

		candidatesContainer.html(data);
		// activate tooltip on patterns
		candidatesContainer.find("[data-toggle=tooltip]").tooltip();

		// make patterns draggable
		candidatesContainer.find(".pattern").draggable({
			revert : 'invalid',
			appendTo : "body",
			helper : function(event, ui) {
				var helper = $(this).clone();
				helper.css('width', $(this).css('width'));
				helper.css('height', $(this).css('height'));
				return helper;
			},
			start : function(evt, ui) {
				$(this).css("display", "none");
			},
			revert : function(valid) {
				if (!valid) {
					$(this).css("display", "block");
					return true;
				} else {
					return false;
				}
			}
		});
	};

	/* Stop-Button functionality in manual mining system */
	var requestStopOfCurrentAlgorithm = function(e) {
		e.preventDefault();

		core.performAction(miningLauncherComponentId,
				requestStopOfCurrentAlgorithmActionId, [], function() {
				}, function() {
				}, function() {
					console.log("Requested stop of current algorithm");
					stopButton.addClass('disabled')
				});
	};

	var getCategories = function() {
		var firstCategory;
		categoriesSelect
				.html('<option value="">Select algorithm category</option>');

		$.post('/Creedo/manualmining/getcategories.json', {
			"miningLauncherId" : miningLauncherComponentId
		}, function(results) {
			$.each(results, function(index, current) {
				if (firstCategory === undefined) {
					firstCategory = current.category;
				}
				categoriesSelect.append($("<option />").val(current.category)
						.text(current.description));
			});
			if (results.length == 1) {
				categoriesSelect.val(firstCategory).trigger('change');
			}
		});

		categoriesSelect.change(function() {
			var selected = getCurrentSelectedCategory();
			console.log("miningrunner: category " + selected + " selected");
			parametersArea.hide();
			if (selected == "") {
				algorithmsArea.hide();
				executeButton.addClass('disabled');
			} else {
				getAndShowCategoryAlgorithms(selected);
			}
		});

	};

	var getAndShowCategoryAlgorithms = function(category) {
		$.post("/Creedo/manualmining/getcategoryalgorithms.json", {
			"algorithmCategory" : category,
			"miningLauncherId" : miningLauncherComponentId
		}, function(results) {

			var firstAlgorithm;

			algorithmsSelect.html($("<option />").val("").text(
					"Select algorithm"));
			$.each(results, function(index, current) {
				algorithmsSelect.append($("<option />").val(current.name).text(
						current.name));
				if (firstAlgorithm === undefined) {
					firstAlgorithm = current.name;
				}
			});

			algorithmsArea.show();

			if (results.length == 1) {
				algorithmsSelect.val(firstAlgorithm).trigger('change');
			}
		});
	};

	var selectAlgorithmAndGetParameters = function(algorithmName,
			parameterHandler) {
		$.post("/Creedo/manualmining/getalgorithmparameters.json", {
			"algorithmName" : algorithmName,
			"miningSystemId" : miningLauncherComponentId
		}, parameterHandler);
	};

	/**
	 * Maps the received parameters to visible control elements. Furthermore it
	 * checks for verifiability and validity of the values and conditionally
	 * shows hint icons and dis/en-ables the execute button.
	 * 
	 * @param results
	 */
	function updateParameterArea(results) {

		var renderParameters = CREEDO.parameters.renderParameters;

		parametersArea.hide();

		var allOk = true;
		executeButton.addClass('disabled');

		var allOk = renderParameters(parametersArea, results);

		// Initialize tooltips (should be already done by renderParameters
		$("[data-toggle=tooltip]").tooltip();
		$("[data-toggle=popover]").popover();

		$('.creedo-parameter-input').on('creedo:param-changed',
				getCheckParametersHandler);

		parametersArea.show();

		if (allOk) {
			executeButton.removeClass('disabled');
		}
	}

	function getCheckParametersHandler(event, paramName, paramValue) {
		sendParameterValuesAndGetNewState(paramName, paramValue,
				updateParameterArea);
	}

	var sendParameterValuesAndGetNewState = function(parameterName,
			parameterValue, parameterHandler) {
		$.post('/Creedo/manualmining/applyandgetalgorithmparameters.json', {
			"miningSystemId" : miningLauncherComponentId,
			"parameterName" : parameterName,
			"parameterValue" : parameterValue,
		}, parameterHandler);
	};

	var getCurrentSelectedAlgorithm = function() {
		return algorithmsSelect.find(":selected").val();
	}

	var getCurrentSelectedCategory = function() {
		return categoriesSelect.find(":selected").val();
	}

	var runSelectedAlgorithm = function() {
		console.log("miningrunner: running currently selected algorithm");
		var CORE = CREEDO.core;

		candidatesContainer
				.html("<div class=\"text-center\"><img src=\"client/images/loader.gif\" /></div>");

		/*
		 * Reset stop-button currently all algorithms are stoppable or at least
		 * information is not retrieved from server
		 */
		// if (isCurrentAlgorithmStoppable) {
		stopButton.removeClass('disabled');
		// } else {
		// stopButton.addClass('disabled');
		// }

		var algorithmName = getCurrentSelectedAlgorithm();

		if (algorithmName != '') {
			// Disable patterns areas
			candidatesContainer.addClass('disabled');
			/*
			 * deactivation of result area can not be done by mining runner (and
			 * seems to be unnecessary)
			 */
			// resultsPatterns.addClass('disabled');
			// Hide "Mine" button and instead show "Stop" button
			mineButton.addClass('hidden');
			stopButton.removeClass('hidden');

			miningErrorNotification.addClass('hidden');

			var miningCompleteHandler = function() {
				candidatesContainer.removeClass('disabled');
				/*
				 * deactivation of result area can not be done by mining runner
				 * (and seems to be unnecessary)
				 */
				// resultsPatterns.removeClass('disabled');
				// Hide "Stop" button and show "Mine" button instead
				stopButton.addClass('hidden');
				mineButton.removeClass('hidden');
			};

			CORE.performAction(analyticsDashboardId, runAlgorithmActionId, {},
					setCandidates, function(request, status, error) {
						showMiningError(request.responseText);
					}, miningCompleteHandler);

		}
	}

	$(document).ready(
			function() {
				console.log("init module: CREEDO.miningrunner");
				console.log("requestStopOfCurrentAlgorithmActionId: "
						+ requestStopOfCurrentAlgorithmActionId);

				getCategories();
				algorithmsSelect.change(function() {
					var selected = getCurrentSelectedAlgorithm();
					console.log("miningrunner: algorithm " + selected
							+ " selected");
					if (selected == "") {
						parametersArea.hide();
						executeButton.addClass('disabled');
					} else {
						selectAlgorithmAndGetParameters(selected,
								updateParameterArea);
					}
				});

				stopButton.click(requestStopOfCurrentAlgorithm);

				executeButton.addClass('disabled');
				executeButton.click(function(e) {
					e.preventDefault();
					refBox.modal('hide');
					runSelectedAlgorithm();
				});
			});

	return {
		runSelectedAlgorithm : runSelectedAlgorithm,
		showMiningError : showMiningError,
		setCandidatePatterns : setCandidates,
		getAndShowCategoryAlgorithms : getAndShowCategoryAlgorithms,
		selectAlgorithmAndGetParameters : selectAlgorithmAndGetParameters,
		sendParameterValuesAndGetNewState : sendParameterValuesAndGetNewState,
		getServerId : function() {
			return miningLauncherComponentId;
		},
		getAnalyticsDashboardServerId : function() {
			return analyticsDashboardId;
		},
		getRunAlgorithmActionId : function() {
			return runAlgorithmActionId;
		}
	};
}());
