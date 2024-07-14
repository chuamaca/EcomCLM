package com.pensionfundadministrators.afps.domain;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.Email;
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
public class Customer {
	
	/*
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	*/
	@Id
	@NotNull
	@Column(unique = true)
	private String dni;
	
	@NotNull
	private String firstname;
	
	@NotNull
	private String lastname;
	
	@NotNull
	private String phone;
	
	@NotNull
	private String email;
	
	@NotNull
	private Double amountavailable;
	
	@NotNull
	private String bankaccount;
	
	@NotNull
	private Timestamp withdrawals;
	
	@OneToOne(fetch = FetchType.EAGER)
	private Insurance  insurance;
}
