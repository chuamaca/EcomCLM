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

import com.pensionfundadministrators.afps.service.IRequestafpService;
import com.pensionfundadministrators.afps.web.model.RequestafpModel;

import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/v1/requestafp")
@Slf4j
public class RequestafpController {
	
	private final IRequestafpService requestPensionFundService;
	
	/**
	 * Get list of events
	 * @return
	 * @throws Exception
	 */
	/*
	@GetMapping(produces = {"application/json"}) //Para Mapear que es Get. lo consumen con un Get
	@Operation(summary ="List Event")
	public ResponseEntity<Object> getAll() throws Exception{
		List<RequestPensionFundModel> response= eventService.findAll();
		log.info("getAll " + "OK");
		log.debug(response.toString());
		return new ResponseEntity<>(response,HttpStatus.OK);
	}
	*/
	//@Operation(summary ="List Beneficiary For DNI")
///	@GetMapping (path= {"{dni}"}, produces = {"application/json"})
	public ResponseEntity<Object> getByDni(@PathVariable("dni") String dni) throws Exception{
		RequestafpModel response= requestPensionFundService.findByDni(dni);
		log.info("getById " + "OK");
		log.debug(response.toString());
		return new ResponseEntity<>(response,HttpStatus.OK);
	}
	
	
	@PostMapping
	public ResponseEntity<Object> create(@Valid @RequestBody RequestafpModel requestPfModel) throws Exception{
		RequestafpModel response= requestPensionFundService.create(requestPfModel);
		log.info("create " + "OK");
		log.debug(response.toString());
		return new ResponseEntity<>(response,HttpStatus.OK);
	}
	
}

