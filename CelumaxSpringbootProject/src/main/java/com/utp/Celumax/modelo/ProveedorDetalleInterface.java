/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.utp.Celumax.modelo;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface ProveedorDetalleInterface extends CrudRepository<ProveedorDetalle, Integer>{
 public List<ProveedorDetalle> findByNombreContaining(String palabra);   
    
}
