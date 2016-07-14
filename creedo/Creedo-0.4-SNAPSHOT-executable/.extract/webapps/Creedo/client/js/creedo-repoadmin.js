/**
 * Initializes all parameter area elements by requesting from server parameter
 * data for respective entry.
 * 
 * @author Mario Boley
 * 
 * @version 0.3.0
 * 
 */

$(document).ready(

		function() {

			var PARAMETERS = CREEDO.parameters;

			/**
			 * To be called as method of a parameter area with componentId and
			 * entryId attribute
			 */
			function loadParamsFromServer() {
				var paramArea = this;
				var $this = $(this);
				var componentId = $this.attr('componentId');
				var entryId = $(this).attr('entryId');

				CREEDO.core.requestData(componentId, entryId, function(result) {
					PARAMETERS.renderParameters($this, result);
				});
			}

			function initParamArea() {

				// this points to dom node of parameter area (since called
				// through
				// selector.each)
				var paramArea = this;
				var $paramArea = $(this);

				loadParamsFromServer.apply(this);

				$(this).on(
						'creedo:param-changed',
						function(event, paramName, paramValue) {
								CREEDO.core.performAction($paramArea
									.attr('componentId'), $paramArea
									.attr('parameterUpdateActionId'), [
									paramName, paramValue ], function() {
								loadParamsFromServer.apply(paramArea);
							});
						});

			}

			$('.parameterArea').each(initParamArea);
		});
