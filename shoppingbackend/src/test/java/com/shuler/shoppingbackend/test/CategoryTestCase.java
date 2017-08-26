package com.shuler.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.shuler.shoppingbackend.dao.CategoryDAO;
import com.shuler.shoppingbackend.dto.Category;

public class CategoryTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;
	
	@BeforeClass
	public static void init() {
		// This is the error you get if the database is not running.
		// WARN: HHH000342: Could not obtain connection to query metadata : 
		// Cannot create PoolableConnectionFactory (isValid() returned false)
		context = new AnnotationConfigApplicationContext();
		context.scan("com.shuler.shoppingbackend");
		context.refresh();
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
	}
	
	@Test
	public void testAddCategory() { // test DAO method add()
		category = new Category();
		category.setName("Television");
		category.setDescription("A wonderful addition to your home.  80 inches");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Successfully added a category to the database table", true, categoryDAO.add(category));
	}
}
