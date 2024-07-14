package com.pensionfundadministrators.afps.web.model;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsuranceModel {
	
	@JsonProperty("insuranceId")
	private Long id;
	
	@NotNull
	@NotBlank(message = "El RUC debe ser Unico")
	private String ruc;
	
	@NotNull
	@NotBlank(message = "El nombre no puede ser Vacio")
	private String name;
	
}
