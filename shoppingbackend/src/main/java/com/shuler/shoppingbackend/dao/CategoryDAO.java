package com.shuler.shoppingbackend.dao;

import java.util.List;

import com.shuler.shoppingbackend.dto.Category;

public interface CategoryDAO {

	

	List<Category> list();
	List<Category> listAll();
	Category get(int id);
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);

}
