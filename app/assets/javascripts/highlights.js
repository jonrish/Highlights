$(document).ready(function() {

	$('#continue').on('click', function() {
		$(this).addClass('hidden');
		$('#step-two').removeClass('hidden');	
	});

	$('#finish').on('click', function() {
		$(this).addClass('hidden');
		$('#step-three').removeClass('hidden')
	});
	
});


