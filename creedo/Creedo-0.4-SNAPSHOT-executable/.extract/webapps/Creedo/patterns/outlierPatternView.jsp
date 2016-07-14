<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../includes/_header.jsp"/>

<div class="container">
    <%-- Header area: PatternType, Text-Description --%>
    <div class="row col-lg-10 col-lg-offset-1">
        <div class="col-lg-12">
            <h1 class="page-header text-center">Outlier Pattern<br>
                <%--<small>${patternDescription}</small>--%>
            </h1>
        </div>
    </div>

    <%-- Description area: Target, Attributes, Propositions, Measures --%>
    <div class="row col-lg-10 col-lg-offset-1">
         <div class="col-md-3">
            <h4>The following Rows:</h4>
            <ul>
                <c:forEach var="elementName" items="${elementNames}">
                    <li>${elementName}</li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-md-3">
            <h4>behave anomalous in terms of the attributes:</h4>
            <ul>
            <c:forEach var="attribute" items="${attributes}">
                <li>${attribute.name()}</li>
            </c:forEach>
            </ul>
        </div>
<!--         <div class="col-md-3"> -->
<!--             <h4>Measure(s):</h4> -->
<!--             <ul> -->
<%--                 <c:forEach var="measure" items="${measures}"> --%>
<%--                     <li>${measure.lhs} = <fmt:formatNumber pattern="0.000" value="${measure.rhs}" /></li> --%>
<%--                 </c:forEach> --%>
<!--             </ul> -->
<!--         </div> -->
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

<jsp:include page="../includes/_footer.jsp"/>