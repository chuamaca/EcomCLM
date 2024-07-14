package com.pensionfundadministrators.afps.web.model;


import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerModel {
	
	/*
	@JsonProperty("customerId")
	private Long id;
	*/
	@NotNull
	@NotBlank(message = "El DNI debe ser Unico")
	private String dni;
	
	@NotNull
	@NotBlank(message = "El nombre no puede ser vacio")
	private String firstname;
	
	
	@NotNull
	@NotBlank(message = "los Apellidos nombre no pueden ser vacios")
	private String lastname;
	
	
	@NotNull
	@NotBlank(message = "El Telefono no puede ser Vacio")
	private String phone;
	
	@NotNull
	@NotBlank(message = "El correo no puede ser Vacio")
	private String email;
	
	@NotNull
	@NotBlank(message = "El Monto no puede ser Vacio")
	private Double amountavailable;
	
	@NotNull
	@NotBlank(message = "La Cuenta Bancaria puede ser Vacio")
	private String bankaccount;
	
    @NotNull(message = "La Fecha De Vinculacion no puede ser vacio")
	@JsonProperty("date")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Timestamp withdrawals;
	
	private InsuranceModel insurance;

}
