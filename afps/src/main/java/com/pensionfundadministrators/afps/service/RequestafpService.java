package com.pensionfundadministrators.afps.service;

import java.io.Console;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pensionfundadministrators.afps.domain.Beneficiary;
import com.pensionfundadministrators.afps.domain.Insurance;
import com.pensionfundadministrators.afps.domain.Requestafp;
import com.pensionfundadministrators.afps.repository.BeneficiaryRepository;
import com.pensionfundadministrators.afps.repository.CustomerRepository;
import com.pensionfundadministrators.afps.repository.RequestafpRepository;
import com.pensionfundadministrators.afps.service.mapper.BeneficiaryMapper;
import com.pensionfundadministrators.afps.service.mapper.CustomerMapper;
import com.pensionfundadministrators.afps.service.mapper.RequestafpMapper;
import com.pensionfundadministrators.afps.web.model.RequestafpModel;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class RequestafpService implements IRequestafpService {

	
	private final RequestafpRepository requestPensionFoundRepository;
	private final RequestafpMapper requestPensionFundMapper;
	
	private final BeneficiaryRepository beneficiaryRepository;
	private final BeneficiaryMapper beneficiaryMapper;
	
	private final CustomerRepository customerRepository;
	private final CustomerMapper customerMapper;
	
	@Override
	public RequestafpModel findByDni(String dni) throws Exception {
		Optional<Requestafp> request = requestPensionFoundRepository.findById(dni);
		if (request.isPresent()) return requestPensionFundMapper.requestToRequestModel(request.get());
		else  throw new Exception("No Tiene Ningun Fondo de Pensiones");
	}

	@Override
	public RequestafpModel create(RequestafpModel requestPensionFundModel) {
		
		//Validando Si tiene el beneficio
		Optional<Beneficiary> requestbeneficiary=beneficiaryRepository.findById(requestPensionFundModel.getDni());
		
		requestbeneficiary.toString();
		
		/*
		if (requestbeneficiary.isPresent()) {
			
			Optional<Insurance> custumerRQ= customerRepository.findById(requestPensionFundModel.getDni())
			
			
			
		}
		*/
		
		Requestafp request= requestPensionFoundRepository.save(requestPensionFundMapper.requestModelToRequest(requestPensionFundModel));
		return requestPensionFundMapper.requestToRequestModel(request);
	}
	
}
