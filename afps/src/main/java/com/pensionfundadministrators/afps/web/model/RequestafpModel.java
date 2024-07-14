package com.pensionfundadministrators.afps.web.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestafpModel {

	
	@NotNull
	@NotBlank(message = "DNI no puede ser vacio")
	private String dni;
	
	@NotNull
	@NotBlank(message = "Amount available no puede ser vacio")
	private Double amountavailable;
		
	@NotNull
	private String bankaccount;
	
	@NotNull
	private String insuranceruc;
	
	
	
	
	
}
