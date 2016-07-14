<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- <div class="col-xs-8 col-xs-offset-2"> -->

<%-- Add button here --%>
<c:if test="${not empty additionTypes}">
	<div class="row paramMargin">
		<form class="form-vertical" role="form" method="POST" action="">
			<div class="form-group col-xs-1">
				<!-- 				<div class="col-xs-3 text-left"> -->
				<a href="javascript:{}"
					onclick="CREEDO.core.performAction(${componentId}, ${entryAdditionAction.id},[$('#identifier').val(),$('#class').val()]); return false;"
					class="btn btn-default">${entryAdditionAction.referenceName}</a>
				<!-- 				</div> -->
			</div>
			<div class="form-group col-xs-5 col-xs-offset-1">
				<!-- 				<div class="col-xs-10"> -->
				<input class="form-control" id="identifier" name="identifier"
					placeholder="Identifier" />
				<!-- 				</div> -->
			</div>
			<div class="form-group col-xs-5">
				<!-- 				<div class="col-xs-10"> -->
				<select class="form-control" id="class" name="class"
					placeholder="Class">
					<c:forEach items="${additionTypes}" var="type" varStatus="loop">
						<option value=${loop.index}>${type}</option>
					</c:forEach>
				</select>

				<!-- 				</div> -->
			</div>
		</form>
	</div>
</c:if>

<div>
	<c:forEach items="${entries}" var="entry" varStatus="i">
		<div class="row paramMargin vertical-align">
			<div class="col-xs-11">
				<h3>${entry.id}(${entry.name})</h3>
			</div>
			<div class="col-xs-1">
				<a class="btn btn-default btn-block actionLink confirmAction"
					linkId="${entryDeletionAction.id}" resultTarget="REFRESH"
					frameId="${componentId}" actionParameter="${entry.id}">${entryDeletionAction.referenceName}</a>
			</div>
		</div>
		<div id="pageBuilderParameters_${i.index}" class="parameterArea"
			componentId="${componentId}" entryId="${entry.id}"
			parameterUpdateActionId="${entry.parameterUpdateActionId}"></div>
	</c:forEach>
</div>
