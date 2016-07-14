<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty analysisSessionId}">
	<script>
		window.analysisSessionId = '${analysisSessionId}';
	</script>
</c:if>

<div class="row">
	<div class="col-sm-9 left-column">
		<jsp:include page="../static/dataViewContainer.jsp" />
		<hr style="margin: 3px 0 3px 0;" />
		<div class="row">
			<div class="col-sm-12 bottom-row">
				<div id="row-resizer"></div>
				<div id="analysis-patterns" class="ratingPatterns">
					<c:forEach items="${resultPatterns}" var="pattern">
                        ${pattern}
                    </c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-3 right-column">
		<div id="column-resizer"></div>
		<div id="candidate-patterns">
			<div id="rate-area" class="text-center">
				<!--                 <h4>Current pattern:</h4> -->
				<!--                 <div id="currentPatternForRating"> -->
				<!--                     <h5>Click on a pattern in order to rate it</h5> -->
				<!--                 </div> -->
				<hr>
				<h4>Ratings:</h4>
				<c:forEach items="${ratingMetrics}" var="ratingMetric"
					varStatus="status">
					<div class="well">
						<h4>${ratingMetric.description}</h4>
						<div class="btn-group" data-toggle="buttons">
							<c:forEach items="${ratingMetric.ratingOptions}" var="option"
								varStatus="optStatus">
								<label class="btn btn-success"> <input
									class="ratingOption_${status.index}" id="${optStatus.index}"
									type="radio" name="${ratingMetric.name}" value="${option.name}">
									${option.name}
								</label>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>