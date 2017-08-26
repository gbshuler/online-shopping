package com.shuler.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shuler.shoppingbackend.dao.CategoryDAO;
import com.shuler.shoppingbackend.dto.Category;

/**
 * Spring Repository here.
 * 
 * @author brad Inject JVM Spring container with a bean name categoryDAO One use
 *         is found in private declaration in front end class PageController
 *
 */

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;
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
		category.setName("Blackberry_410");
		category.setDescription("Built in keyboard!");
		category.setImageURL("CAT_2.png");
		categories.add(category);
		category = new Category();
		category.setId(3);
		category.setName("Tesla_S");
		category.setDescription("Tesla Model S");
		category.setImageURL("CAT_3.png");
		categories.add(category);

		category = new Category();
		category.setId(4);
		category.setName("MacBook_Pro_15_wRetina");
		category.setDescription("Solid Aluminium ingot");
		category.setImageURL("CAT_4.png");
		categories.add(category);

		category = new Category();
		category.setId(5);
		category.setName("Charcoal");
		category.setDescription("One bag of charcoal");
		category.setImageURL("CAT_5.png");
		categories.add(category);
	}

	@Override
	public List<Category> list() {
		return categories;
	}

	@Override
	public Category get(int id) {
		for (Category category : categories) {
			if (category.getId() == id) {
				return category;
			}
		}
		return null; // todo handle - Throw business exception?
	}

	@Override
	@Transactional
	public boolean add(Category category) {
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
