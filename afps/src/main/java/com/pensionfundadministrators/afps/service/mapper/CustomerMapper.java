package com.pensionfundadministrators.afps.service.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import com.pensionfundadministrators.afps.domain.Customer;
import com.pensionfundadministrators.afps.web.model.CustomerModel;

@Mapper(componentModel = "spring")
public interface CustomerMapper {
	
	Customer customerModelToCustomer(CustomerModel model);
	CustomerModel customerToCustomerModel(Customer domain);
	List<CustomerModel> customersToCustomerModels(List<Customer> domain);
	@Mapping(target="dni", ignore = true)
	void update(@MappingTarget Customer entity, CustomerModel updateEntity);
}
