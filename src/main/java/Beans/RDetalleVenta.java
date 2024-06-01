/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

public class RDetalleVenta extends MAuditoria{
    
    private Integer IdDetalleVenta;
    private Integer IdVenta;
    private Integer IdProducto;
    private Integer Cantidad;
    private Double Precio;
    private Double Descuento;

    public Integer getIdDetalleVenta() {
        return IdDetalleVenta;
    }

    public void setIdDetalleVenta(Integer IdDetalleVenta) {
        this.IdDetalleVenta = IdDetalleVenta;
    }

    public Integer getIdVenta() {
        return IdVenta;
    }

    public void setIdVenta(Integer IdVenta) {
        this.IdVenta = IdVenta;
    }

    public Integer getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(Integer IdProducto) {
        this.IdProducto = IdProducto;
    }

    public Integer getCantidad() {
        return Cantidad;
    }

    public void setCantidad(Integer Cantidad) {
        this.Cantidad = Cantidad;
    }

    public Double getPrecio() {
        return Precio;
    }

    public void setPrecio(Double Precio) {
        this.Precio = Precio;
    }

    public Double getDescuento() {
        return Descuento;
    }

    public void setDescuento(Double Descuento) {
        this.Descuento = Descuento;
    }
    
}
