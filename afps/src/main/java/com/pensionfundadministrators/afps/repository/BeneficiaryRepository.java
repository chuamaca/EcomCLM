package com.pensionfundadministrators.afps.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pensionfundadministrators.afps.domain.Beneficiary;

public interface BeneficiaryRepository extends JpaRepository<Beneficiary, String>  {
	 List<BeneficiaryRepository> findByDniIgnoreCaseAndInsurancerucIgnoreCase(String dni, String insuranceruc);

	//Optional<RequestPensionFund> findById(String dni);
}
