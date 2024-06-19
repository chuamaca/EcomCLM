package DAO;

import Beans.MProducto;
import Conexion.MySQLConexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DProducto {

    private static String SELECT_PRODUCTOS = "SELECT p.IdProducto,p.Codigo, p.Nombre,p.Stock, c.Nombre as Categoria,p.Imagen, p.PrecioVenta FROM PRODUCTOS p inner join categorias c \n"
            + "on p.IdCategoria =c.IdCategoria";

    private static String SELECT_PRODUCTOS_BY_ID = "SELECT p.IdProducto,p.Codigo, p.Nombre,p.Stock, c.Nombre as Categoria,p.Imagen, p.PrecioVenta FROM PRODUCTOS p inner join categorias c \n"
            + "on p.IdCategoria =c.IdCategoria WHERE p.IdProducto?";

     public List<MProducto> lisProductos() {
        List<MProducto> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT * FROM productos";
        try (PreparedStatement st = cn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                MProducto p = new MProducto();
                p.setIdProducto(rs.getInt("IdProducto"));
                p.setCodigo(rs.getString("Codigo"));
                p.setNombre(rs.getString("Nombre"));
                p.setStock(rs.getInt("Stock"));
                p.setImagen(rs.getString("Imagen"));
                p.setPrecioVenta(rs.getDouble("PrecioVenta"));
                p.setIdCategoria(rs.getInt("IdCategoria"));
                p.setEstado(rs.getInt("Estado"));
                p.setFechaCrea(rs.getDate("FechaCrea"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    private int obtenerProximoIdDisponible() {
        int proximoId = -1;
        Connection cn = MySQLConexion.getConexion();
        String sql = "{CALL spObtenerProximoIdProductoDisponible(?)}";
        try (CallableStatement cs = cn.prepareCall(sql)) {
            cs.registerOutParameter(1, Types.INTEGER);
            cs.execute();
            proximoId = cs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return proximoId;
    }

    public void agregarProducto(MProducto producto) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO productos (IdProducto, Codigo, Nombre, Stock, Imagen, PrecioVenta, IdCategoria, Estado, UsuarioCrea, FechaCrea) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = cn.prepareStatement(sql)) {
            producto.setIdProducto(obtenerProximoIdDisponible());
            st.setInt(1, producto.getIdProducto());
            st.setString(2, producto.getCodigo());
            st.setString(3, producto.getNombre());
            st.setInt(4, producto.getStock());
            st.setString(5, producto.getImagen());
            st.setDouble(6, producto.getPrecioVenta());
            st.setInt(7, producto.getIdCategoria());
            st.setInt(8, producto.getEstado());
            st.setInt(9, producto.getUsuarioCrea());
            st.setDate(10, new java.sql.Date(producto.getFechaCrea().getTime()));
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizarProducto(MProducto producto) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "UPDATE productos SET Codigo = ?, Nombre = ?, Stock = ?, Imagen = ?, PrecioVenta = ?, IdCategoria = ?, Estado = ?, UsuarioModifica = ?, FechaModifica = ? WHERE IdProducto = ?";
        try (PreparedStatement st = cn.prepareStatement(sql)) {
            st.setString(1, producto.getCodigo());
            st.setString(2, producto.getNombre());
            st.setInt(3, producto.getStock());
            st.setString(4, producto.getImagen());
            st.setDouble(5, producto.getPrecioVenta());
            st.setInt(6, producto.getIdCategoria());
            st.setInt(7, producto.getEstado());
            st.setInt(8, producto.getUsuarioModifica());
            st.setDate(9, new java.sql.Date(producto.getFechaModifica().getTime()));
            st.setInt(10, producto.getIdProducto());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarProducto(int idProducto) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "DELETE FROM productos WHERE IdProducto = ?";
        try (PreparedStatement st = cn.prepareStatement(sql)) {
            st.setInt(1, idProducto);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
}
