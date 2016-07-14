<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${statusMessagePresent}">
	<div
		class="alert alert-info alert-dismissible col-xs-8 col-xs-offset-2"
		role="alert">
		<button type="button" class="close" data-dismiss="alert">
			<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
		</button>
		${statusMessage}
	</div>
</c:if>
<c:if test="${not empty accountRequestNoteHtml}">
	<div class="row">
		<div class="col-xs-6 col-xs-offset-3">${accountRequestNoteHtml}
		</div>
	</div>
</c:if>
<div class="row">
	<div class="col-xs-12">
		<form class="form-horizontal" role="form" method="POST" action="">
			<div class="form-group">
				<label for="username" class="col-xs-3 control-label">Email</label>
				<div class="col-xs-6">
					<input type="email" class="form-control" id="username"
						name="username" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-xs-3 control-label">Password</label>
				<div class="col-xs-6">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Password">
				</div>
			</div>

			<div class="form-group">
				<div class="col-xs-2 col-xs-offset-3">
					<a href="javascript:{}"
						onclick="CREEDO.core.performAction(${requestAccountPageComponentId}, ${requestAccountActionId},[$('#username').val(), $('#password').val()]); return false;"
						class="btn btn-primary btn-block">Request account</a>
				</div>
			</div>
		</form>
	</div>
<!-- 	<div class="col-xs-3"></div> -->
</div>