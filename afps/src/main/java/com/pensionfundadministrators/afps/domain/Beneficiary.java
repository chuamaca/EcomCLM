package com.pensionfundadministrators.afps.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Beneficiary {
	
	@Id
	@NotNull
	@Column(unique = true)
	private String dni;
	
	@NotNull
	private Double amountavailable;
	
	@NotNull
	private Timestamp datedisbursement;
	
	@NotNull
	private String bankaccount;
	
	@NotNull
	private String insuranceruc;
		
}
