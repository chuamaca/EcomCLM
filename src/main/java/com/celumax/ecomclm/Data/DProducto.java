/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.celumax.ecomclm.Data;

import com.celumax.ecomclm.Model.MProducto;
import com.celumax.ecomclm.Util.ConexionJDBC;
import com.celumax.ecomclm.Util.MySQLConexion;
import java.sql.CallableStatement;
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

    private static String SELECT_PRODUCTOS = "SELECT IdProducto,Codigo, Nombre,Stock, Imagen, PrecioVenta FROM PRODUCTOS";

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
                String imagen = rs.getString("Imagen");
                double precioVenta = rs.getDouble("PrecioVenta");

                producto = new MProducto();
                producto.setIdProducto(idProducto);
                producto.setCodigo(codigo);
                producto.setNombre(nombre);
                producto.setStock(stock);
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
       //GRAFICO2
    public List<MProducto> lisProductosMasCarosPorAnio(int an) {
        List<MProducto> lista = new ArrayList<>();
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "{call spPCarosxAnio(?)}"; 
        CallableStatement t = cn.prepareCall(sql);
        t.setInt(1, an); 
        ResultSet rs = t.executeQuery();
        while (rs.next()) {
            MProducto p = new MProducto();
            p.setNombre(rs.getString("NombreProducto")); 
            p.setPrecioVenta(rs.getDouble("Precio"));
            lista.add(p);
        }
        rs.close();
        t.close();
        cn.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    return lista;
    }
    //GRAFICO3
     public List<MProducto> lisStockPorAnio(int an) {
        List<MProducto> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spStockPorAnio(?)}"; 
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, an); 
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                MProducto p = new MProducto();
                p.setNombre(rs.getString("nombre")); 
                p.setStock(rs.getInt("stock"));
                lista.add(p);
            }
            rs.close();
            st.close();
            cn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
