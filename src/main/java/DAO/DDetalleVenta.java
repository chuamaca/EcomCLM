package DAO;

import Beans.RDetalleVenta;
import Conexion.ConexionJDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DDetalleVenta {

    private static String SELECT_DETALLESVENTA = "SELECT * FROM DetallesVenta";

    public List<RDetalleVenta> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        RDetalleVenta detalleVenta = null;
        List<RDetalleVenta> listaDetallesVenta = new ArrayList<>();

        try {
            conn = ConexionJDBC.getConnection();
            stmt = conn.prepareStatement(SELECT_DETALLESVENTA);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idDetalleVenta = rs.getInt("IdDetalleVenta");
                int idVenta = rs.getInt("IdVenta");
                int idProducto = rs.getInt("IdProducto");
                int cantidad = rs.getInt("Cantidad");
                double precio = rs.getDouble("Precio");
                double descuento = rs.getDouble("Descuento");

                detalleVenta = new RDetalleVenta();
                
                detalleVenta.setIdDetalleVenta(idDetalleVenta);
                detalleVenta.setIdVenta(idVenta);
                detalleVenta.setIdProducto(idProducto);
                detalleVenta.setCantidad(cantidad);
                detalleVenta.setPrecio(precio);
                detalleVenta.setDescuento(descuento);

             
                detalleVenta.setEstado(rs.getInt("Estado"));
                detalleVenta.setUsuarioCrea(rs.getInt("UsuarioCrea"));
                detalleVenta.setFechaCrea(rs.getDate("FechaCrea"));
                detalleVenta.setUsuarioModifica(rs.getInt("UsuarioModifica"));
                detalleVenta.setFechaModifica(rs.getDate("FechaModifica"));
                detalleVenta.setUsuarioElimina(rs.getInt("UsuarioElimina"));
                detalleVenta.setFechaElimina(rs.getDate("FechaElimina"));

                listaDetallesVenta.add(detalleVenta);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConexionJDBC.close(rs);
            ConexionJDBC.close(stmt);
            ConexionJDBC.close(conn);
        }

        return listaDetallesVenta;
    }
}
