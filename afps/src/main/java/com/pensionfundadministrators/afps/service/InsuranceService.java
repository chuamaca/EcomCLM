package com.pensionfundadministrators.afps.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pensionfundadministrators.afps.domain.Insurance;
import com.pensionfundadministrators.afps.repository.InsuranceRepository;
import com.pensionfundadministrators.afps.service.mapper.InsuranceMapper;
import com.pensionfundadministrators.afps.web.model.InsuranceModel;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InsuranceService implements IInsuranceService {

	private final InsuranceRepository insuranceRepository;
	private final InsuranceMapper insuranceMapper;
	
	@Override
	public List<InsuranceModel> findAll() throws Exception {
		List<Insurance> insurances = insuranceRepository.findAll();
		return insuranceMapper.insurancesToInsuranceModels(insurances);
	}

	@Override
	public InsuranceModel findById(Long id) throws Exception {
		Optional<Insurance> insurance= insuranceRepository.findById(id);
		if (insurance.isPresent()) return insuranceMapper.insuranceToInsuranceModel(insurance.get());
		else throw new Exception("No se Encontro Datos");
	}

	@Override
	public List<InsuranceModel> findByName(String name) throws Exception {
		List<Insurance> insurances = insuranceRepository.findByName(name);
		return insuranceMapper.insurancesToInsuranceModels(insurances);
	}

	@Override
	public InsuranceModel create(InsuranceModel insuranceModel) {
		Insurance insurance = insuranceRepository.save(insuranceMapper.insuranceModelToInsurance(insuranceModel));
		return insuranceMapper.insuranceToInsuranceModel(insurance);
	}

	@Override
	public void update(Long id, InsuranceModel insuranceModel) throws Exception {
		Optional<Insurance> insuranceOptional = insuranceRepository.findById(id);
		
		if (insuranceOptional.isPresent()) {
			Insurance insuranceToUpdate = insuranceOptional.get();
			insuranceMapper.update(insuranceToUpdate, insuranceModel);
			insuranceRepository.save(insuranceToUpdate);
		}else throw new Exception("No Se Encontro Datos");
	}

	@Override
	public void deleteById(Long id) throws Exception {
		insuranceRepository.deleteById(id);		
	}
}
