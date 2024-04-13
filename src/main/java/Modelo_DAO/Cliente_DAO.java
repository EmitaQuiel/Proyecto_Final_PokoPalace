/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo_DAO;

import Modelo.Cliente;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Emi
 */
public class Cliente_DAO {

    private Connection cn = null;
    private PreparedStatement ps = null;

    // Método para insertar un nuevo cliente en la base de datos
    public void insertarCliente(Cliente cliente) {
        try {
            // Obtener la conexión a la base de datos
            cn = Conexion.getConnection();

            // Definir la sentencia SQL para la inserción
            String sql = "INSERT INTO clientes (cedula, nombres, apellidos, email, telefono, provincia, canton, distrito, direccion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Preparar la sentencia SQL con los valores del cliente
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

            // Ejecutar la sentencia SQL
            ps.executeUpdate();
        } catch (SQLException ex) {
            // Manejar cualquier excepción de SQL que pueda ocurrir
            ex.printStackTrace();
        } finally {
            // Cerrar la conexión y el PreparedStatement
            
        }
    }
}
