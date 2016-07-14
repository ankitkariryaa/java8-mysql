/**
 * creedo-ping.js v0.1.2.1
 * 
 * @author Björn Jacobs
 * @author Mario Boley
 * 
 */

CREEDO.namespace("CREEDO.ping");

CREEDO.ping = (function() {

	console.log("loading module: CREEDO.ping")

	var failCounter = 0;
	var failLimit = 30;
	var requestTimeout = 10000;
	var pingInterval = 3000;
	var pingReceiverId = $("#creedo-pinger").attr("creedoComponentId");

	function pingToServer() {
		setTimeout(function() {
			$.ajax({
				url : "ping.htm",
				data : {
					pingReceiverId : pingReceiverId
				},
				error : function(jqxhr, textStatus, errorThrown) {
					if (errorThrown == 'Unauthorized') {
						window.close(); // case child window
						window.location = "index.htm"; // case Creedo main
						// window
					}
					failCounter++;
				},
				success : function(data, textStatus, request) {
					// if (request.getResponseHeader('CLOSE_REQUESTED') == '1')
					// {
					// window.close();
					// }
					failCounter = 0;
				},
				timeout : requestTimeout
			});

			if (failCounter > failLimit) {
				alert('Connection to Creedo server seems to be lost!');
			} else {
				pingToServer();
			}
		}, pingInterval);
	}

	console.log("CREEDO.ping: start pinging")
	pingToServer();

	return {};

})();
