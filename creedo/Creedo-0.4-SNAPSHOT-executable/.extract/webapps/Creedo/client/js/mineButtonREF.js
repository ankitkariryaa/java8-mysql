var categoriesSelect = $('#algorithmCategoriesSelect');
var algorithmsArea = $('#refAlgorithmsArea');
var algorithmsSelect = $('#algorithmSelect');
var parametersArea = $('#refParametersArea');
var executeButton = $('#refExecuteButton');
var candidatesContainer = $("#candidate-patterns");
var resultsPatterns = $('#analysis-patterns');
var refBox = $('#refControlBox');
var mineButton = $('#btn-start-mining');
var stopButton = $('#btn-stop-mining');
var isCurrentAlgorithmStoppable = true;

function refMine(e) {
	e.preventDefault();

	/* Reference mining system logic */
	refBox.modal();
}

// function getExecuteButtonEventHandler(e) {
// var miningrunner = CREEDO.miningrunner;
// e.preventDefault();
//
// // Hide box
// refBox.modal('hide');
// miningrunner.runSelectedAlgorithm();
// }

$(document).ready(function() {
	var showDialog = $("#btn-start-mining").attr('showDialog') === "true";

//	executeButton.addClass('disabled');
	// getCategories();

	// Register event handler for change-events
	// categoriesSelect.change(getCategoryAlgorithmsEventHandler);
	// algorithmsSelect.change(getAlgorithmParametersEventHandler);

	// Register callback for execute button
	// executeButton.click(getExecuteButtonEventHandler);

	if (showDialog) {
		$("#btn-start-mining").click(refMine);
	} else {
		$("#btn-start-mining").click(function(e)  {
			e.preventDefault();
			CREEDO.miningrunner.runSelectedAlgorithm();
		});
	}

});
