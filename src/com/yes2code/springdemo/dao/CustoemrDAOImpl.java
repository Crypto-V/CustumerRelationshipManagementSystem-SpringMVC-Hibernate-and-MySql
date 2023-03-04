package com.yes2code.springdemo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes2code.springdemo.entity.Customer;

@Repository
public class CustoemrDAOImpl implements CustomerDAO {

	
	//need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	@Transactional
	public List<Customer> getCustomers() {

		//get current session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//create query
		Query<Customer> theQuery = currentSession.createQuery("from Customer", Customer.class);
		
		//get list of customers from query
		List<Customer> customers = theQuery.getResultList();
		
		//return the list of customers that was retrieved
		
		
		return customers;
	}

}
