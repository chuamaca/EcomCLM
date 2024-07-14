package com.pensionfundadministrators.afps.service.mapper;

import java.util.List;


import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import com.pensionfundadministrators.afps.domain.Requestafp;
import com.pensionfundadministrators.afps.web.model.RequestafpModel;

//Maneja tambien la injeccion de dependicas con spring
@Mapper(componentModel = "spring")
public interface RequestafpMapper {
	
	Requestafp requestModelToRequest(RequestafpModel model);
	RequestafpModel requestToRequestModel(Requestafp domain);
	List<RequestafpModel> requestsToRequesModels (List<Requestafp> domain);
	
	 @Mapping(target = "dni", ignore = true)
	void update (@MappingTarget Requestafp entity, RequestafpModel updateEntity);
	 
}
