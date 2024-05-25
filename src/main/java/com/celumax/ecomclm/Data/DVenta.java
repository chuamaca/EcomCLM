package com.celumax.ecomclm.Data;

import com.celumax.ecomclm.Model.MVenta;
import com.celumax.ecomclm.Util.ConexionJDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;




public class DVenta {

    private static String SELECT_VENTAS = "SELECT * FROM Ventas";

    public List<MVenta> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MVenta venta = null;
        List<MVenta> listaVentas = new ArrayList<>();

        try {
            conn = ConexionJDBC.getConnection();
            stmt = conn.prepareStatement(SELECT_VENTAS);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idVenta = rs.getInt("IdVenta");
                int idCliente = rs.getInt("IdCliente");
                int idUsuario = rs.getInt("IdUsuario");
                Date fechaVenta = rs.getDate("FechaVenta");
                double impuesto = rs.getDouble("Impuesto");
                double total = rs.getDouble("Total");

                venta = new MVenta();
                venta.setIdVenta(idVenta);
                venta.setIdCliente(idCliente);
                venta.setIdUsuario(idUsuario);
                venta.setFechaVenta(fechaVenta);
                venta.setImpuesto(impuesto);
                venta.setTotal(total);

              
                venta.setEstado(rs.getInt("Estado"));
                venta.setUsuarioCrea(rs.getInt("UsuarioCrea"));
                venta.setFechaCrea(rs.getDate("FechaCrea"));
                venta.setUsuarioModifica(rs.getInt("UsuarioModifica"));
                venta.setFechaModifica(rs.getDate("FechaModifica"));
                venta.setUsuarioElimina(rs.getInt("UsuarioElimina"));
                venta.setFechaElimina(rs.getDate("FechaElimina"));

                listaVentas.add(venta);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConexionJDBC.close(rs);
            ConexionJDBC.close(stmt);
            ConexionJDBC.close(conn);
        }

        return listaVentas;
    }
}
