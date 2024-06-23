/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Cesar
 */
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@ToString
public class MProducto extends MAuditoria {

    private Integer IdProducto;
    private String Codigo;
    private String Nombre;
    private Integer Stock;
    private String Imagen;
    private double PrecioVenta;
     private double PrecioCompra;
    private String Categoria;
    private Integer IdCategoria;

    public MProducto() {
    }

    public Integer getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(Integer IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public Integer getStock() {
        return Stock;
    }

    public void setStock(Integer Stock) {
        this.Stock = Stock;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public double getPrecioVenta() {
        return PrecioVenta;
    }

    public void setPrecioVenta(double PrecioVenta) {
        this.PrecioVenta = PrecioVenta;
    }

    public double getPrecioCompra() {
        return PrecioCompra;
    }

    public void setPrecioCompra(double PrecioCompra) {
        this.PrecioCompra = PrecioCompra;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

    public Integer getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(Integer IdCategoria) {
        this.IdCategoria = IdCategoria;
    }

    public MProducto(Integer IdProducto, String Codigo, String Nombre, Integer Stock, String Imagen, double PrecioVenta, double PrecioCompra, String Categoria, Integer IdCategoria) {
        this.IdProducto = IdProducto;
        this.Codigo = Codigo;
        this.Nombre = Nombre;
        this.Stock = Stock;
        this.Imagen = Imagen;
        this.PrecioVenta = PrecioVenta;
        this.PrecioCompra = PrecioCompra;
        this.Categoria = Categoria;
        this.IdCategoria = IdCategoria;
    }

    public MProducto(Integer IdProducto, String Codigo, String Nombre, Integer Stock, String Imagen, double PrecioVenta, double PrecioCompra, String Categoria, Integer IdCategoria, Integer Estado, Integer UsuarioCrea, Date FechaCrea, Integer UsuarioModifica, Date FechaModifica, Integer UsuarioElimina, Date FechaElimina) {
        super(Estado, UsuarioCrea, FechaCrea, UsuarioModifica, FechaModifica, UsuarioElimina, FechaElimina);
        this.IdProducto = IdProducto;
        this.Codigo = Codigo;
        this.Nombre = Nombre;
        this.Stock = Stock;
        this.Imagen = Imagen;
        this.PrecioVenta = PrecioVenta;
        this.PrecioCompra = PrecioCompra;
        this.Categoria = Categoria;
        this.IdCategoria = IdCategoria;
    }

   

    
    
    
    
}
