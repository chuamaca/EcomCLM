package DAO;

import Beans.MCliente;
import Beans.MCategoria;
import Conexion.MySQLConexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DCliente {
    private static String SELECT_COMPROBAR_USUARIO = "select IdCliente, Nombre from clientes where Estado=1 and Nombre=? and NumeroDocumento=?";

     public List<MCliente> lisClientes() {
        List<MCliente> listaClientes = new ArrayList<>();
        String sql = "SELECT * FROM clientes";
        try (Connection conn = MySQLConexion.getConexion(); 
             PreparedStatement stmt = conn.prepareStatement(sql); 
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MCliente c = new MCliente();
                c.setIdCliente(rs.getInt("IdCliente"));
                c.setNombre(rs.getString("Nombre"));
                c.setNumeroDocumento(rs.getString("NumeroDocumento"));
                c.setDireccion(rs.getString("Direccion"));
                c.setTelefono(rs.getString("Telefono"));
                c.setCorreo(rs.getString("Correo"));
                listaClientes.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaClientes;
    }
     
     public void agregarCliente(MCliente cliente) {
    int idCliente = obtenerProximoIdDisponible();
    String sql = "INSERT INTO clientes (IdCliente, Nombre, NumeroDocumento, Direccion, Telefono, Correo, Estado, UsuarioCrea, FechaCrea) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = MySQLConexion.getConexion();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, idCliente);
        stmt.setString(2, cliente.getNombre());
        stmt.setString(3, cliente.getNumeroDocumento());
        stmt.setString(4, cliente.getDireccion());
        stmt.setString(5, cliente.getTelefono());
        stmt.setString(6, cliente.getCorreo());
        stmt.setInt(7, cliente.getEstado());
        stmt.setInt(8, cliente.getUsuarioCrea());
        stmt.setTimestamp(9, (Timestamp) cliente.getFechaCrea());
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
     
     protected int obtenerProximoIdDisponible() {
        int proximoId = -1;
        String sql = "{CALL obtenerProximoIdDisponible()}";
        try (Connection conn = MySQLConexion.getConexion();
             CallableStatement stmt = conn.prepareCall(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                proximoId = rs.getInt("ProximoId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proximoId;
    }

    public void actualizarCliente(MCliente cliente) {
        String sql = "UPDATE clientes SET Nombre = ?, NumeroDocumento = ?, Direccion = ?, Telefono = ?, Correo = ? WHERE IdCliente = ?";
        try (Connection conn = MySQLConexion.getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getNumeroDocumento());
            stmt.setString(3, cliente.getDireccion());
            stmt.setString(4, cliente.getTelefono());
            stmt.setString(5, cliente.getCorreo());
            stmt.setInt(6, cliente.getIdCliente());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarCliente(int idCliente) {
        String sql = "DELETE FROM clientes WHERE IdCliente = ?";
        try (Connection conn = MySQLConexion.getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idCliente);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
    public List<MCategoria> lisVentaPorCategoria() {
    List<MCategoria> lista = new ArrayList<>();
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "{call spVentasPorCategoria(?)}"; 
        CallableStatement st = cn.prepareCall(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            MCategoria mVenta = new MCategoria();
            mVenta.setNombre(rs.getString("nombre")); 
            mVenta.setTotal(rs.getDouble("total"));
            lista.add(mVenta);
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    return lista;
}

        
    
    public MCliente ComprobarUsuario(MCliente client) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MCliente cliente = null;

        try {
            conn = MySQLConexion.getConexion();
            stmt = conn.prepareStatement(SELECT_COMPROBAR_USUARIO);
            stmt.setString(1, client.getNombre());
            stmt.setString(2, client.getNumeroDocumento());
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                
                cliente= new MCliente();
                
                cliente.setIdCliente(rs.getInt("IdCliente"));
                cliente.setNombre(rs.getString("Nombre"));
 
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
           
        }

        return cliente;
    }
  
}