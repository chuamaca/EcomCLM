/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

import java.util.Date;

/**
 *
 * @author Cesar
 */
public class Venta {

    int IdVenta;
    String Nombre;
    int CantidadProducto;
    Date FechaVenta;
    double Impuesto;
    double SubTotal;
    double Total;

    public Venta() {
    }

    public Venta(int IdVenta, String Nombre, int CantidadProducto, Date FechaVenta, double Impuesto, double SubTotal, double Total) {
        this.IdVenta = IdVenta;
        this.Nombre = Nombre;
        this.CantidadProducto = CantidadProducto;
        this.FechaVenta = FechaVenta;
        this.Impuesto = Impuesto;
        this.SubTotal = SubTotal;
        this.Total = Total;
    }

    public int getIdVenta() {
        return IdVenta;
    }

    public void setIdVenta(int IdVenta) {
        this.IdVenta = IdVenta;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getCantidadProducto() {
        return CantidadProducto;
    }

    public void setCantidadProducto(int CantidadProducto) {
        this.CantidadProducto = CantidadProducto;
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

    public double getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(double SubTotal) {
        this.SubTotal = SubTotal;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

}
