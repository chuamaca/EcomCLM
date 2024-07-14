package DAO;
//se realiza todas las operaciones que se van a ejecutar en las
// paginas jsp

import java.sql.*;
import java.util.*;
import Beans.*;
import Conexion.MySQLConexion;

public class Negocio {


    public List<MProducto> LisCategoriaProducto(int IdCategoria) {
        List<MProducto> lista = new ArrayList();
        String sql = "SELECT IdProducto, Codigo, p.Nombre, Stock, PrecioVenta, p.IdCategoria\n"
                + "FROM productos p inner join categorias c\n"
                + "on  p.IdCategoria = c.IdCategoria \n"
                + "where c.IdCategoria =?";
        try {
            PreparedStatement st = MySQLConexion.getConexion().prepareStatement(sql);
            st.setInt(1, IdCategoria);
            ResultSet rs = st.executeQuery();
            System.out.println("RS: " + rs.toString());
            while (rs.next()) {
                MProducto a = new MProducto(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getDouble(5), rs.getInt(6));
                lista.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    
     public List<MCategoria> LisCategoria() {
        List<MCategoria> lista = new ArrayList();
        String sql = "select IdCategoria , Nombre from Categorias";
        try {
            PreparedStatement st = MySQLConexion.getConexion().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                MCategoria a = new MCategoria(rs.getInt(1), rs.getString(2));
                lista.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
   
}
