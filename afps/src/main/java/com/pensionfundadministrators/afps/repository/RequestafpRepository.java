package com.pensionfundadministrators.afps.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pensionfundadministrators.afps.domain.Requestafp;

public interface RequestafpRepository extends JpaRepository<Requestafp, String>  {
	 List<RequestafpRepository> findByDniIgnoreCaseAndInsurancerucIgnoreCase(String dni, String insuranceruc);

	//Optional<RequestPensionFund> findById(String dni);
}
