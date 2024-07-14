package com.pensionfundadministrators.afps.service.mapper;

import java.util.List;


import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

import com.pensionfundadministrators.afps.domain.Beneficiary;
import com.pensionfundadministrators.afps.web.model.BeneficiaryModel;
import com.pensionfundadministrators.afps.web.model.RequestafpModel;

//Maneja tambien la injeccion de dependicas con spring
@Mapper(componentModel = "spring")
public interface BeneficiaryMapper {
	
	Beneficiary beneficiaryModelToBeneficiary(BeneficiaryModel model);
	BeneficiaryModel beneficiaryToBeneficiaryModel(Beneficiary beneficiary);
	List<BeneficiaryModel> beneficiariesToBeneficiariesModel (List<Beneficiary> domain);
	
	 @Mapping(target = "dni", ignore = true)
	void update (@MappingTarget Beneficiary entity, BeneficiaryModel updateEntity);
	 
}
