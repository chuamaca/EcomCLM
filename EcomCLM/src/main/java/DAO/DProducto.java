package DAO;

import Beans.MProducto;
import Conexion.MySQLConexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public class DProducto {

    @PersistenceContext(unitName = "NombreUnidadPersistencia") 
    private EntityManager entityManager;

    public List<MProducto> obtenerProductosPorCategoria(Integer idCategoria) {
        Query query = entityManager.createQuery("SELECT p FROM MProducto p WHERE p.idCategoria = :idCategoria");
        query.setParameter("idCategoria", idCategoria);
        return query.getResultList();
    }

    private static String SELECT_PRODUCTOS = "SELECT p.IdProducto,p.Codigo, p.Nombre,p.Stock, c.Nombre as Categoria,p.Imagen, p.PrecioVenta FROM PRODUCTOS p inner join categorias c \n"
            + "on p.IdCategoria =c.IdCategoria";

    private static String SELECT_PRODUCTOS_BY_ID = "SELECT p.IdProducto,p.Codigo, p.Nombre,p.Stock, c.Nombre as Categoria,p.Imagen, p.PrecioVenta FROM PRODUCTOS p inner join categorias c \n"
            + "on p.IdCategoria =c.IdCategoria WHERE p.IdProducto=?";

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
                System.out.println("Categorias:  "+ rs.getString("Categoria"));
                
                MProducto p = new MProducto();
                p.setIdProducto(rs.getInt("IdProducto"));
                p.setCodigo(rs.getString("Codigo"));
                p.setNombre(rs.getString("Nombre"));
                p.setStock(rs.getInt("Stock"));
                p.setCategoria(rs.getString("Categoria"));
                p.setImagen(rs.getString("Imagen"));
                p.setPrecioVenta(rs.getDouble("PrecioVenta"));
                listaproductos.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return listaproductos;
    }

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

    protected int obtenerProximoIdDisponible() {
    int proximoId = -1;
    String sql = "{CALL spObtenerProximoIdProductoDisponible(?)}";
    try (Connection conn = MySQLConexion.getConexion();
         CallableStatement stmt = conn.prepareCall(sql)) {
        stmt.registerOutParameter(1, java.sql.Types.INTEGER);
        stmt.execute();
        proximoId = stmt.getInt(1);
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error al ejecutar el procedimiento almacenado: " + e.getMessage());
    }
    System.out.println("Próximo ID obtenido: " + proximoId);
    return proximoId;
}


    public void agregarProducto(MProducto producto) {
    int idProducto = obtenerProximoIdDisponible();
    if (idProducto == -1) {
        throw new IllegalStateException("No se pudo obtener el próximo ID de producto.");
    }
    producto.setIdProducto(idProducto);

    Connection cn = MySQLConexion.getConexion();
    String sql = "INSERT INTO productos (IdProducto, Codigo, Nombre, Stock, Imagen, PrecioVenta, IdCategoria, Estado, UsuarioCrea, FechaCrea) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement st = cn.prepareStatement(sql)) {
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
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error al agregar el producto: " + e.getMessage());
    }
}


    public void actualizarProducto(MProducto producto) {
        Connection cn = null;
        PreparedStatement st = null;

        try {
            cn = MySQLConexion.getConexion();
            String sql = "UPDATE productos SET Codigo = ?, Nombre = ?, Stock = ?, Imagen = ?, PrecioVenta = ?, IdCategoria = ?, Estado = ?, UsuarioModifica = ?, FechaModifica = ? WHERE IdProducto = ?";
            st = cn.prepareStatement(sql);

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

            int filasActualizadas = st.executeUpdate();

            if (filasActualizadas > 0) {
                System.out.println("Producto actualizado correctamente.");
            } else {
                System.out.println("No se encontró el producto con ID: " + producto.getIdProducto());
                // Puedes lanzar una excepción o manejar el caso según tus necesidades
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones (puedes lanzar una excepción personalizada o manejarla según tus requerimientos)
        } finally {
            // Cerrar recursos en el orden inverso a su apertura
            try {
                if (st != null) {
                    st.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
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
