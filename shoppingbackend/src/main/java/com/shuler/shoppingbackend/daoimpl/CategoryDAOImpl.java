package com.shuler.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

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
@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * @return Active rows in Category Table
	 * 
	 */
	@SuppressWarnings("unchecked") // Since we cannot cast the return to its
									// generic type
	@Override
	public List<Category> listAll() {
		String selectActiveCategory = "FROM Category";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);

		return query.getResultList();
	}

	/**
	 * @return Active rows in Category Table
	 * Suppress compile warning (since we cannot cast 
	 * the return to its generic type
	 */
	@SuppressWarnings("unchecked") 
	@Override
	public List<Category> list() {
		String selectActiveCategory = "FROM Category WHERE active = :active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		query.setParameter("active", true);

		return query.getResultList();
	}

	/**
	 * Retrieve a single category based on id
	 */
	@Override
	public Category get(int id) {
		return sessionFactory.getCurrentSession().get(Category.class, id);
	}

	/**
	 * Persist a new category
	 */
	@Override
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

	@Override
	public boolean update(Category category) {
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Category category) {
		category.setActive(false); // Not a real delete. Admin disables category
									// to remove store
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
