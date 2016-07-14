/**
 * <p>
 * creedo-patterns.js v0.1.2.1
 * </p>
 * <p>
 * defines: module CREEDO.patterns
 * </p>
 * 
 * @author Ruofan Xu
 * @author Bo Kang
 * @author Björn Jacobs
 * @author Elvin Efendijev
 * @author Mario Boley
 * 
 */

CREEDO.namespace("CREEDO.patterns");

CREEDO.patterns = (function() {

	console.log("loading module: CREEDO.patterns")

	var CORE = CREEDO.core;
	var dataViewContainer = CREEDO.dataviewcontainer;

//	var patternsForDataFiltering = [];

	var isPatternSelectedForFiltering = function($pattern) {
		var $icon = $pattern.find(".btn-toggle-support-set span");
		return $icon.hasClass("glyphicon-fullscreen");
	};
	
	function addPatternFilterToViewContainer(id, name, supportSet) {
		dataViewContainer.addFilter({
			id:id,
			name:name,
			content:supportSet
		});
		dataViewContainer.redrawFilteringDependentViews();		
	};

	var selectPatternForFiltering = function($pattern) {
		var id = $pattern.prop("id");
		var supportSetProviderId = $pattern.attr("supportSetProviderId");
		var supportSet = ($pattern.data("support-set") || []);
		var filterName = $pattern.data("annotation") || "pattern "+id+1;

//		patternsForDataFiltering.push(id);
		if (supportSet.length == 0) {
			CORE.requestData(supportSetProviderId, id, function(data) {
				$pattern.data("support-set", data);
				addPatternFilterToViewContainer(id,filterName, data);
			});
		} else {
			addPatternFilterToViewContainer(id, filterName, supportSet);
		}
		setPatternSelectedForFilteringProperties($pattern);
	}

	var setPatternSelectedForFilteringProperties = function($pattern) {
		var $icon = getPatternToggleSupportSetIcon($pattern);
		$icon.removeClass("glyphicon-screenshot");
		$icon.addClass("glyphicon-fullscreen");
		$pattern.addClass("selected-for-data-filter");
	}

	var unselectPatternForFiltering = function($pattern) {
		var id = $pattern.prop("id");
		
		dataViewContainer.removeFilter(id);

		dataViewContainer.mainTable.fnDraw();
		dataViewContainer.drawPointCloud();

		unsetPatternSelectedForFilteringProperties($pattern);
	}

	var unsetPatternSelectedForFilteringProperties = function($pattern) {
		var $icon = getPatternToggleSupportSetIcon($pattern);
		$icon.removeClass("glyphicon-fullscreen");
		$icon.addClass("glyphicon-screenshot");
		$pattern.removeClass("selected-for-data-filter");
	}

	var getPatternToggleSupportSetIcon = function($pattern) {
		return $pattern.find(".btn-toggle-support-set span");
	}

	var detailedViewClickEventHandler = function(e) {
		e.preventDefault();
		// var $pattern = $(this).parents(".pattern");
		// var patternId = $pattern.prop("id");
		var pattern = $(this).parents(".pattern");
		var patternActionProviderId = $(pattern).attr("actionProviderId");
		console.log("actionProviderId of pattern: " + patternActionProviderId);
		var detailedViewActionId = $(pattern).attr("openDetailedViewActionId");
		console.log("openDetailedViewActionId: " + detailedViewActionId);
		var patternId = pattern.prop("id");
		console.log("patternId: " + patternId);

		CORE.performActionAndAwaitResultInNewPopUp(patternActionProviderId,
				detailedViewActionId, [ patternId ]);

		// var link = $(this).prop("href");
		// window.open(link, "_blank",
		// "scrollbars=1,toolbar=0,location=0,menubar=0,status=0,height="
		// + screen.height + ",width=" + screen.width);

	}

	$(document).ready(function() {

		console.log("init module: CREEDO.patterns");

		$("body").on("click", ".btn-toggle-support-set", function(e) {
			e.preventDefault();

			var $pattern = $(this).parents(".pattern");
			// var $icon = $(this).find("span");

			if (isPatternSelectedForFiltering($pattern)) {
				// Is already selected for
				// filtering, should
				// be undone
				unselectPatternForFiltering($pattern);
			} else {
				// Should be selected for
				// filtering
				selectPatternForFiltering($pattern);
			}
		});

		$("body").on("click", ".detailed-view", detailedViewClickEventHandler);

	});

	return {
		isPatternSelectedForFiltering : isPatternSelectedForFiltering,
		selectPatternForFiltering : selectPatternForFiltering,
		setPatternSelectedForFilteringProperties : setPatternSelectedForFilteringProperties,
		unselectPatternForFiltering : unselectPatternForFiltering
	};

})();