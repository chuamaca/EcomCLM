package com.pensionfundadministrators.afps.service;

import com.pensionfundadministrators.afps.web.model.RequestafpModel;

public interface IRequestafpService {

	
	RequestafpModel findByDni(String dni) throws Exception;
	RequestafpModel create(RequestafpModel requestPensionFundModel);
	
	/*
	List<EventModel> findByNameAndDescription(String name, String Description) throws Exception;
	List<EventModel> findAll() throws Exception;
	void update(Long id, EventModel eventModel) throws Exception;
	void deleteById(Long id) throws Exception;
	*/
	
}
