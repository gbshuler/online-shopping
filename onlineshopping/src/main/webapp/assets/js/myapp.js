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
	
	
	// $ in $table because THIS is jQuery!!
	
	var $table = $('#productListTable');
	
	 // Execute the code below only where we have this table.
	 //  Trick to check if q JS file is included which defines a table
	 //
	if ($table.length) {
		// console.log('Inside the table!');
		
		var jsonUrl = '';
		// categoryId is The UUID of a Category domain object in the DataBase
		if (window.categoryId == '') {  
			// Create a URL to make a REST call to grab a JSON list of all products
			jsonUrl = window.contextRoot + '/json/data/all/products';
		}
		else {
	
		  	 // Create a URL to make a REST call to grab a JSON list of all products
		  	 // We have a categoryId, so build up the URL for the REST controller 
		  	 to jsonDataController.
		  	
			jsonURL = window.contextRoot + 'json/data/category/' + window.categoryId + '/products';
			
		}
		
		
		 //  $table is a variable holding an element with id 'productListTable'
		 //  In JavaScript we can just "tack on" a DataTable object to any other object
		 //  Pass in the table data using a JSON constructor.
		 
		$table.DataTable( { 
			
			// Specify the lengthMenu property of a jQuery DataTable
			//  This is a drop down data set.  
			//  First collection is values of each drop down row.
			//  Second collection is the label for each drop down row
			   
			lengthMenu: [[3,5,10,-1],[ '3 Records', '5 Records', '10 Records', 'ALL']],
			pageLength: 5, // Show 5  records per page
			ajax: {
				url: jsonUrl,
				dataSrc: ''
			},
			columns: [ // based on the name/value pairs from REST JSON return data from AJAX
				 {
					 data: 'name'
				 },
				 {
					 data: 'brand'
				 },
				 {
					 data: 'unitPrice'
				 },
				 {
					 data: 'quantity'
				 }
		
			]
		
		});
	}
	
});