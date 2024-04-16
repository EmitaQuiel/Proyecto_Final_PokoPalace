package Modelo_DAO;

import Modelo.Usuario;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuario_DAO {

    public boolean insertarUsuario(Usuario usuario) {
        Connection cn = null;
        PreparedStatement ps = null;
        boolean exito = false; // Variable para indicar el éxito de la inserción

        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO usuarios (nombre_usuario, contrasena, email_cliente) VALUES (?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, usuario.getNombreUsuario());
            ps.setString(2, usuario.getContrasena());
            ps.setString(3, usuario.getEmailCliente());

            int filasAfectadas = ps.executeUpdate();

            // Si se inserta al menos una fila, consideramos que la inserción fue exitosa
            if (filasAfectadas > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return exito; // Devolvemos el resultado de la inserción
    }

    public boolean emailExistente(String emailCliente) {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean existe = false;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT COUNT(*) FROM usuarios WHERE email_cliente = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, emailCliente); // Cambiar de 'email' a 'emailCliente'
            rs = ps.executeQuery();

            if (rs.next()) {
                // Si el conteo es mayor que 0, significa que el correo electrónico ya está registrado
                existe = rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return existe;
    }

    public Usuario obtenerPorNombreUsuario(String nombreUsuario) {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Usuario usuario = null;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM usuarios WHERE nombre_usuario = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, nombreUsuario);
            rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNombreUsuario(rs.getString("nombre_usuario"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setEmailCliente(rs.getString("email_cliente"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 

        return usuario;
    }

    public Usuario obtenerPorEmailCliente(String emailCliente) {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Usuario usuario = null;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM usuarios WHERE email_cliente = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, emailCliente);
            rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNombreUsuario(rs.getString("nombre_usuario"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setEmailCliente(rs.getString("email_cliente"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 

        return usuario;
    }

}
