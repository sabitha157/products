package com.niit.Products.dao;

import java.util.List;

import com.niit.Products.pojos.Category;
//import com.niit.Products.pojos.Product;
import com.niit.Products.pojos.Product;

public interface CategoryDao
{
	public void addCategory(Category category);
	public List getAllCategory();
	public Category getCategoryById(int id);
	public void delete(int id);
}
