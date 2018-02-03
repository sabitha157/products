package com.niit.Products.controller;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
//import java.util.List;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.Products.dao.CategoryDao;
import com.niit.Products.dao.ProductDao;
import com.niit.Products.pojos.Product;

@Controller
public class ProductController 
{
	@Autowired
    private CategoryDao categoryDao;
	@Autowired
	private ProductDao productDao;
	@RequestMapping("/product")
	   public String getProductPage(@ModelAttribute("product") Product product,Model model)
	   {
		 //model.addAttribute("products",productDao.getAllProduct());
		 model.addAttribute("categoryList",this.categoryDao.getAllCategory());
		 model.addAttribute("products",this.productDao.getAllProduct());
		 return "product";  
	   }
	 @RequestMapping(value="addProduct", method=RequestMethod.POST)
	   public String getAddProductPage(@ModelAttribute("product")@Valid Product product,BindingResult results,HttpServletRequest request,Model model)
	   {
		 if(results.hasErrors())
		 {	
			model.addAttribute("categoryList",this.categoryDao.getAllCategory());
		    return "product";
		 }
		 else
		 {
		 productDao.addProduct(product);
		 MultipartFile file=product.getFile();
		 String imagepath=request.getServletContext().getRealPath("/images/");
		 System.out.println("Directory:"+imagepath);
		 Path path=Paths.get(imagepath + File.separator + product.getId()+ ".jpg");
		 File imageFile=new File(path.toString());
		 System.out.println("Path:"+path.toString());
		 if(!imageFile.exists())
		 {
			 imageFile.mkdirs();
		 }
		 try
		 {
			 file.transferTo(imageFile);
		 }
		 catch(IllegalStateException e)
		 {
			 e.printStackTrace();
		 }
		 catch(IOException e)
		 {
			 e.printStackTrace();
		 }
		 model.addAttribute("categoryList",this.categoryDao.getAllCategory());
		 model.addAttribute("products",this.productDao.getAllProduct());
		 return "redirect:/product";
		 }
		}
	   @RequestMapping(value="/editproduct/{id}")
	   public ModelAndView editProduct(@PathVariable int id,Model model)
	   {
	ModelAndView mv=new ModelAndView("product");
	mv.addObject("product",productDao.getProductById(id));
	model.addAttribute("categoryList",this.categoryDao.getAllCategory());
	model.addAttribute("products",this.productDao.getAllProduct());
	return mv;
	   }	  
	   @RequestMapping(value="/deleteproduct/{id}",method=RequestMethod.GET)
	   public String deleteProduct(@PathVariable int id)
		   {
		   productDao.delete(id);
		   return "redirect:/product";
		   }
	   @RequestMapping("/bp")
		public String getBuyPage(@ModelAttribute("product") Product product, Model model) {
			model.addAttribute("products", productDao.getAllProduct());
			return "buyproduct";
		}

}