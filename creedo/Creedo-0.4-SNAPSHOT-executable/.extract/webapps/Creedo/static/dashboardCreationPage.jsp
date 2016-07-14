<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <div class="col-xs-8 col-xs-offset-2"> -->
	<div class="container">
		<form class="form-horizontal" role="form" id="customMiningForm">

			<label for="systemVariantSelect">System:</label> <select
				class="form-control" id="systemVariantSelect"
				name="systemVariantSelect" form="customMiningForm">
				<c:forEach items="${systemVariants}" var="sys">
					<option value="${sys.rhs}">${sys.lhs}</option>
				</c:forEach>
			</select> <label>Datatable:</label>
			<div role="tabpanel">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#database"
						aria-controls="home" role="tab" data-toggle="tab">Select from
							Database</a></li>
					<li role="presentation"><a href="#files"
						aria-controls="profile" role="tab" data-toggle="tab">Upload
							files</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="database">
						<select class="form-control" id="dataTableSelect"
							name="dataTableSelect" form="customMiningForm">
							<c:forEach items="${dataTables}" var="dt">
								<%--                                 <option value="${dt.rhs}">${dt.lhs}</option> --%>
								<option>${dt}</option>

							</c:forEach>
						</select>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="files">
						<label for="datafile">Data content file:</label> <input
							type="file" class="form-control file-upload" id="datafile"
							name="datafile" form="customMiningForm" /> <label
							for="attributesfile">Attributes definition file:</label> <input
							type="file" class="form-control file-upload" id="attributesfile"
							name="attributesfile" form="customMiningForm" /> <label
							for="attributegroupsfile">Attribute-groups definition
							file (optional):</label> <input type="file"
							class="form-control file-upload" id="attributegroupsfile"
							name="attributegroupsfile" form="customMiningForm" /> <label
							for="datadelimiter">Data column delimiter (1 character):</label>
						<input type="text" class="form-control" id="datadelimiter"
							name="datadelimiter" form="customMiningForm" /> <label
							for="missingsymbol">Missing value indicator:</label> <input
							type="text" class="form-control" id="missingsymbol"
							name="missingsymbol" form="customMiningForm" />
					</div>
				</div>
			</div>

			<label for="miningAlgorithmSelect">Algorithm:</label>
			<div id="miningAlgorithmSelect"
				style="overflow-y: scroll; height: 400px;">
				<c:forEach items="${miningAlgorithms}" var="alg" varStatus="loop">
					<c:choose>
						<c:when test="${alg.rhs == true}">
							<input type="checkbox" name="algorithm" checked="checked"
								value="${loop.index}">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="algorithm" value="${loop.index}"
								form="customMiningForm">
						</c:otherwise>
					</c:choose>
					<label for="${loop.index}">${alg.lhs}</label>
					<br />
				</c:forEach>
			</div>
			<hr />
			<div id="customDashParameterArea"></div>
			<button type="submit" class="btn btn-default"
				id="buttonStartMiningForm2">Start</button>
		</form>
	</div>
<!-- </div> -->