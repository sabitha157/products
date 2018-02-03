package com.niit.Products.controller;

//import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.niit.Products.dao.ProductDao;
import com.niit.Products.dao.Userdao;
import com.niit.Products.pojos.Address;
import com.niit.Products.pojos.Product;
import com.niit.Products.pojos.User;

@Controller
@SessionAttributes
public class Pagecontroller {
	@Autowired
	private Userdao userdao;
 
	@RequestMapping(value = { "/homePage", "/" })
	public String getIndexPage() {
		return "index";
	}
	
	@RequestMapping("/thanku")
	public String getTqPage() {
		return "thankyou";
	}

	@RequestMapping("/login")
	public String getLoginPage(Model model,@RequestParam(name="error",required=false)String error) {
		if(error!=null)
		{
			model.addAttribute("message","Invalid username and password");
		}
		
		return "login";
	}

	@RequestMapping("/register")
	public String getRegisterPage(Model model) {
	
		model.addAttribute("user", new User());
		return "register";
	}


	@RequestMapping("/couch")
	public String getCouchPage() {
		return "couch";
	}

	@RequestMapping("/dinners")
	public String getDinnerPage() {
		return "dinners";
	}

	@RequestMapping("/aboutus")
	public String getAboutUsPage() {
		return "aboutus";
	}

	@RequestMapping("/vanity")
	public String getWardrobePage() {
		return "wardrobes";
	}

	@RequestMapping("/services")
	public String getServicesPage() {
		return "services";
	}

	@RequestMapping("/branch")
	public String getBranchesPage() {
		return "branches";
	}

	@RequestMapping("/swingproduct")
	public String getSwing() {
		return "swing";
	}
	
	@RequestMapping("/up")
	public String getUserPage(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("users", userdao.getAlluser());
		return "user";
	}

	
	
	@RequestMapping(value = "userdetails", method = RequestMethod.POST)
	public String getUser(@ModelAttribute User user) {
		user.setRole("user");
		user.setEnabled(true);
		System.out.println("Username:" + user.getUsername());
		System.out.println("DOB:" + user.getDob());
		// System.out.println("Address:"+user.getAddress());
		return "login";
	} 

	
	@RequestMapping("/add")
	public String getPage(@ModelAttribute("user")@Valid User user,BindingResult results, Model model) {
		if(results.hasErrors())
		{
			return "user";
		}
		else		
		{
		user = userdao.addUser(user);
		return "redirect:/up";
	}
	}
	@RequestMapping(value = "address", method = RequestMethod.POST)
	public String getAddress(@ModelAttribute("user") @Valid User user, BindingResult results, Model model) {
		if (results.hasErrors()) {
			return "register";
		} 
		else
		{
			
			user.setRole("USER");
			user.setEnabled(true);
			user = userdao.addUser(user);
			System.out.println("Username:" + user.getUsername());
			System.out.println("DOB:" + user.getDob());
			// System.out.println("Address:"+user.getAddress());
			model.addAttribute("user", user);
			model.addAttribute("address", new Address());
			return "address";
		}
	
	}
	@RequestMapping("/address1/{id}")
	public String getAddressPage(@ModelAttribute("address")@Valid Address address,BindingResult results,@PathVariable int id,Model model) 
	{
		if (results.hasErrors())
		{
			return "address";
		} 
		else 
		{
		User user = userdao.getUserById(id);
		List<Address> addresses = user.getAddress();
		addresses.add(address);
		user.setAddress(addresses);
		userdao.upUser(user);
		return "redirect:/login";
	}
	}
	

    
}
