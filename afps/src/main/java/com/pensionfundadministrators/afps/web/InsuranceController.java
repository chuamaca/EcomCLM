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

import com.pensionfundadministrators.afps.service.IInsuranceService;
import com.pensionfundadministrators.afps.web.model.InsuranceModel;

import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/v1/insurance")
@Slf4j
public class InsuranceController {
	
	private final IInsuranceService insuranceService;
	
	@GetMapping(produces = {"application/json"})
	@Operation(summary ="List Insurance")
	public ResponseEntity<Object> getAll() throws Exception{
		List<InsuranceModel> response=insuranceService.findAll();
		log.info("Service Insurance - getAll " + "OK");
		return new ResponseEntity<>(response,HttpStatus.OK);
	}
	
	@GetMapping(path= {"{id}"}, produces = {"application/json"})
	public ResponseEntity<Object> getById(@PathVariable("id") Long id) throws Exception{
		InsuranceModel response=insuranceService.findById(id);
		log.info("Service Insurance getById " + "OK");
		log.debug(response.toString());
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<Object> create(@RequestBody InsuranceModel insuranceModel) throws Exception{
		InsuranceModel response= insuranceService.create(insuranceModel);
		log.info(" sdfsd "+insuranceModel.getName());
		//log.info("create " + "OK");
		log.debug(response.toString());
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@PutMapping (path= {"{id}"}, produces = {"application/json"})
	public void update(@PathVariable("id") Long id,
			@Valid @RequestBody InsuranceModel insuranceModel) throws Exception{
		insuranceService.update(id, insuranceModel);
		log.info("update " + "OK");
		log.debug(id.toString() +"/"+insuranceModel.toString());
	}
	
	@DeleteMapping (path= {"{id}"}, produces = {"aplication/jason"})
	public void deleteById(@PathVariable("id") Long id) throws Exception{
		insuranceService.deleteById(id);
		log.info("Service Insurance delete " + "OK");
		log.debug(id.toString() +"/"+insuranceService.toString());
	}
	
}
