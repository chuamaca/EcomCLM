package com.pensionfundadministrators.afps.service;



import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pensionfundadministrators.afps.domain.Beneficiary;
import com.pensionfundadministrators.afps.repository.BeneficiaryRepository;
import com.pensionfundadministrators.afps.service.mapper.BeneficiaryMapper;
import com.pensionfundadministrators.afps.web.model.BeneficiaryModel;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class BeneficiaryService implements IBeneficiaryService{
	
	private final BeneficiaryRepository beneficiariesRepository;
	private final BeneficiaryMapper beneficiaryMapper;
	
	@Override
	public BeneficiaryModel findByDni(String dni) throws Exception {
		Optional<Beneficiary> request = beneficiariesRepository.findById(dni);
		if (request.isPresent()) return beneficiaryMapper.beneficiaryToBeneficiaryModel(request.get());
		else  throw new Exception("No Esta Beneficiado con el retiro de Pensiones");
	}

	@Override
	public BeneficiaryModel create(BeneficiaryModel beneficiaryModel) {
		Beneficiary request= beneficiariesRepository.save(beneficiaryMapper.beneficiaryModelToBeneficiary(beneficiaryModel));
		return beneficiaryMapper.beneficiaryToBeneficiaryModel(request);
	}

	
	
	
}
