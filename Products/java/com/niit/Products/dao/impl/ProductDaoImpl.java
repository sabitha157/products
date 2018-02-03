package com.niit.Products.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Products.dao.ProductDao;
import com.niit.Products.pojos.Product;
@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {
	@Autowired
private SessionFactory sessionFactory;
	@Override
	public void addProduct(Product product) {
	 Session session=sessionFactory.openSession();
	 Transaction transaction=session.beginTransaction();
     session.saveOrUpdate(product);
	 transaction.commit();
	 session.close();

	}

	@Override
	public Product getProductById(int id) {
		Session  session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		Product p1=new Product();
		p1=session.get(Product.class, id);
		transaction.commit();	
		session.close();
		return p1;
	}

	@Override
	public List<Product> getAllProduct() {
		Session  session=sessionFactory.openSession();
		List<Product> p2=session.createQuery("from Product", Product.class).list();
		session.close();
		return p2;
	}

	@Override
	public void delete(int id) {
		Session  session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.delete(getProductById(id));
		transaction.commit();		
		session.close();
	}

}
