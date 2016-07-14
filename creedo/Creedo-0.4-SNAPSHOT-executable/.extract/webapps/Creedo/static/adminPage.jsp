<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <div class="col-xs-8 col-xs-offset-2"> -->
    <div class="container">
        <div class="col-md-12 text-justify">
            <p> User accounts: </p>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Reg.Date</th>
                    <th>Administrator</th>
                    <th>Developer</th>
                    <th>Active</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user" varStatus="status">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.registrationDate}</td>
                        <td><c:if test="${user.administrator}"><span class="glyphicon glyphicon-ok"></span></c:if></td>
                        <td><c:if test="${user.developer}"><span class="glyphicon glyphicon-ok"></span></c:if></td>
                        <td><c:if test="${user.active}"><span class="glyphicon glyphicon-ok"></span></c:if></td>
                        <td><button class="toggleActiveAction" type="submit" class="btn btn-primary" userid="${user.id}">Toggle activation</button>
                </c:forEach>
            </tbody>
        </table>
    </div>
<!-- </div> -->