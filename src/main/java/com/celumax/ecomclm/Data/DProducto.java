/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.celumax.ecomclm.Data;

import com.celumax.ecomclm.Model.MProducto;
import com.celumax.ecomclm.Util.ConexionJDBC;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Cesar
 */
public class DProducto {

    private static String SELECT_PRODUCTOS = "SELECT p.IdProducto,p.Codigo, p.Nombre,p.Stock, c.Nombre as Categoria,p.Imagen, p.PrecioVenta FROM PRODUCTOS p inner join categorias c \n" +
"on p.IdCategoria =c.IdCategoria";

    public List<MProducto> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MProducto producto = null;
        List<MProducto> listaproductos = new ArrayList<>();

        try {
            conn = ConexionJDBC.getConnection();

            System.out.println("conxion: " + conn);
            stmt = conn.prepareStatement(SELECT_PRODUCTOS);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idProducto = rs.getInt("IdProducto");
                String codigo = rs.getString("Codigo");
                String nombre = rs.getString("Nombre");
                Integer stock = rs.getInt("Stock");
                String Categoria=rs.getString("Categoria");
                String imagen = rs.getString("Imagen");
                double precioVenta = rs.getDouble("PrecioVenta");

                producto = new MProducto();
                producto.setIdProducto(idProducto);
                producto.setCodigo(codigo);
                producto.setNombre(nombre);
                producto.setStock(stock);
                producto.setCategoria(Categoria);
                producto.setImagen(imagen);
                producto.setPrecioVenta(precioVenta);
                System.out.println("roductos" + producto);
                listaproductos.add(producto);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConexionJDBC.close(rs);
            ConexionJDBC.close(stmt);
            ConexionJDBC.close(conn);
        }

        return listaproductos;
    }
}
