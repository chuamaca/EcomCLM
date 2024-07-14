
package com.utp.Celumax.modelo;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface ProveedorInterface extends CrudRepository<Proveedor, Integer>{
 public List<Proveedor> findByNombreContaining(String palabra);   
    
}
