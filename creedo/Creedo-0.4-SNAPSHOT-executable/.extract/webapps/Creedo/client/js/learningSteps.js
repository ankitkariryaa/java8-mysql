$(document)
		.ready(
				function() {
					if (!window.isLearningSession) {
						return;
					}
					// Instance the tour
					var tour = new Tour(
							{
								steps : [
										{
											element : "#btn-leave-mining",
											title : "Click to leave",
											content : "If you click this button, you current session will be saved and you will be redirected to the Mars",
											placement : "bottom" 
										}, {
											element : "#btn-start-mining",
											title : "Title of my step",
											content : "Content o #btn-leave-mining #btn-leave-mining egerg",
											placement : "bottom"
										} ],
								storage : false
							});

					// Initialize the tour
					tour.init();

					// Start the tour
					tour.start();
				});