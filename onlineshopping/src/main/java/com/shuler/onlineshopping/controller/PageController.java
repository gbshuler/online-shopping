package com.shuler.onlineshopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// This is a "helper controller" - for request mapping
@Controller
public class PageController {
	// Specify URLs
	@RequestMapping(value = { "/", "/home", "/index" })
	// Spring MVC class with Model and View
	public ModelAndView index() {
		// !!! This binds the ModelAndView page.jsp
		ModelAndView mv = new ModelAndView("page"); // No model for this
													// constructor signature
		// Now we create the model!
		// Add an attribute to the model. "greeting" will be bound to the view
		// ({greeting} JSP
		mv.addObject("greeting", "Welcome to Spring Web MVC");
		return mv;
	}

//	@RequestMapping(value = "/test")
//	// Spring MVC class with Model and View
//	public ModelAndView test(@RequestParam(value = "greeting", required = false) String greeting) { // query
//		// param
//		if (greeting == null) {
//			greeting = "Hello There";
//		}
//		// !!! This binds the ModelAndView page.jsp
//		ModelAndView mv = new ModelAndView("page");
//		// Now we create the model!
//		// Add an attribute to the model. "greeting" will be bound to the view
//		// ({greeting} JSP
//		mv.addObject("greeting", greeting); // now passing in model value
//		return mv;
//	}

	@RequestMapping(value = "/test/{greeting}") // model value is part of
	public ModelAndView test(@PathVariable("greeting") String greeting) { // query
		if (greeting == null) {
			greeting = "Hello There";
		}
		// !!! This binds the ModelAndView page.jsp
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("greeting", greeting); // now passing in model value
		return mv;
	}
}
