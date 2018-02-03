package com.niit.Products.controller;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.Products.dao.CartDao;
import com.niit.Products.dao.ProductDao;
import com.niit.Products.dao.Userdao;
import com.niit.Products.pojos.Cart;
import com.niit.Products.pojos.CartItem;
import com.niit.Products.pojos.Product;
import com.niit.Products.pojos.User;
@Controller
public class CartController {
	
	@Autowired
	Userdao userdao;

	@Autowired
	CartDao cartDao;

	@Autowired
	ProductDao productDao;

	
	@RequestMapping("/cart")
	public String getCart(Principal principal, Model model, Cart cart) 
	{

		User user = userdao.getUserByUsername(principal.getName());
		cart = cartDao.getCartByUser(user);
		model.addAttribute("cart", cart);
		return "cart";
	}
	@RequestMapping("/acart/{id}")
	public String addToCart(@PathVariable int id, Model model, Principal principal) {

		User user = userdao.getUserByUsername(principal.getName());
		Product product = productDao.getProductById(id);

		boolean found = false;

		List<CartItem> cartItems;
		CartItem cartItem;
		Cart cart;
		if ((cart = cartDao.getCartByUser(user)) == null) {
			cart = new Cart();
			cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setQuantity(1);
			cartItem.setSubTotal(product.getCost());

			cartItems = new ArrayList<CartItem>();
			cartItems.add(cartItem);

			cart.setCartItems(cartItems);
			cart.setUser(user);
			cart.setGrandTotal(cartItem.getSubTotal());

			cartDao.addCartItem(cart);

		} else {
			for (CartItem ci : cart.getCartItems()) {
				if (ci.getProduct().getId() == id) {
					ci.setQuantity(ci.getQuantity() + 1);
					ci.setSubTotal(ci.getQuantity() * ci.getProduct().getCost());
					cart.setGrandTotal(cart.getGrandTotal() + ci.getProduct().getCost());
					found = true;
				}
			}

			if (!found) {
				cartItem = new CartItem();
				cartItem.setProduct(product);
				cartItem.setQuantity(1);
				cartItem.setSubTotal(product.getCost());

				cart.getCartItems().add(cartItem);
				cart.setGrandTotal(cart.getGrandTotal() + cartItem.getSubTotal());

			}

			cartDao.addCartItem(cart);
		}
		model.addAttribute("cart", cart);
		return "cart";
	}

	@RequestMapping(value = { "/checkout" })
	public String getpage() {
		return "thankyou";
	}
	@RequestMapping("/deletecart/{id}")
	public String deleteCartItem(@PathVariable int id, Principal principal, Model model) {

		CartItem cartItem = cartDao.getCartItemById(id);
		User user = userdao.getUserByUsername(principal.getName());
		Cart cart = cartDao.getCartByUser(user);
		cartDao.removeCartItem(cart, cartItem);
		model.addAttribute("cart", cart);
		return "redirect:/cart";
	}
}
