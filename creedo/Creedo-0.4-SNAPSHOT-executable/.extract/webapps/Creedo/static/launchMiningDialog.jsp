<div class="modal fade" id="refControlBox" tabindex="-1" role="dialog"
	aria-labelledby="refBoxLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="refBoxLabel">${launchDialogTitle}</h4>
			</div>
			<div class="modal-body" id="refBoxContent">
				<%-- Category selection --%>
				<div class="row ${algorithmCategoryHiddenClass}"
					id="refCategoryArea">
					<div class="col-xs-4 text-right">
						<h4>
							<label for="algorithmCategoriesSelect">Category:</label>
						</h4>
					</div>
					<div class="col-xs-8">
						<select id="algorithmCategoriesSelect" class="form-control">
							<option value="">Select algorithm category</option>
						</select>
					</div>
				</div>

				<%-- Algorithm selection --%>
				<div class="row paramMargin ${algorithmSelectHiddenClass}" id="refAlgorithmsArea"
					style="display: none;">
					<div class="col-xs-4 text-right">
						<h4>
							<label for="algorithmSelect">Algorithm:</label>
						</h4>
					</div>
					<div class="col-xs-8">
						<select id="algorithmSelect" class="form-control">
							<option value="">Select algorithm</option>
						</select>
					</div>
				</div>

				<%-- Parameter selection --%>
				<div id="refParametersArea" style="display: none;">
					<div class="row" id="refParameterRow">
						<div class="col-xs-4 text-right">
							<label for="input_xyz">ParamName:</label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="form-control" id="input_xyz">
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-info" id="refExecuteButton">Execute!</button>
			</div>
		</div>
	</div>
</div>
