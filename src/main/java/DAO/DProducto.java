/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Beans.MProducto;
import Conexion.MySQLConexion;
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

    private static String SELECT_PRODUCTOS = "SELECT p.IdProducto,p.Codigo, p.Nombre,p.Stock, c.Nombre as Categoria,p.Imagen, p.PrecioVenta FROM PRODUCTOS p inner join categorias c \n"
            + "on p.IdCategoria =c.IdCategoria";

    private static String SELECT_PRODUCTOS_BY_ID = "SELECT p.IdProducto,p.Codigo, p.Nombre,p.Stock, c.Nombre as Categoria,p.Imagen, p.PrecioVenta FROM PRODUCTOS p inner join categorias c \n"
            + "on p.IdCategoria =c.IdCategoria WHERE p.IdProducto?";

    private static String INSERT_PRODUCTO = "";

    public List<MProducto> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MProducto producto = null;
        List<MProducto> listaproductos = new ArrayList<>();

        try {
            conn = MySQLConexion.getConexion();

            System.out.println("conxion: " + conn);
            stmt = conn.prepareStatement(SELECT_PRODUCTOS);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idProducto = rs.getInt("IdProducto");
                String codigo = rs.getString("Codigo");
                String nombre = rs.getString("Nombre");
                Integer stock = rs.getInt("Stock");
                String Categoria = rs.getString("Categoria");
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

    public MProducto SelectById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MProducto producto = null;

        try {
            conn = MySQLConexion.getConexion();

            System.out.println("conxion: " + conn);
            stmt = conn.prepareStatement(SELECT_PRODUCTOS_BY_ID);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                int idProducto = rs.getInt("IdProducto");
                String codigo = rs.getString("Codigo");
                String nombre = rs.getString("Nombre");
                Integer stock = rs.getInt("Stock");
                String Categoria = rs.getString("Categoria");
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

            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {

        }

        return producto;
    }

    public MProducto InsertPorducto(MProducto producto) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = MySQLConexion.getConexion();

            System.out.println("conxion: " + conn);
            stmt = conn.prepareCall(INSERT_PRODUCTO);
            stmt.setInt(1, producto.getIdCategoria());
            stmt.setString(2, producto.getCodigo());
            stmt.setString(3, producto.getNombre());
            stmt.setInt(4, producto.getStock());
            stmt.setDouble(5, producto.getPrecioCompra());
            stmt.setDouble(6, producto.getPrecioVenta());

            rs = stmt.executeQuery();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {

        }

        return producto;
    }
}
