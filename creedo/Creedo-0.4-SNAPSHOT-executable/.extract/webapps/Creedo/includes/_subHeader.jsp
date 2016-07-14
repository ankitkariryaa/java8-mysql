<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-xs-8 col-xs-offset-2" id="sub-header">
		<div class="row" style="margin: 5px 20px 15px 15px">
			<div class="ocmtitle pull-left">${title}</div>
			<div class="pull-right">
				<c:if test="${not empty secondaryLogoFilePath}">
					<a href="${secondaryLogoLink}" target="_blank"><img src="${secondaryLogoFilePath}" height=50 style="margin-right:25px"></a>
				</c:if>

				<c:if test="${not empty primaryLogoFilePath}">
					<a href="${primaryLogoLink}" target="_blank"><img src="${primaryLogoFilePath}" height=50></a>
				</c:if>
			</div>
		</div>
	</div>
</div>