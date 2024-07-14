package com.pensionfundadministrators.afps.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pensionfundadministrators.afps.domain.Customer;

public interface CustomerRepository extends JpaRepository<Customer, String> {
	List<Customer> findByFirstnameIgnoreCaseAndDniIgnoreCase(String firstname, String dni);
}
