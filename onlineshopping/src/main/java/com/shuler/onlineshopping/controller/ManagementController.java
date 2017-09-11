package com.shuler.onlineshopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shuler.shoppingbackend.dao.CategoryDAO;
import com.shuler.shoppingbackend.dao.ProductDAO;
import com.shuler.shoppingbackend.dto.Category;
import com.shuler.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private ProductDAO productDAO;
	
   @RequestMapping(value="/products", method=RequestMethod.GET) // GET is default
   public ModelAndView showManageProducts(@RequestParam(name="operation", required=false) String operation) {
	   ModelAndView mv = new ModelAndView("page");
	   
	   mv.addObject("userClickManageProducts", true);
	   mv.addObject("title", "Manage Products");
	   
	   Product nProduct = new Product();
	   
	   nProduct.setSupplierId(1);
	   nProduct.setActive(true);

	   mv.addObject("product", nProduct);
	   
	   if (operation != null) {
		   if (operation.equals("product")) {
			   mv.addObject("message", "Product created successfuly");
		   }
	   }	   
	   return mv;
   }
   
   @RequestMapping(value="/products", method=RequestMethod.POST) // GET is default
   public String handleProductSubmission(@ModelAttribute("product") Product modifiedProduct) {

	   productDAO.add(modifiedProduct);
	   // ! Pass the ball to the get request handler (above) showManageProducts()
	   return "redirect:/manage/products?operation=product";
   }
   
   /**
    * Populate drop-down for all categories on management form 
    * @return
    */
   @ModelAttribute("categories")
   public List<Category> getCategories() {
	   List<Category> list = categoryDAO.list();
	   return list;
   }
   
	@ModelAttribute("category")
	public Category getCategory() {
		return new Category();
	}
}
