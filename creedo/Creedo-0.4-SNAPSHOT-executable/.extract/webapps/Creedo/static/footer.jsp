<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-xs-8 col-xs-offset-2">
	<div class="container">
		<div class="row">
			<hr>
			<div class="col-md-4">
				<p style="font-size: 10pt" class="row text-left">
					<c:forEach items="${footerLinks}" var="link" varStatus="status">
						<a href="#" class="actionLink" linkId="${link.id}"
							frameId="${footerId}"
							resultTarget="${link.clientWindowEffect}"> <c:if
								test="${link.emphasized}">
								<b>
							</c:if>${link.name} <c:if test="${link.emphasized}">
								</b>
							</c:if>
						</a>
							${!status.last ? ' | ' : ''}
						</c:forEach>
				</p>
			</div>
			<div class="col-md-8">
				<p style="color: #B0B0B0; font-size: 10pt" class="row text-right">
					${footerStaticText}</p>
			</div>
		</div>
	</div>
</div>