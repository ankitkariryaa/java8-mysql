<%--
title
description
imgurl (user uploaded database)
imgcredits (user uploaded database)
datatable_id
system_builder_id
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty dashboardCreationStatus}">
    <div
            class="alert alert-info alert-dismissible col-xs-8 col-xs-offset-2"
            role="alert">
        <button type="button" class="close" data-dismiss="alert">
            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        </button>
        <strong>Status:</strong> ${dashboardCreationStatus}
    </div>
</c:if>

<!-- <div class="col-xs-8 col-xs-offset-2"> -->
    <div class="container">
        <form class="form-horizontal" role="form" id="createDashboardForm" method="post"
              action="${pageContext.request.contextPath}/customDash/createDashboard.htm">

            <label for="dashboardTitle">Title:</label>
            <input type="text" class="form-control" id="dashboardTitle" name="dashboardTitle"
                   form="createDashboardForm"/>

            <label for="dashboardDescription">Description:</label>
            <input type="text" class="form-control" id="dashboardDescription" name="dashboardDescription"
                   form="createDashboardForm"/>

            <label for="systemVariantSelect">System:</label>
            <select class="form-control" id="systemVariantSelect"
                    name="systemVariantSelect" form="createDashboardForm">
                <c:forEach items="${systemVariants}" var="sys" varStatus="loop">
                    <option value="${loop.index}">${sys}</option>
                </c:forEach>
            </select>

            <label for="dataTableSelect">Data table:</label>
            <select class="form-control" id="dataTableSelect" name="dataTableSelect" form="createDashboardForm">
                <c:forEach items="${dataTables}" var="dt">
                    <option value="${dt.rhs}">${dt.lhs}</option>
                </c:forEach>
            </select>

            <p><label>Algorithms:</label></p>
            <c:forEach items="${miningAlgorithms}" var="alg" varStatus="loop">
                <p>
                    <input type="checkbox" id="alg_${loop.index}" name="algorithm" value="${loop.index}" form="createDashboardForm">
                    <label for="alg_${loop.index}">${alg.lhs}</label>
                </p>
            </c:forEach>

            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
<!-- </div> -->