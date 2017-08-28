$(function() {
	// solving the active menu problem
	switch(window.menu) { // set in page.jsp - which is set by page controller.  Slick way to push Java into JS
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;	
	default:
		if(window.menu == "Home") break;
		$('#listProducts').addClass('active');	
		$('#a_' + menu).addClass('active');  // highlights product in sidebar.jsp
		break;
	}
});