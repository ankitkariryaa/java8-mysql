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
	<jsp:include page="_loadingmodal.jsp" />