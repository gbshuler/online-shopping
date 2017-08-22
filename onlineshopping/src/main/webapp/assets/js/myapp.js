$(function() {
	// solving the active menu problem
	switch(window.menu) { // set in page.jsp - which is set by page controller.  Slick way to push Java into JS
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'Home':
		$('#home').addClass('active');	
		break;
	}
});