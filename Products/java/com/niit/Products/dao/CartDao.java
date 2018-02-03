package com.niit.Products.dao;

import com.niit.Products.pojos.Cart;
import com.niit.Products.pojos.CartItem;
import com.niit.Products.pojos.User;

public interface CartDao {

	public Cart getCartByUser(User user);
	public void addCartItem(Cart cart);
	public void removeCartItem(Cart cart,CartItem cartItem);
	public void deleteCart(Cart cart);
	public CartItem getCartItemById(int id);
}
