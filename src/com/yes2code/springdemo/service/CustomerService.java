package com.yes2code.springdemo.service;

import java.util.List;

import com.yes2code.springdemo.entity.Customer;

public interface CustomerService {
	
	public List<Customer> getCustomers(int theSortField);

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int theID);

	public void deleteCustomer(int theId);

	public List<Customer> searchCustomers(String theSearchName);

}
