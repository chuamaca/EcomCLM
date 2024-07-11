package DAO;

import Beans.MUsuario;
import Conexion.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class DUsuario {

    private static String SELECT_USUARIOS = "SELECT * FROM Usuarios";
    
    public List<MUsuario> Select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MUsuario usuario = null;
        List<MUsuario> listaUsuarios = new ArrayList<>();

        try {
            conn = MySQLConexion.getConexion();
            stmt = conn.prepareStatement(SELECT_USUARIOS);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idUsuario = rs.getInt("IdUsuario");
                String nombreUsuario = rs.getString("NombreUsuario");
                String contrasena = rs.getString("Contrasena");
                String correo = rs.getString("Correo");
                String imagen = rs.getString("Imagen");

                usuario = new MUsuario();
                usuario.setIdUsuario(idUsuario);
                usuario.setNombreUsuario(nombreUsuario);
                usuario.setContrasena(contrasena);
                usuario.setCorreo(correo);
                usuario.setImagen(imagen);

        
                usuario.setEstado(rs.getInt("Estado"));
                usuario.setUsuarioCrea(rs.getInt("UsuarioCrea"));
                usuario.setFechaCrea(rs.getDate("FechaCrea"));
                usuario.setUsuarioModifica(rs.getInt("UsuarioModifica"));
                usuario.setFechaModifica(rs.getDate("FechaModifica"));
                usuario.setUsuarioElimina(rs.getInt("UsuarioElimina"));
                usuario.setFechaElimina(rs.getDate("FechaElimina"));

                listaUsuarios.add(usuario);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
           
        }

        return listaUsuarios;
    }
}
