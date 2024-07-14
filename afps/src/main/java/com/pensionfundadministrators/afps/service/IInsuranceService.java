package com.pensionfundadministrators.afps.service;

import java.util.List;

import com.pensionfundadministrators.afps.web.model.InsuranceModel;

public interface IInsuranceService {
	
	List<InsuranceModel> findAll() throws Exception;
	InsuranceModel findById(Long id) throws Exception;
	List<InsuranceModel> findByName(String name) throws Exception;
	InsuranceModel create(InsuranceModel insuranceModel);
	
	void update(Long id, InsuranceModel insuranceModel) throws Exception;
	
	void deleteById(Long id) throws Exception;
	
}
