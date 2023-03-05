package com.yes2code.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yes2code.springdemo.dao.CustomerDAO;
import com.yes2code.springdemo.entity.Customer;
import com.yes2code.springdemo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	// Injecting the CustomerService that wil redirect to DAO
	// |AUtowired spring will scan for the components that implements Service
	// interface and auto inject them in this class.
	@Autowired
	private CustomerService customerService;

	@GetMapping("/list")
	public String listCustomers(Model theModel) {

		// get customers from dao
		List<Customer> theCustomers = customerService.getCustomers();

		// add customers to the model(data container)
		theModel.addAttribute("customers", theCustomers);

		return "list-customers";

	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {

		// create model attribute to bind the form data
		Customer theCustomer = new Customer();
		theModel.addAttribute("customer", theCustomer);

		return "customer-form";
	}
	
	//This is getting the action from the form doing the job and redirecting to the list page
	@PostMapping("saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
		
		//save the customer
		customerService.saveCustomer(theCustomer);
		
		return "redirect:/customer/list";
	}

}
