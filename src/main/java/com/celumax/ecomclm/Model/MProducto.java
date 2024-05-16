/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.celumax.ecomclm.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 *
 * @author Cesar
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MProducto extends MAuditoria {

    private Integer IdProducto;
    private String Codigo;
    private String Nombre;
    private Integer Stock;
    private String Imagen;
    private Double PrecioVenta;
    private String Categoria;
    private Integer IdCategoria;
}
