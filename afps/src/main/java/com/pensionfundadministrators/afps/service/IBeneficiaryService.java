package com.pensionfundadministrators.afps.service;

import com.pensionfundadministrators.afps.web.model.BeneficiaryModel;

public interface IBeneficiaryService {

	
	BeneficiaryModel  findByDni(String dni) throws Exception;
	BeneficiaryModel create(BeneficiaryModel beneficiaryModel);
	
	/*
	List<EventModel> findByNameAndDescription(String name, String Description) throws Exception;
	List<EventModel> findAll() throws Exception;
	void update(Long id, EventModel eventModel) throws Exception;
	void deleteById(Long id) throws Exception;
	*/
	
}
