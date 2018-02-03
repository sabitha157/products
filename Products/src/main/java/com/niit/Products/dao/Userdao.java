package com.niit.Products.dao;

import java.util.List;

import com.niit.Products.pojos.User;

public interface Userdao {
	public User addUser(User user);
	public void upUser(User user);
	public User getUserById(int id);
	public List getAlluser();
	public User getUserByUsername(String username);
}
