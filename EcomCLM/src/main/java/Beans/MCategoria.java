package Beans;

import java.io.Serializable;
import java.util.Date;

public class MCategoria implements Serializable {
    
    private Integer IdCategoria;
    private String Nombre;
    private String Descripcion;
    private int Estado;
    private int UsuarioCrea;
    private Date FechaCrea;
    private int UsuarioModifica;
    private Date FechaModifica;
    private int UsuarioElimina;
    private Date FechaElimina;
    private double total;


    
    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Integer getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(Integer IdCategoria) {
        this.IdCategoria = IdCategoria;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }

    public int getUsuarioCrea() {
        return UsuarioCrea;
    }

    public void setUsuarioCrea(int UsuarioCrea) {
        this.UsuarioCrea = UsuarioCrea;
    }

    public Date getFechaCrea() {
        return FechaCrea;
    }

    public void setFechaCrea(Date FechaCrea) {
        this.FechaCrea = FechaCrea;
    }

    public int getUsuarioModifica() {
        return UsuarioModifica;
    }

    public void setUsuarioModifica(int UsuarioModifica) {
        this.UsuarioModifica = UsuarioModifica;
    }

    public Date getFechaModifica() {
        return FechaModifica;
    }

    public void setFechaModifica(Date FechaModifica) {
        this.FechaModifica = FechaModifica;
    }

    public int getUsuarioElimina() {
        return UsuarioElimina;
    }

    public void setUsuarioElimina(int UsuarioElimina) {
        this.UsuarioElimina = UsuarioElimina;
    }

    public Date getFechaElimina() {
        return FechaElimina;
    }

    public void setFechaElimina(Date FechaElimina) {
        this.FechaElimina = FechaElimina;
    }
    
    public MCategoria(Integer IdCategoria, String Nombre) {
        this.IdCategoria = IdCategoria;
        this.Nombre = Nombre;
    }

    public MCategoria() {
    }

}
