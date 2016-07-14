function ocmMine(e) {
	var creedoCore = CREEDO.core;
	var miningrunner = CREEDO.miningrunner;
	var $that = $(this);
	var $container = $("#candidate-patterns");
	$("#analysis-patterns").addClass("disabled");
	$container
			.html("<div class=\"text-center\"><img src=\"client/images/loader.gif\" /></div>");
	e.preventDefault();
	$that.addClass('disabled');

	$('#mining-error-notification').addClass('hidden');

	creedoCore.performAction(miningrunner.getAnalyticsDashboardServerId(),
			miningrunner.getRunAlgorithmActionId(), {},
			miningrunner.setCandidatePatterns,
			function(request, status, error) {
				miningrunner.showMiningError(request.responseText);
			}, function() {
				$that.removeClass('disabled');
				$("#analysis-patterns").removeClass("disabled");
			});

}

$(document).ready(function() {
	$("#btn-start-mining").on("click", ocmMine);// .click();
});
