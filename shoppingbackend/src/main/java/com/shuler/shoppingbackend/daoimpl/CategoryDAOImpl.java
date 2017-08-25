package com.shuler.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.shuler.shoppingbackend.dao.CategoryDAO;
import com.shuler.shoppingbackend.dto.Category;

/**
 *  Spring Repository here.
 * @author brad
 * Inject JVM Spring container with a bean name categoryDAO 
 * One use is found in private declaration in front end class PageController
 *
 */

@Repository("categoryDAO")  
public class CategoryDAOImpl implements CategoryDAO {

	private static List<Category> categories = new ArrayList<>();
	
	static {
		Category category = new Category();
		
		category.setId(1);
        category.setName("Television");
        category.setDescription("A wonderful addition to your home.  80 inches");
        category.setImageURL("CAT_1.png");
        categories.add(category);
        
        category = new Category();
		category.setId(2);
        category.setName("Blackberry 410");
        category.setDescription("Built in keyboard!");
        category.setImageURL("CAT_2.png");
        categories.add(category);
        
        category = new Category();
		category.setId(3);
        category.setName("MacBook Pro 15 w/Retina");
        category.setDescription("Solid Aluminium ingot");
        category.setImageURL("CAT_3.png");
        categories.add(category);
    }
	
	@Override
	public List<Category> list() {
		return categories;
	}

	@Override
	public Category getId(int id) {
		for (Category category: categories) {
			if (category.getId() == id) {
				return category;
			}
		}
		return null;  // todo handle
	}

}
