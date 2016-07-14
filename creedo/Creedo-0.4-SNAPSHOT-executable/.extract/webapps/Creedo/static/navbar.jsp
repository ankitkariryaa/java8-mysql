<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	window.helpTarget = '${help_start_url}';
</script>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- You'll want to use a responsive image option so this logo looks good on devices - I recommend using something like retina.js (do a quick Google search for it and you'll find it) -->
			<!--<a class="navbar-brand" href="index.html">Home</a>-->
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav navbar-right">

				<c:forEach items="${navbarLinks}" var="link">
					<li><a href="#" class="actionLink" linkId="${link.id}"
						frameId="${navbarId}" 
						resultTarget="${link.clientWindowEffect}"> <c:if
								test="${link.emphasized}">
								<b>
							</c:if>${link.name} <c:if test="${link.emphasized}">
								</b>
							</c:if>
					</a></li>
				</c:forEach>

			</ul>
		</div>


		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>