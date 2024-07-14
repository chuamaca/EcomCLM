package com.pensionfundadministrators.afps.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pensionfundadministrators.afps.domain.Customer;
import com.pensionfundadministrators.afps.repository.CustomerRepository;
import com.pensionfundadministrators.afps.service.mapper.CustomerMapper;
import com.pensionfundadministrators.afps.web.model.CustomerModel;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomerService implements ICustomerService {

	private final CustomerRepository customerRepository;
	private final CustomerMapper customerMapper;
	
	@Override
	public List<CustomerModel> findAll() throws Exception {
		List<Customer> customers = customerRepository.findAll();
		return customerMapper.customersToCustomerModels(customers);
	}

	@Override
	public CustomerModel findByDni(String dni) throws Exception {
		Optional<Customer> customer= customerRepository.findById(dni);
		if (customer.isPresent()) return customerMapper.customerToCustomerModel(customer.get());
		else throw new Exception("No se Encontro Datos");
	}
	

	@Override
	public List<CustomerModel> findByNameAndDni(String firstname, String dni) throws Exception {
		List<Customer> customers = customerRepository.findByFirstnameIgnoreCaseAndDniIgnoreCase(firstname, dni);
		return customerMapper.customersToCustomerModels(customers);
	}

	@Override
	public CustomerModel create(CustomerModel customerModel) throws Exception {
		String validateCustomer = customerModel.getDni();
		Optional<Customer> customerDni= customerRepository.findById(validateCustomer);
		if (customerDni.isEmpty()) {
			Customer customer = customerRepository.save(customerMapper.customerModelToCustomer(customerModel));
			return customerMapper.customerToCustomerModel(customer);
		}else throw new Exception("EL Documento Ya se encuentra Registrado");
		
	}

	@Override
	public void update(String dni, CustomerModel customerModel) throws Exception {
		Optional<Customer> customerOptional = customerRepository.findById(dni);
		
		if (customerOptional.isPresent()) {
			Customer customerToUpdate = customerOptional.get();
			
			customerMapper.update(customerToUpdate, customerModel);
			customerRepository.save(customerToUpdate);
		}else throw new Exception("No Se Encontro Datos");
	}

	@Override
	public void deleteByDni(String dni) throws Exception {
		customerRepository.deleteById(dni);		
	}
}
