package com.pensionfundadministrators.afps.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pensionfundadministrators.afps.service.ICustomerService;
import com.pensionfundadministrators.afps.web.model.CustomerModel;

import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/v1/customer")
@Slf4j
public class CustomerController {
	
	private final ICustomerService customerService;
	
	@GetMapping(produces = {"application/json"})
	@Operation(summary ="List Insurance")
	public ResponseEntity<Object> getAll() throws Exception{
		List<CustomerModel> response=customerService.findAll();
		log.info("Service Customer - getAll " + "OK");
		return new ResponseEntity<>(response,HttpStatus.OK);
	}
	
	@GetMapping(path= {"{dni}"}, produces = {"application/json"})
	public ResponseEntity<Object> getByDni(@PathVariable("dni") String dni) throws Exception{
		CustomerModel response=customerService.findByDni(dni);
		log.info("Service Customer getById " + "OK");
		log.debug(response.toString());
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<Object> create(@RequestBody CustomerModel customerModel) throws Exception{
		CustomerModel response= customerService.create(customerModel);
		//log.info(" sdfsd "+customerModel.getName());
		log.info("create " + "OK");
		log.debug(response.toString());
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@PutMapping (path= {"{dni}"}, produces = {"application/json"})
	public void update(@PathVariable("dni") String dni,
			@Valid @RequestBody CustomerModel customerModel) throws Exception{
		customerService.update(dni, customerModel);
		log.info("update " + "OK");
		log.debug(dni.toString() +"/"+customerModel.toString());
	}
	
	@DeleteMapping (path= {"{dni}"}, produces = {"aplication/jason"})
	public void deleteById(@PathVariable("dni") String dni) throws Exception{
		customerService.deleteByDni(dni);
		log.info("Service Customer delete " + "OK");
		log.debug(dni.toString() +"/"+customerService.toString());
	}
	
}
