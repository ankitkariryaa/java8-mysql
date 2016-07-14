/**
 * <p>
 * creedo-analyticsdashboard.js v0.1.2.1
 * </p>
 * <p>
 * defines: module CREEDO.analyticsdashboard
 * </p>
 * 
 * @author Ruofan Xu
 * @author Elvin Efendijev
 * @author Bo Kang
 * @author Björn Jacobs
 * @author Mario Boley
 * 
 */

CREEDO.namespace("CREEDO.analyticsdashboard");

CREEDO.analyticsdashboard = (function() {

	console.log("loading module: CREEDO.analyticsdashboard");

	var CORE = CREEDO.core;
	var CPATTERNS = CREEDO.patterns;

	var id = $("#creedo-analytics-dashboard").attr("creedoComponentId");
	var runAlgorithmActionId = $("#creedo-analytics-dashboard").attr(
			"runAlgorithmActionId");
	var savePatternActionId = $("#creedo-analytics-dashboard").attr(
			"savePatternActionId");
	var deletePatternActionId = $("#creedo-analytics-dashboard").attr(
			"deletePatternActionId");
	var annotatePatternActionId = $("#creedo-analytics-dashboard").attr(
			"annotatePatternActionId");

	var bindAnnotationHandlers = function() {
		$('.annotation').on(
				'keypress',
				function(e) {
					var code = e.keyCode || e.which;
					if (code == 13) { // Enter keycode
						var annotationText = $(this).val();
						var $pattern = $(this).parents(".pattern");
						var patternId = $pattern.prop("id");
						$pattern.data("annotation", annotationText);
						console.log("Submitting annotation to server...");
						CORE.performAction(id, annotatePatternActionId, [
								patternId, annotationText ], function() {
							console.log("Server returned ok");
						});
					}
				});
	};

	var bindAnnotationHandler = function(patternId) {
		$('#' + patternId + ' .annotation').on(
				'keypress',
				function(e) {
					var code = e.keyCode || e.which;
					if (code == 13) { // Enter keycode
						var annotationText = $(this).val();
						var $pattern = $(this).parents(".pattern");
						var patternId = $pattern.prop("id");
						$pattern.data("annotation", annotationText);
						console.log("Submitting annotation to server...");
						CORE.performAction(id, annotatePatternActionId, [
								patternId, annotationText ], function() {
							console.log("Server returned ok");
						});
					}
				});
	};

	var dropToResultAreaHandler = function(event, ui) {
		var patternId = ui.draggable.prop("id");

		var patternSaveRequestHandler = function(data) {
			var $oldPatternBeforeMove = $(".pattern[id=" + patternId + "]");
			var wasSelected = CPATTERNS
					.isPatternSelectedForFiltering($oldPatternBeforeMove);

			$("#analysis-patterns").append(data);
			ui.draggable.remove();

			if (wasSelected) {
				var $newPatternAfterMove = $(".pattern[id=" + patternId + "]");
				CPATTERNS
						.setPatternSelectedForFilteringProperties($newPatternAfterMove);
			}

			bindAnnotationHandler(patternId);

			// bindAnnotationHandlers();
		};

		CORE.performAction(id, savePatternActionId, [ patternId ],
				patternSaveRequestHandler);
	};

	var deletePattern = function(pattern) {

		var successHandler = function() {
			if (CPATTERNS.isPatternSelectedForFiltering(pattern)) {
				CPATTERNS.unselectPatternForFiltering(pattern);
			}
			pattern.hide("slow");
		}

		var patternId = pattern.prop("id");
		CORE.performAction(id, deletePatternActionId, [ patternId ],
				successHandler);
	}

	$(document).ready(function() {
		console.log("init module: CREEDO.analyticsdashboard");
		console.log("analytics dashboard server component id: " + id);
		console.log("run algorithm action id: " + runAlgorithmActionId);
		console.log("save pattern action id: " + savePatternActionId);
		console.log("annotate pattern action id: " + annotatePatternActionId);

		// drag drop functionality in mining dashboard
		$("#analysis-patterns").droppable({
			accept : "#candidate-patterns .pattern",
			drop : dropToResultAreaHandler
		});

		$("body").on("click", ".btn-remove-pattern", function(e) {
			e.preventDefault();
			var pattern = $(this).parents(".pattern");
			deletePattern(pattern);
		});

		bindAnnotationHandlers();

	});

	return {
		getId : function() {
			return id;
		},
		getRunAlgorithmActionId : function() {
			return runAlgorithmActionId;
		}
	};
}());
