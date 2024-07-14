/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

/**
 *
 * @author Cesar
 */
public class MUsuario extends MCliente {

    private Integer IdUsuario;
    private String NombreUsuario;
    private String Contrasena;
    private String Correo;
    private String Imagen;
    private String NumeroDocumento;

    public Integer getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(Integer IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getContrasena() {
        return Contrasena;
    }

    public void setContrasena(String Contrasena) {
        this.Contrasena = Contrasena;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public String getNumeroDocumento() {
        return NumeroDocumento;
    }

    public void setNumeroDocumento(String NumeroDocumento) {
        this.NumeroDocumento = NumeroDocumento;
    }

    public MUsuario(Integer IdUsuario, String NombreUsuario, String Contrasena, String Correo, String Imagen, String NumeroDocumento) {
        this.IdUsuario = IdUsuario;
        this.NombreUsuario = NombreUsuario;
        this.Contrasena = Contrasena;
        this.Correo = Correo;
        this.Imagen = Imagen;
        this.NumeroDocumento = NumeroDocumento;
    }

    public MUsuario() {
    }

}
