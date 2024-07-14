package com.utp.Celumax.modelo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "proveedor_detalle")
public class ProveedorDetalle {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int code;
    private String nombre;
    private String contacto;
    private String email;
    private String telefono;

    public ProveedorDetalle() {
    }

    public ProveedorDetalle(int code, String nombre, String contacto, String email, String telefono) {
        this.code = code;
        this.nombre = nombre;
        this.contacto = contacto;
        this.email = email;
        this.telefono = telefono;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
