package com.niit.Products.dao;

import java.util.List;

import com.niit.Products.pojos.Product;
import com.niit.Products.pojos.User;

public interface ProductDao 
{
	public void addProduct(Product product);
	public Product getProductById(int id);
	public List getAllProduct();
	public void delete(int id);

}
