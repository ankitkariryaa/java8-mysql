<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
		<form class="col-xs-12 form-horizontal" role="form" method="POST" action="">
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
						onclick="CREEDO.core.performAction(${loginPageComponentId}, '${loginAction.id}',[$('#username').val(), $('#password').val()], CREEDO.core.redirect); return false;"
						class="btn btn-primary btn-block">${loginAction.referenceName}</a>
				</div>
				<div class="col-xs-2 text-center" style="padding-top: 8px;">
					<strong>or</strong>
				</div>
				<div class="col-xs-2 text-right">
					<a href="#" class="actionLink btn btn-default btn-block"
						linkId="${loadAccountRequestPageAction.id}" resultTarget="REFRESH"
						frameId="${loginPageComponentId}">${loadAccountRequestPageAction.referenceName}</a>
				</div>
			</div>
		</form>
</div>