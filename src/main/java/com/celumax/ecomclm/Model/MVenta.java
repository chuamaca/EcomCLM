/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.celumax.ecomclm.Model;

import java.util.Date;



public class MVenta extends MAuditoria {

    private Integer IdVenta;
    private Integer IdCliente;
    private Integer IdUsuario;
    private Date FechaVenta;
    private double Impuesto;
    private double Total;

    public Integer getIdVenta() {
        return IdVenta;
    }

    public void setIdVenta(Integer IdVenta) {
        this.IdVenta = IdVenta;
    }

    public Integer getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(Integer IdCliente) {
        this.IdCliente = IdCliente;
    }

    public Integer getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(Integer IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public Date getFechaVenta() {
        return FechaVenta;
    }

    public void setFechaVenta(Date FechaVenta) {
        this.FechaVenta = FechaVenta;
    }

    public double getImpuesto() {
        return Impuesto;
    }

    public void setImpuesto(double Impuesto) {
        this.Impuesto = Impuesto;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

}
