<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Researcher view</title>
<link rel="stylesheet" href="client/css/style.css" />

<script type="text/javascript" src="client/js/jquery-latest.js"></script>
<script type="text/javascript" src="client/js/researcher.js"></script>

</head>

<body>
	${viewModel.html}
<%-- 	<c:forEach items="${viewModel.inspectables}" var="inspectable"> --%>
<%-- 		<b><big> ${inspectable.name}</big></b> --%>
<!-- 		<div style="height: 400px; overflow: auto;"> -->
<!-- 			<table border="1" style="width: 1000px"> -->
<!-- 				<tr> -->
<%-- 					<c:forEach items="${inspectable.inspectableState.header}" --%>
<%-- 						var="headerEntry"> --%>
<%-- 						<td>${headerEntry}</td> --%>
<%-- 					</c:forEach> --%>
<!-- 				</tr> -->
<%-- 				<c:forEach items="${inspectable.inspectableState.table}" var="row"> --%>
<!-- 					<tr> -->
<%-- 						<c:forEach items="${row}" var="tableEntry"> --%>
<%-- 							<td>${tableEntry}</td> --%>
<%-- 						</c:forEach> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</table> -->
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
</body>

</html>