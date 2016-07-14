<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-sm-12 content top-row" id="creedo-dataviewcontainer"
		componentId="${dataViewContainerId}" updatePointCloudActionId="${updatePointCloudActionId}">
		<div class="content-title">
			<h3 class="pull-left" id="datasetNameElement">
				<c:out value="${datasetName}" />
			</h3>
			<div class="actions pull-right">
				<a href="#content-table" data-toggle="tab" id="tab-content"> <span
					class="glyphicon glyphicon-th"></span> Datatable
				</a> | <a href="#content-point-cloud" data-toggle="tab"
					title="Point Cloud" id="tab-point-cloud"> <span
					class="glyphicon glyphicon-cloud"></span> Scatter plot
				</a> | <a href="#content-metadata" data-toggle="tab" id="tab-metadata">
					<span class="glyphicon glyphicon-eye-open"></span> Propositions
				</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="content-table">
				<jsp:include page="../dashboard/_table.jsp" />
			</div>
			<div class="tab-pane fade" id="content-point-cloud">
				<jsp:include page="../dashboard/_pointCloud.jsp" />
			</div>
			<div class="tab-pane fade" id="content-metadata">
				<jsp:include page="../dashboard/_metadata.jsp" />
			</div>
		</div>
	</div>
</div>