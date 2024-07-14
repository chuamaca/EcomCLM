package com.pensionfundadministrators.afps.service;

import java.util.List;

import com.pensionfundadministrators.afps.web.model.CustomerModel;

public interface ICustomerService {
	
	List<CustomerModel> findAll() throws Exception;
	CustomerModel findByDni(String dni) throws Exception;
	List<CustomerModel> findByNameAndDni(String name, String dni) throws Exception;
	CustomerModel create(CustomerModel customerModel) throws Exception;
	void update(String dni, CustomerModel customerModel) throws Exception;
	void deleteByDni(String dni) throws Exception;
	
}
