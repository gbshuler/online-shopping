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
	private static String CATEGORY_NAME = "Television";

	@BeforeClass
	public static void init() {
		// This is the error you get if the database is not running.
		// WARN: HHH000342: Could not obtain connection to query metadata :
		// Cannot create PoolableConnectionFactory (isValid() returned false)
		context = new AnnotationConfigApplicationContext();
		context.scan("com.shuler.shoppingbackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}

	@Test
	public void testAddCategory() { // test DAO method add()
		category = new Category();
		category.setName(CATEGORY_NAME);
		category.setDescription("A wonderful addition to your home.  80 inches");
		category.setImageURL("CAT_1.png");

		assertEquals("Successfully added a category to the database table", true, categoryDAO.add(category));
	}

//	@Test
//	public void testGetCategory() { // test DAO method get()
//		category = categoryDAO.get(4);
//
//		assertEquals("Successfully retrieved a category from the database table", CATEGORY_NAME, category.getName());
//	}
//	@Test
//	public void testUpdateCategory() { // test DAO method update()
//		category = categoryDAO.get(5);
//		category.setName("Receiver");
//
//		assertEquals("Successfully retrieved a category from the database table", true, 
//				categoryDAO.update(category));
//	}
//
//	
//	@Test
//	public void testDeleteCategory() { // test DAO method get()
//		category = categoryDAO.get(5);
//
//		assertEquals("Successfully deleted a category from the database table", true, categoryDAO.delete(category));
//		category = categoryDAO.merge(category);
//		assertEquals("Successfully deleted a category from the database table", true, category.delete(category));
//	}
	
//	/**
//	 * You have to look at number of rows in table CATEGORY and count how many have is_active set to TRUE.
//	 * It's a cat and mouse game since another test will change the number of rows.
//	 */
//	@Test
//	public void testListCategory() { // test DAO method list()
//		category = categoryDAO.get(5);
//
//		assertEquals("Successfully fetched the list of categories in the table", 12, categoryDAO.list().size());
//
//	}
	
	/**
     * CRUD Integration test
     * 
     * Run this test in isolation
     * WILL FAIL IF YOU DONT "Drop the table and then create it"
     * 
     * FOO DROP TABLE CATEGORY;
     * FOO CREATE TABLE category (
	 *   id IDENTITY,
	 *   name VARCHAR(50),
	 *   description VARCHAR(255),
	 *   image_url VARCHAR(50),
	 *   is_active BOOLEAN,
	
	 *   CONSTRAINT pk_category_id PRIMARY KEY (id)
     * );
	 */
	@Test
	public void testCRUDCategory() { // test DAO method list()
		Category category = new Category();
		
		// STEP 1 CREATE (ADD)
		
		category.setName("Bicycle");
		category.setDescription("Spin the wheel on a new bike!");
		category.setImageURL("bikeCategory.png");

		assertEquals("Successfully added a category to the database table", true, categoryDAO.add(category));

		category = new Category();
		category.setName("Hyperloop");
		category.setDescription("Plan ahead for your destination.");
		category.setImageURL("hyperloop.png");
		
		assertEquals("Successfully added a category to the database table", true, categoryDAO.add(category));
		
		// STEP 2 UPDATE 
		
		category = categoryDAO.get(2);
		category.setName("Tesla");

		assertEquals("Successfully update a category from the database table", true, 
				categoryDAO.update(category));
		
		// STEP 3 DELETE
		category = categoryDAO.get(2);
		assertEquals("Successfully deleted a category from the database table", true, categoryDAO.delete(category));

		// STEP 4 LIST (Get collection of all rows in database

		// Retrieve rows where active is true
		assertEquals("Successfully fetched the list of categories in the table", 1, categoryDAO.list().size());
		// Retrieve all rows no matter values (no WHERE clause)
		assertEquals("Successfully fetched the list of categories in the table", 2, categoryDAO.listAll().size());

	}
}
