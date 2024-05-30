package com.celumax.ecomclm.Data;

import com.celumax.ecomclm.Model.MCliente;
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
/**
 *
 * @author KID-R
 */
public class DCliente {

    private static String SELECT_CLIENTES = "SELECT * FROM Clientes";

    public List<MCliente> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MCliente cliente = null;
        List<MCliente> listaClientes = new ArrayList<>();

        try {
            conn = ConexionJDBC.getConnection();
            stmt = conn.prepareStatement(SELECT_CLIENTES);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idCliente = rs.getInt("IdCliente");
                String nombre = rs.getString("Nombre");
                String numeroDocumento = rs.getString("NumeroDocumento");
                String direccion = rs.getString("Direccion");
                String telefono = rs.getString("Telefono");
                String correo = rs.getString("Correo");
                
                cliente = new MCliente();
                cliente.setIdCliente(idCliente);
                cliente.setNombre(nombre);
                cliente.setNumeroDocumento(numeroDocumento);
                cliente.setDireccion(direccion);
                cliente.setTelefono(telefono);
                cliente.setCorreo(correo);

                
                cliente.setEstado(rs.getInt("Estado"));
                cliente.setUsuarioCrea(rs.getInt("UsuarioCrea"));
                cliente.setFechaCrea(rs.getDate("FechaCrea"));
                cliente.setUsuarioModifica(rs.getInt("UsuarioModifica"));
                cliente.setFechaModifica(rs.getDate("FechaModifica"));
                cliente.setUsuarioElimina(rs.getInt("UsuarioElimina"));
                cliente.setFechaElimina(rs.getDate("FechaElimina"));

                listaClientes.add(cliente);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConexionJDBC.close(rs);
            ConexionJDBC.close(stmt);
            ConexionJDBC.close(conn);
        }

        return listaClientes;
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

  
}