<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div class="col-xs-8 col-xs-offset-2"> -->

${mainContent}

<%-- <c:choose> --%>
<%--     <c:when test="${not empty demos}"> --%>
<c:if test="${not empty actionSections}">

	<div class="container-fluid">
		<c:forEach items="${actionSections}" var="section">
			<div class="container">
				<div class="col-lg-12 col-md-12 col-sm-12 text-center">
					<h3>${section.title}</h3>
				</div>
			</div>
			<c:forEach items="${section.entries}" var="entry" varStatus="status">
				<c:if test="${status.count % 3 == 1}">
					<div class="row">
				</c:if>
				<div class="col-lg-4 col-md-12 col-sm12">
					<div class="bs-component">
						<div class="well">
							<a href="#"> <img
								class="img-responsive img-home-portfolio actionLink"
								frameId="${frameId}" linkId="${entry.openAction.id}"
								resultTarget="${entry.openAction.effect}"
								src="file.htm?filename=${entry.link.imgPath}">
							</a>
							<p>
								<c:if test="${not empty entry.renameAction}">
									<span class="actionLink" frameId="${frameId}"
										linkId="${entry.renameAction.id}"
										title="${entry.renameAction.referenceName}"
										<c:if test="${entry.renameAction.hasInputParameter}">actionInputParameter="${entry.renameAction.inputParameterName}"</c:if>
										resultTarget="${entry.renameAction.effect}"><b>${entry.link.title}</b></span>
								</c:if>
								<c:if test="${empty entry.renameAction}">
									<b>${entry.link.title}</b>
								</c:if>
								${entry.link.description}
							</p>
							<div style="color: #808080; font-size: 6pt">${entry.link.imgCredits}</div>
							<c:forEach items="${entry.otherActions}" var="action">
								<a href="#"
									class="actionLink ${action.confirmed?'confirmAction':''}"
									frameId="${frameId}" linkId="${action.id}"
									<c:if test="${action.hasInputParameter}">actionInputParameter="${action.inputParameterName}"</c:if>
									resultTarget="${action.effect}"> ${action.referenceName} <%-- 									"${action.hasInputParameter? 'inputParameter='+action.inputParameterName}:''}" --%>
								</a>

							</c:forEach>
						</div>
					</div>
				</div>
				<c:if test="${status.count % 3 == 0}">
	</div>
</c:if>
</c:forEach>
</c:forEach>
</div>
</c:if>
<%--     </c:when> --%>
<%-- <c:otherwise> --%>
<c:if test="${not empty loginInvitationHtml}">
	<div class="container">
		<div class="col-lg-12 col-md-12 col-sm-12 text-center">
			<h3>${loginInvitationHtml}</h3>
		</div>
	</div>
</c:if>
<%-- </c:otherwise> --%>
<%-- </c:choose> --%>

<!-- </div> -->