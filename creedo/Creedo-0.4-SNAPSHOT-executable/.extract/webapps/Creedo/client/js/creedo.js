/**
 * <p>
 * creedo.js v0.1.2.3
 * </p>
 * <p>
 * defines: global CREEDO, function CREEDO.namespace, module CREEDO.core
 * </p>
 * <p>
 * Module defines interface for communicating with a Creedo server. In
 * particular, on document ready all html elements with the actionLink class
 * will receive an on click handler that initializes an appropriate http
 * request.
 * </p>
 * 
 * @author Mario Boley
 * 
 */

var CREEDO = CREEDO || {};

/**
 * Returns (and creates on demand) namespace objects within the global CREEDO
 * object that contain the functions visible inside that conceptual namespace.
 * 
 * @param namespaceName
 *            string referencing the desired namespace; e.g.,
 *            "CREEDO.mining.data"; leading 'CREEDO' reference is optional
 * @return referenced namespace object
 */
CREEDO.namespace = function(namespaceName) {
	var parts = namespaceName.split('.');
	var parent = CREEDO;
	var i;

	if (parts[0] === "CREEDO") {
		parts = parts.slice(1);
	}

	for (i = 0; i < parts.length; i += 1) {
		if (typeof parent[parts[i]] === "undefined") {
			parent[parts[i]] = {};
		}
		parent = parent[parts[i]];
	}
	return parent;
}

CREEDO.namespace("CREEDO.core");

CREEDO.core = (function() {

	console.log("loading module: CREEDO.core");

	var getNewPopUpWindow = function(url) {
		// $.blockUI();
		var result = window.open(url, "_blank",
				"fullscreen=no,scrollbars=1,toolbar=0,location=0,menubar=0,status=0,height="
						+ screen.availHeight + ",width=" + screen.availWidth);
		result.moveTo(0, 0);
		result.resizeTo(screen.availWidth, screen.availHeight);
		return result;
	};

	var showMessage = function(text, title) {
		bootbox.dialog({
			title : title,
			message : text,
			buttons : {
				success : {
					label : "OK",
					className : "btn-success"
				}
			}
		});
	};

	var refresh = function() {
		var currentLocation = window.location.href;
		window.location.href = currentLocation;
	};

	var redirect = function(url) {
		window.location.href = url;
	};

	var defaultErrorHandler = function(xhr) {
		showMessage(xhr.responseText);
	};

	var loadFrameInNewWindow = function(postUrl, postData, target) {
		$.ajax({
			type : "POST",
			url : postUrl,
			data : postData,
			dataType : "text",
			timeout : 30000, // in milliseconds
			success : function(url) {
				target.location.replace(url);
				// target.displayDashboardFromUrl(url);
				target.focus();
			},
			error : function(request, status, err) {
				target.close();
				if (status == "timeout") {
					alert(status);
				}
			}
		});
	};

	/**
	 * Performs get request for a designated data package from Creedo server
	 * that will be passed to successHandler as array of objects (json format).
	 * 
	 * @param successHandler
	 *            function with single argument that processes returned data
	 * 
	 */
	var requestData = function(creedoComponentId, dataItemId, successHandler) {
		$.getJSON("getData.json", {
			creedoComponentId : creedoComponentId,
			dataItemId : dataItemId
		}, successHandler);
	};

	var performAction = function(actionProviderId, actionId, parameters,
			successHandler, errorHandler, completeHandler) {

		successHandler = (typeof successHandler !== 'undefined' ? successHandler
				: refresh);
		errorHandler = (typeof errorHandler !== 'undefined' ? errorHandler
				: defaultErrorHandler);
		completeHandler = (typeof completeHandler !== 'undefined' ? completeHandler
				: function() {
				})

		$.ajax({
			type : "post",
			url : "performAction.htm",
			data : {
				actionProviderId : actionProviderId,
				actionId : actionId,
				parameters : parameters
			},
			success : successHandler,
			error : errorHandler,
			complete : completeHandler
		});
	};

	/**
	 * Published function
	 */
	var performActionAndAwaitResultInNewPopUp = function(frameId, linkId,
			parameters) {
		parameters = (typeof parameters !== undefined ? parameters : []);
		var popUp = CREEDO.core.getNewPopUpWindow("loading.htm");
		performAction(frameId, linkId, parameters, function(url) {
			popUp.location.replace(url);
			popUp.focus();
		}, function(xhr) {
			showMessage(xhr.responseText);
			popUp.close();
		});
	};

	var resolveActionWithParameters = function(parameters, actionElement) {
		if (actionElement.attr('resultTarget') == "POPUP") {
			performActionAndAwaitResultInNewPopUp(
					actionElement.attr('frameId'),
					actionElement.attr('linkId'), parameters);
		} else {
			var successFunction;
			if (actionElement.attr('resultTarget') == "REFRESH") {
				successFunction = refresh;
			} else if (actionElement.attr('resultTarget') == "REDIRECT") {
				successFunction = function(url) {
					window.location.href = url
				};
			} else if (actionElement.attr('resultTarget') == "CLOSE") {
				successFunction = function() {
					window.close();
				};
			}

			performAction(actionElement.attr('frameId'), actionElement
					.attr('linkId'), parameters, successFunction,
					function(xhr) {
						showMessage(xhr.responseText);
					});
		}
	};

	/**
	 * Wraps function(params, el) into another function that queries user for
	 * confirmation in case the action link has been configured this way
	 */
	var confirmationFunctionWrapper = function(actionElement, wrapped) {
		if (actionElement.hasClass("confirmAction")) {
			return function(params, el) {
				bootbox.confirm("Are you sure?", function(result) {
					if (result) {
						wrapped(params, el);
					}
				});
			}
		} else {
			return wrapped;
		}
	}

	var parameterFunctionWrapper = function(actionElement, wrapped) {
		var inputParameter = actionElement.attr('actionInputParameter'), staticActionParameter = actionElement
				.attr('actionParameter');
		if (inputParameter) {
			return function(el) {
				bootbox.prompt({
					title : inputParameter,
					callback : function(result) {
						var params;
						if (result !== null) {
							params = [ result ];
							console.dir(params);
							wrapped(params, el);
						}
					}
				});
			}
		} else if (staticActionParameter) {
			return function(el) {
				wrapped([ staticActionParameter ], el);
			}
		} else {
			return function(el) {
				wrapped([], el);
			}
		}
	}

	// initialization
	$(document).ready(
			function() {

				console.log("init module: CREEDO.core");

				var addActionLinkClickHandler = function(idx, actionElement) {
					var $actionElement = $(actionElement);
					var paramFree = parameterFunctionWrapper($actionElement,
							confirmationFunctionWrapper($actionElement,
									resolveActionWithParameters));
					$(actionElement).click(function(e) {
						e.preventDefault();
						paramFree($(this));
					});
				}

				$('.actionLink').each(addActionLinkClickHandler);
			});

	return {
		showMessage : showMessage,
		refresh : refresh,
		redirect : redirect,
		defaultErrorHandler : defaultErrorHandler,
		getNewPopUpWindow : getNewPopUpWindow,
		loadFrameInNewWindow : loadFrameInNewWindow,
		requestData : requestData,
		performAction : performAction,
		performActionAndAwaitResultInNewPopUp : performActionAndAwaitResultInNewPopUp
	};

}());
