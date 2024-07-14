package DAO;

import Beans.MCategoria;
import Conexion.MySQLConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Stateless
public class DCategoria {
    private Connection conn;

    public DCategoria() {
        conn = MySQLConexion.getConexion();
    }

    
    @PersistenceContext(unitName = "tuUnidadPersistencia")
    private EntityManager entityManager;

    public List<MCategoria> obtenerTodasCategorias() {
        TypedQuery<MCategoria> query = entityManager.createQuery("SELECT c FROM MCategoria c", MCategoria.class);
        return query.getResultList();
    }
    
    
    public void insertarCategoria(MCategoria categoria) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("INSERT INTO categorias (nombre, descripcion, UsuarioCrea, FechaCrea, estado) VALUES (?,?,?,?,?)");
            pstmt.setString(1, categoria.getNombre());
            pstmt.setString(2, categoria.getDescripcion());
            pstmt.setInt(3, categoria.getUsuarioCrea());
            pstmt.setDate(4, new java.sql.Date(categoria.getFechaCrea().getTime()));
            pstmt.setInt(5, categoria.getEstado());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } 
    }

    public List<MCategoria> obtenerCategorias() {
    List<MCategoria> listaCategorias = new ArrayList<>();
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        conn = MySQLConexion.getConexion();
        stmt = conn.prepareStatement("SELECT IdCategoria, Nombre, Descripcion, UsuarioCrea, FechaCrea, Estado FROM categorias");
        rs = stmt.executeQuery();
        
        while (rs.next()) {
            MCategoria categoria = new MCategoria();
            categoria.setIdCategoria(rs.getInt("IdCategoria"));
            categoria.setNombre(rs.getString("Nombre"));
            categoria.setDescripcion(rs.getString("Descripcion"));
            categoria.setUsuarioCrea(rs.getInt("UsuarioCrea"));
            categoria.setFechaCrea(rs.getDate("FechaCrea"));
            categoria.setEstado(rs.getInt("Estado"));
            
            listaCategorias.add(categoria);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        // Cerrar recursos
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    return listaCategorias;
}
    
    public void actualizarCategoria(MCategoria categoria) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("UPDATE categorias SET nombre =?, descripcion =?, UsuarioModifica =?, fechaModifica =?, estado =? WHERE id_categoria =?");
            pstmt.setString(1, categoria.getNombre());
            pstmt.setString(2, categoria.getDescripcion());
            pstmt.setInt(3, categoria.getUsuarioModifica());
            pstmt.setDate(4, new java.sql.Date(categoria.getFechaModifica().getTime()));
            pstmt.setInt(5, categoria.getEstado());
            pstmt.setInt(6, categoria.getIdCategoria());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void eliminarCategoria(int idCategoria) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("DELETE FROM categorias WHERE IdCategoria = ?");
            pstmt.setInt(1, idCategoria);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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