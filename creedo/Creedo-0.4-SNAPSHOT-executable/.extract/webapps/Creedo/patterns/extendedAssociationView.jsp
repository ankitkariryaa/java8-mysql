<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../includes/_header.jsp" />

<div class="container">
	<%-- Header area: PatternType, Text-Description --%>
	<div class="row col-lg-10 col-lg-offset-1">
		<div class="col-lg-12">
			<h1 class="page-header text-center">
				Association<br>
				<%--<small>${patternDescription}</small>--%>
			</h1>
		</div>
	</div>

	<div class="row col-lg-10 col-lg-offset-1">
		<div class="col-lg-12">
			<h3 class="text-center">User annotation:</h3>
			<div class="text-center">${annotation}</div>
		</div>
	</div>

	<%-- Description area: Target, Attributes, Propositions, Measures --%>
	<div class="row col-lg-10 col-lg-offset-1">
		<div class="col-md-3">
			<h4>Elements(s):</h4>
			<ul>
				<c:forEach var="proposition" items="${propositions}">
					<li>${proposition.attribute.name()}=
						${proposition.constraint.description()}</li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-md-3">
			<h4>Measure(s):</h4>
			<ul>
				<c:forEach var="measurement" items="${measurements}">
					<li>${measurement.measure}:<fmt:formatNumber pattern="0.000"
							value="${measurement.value}" /></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<%-- Visualization figures (Title + Image-URL)--%>
	<div class="row col-lg-10 col-lg-offset-1">
		<c:forEach var="imagePath" items="${vImages}">
			<div class="col-md-6 portfolio-item">
				<%--<h3>Title here</h3>--%>
				<img class="img-responsive img-border" src="${imagePath}">
			</div>
		</c:forEach>
	</div>
</div>
<!-- /.container -->

<jsp:include page="../includes/_footer.jsp" />