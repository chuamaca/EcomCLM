package com.pensionfundadministrators.afps.service.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import com.pensionfundadministrators.afps.domain.Insurance;
import com.pensionfundadministrators.afps.web.model.InsuranceModel;

@Mapper(componentModel = "spring")
public interface InsuranceMapper {
	
	Insurance insuranceModelToInsurance(InsuranceModel model);
	InsuranceModel insuranceToInsuranceModel(Insurance domain);
	List<InsuranceModel> insurancesToInsuranceModels(List<Insurance> domain);
	@Mapping(target="id", ignore = true)
	void update(@MappingTarget Insurance entity, InsuranceModel updateEntity);
}
