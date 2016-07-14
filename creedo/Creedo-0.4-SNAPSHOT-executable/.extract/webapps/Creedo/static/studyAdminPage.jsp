<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <div class="col-xs-8 col-xs-offset-2"> -->
    <div class="container">
        <label for="studySelect">Study:</label>
        <select id="studySelect"
                name="studySelect">
            <option disabled selected> -- select an study -- </option>
            <c:forEach items="${studies}" var="study">
                <option value="${study.rhs}">${study.lhs}</option>
            </c:forEach>
        </select>

        <div id="studyDashGeneralInfoArea" class="col-md-12 text-justify"></div>
        <div id="studyDashParticipantsInfoArea" class="col-md-12 text-justify"></div>
    </div>
<!-- </div> -->