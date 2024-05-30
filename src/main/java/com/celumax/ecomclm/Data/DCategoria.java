package com.celumax.ecomclm.Data;

import com.celumax.ecomclm.Model.MCategoria;
import com.celumax.ecomclm.Util.ConexionJDBC;
import com.celumax.ecomclm.Util.MySQLConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DCategoria {

    private static String SELECT_CATEGORIAS = "SELECT * FROM Categorias";

    public List<MCategoria> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MCategoria categoria = null;
        List<MCategoria> listaCategorias = new ArrayList<>();

        try {
            conn = ConexionJDBC.getConnection();
            stmt = conn.prepareStatement(SELECT_CATEGORIAS);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idCategoria = rs.getInt("IdCategoria");
                String nombre = rs.getString("Nombre");
                String descripcion = rs.getString("Descripcion");
                
                categoria = new MCategoria();
                
                categoria.setIdCategoria(idCategoria);
                categoria.setNombre(nombre);
                categoria.setDescripcion(descripcion);
                
                
                categoria.setEstado(rs.getInt("Estado"));
                categoria.setUsuarioCrea(rs.getInt("UsuarioCrea"));
                categoria.setFechaCrea(rs.getDate("FechaCrea"));
                categoria.setUsuarioModifica(rs.getInt("UsuarioModifica"));
                categoria.setFechaModifica(rs.getDate("FechaModifica"));
                categoria.setUsuarioElimina(rs.getInt("UsuarioElimina"));
                categoria.setFechaElimina(rs.getDate("FechaElimina"));

                listaCategorias.add(categoria);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConexionJDBC.close(rs);
            ConexionJDBC.close(stmt);
            ConexionJDBC.close(conn);
        }

        return listaCategorias;
    }
    //LISTA PARA GRAFICO2
   public List<MCategoria> lisVentaPorCategoria(int an) {
        List<MCategoria> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spVentasPorCategoria(?)}"; 
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, an); 
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                MCategoria c = new MCategoria();
                c.setNombre(rs.getString("Nombre")); 
                c.setTotal(rs.getDouble("total"));
                lista.add(c);
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