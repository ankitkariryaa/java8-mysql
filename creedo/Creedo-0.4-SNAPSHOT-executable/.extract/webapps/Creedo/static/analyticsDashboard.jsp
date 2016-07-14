<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty analysisSessionId}">
	<script>
		window.analysisSessionId = '${analysisSessionId}';
	</script>
</c:if>
<div id="creedo-analytics-dashboard" class="row"
	creedoComponentId="${analyticsDashboardId}"
	runAlgorithmActionId="${runAlgorithmActionId}"
	savePatternActionId="${savePatternActionId}"
	deletePatternActionId="${deletePatternActionId}"
	annotatePatternActionId="${annotatePatternActionId}">
	<div class="col-sm-9 left-column">
		<jsp:include page="dataViewContainer.jsp" />
		<hr style="margin: 3px 0 3px 0;" />
		<div class="row">
			<div class="col-sm-12 bottom-row">
				<div id="row-resizer"></div>
				<div id="analysis-patterns">
					<a
						href="exportPatterns.htm?analyticsDashboardId=${analyticsDashboardId}"
						target="_blank"><span
						class="export-pattern glyphicon glyphicon-floppy-save"
						title="Download patterns in file"></span></a> ${resultPatternHtml}
				</div>
			</div>
		</div>
	</div>
	<div id="creedo-mininglauncher" class="col-sm-3 right-column"
		creedoComponentId="${miningLauncherId}"
		requestStopOfCurrentAlgorithmActionId="${requestStopOfCurrentAlgorithmActionId}">
		<jsp:include page="launchMiningDialog.jsp" />
		<div id="column-resizer"></div>
		<span id="btn-start-span"> <a href="#"
			class="btn btn-success btn-lg btn-block" id="btn-start-mining"
			showDialog="${showLaunchDialog}"><strong>Mine</strong></a>
		</span> <span id="btn-stop-span"> <a href="#"
			class="btn btn-warning btn-lg btn-block hidden" id="btn-stop-mining"><strong>Stop</strong></a>
		</span> <span id="mining-error-notification" class="hidden">
			<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"></span>
				<div id="mining-error-notification-text">
					The algorithm encountered a problem. Click to see trace: <span
						id="mining-error-notification-icon"
						class="glyphicon glyphicon-new-window"></span>
				</div>
			</div>
		</span>
		<div id="candidate-patterns"></div>
	</div>
</div>