package Modelo_DAO;

import Modelo.Cliente;
import Modelo.InformacionCompra;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Cliente_DAO {

    private Connection cn = null;
    private PreparedStatement ps = null;

    
    public void insertarCliente(Cliente cliente) {
        Connection cn = null;
        PreparedStatement ps = null;

        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO clientes (cedula, nombres, apellidos, email, telefono, provincia, canton, distrito, direccion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, cliente.getCedula());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getApellidos());
            ps.setString(4, cliente.getEmail());
            ps.setString(5, cliente.getTelefono());
            ps.setString(6, cliente.getProvincia());
            ps.setString(7, cliente.getCanton());
            ps.setString(8, cliente.getDistrito());
            ps.setString(9, cliente.getDireccion());

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public int obtenerUltimoId() {
        int idCliente = 0;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT MAX(id_cliente) AS ultimo_id FROM clientes";
            ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                idCliente = rs.getInt("ultimo_id");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {

        }

        return idCliente;
    }

    public Cliente buscarPorCedula(String cedula) {
        Cliente cliente = null;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM clientes WHERE cedula = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, cedula);
            rs = ps.executeQuery();

            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId_Cliente(rs.getInt("id_cliente"));
                cliente.setCedula(rs.getString("cedula"));
                cliente.setNombre(rs.getString("nombres"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setEmail(rs.getString("email"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setProvincia(rs.getString("provincia"));
                cliente.setCanton(rs.getString("canton"));
                cliente.setDistrito(rs.getString("distrito"));
                cliente.setDireccion(rs.getString("direccion"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            
        }

        return cliente;
    }

}
