package com.pensionfundadministrators.afps.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pensionfundadministrators.afps.domain.Insurance;

public interface InsuranceRepository extends JpaRepository<Insurance, Long> {
	List<Insurance> findByName(String name);
}
