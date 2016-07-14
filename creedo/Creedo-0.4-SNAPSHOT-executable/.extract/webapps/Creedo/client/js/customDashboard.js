var renderParameters = CREEDO.parameters.renderParameters;
var systemVariantSelector = $('#systemVariantSelect');
var parameterArea = $('#customDashParameterArea');

function systemVariantSelectorChange() {
	var value = systemVariantSelector.find(":selected").val();
	$.post("customDash/setSystemVariant.json", {
		"systemVariantId" : value
	}).done(updateCustomDashParameterArea);
}

function initCustomDashboardJs() {
	systemVariantSelector.change(systemVariantSelectorChange);

	updateCustomDashParameterArea();
}

function updateCustomDashParameterArea() {
	parameterArea.html('');

	$.get("customDash/getParameters.json", function(results) {
		renderParameters(parameterArea, results);
		initializeParameters();
	})
}

function initializeParameters() {
	// Initialize tooltips
	$("[data-toggle=tooltip]").tooltip();
	$("[data-toggle=popover]").popover();

	// Register change handler
	// $('.extParameter,
	// .intParameter').not('.multiple-select').change(registerParameterChange);
	// $('.multiple-select').multiselect({
	// buttonWidth: '100%',
	// onDropdownHidden: registerParameterChange
	// });
	$('.text-parameter, .range-enumerable-parameter').change(
			registerParameterChange);
	$('.subset-parameter').multiselect({
		buttonWidth : '100%',
		onDropdownHidden : registerParameterChange
	});
}

function registerParameterChange() {
	var current = $(this);

	var result = getParameterState(current);

	$.post('customDash/setParameter.json', {
		parameterName : result.parameterName,
		parameterValue : result.parameterValue
	}).done(updateCustomDashParameterArea);
}

$(document).ready(function() {

	// Init Custom dashboard JS functions
	initCustomDashboardJs();

});