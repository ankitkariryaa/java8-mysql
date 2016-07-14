<jsp:useBean id="uisession" scope="session"
	type="de.unibonn.creedo.webapp.CreedoSession" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<img src="client/images/loader.gif" class="loader" />

<table class="datatable table hide">
	<thead>
		<tr>
			<th class="datatable-names-column"><em><b>${dataTableViewModel.nameColumnTitle}</b></em></th>
			<c:forEach items="${dataTableViewModel.attributeColumnTitles }"
				var="element" varStatus="column">
				<th class="datatable-column">${element}</th>
			</c:forEach>
		</tr>
	</thead>
	<tbody></tbody>
</table>