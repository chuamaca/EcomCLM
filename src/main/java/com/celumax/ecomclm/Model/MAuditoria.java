/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.celumax.ecomclm.Model;

import java.util.Date;
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

public class MAuditoria {

    private Integer Estado;
    private Integer UsuarioCrea;
    private Date FechaCrea;
    private Integer UsuarioModifica;
    private Date FechaModifica;
    private Integer UsuarioElimina;
    private Date FechaElimina;
}
