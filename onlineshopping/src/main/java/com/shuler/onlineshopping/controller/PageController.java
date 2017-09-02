package com.shuler.onlineshopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shuler.shoppingbackend.dao.CategoryDAO;
import com.shuler.shoppingbackend.dao.ProductDAO;
import com.shuler.shoppingbackend.dto.Category;
import com.shuler.shoppingbackend.dto.Product;

// This is a "helper controller" - for request mapping
@Controller
public class PageController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;

	// Specify URLs
	@RequestMapping(value = { "/", "/home", "/index" })
	// Spring MVC class with Model and View
	public ModelAndView index() {
		// !!! This binds this method to page.jsp
		ModelAndView mv = new ModelAndView("page"); // No model for this
													// constructor signature

		mv.addObject("categories", categoryDAO.list());

		// Now we create the model!
		// Add an attribute to the model. "greeting" will be bound to the view
		// ({greeting} JSP
		mv.addObject("title", "Home");

		// Create a little flag the JSP can look for as a clue where this result
		// came from
		mv.addObject("userClickHome", true);
		mv.addObject("userClickHome", true);
		return mv;
	}

	@RequestMapping(value = { "/about" })
	// Spring MVC class with Model and View
	public ModelAndView about() {
		// !!! This binds this method to page.jsp
		ModelAndView mv = new ModelAndView("page"); // No model for this
		// constructor signature
		// Now we create the model!
		// Add an attribute to the model. name and value be bound to the view
		mv.addObject("title", "About Us");

		// Create a little flag the JSP can look for as a clue where this result
		// came from
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = { "/contact" })
	// Spring MVC class with Model and View
	public ModelAndView contact() {
		// !!! This binds this method to page.jsp
		ModelAndView mv = new ModelAndView("page"); // No model for this //
													// constructor signature
		// Now we create the model!
		// Add an attribute to the model. name and value be bound to the view
		mv.addObject("title", "Contact Us");

		// Create a little flag the JSP can look for as a clue where this result
		// came from
		mv.addObject("userClickContact", true);
		return mv;
	}

	@RequestMapping(value = { "/show/all/products" })
	public ModelAndView showAllProducts() {
		// !!! This binds this method to page.jsp
		ModelAndView mv = new ModelAndView("page"); // No model for this
													// constructor signature
		// Lost 3 hours because I didn't add this line!
		mv.addObject("categories", categoryDAO.list());
		// Now we create the model!
		// Add an attribute to the model. name and value be bound to the view
		mv.addObject("title", "All Products");

		// Create a little flag the JSP can look for as a clue where this result
		// came from
		mv.addObject("userClickAllProducts", true);
		return mv;
	}
		
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		
		// categoryDAO to fetch a single category
		Category category = null;
		
		category = categoryDAO.get(id);
		
		mv.addObject("title",category.getName());
		
		List<Category> theList = categoryDAO.list();
		//passing the list of categories
		mv.addObject("categories", theList);
		
		// passing the single category object
		mv.addObject("category", category);
		
		mv.addObject("userClickCategoryProducts",true);
		return mv;				
	}	
	
	@RequestMapping(value = "/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		
		// productDAO to fetch a single category
		Product product = null;

		product = productDAO.get(id);
		
		// Update the view count
		product.setViews(product.getViews() + 1);  // views	is an attribute for a product
		productDAO.update(product);
		
		mv.addObject("title", product.getName());	
		// passing the single product object
		mv.addObject("product", product);
		
		mv.addObject("userClickShowProduct",true);
		return mv;				
	}
}
