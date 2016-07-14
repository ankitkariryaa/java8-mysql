<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="/Creedo/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:if test="${not empty applicationTitlePrefix}">${applicationTitlePrefix}</c:if><c:if
		test="${not empty title}"> - ${title}</c:if></title>

<!-- Bootstrap -->
<link href="client/css/bootstrap.css" rel="stylesheet">
<link href="client/css/bootstrap-tour.min.css" rel="stylesheet">
<!-- <link href="client/css/bootstrap-multiselect.css" rel="stylesheet" -->
<!-- 	type="text/css" /> -->
<link href="client/lib/select2-3.5.4/select2.css" rel="stylesheet">
<link href="client/lib/select2-3.5.4/select2-bootstrap.css"
	rel="stylesheet">
<link href="client/css/jquery.dataTables.min.css" rel="stylesheet">
<link href="client/css/dataTables.fixedColumns.min.css" rel="stylesheet">
<link href="client/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
<link href="client/css/modern-business.css" rel="stylesheet">
<link href="client/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<link href="client/css/dashboard.css" rel="stylesheet">
<link href="client/css/survey.css" rel="stylesheet">
<link href="client/css/general.css" rel="stylesheet">
<c:if test="${not empty customStylesheet}">
	<link href="file.htm?filename=${customStylesheet}" rel=stylesheet />
</c:if>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="client/lib/jquery-1.11.1.min.js"></script>

</head>

<body id="<c:out value="${controllerName}"/>">
	<jsp:include page="../includes/_loadingmodal.jsp" />

	<c:forEach items="${components}" var="component">
		<jsp:include page="${component.view}" />
	</c:forEach>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="client/lib/bootstrap.min.js"></script>
	<script src="client/lib/bootstrap-tour.min.js"></script>
	<script src="client/lib/bootstrap-multiselect.js"></script>
	<script src="client/lib/select2-3.5.4/select2.min.js"></script>
	<script src="client/lib/jquery.dataTables.min.js"></script>
	<script src="client/lib/jquery.confirm.min.js"></script>
	<script src="client/lib/dataTables.fixedColumns.min.js"></script>
	<script src="client/lib/jquery-ui-1.10.4.custom.min.js"></script>
	<!-- <script src="client/lib/jquery.form.js"></script> -->
	<script src="client/lib/Highcharts-4.2.5/js/highcharts.js"></script>
	<script src="client/lib/Highcharts-4.2.5/js/modules/exporting.js"></script>
	<script
		src="client/lib/Highcharts-4.2.5/js/modules/offline-exporting.js"></script>
	<script src="client/lib/bootbox.min.js"></script>
	<script src="client/lib/jquery.blockUI.min.js"></script>

	<!-- non-library js files -->
	<script src="client/js/creedo.js?v=0.1.2.3"></script>

	<c:forEach items="${scriptFilenames}" var="scriptFilename">
		<script src="client/js/${scriptFilename}"></script>
	</c:forEach>

	<script src="client/js/learningSteps.js"></script>
	<!-- default js code for the app -->
	<!-- <script src="client/js/customDashboard.js?v=23"></script> -->
	<script src="client/js/studyAdminDash.js"></script>
	<script src="client/js/default.js?v=77"></script>

</body>
</html>