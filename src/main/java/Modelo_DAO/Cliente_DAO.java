package Modelo_DAO;

import Modelo.Cliente;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//Este metodo recibe el objeto de Cliente que esta en la carperta modelo como parametro para poder trabajar con el
public class Cliente_DAO {

    private Connection cn = null;
    private PreparedStatement ps = null;

    public void insertarCliente(Cliente cliente) {
        Connection cn = null;
        PreparedStatement ps = null;

        //Se define una consulta SQL para insertar un nuevo cliente
        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO clientes (cedula, nombres, apellidos, email, telefono, provincia, canton, distrito, direccion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            //Establece los valores para los parametros y el numero numero de la columna
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
        }
    }

    public int obtenerUltimoId() {
        int idCliente = 0;

        //Esta cojsulta SQL es para obtener el ultimo cliente de la tabla clientes
        try {
            cn = Conexion.getConnection();
            String sql = "SELECT MAX(id_cliente) AS ultimo_id FROM clientes";
            ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            //Verifica si hay algun resultado y se obtiene para guardarlo en la variable idCliente
            if (rs.next()) {
                idCliente = rs.getInt("ultimo_id");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
        return idCliente;
    }

    public Cliente buscarPorCedula(String cedula) {
        Cliente cliente = null;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        //Busca todos los datos de un cliente por medio de su cedula
        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM clientes WHERE cedula = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, cedula);
            rs = ps.executeQuery();

            //Recupera los datos de la tabla y los almacena en cliente
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
        } 
        return cliente;
    }
}
