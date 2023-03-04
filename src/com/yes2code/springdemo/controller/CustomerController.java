package com.yes2code.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yes2code.springdemo.dao.CustomerDAO;
import com.yes2code.springdemo.entity.Customer;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	//Injecting the CustomerDAO
	//|AUtowired spring will scan for the components that implements DAO interface and auto inject them in this class.
	@Autowired
	private CustomerDAO customerDAO;
	
	@RequestMapping("/list")
	public String listCustomers(Model theModel) {
		
		//get customers from dao
		  List<Customer> theCustomers = customerDAO.getCustomers();
		
		//add customers to the model(data container)
		  theModel.addAttribute("customers",theCustomers);
		
		return "list-customers";
		
	}
	

}
