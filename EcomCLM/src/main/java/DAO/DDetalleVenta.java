package DAO;

import Beans.*;
import Conexion.MySQLConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DDetalleVenta {

    private static String SELECT_DETALLESVENTA = "SELECT * FROM DetallesVenta";
    
    private static String SELECT_VENTA = "SELECT v.IdVenta, c.Nombre, sum(d.Cantidad) as CantidadProducto,v.FechaVenta,v.Impuesto,v.Total-v.Impuesto as SubTotal,  v.Total FROM ventas v \n" +
"inner join clientes c \n" +
"on v.IdCliente =c.IdCliente \n" +
"inner join detallesventa d \n" +
"on v.IdVenta =d.IdVenta \n" +
"inner join productos p \n" +
"on d.IdProducto =p.IdProducto\n" +
"group by v.IdVenta, c.Nombre,v.FechaVenta, v.Total";
    

    public List<RDetalleVenta> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        RDetalleVenta detalleVenta = null;
        List<RDetalleVenta> listaDetallesVenta = new ArrayList<>();

        try {
            conn = MySQLConexion.getConexion();
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
                detalleVenta.setPrecioVenta(precio);
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

        }

        return listaDetallesVenta;
    }

    public List<Venta> SelectVentas() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Venta detalleVenta = null;
        List<Venta> listaDetallesVenta = new ArrayList<>();

        try {
            conn = MySQLConexion.getConexion();
            stmt = conn.prepareStatement(SELECT_VENTA);
            rs = stmt.executeQuery();
            while (rs.next()) {
//                int idDetalleVenta = rs.getInt("IdDetalleVenta");
//                int idVenta = rs.getInt("IdVenta");
//                int idProducto = rs.getInt("IdProducto");
//                int cantidad = rs.getInt("Cantidad");
//                double precio = rs.getDouble("Precio");
//                double descuento = rs.getDouble("Descuento");
//IdVenta	Nombre	CantidadProducto	FechaVenta	Impuesto	SubTotal	Total
                detalleVenta = new Venta();
                detalleVenta.setIdVenta(rs.getInt("IdVenta"));
                detalleVenta.setNombre(rs.getString("Nombre"));
                detalleVenta.setCantidadProducto(rs.getInt("CantidadProducto"));
                detalleVenta.setFechaVenta(rs.getDate("FechaVenta"));
                detalleVenta.setImpuesto(rs.getDouble("Impuesto"));
                detalleVenta.setSubTotal(rs.getDouble("SubTotal"));
                detalleVenta.setTotal(rs.getDouble("Total"));

                listaDetallesVenta.add(detalleVenta);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {

        }

        return listaDetallesVenta;
    }

    public int GrabarVentaDetalle(List<RDetalleVenta> lista, int idcliente, double total) {
        int idVenta = 0;
        double smt = 0;
        for (RDetalleVenta x : lista) {
            smt = smt + x.total();
        }
        Connection cn = MySQLConexion.getConexion();
        try {
            CallableStatement st = cn.prepareCall("{call SP_FACTURA_VENTA(?,?)}");

            st.setInt(1, idcliente);
            st.setDouble(2, total);
            ResultSet rs = st.executeQuery();
            rs.next();

            idVenta = rs.getInt(1);
            CallableStatement st2 = cn.prepareCall("{call SP_FACTURA_VENTA_DETALLE(?,?,?,?)}");
            for (RDetalleVenta compra : lista) {

                st2.setInt(1, idVenta);
                st2.setInt(2, compra.getIdProducto());
                st2.setInt(3, compra.getCantidad());
                st2.setDouble(4, compra.getPrecioVenta());
                st2.executeUpdate();

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return idVenta;
    }
}
