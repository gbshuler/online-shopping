package com.shuler.onlineshopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuler.shoppingbackend.dao.ProductDAO;
import com.shuler.shoppingbackend.dto.Product;

/**
 * Top level context for all requests in class 
 * (All requests must have /json/data prepended to them)
 * Request mappings will be intercepted for these URLS:
 * /json/data/all/products
 * /json/data/category/${id}/products
 * Example (will return a list of Product objects for Category 7 -- using ResponseBock to package into JSON:
 * /json/data/category/7/products
 */
@Controller
@RequestMapping("/json/data")
public class JsonDataController {
	@Autowired
	private ProductDAO productDAO;

	/**
	 * No more ModelAndView.  Get as JSON data
	 * The ResponseBody will cause a classpath lookup for an a
	 * appropriate data converter (should be JSON)
	 * @return List of all Product's
	 */
	@RequestMapping("/all/products")
	@ResponseBody
	public List<Product> getAllProducts() {
		
		return productDAO.listActiveProducts();
				
	}
	
	/**
	 * Convert return data to JSON using a jackson ResponsBody 
	 * (a JSON converter class will be automatically added with the Class Loader)
	 *  "ResponseBody" a converted object by Jackson
	 * @param id of a Category
	 * @return List of Products for a given Category
	 */
	@RequestMapping("/category/{id}/products")
	@ResponseBody
	public List<Product> getProductsByCategory(@PathVariable int id) {
        return productDAO.listActiveProductsByCategory(id);
	}
}
