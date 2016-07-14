<div class="modal fade" id="loadingmodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Loading dashboard...</h4>
			</div>
			<div class="modal-body text-center">
				<img src="client/images/loader.gif">
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	function showLoadingModal() {
		$('#loadingmodal').modal({
			keyboard : false,
			backdrop : 'static'
		});
	}
</script>