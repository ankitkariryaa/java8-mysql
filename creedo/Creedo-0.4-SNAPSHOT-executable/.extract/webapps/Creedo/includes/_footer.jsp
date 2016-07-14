<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-xs-8 col-xs-offset-2">
	<div class="container">
		<div class="row">
			<hr>
			<c:if test="${not empty showGrantNotice and showGrantNotice}">
				<div class="col-md-4">
					<p style="font-size: 10pt" class="row text-left">
						<c:forEach items="${footer_content_page_links}" var="link"
							varStatus="status">
							<c:if test="${link.emphasis}">
								<b>
							</c:if>
							<a href="${link.linkTarget}">${link.linkName}</a>
							<c:if test="${link.emphasis}">
								</b>
							</c:if>
							${!status.last ? ' | ' : ''}
						</c:forEach>
					</p>
				</div>
				<div class="col-md-8">
					<p style="color: #B0B0B0; font-size: 10pt" class="row text-right">
						Copyright &copy 2014 Fraunhofer IAIS & University of Bonn. All
						rights reserved. Powered by realKD</p>
				</div>
			</c:if>
		</div>
	</div>
</div>


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="client/lib/bootstrap.min.js"></script>
<script src="client/lib/bootstrap-tour.min.js"></script>
<script src="client/lib/bootstrap-multiselect.js"></script>
<script src="client/lib/jquery.dataTables.min.js"></script>
<script src="client/lib/jquery.confirm.min.js"></script>
<script src="client/lib/dataTables.fixedColumns.min.js"></script>
<script src="client/lib/jquery-ui-1.10.4.custom.min.js"></script>
<script src="client/lib/Highcharts-4.2.5/js/highcharts.js"></script>
<script src="client/lib/Highcharts-4.2.5/js/modules/exporting.js"></script>
<script src="client/lib/Highcharts-4.2.5/js/modules/offline-exporting.js"></script>
<script src="client/lib/bootbox.min.js"></script>

<!-- non-library js files -->
<script src="client/js/creedo.js?v=0.1.2.1"></script>
<script src="client/js/creedo-dataviewcontainer.js?v=0.1.2.18"></script>
<script src="client/js/creedo-patterns.js?v=0.1.2.1"></script>
<%-- <jsp:include page="../dashboard/mineButton.jsp" /> --%>
<script src="client/js/learningSteps.js"></script>
<!-- default js code for the app -->
<script src="client/js/customDashboard.js?v=23"></script>
<script src="client/js/studyAdminDash.js"></script>
<script src="client/js/parameterHandler.js?v=11"></script>
<script src="client/js/default.js?v=67"></script>

</body>
</html>