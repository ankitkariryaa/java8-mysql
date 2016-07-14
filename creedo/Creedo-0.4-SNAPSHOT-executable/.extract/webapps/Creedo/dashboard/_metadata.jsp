<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="datatable table">
	<thead>
		<tr>
			<th>Attributes</th>
			<th>Type</th>
			<th>Values</th>
		</tr>
	</thead>
	<tbody>
		<jsp:useBean id="uisession" scope="session"
			type="de.unibonn.creedo.webapp.CreedoSession" />
		<c:if test="${not empty metaDataModel}">
			<c:forEach items="${metaDataModel.entries}" var="element"
				varStatus="row">
				<tr>
					<td>${element.name}</td>
					<td>${element.type}</td>
					<td>${element.description}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>