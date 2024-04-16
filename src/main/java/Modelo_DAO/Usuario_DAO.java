package Modelo_DAO;

import Modelo.InformacionCompra;
import Modelo.Usuario;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Usuario_DAO {

    public boolean insertarUsuario(Usuario usuario) {
        Connection cn = null;
        PreparedStatement ps = null;
        boolean exito = false; 

        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO usuarios (nombre_usuario, contrasena, email_cliente) VALUES (?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, usuario.getNombreUsuario());
            ps.setString(2, usuario.getContrasena());
            ps.setString(3, usuario.getEmailCliente());

            int filasAfectadas = ps.executeUpdate();

            
            if (filasAfectadas > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return exito;
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
            ps.setString(1, emailCliente); 
            rs = ps.executeQuery();

            if (rs.next()) {
                
                existe = rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return existe;
    }

    public List<InformacionCompra> obtenerHistorialCompras(int idUsuario) {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<InformacionCompra> historialCompras = new ArrayList<>();

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM detalles_pedido WHERE id_cliente = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();

            while (rs.next()) {
                InformacionCompra detalle = new InformacionCompra();
                detalle.setIdDetalle(rs.getInt("id_detalle"));
                detalle.setIdCliente(rs.getInt("id_cliente"));
                detalle.setIdProducto(rs.getInt("id_producto"));
                detalle.setCantidad(rs.getInt("cantidad"));
                detalle.setPrecioCompra(rs.getDouble("precioCompra"));
                detalle.setMetodoPago(rs.getString("metodo_pago"));
                detalle.setPrecioTotal(rs.getDouble("precio_total"));
                detalle.setEstadoPago(rs.getString("estadoPago"));
                
                historialCompras.add(detalle);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 

        return historialCompras;
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
