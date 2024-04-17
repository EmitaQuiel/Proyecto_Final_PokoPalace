package Modelo_DAO;

import Modelo.Cliente;
import Modelo.InformacionCompra;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetallePedido_DAO {

    private Connection cn = null;
    private PreparedStatement ps = null;

    public void insertarDetallePedido(InformacionCompra detallePedido) {
        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO detalles_pedido (id_cliente, id_producto, cantidad, precioCompra, metodo_pago, precio_total, estadoPago, metodo_envio) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, detallePedido.getIdCliente());
            ps.setInt(2, detallePedido.getIdProducto());
            ps.setInt(3, detallePedido.getCantidad());
            ps.setDouble(4, detallePedido.getPrecioCompra());
            ps.setString(5, detallePedido.getMetodoPago());
            ps.setDouble(6, detallePedido.getPrecioTotal());
            ps.setString(7, detallePedido.getEstadoPago());
            ps.setString(8, detallePedido.getMetodoEnvio());

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<InformacionCompra> obtenerHistorialCompras(int idCliente) {
        ArrayList<InformacionCompra> historialCompras = new ArrayList<>();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT dp.id_detalle, dp.id_cliente, dp.id_producto, dp.cantidad, dp.precioCompra, dp.metodo_pago, dp.precio_total, dp.estadoPago, dp.metodo_envio, "
                    + "c.nombres AS nombre_cliente, c.apellidos AS apellido_cliente, "
                    + "p.nombre AS nombre_producto, p.precio AS precio_producto "
                    + "FROM detalles_pedido dp "
                    + "INNER JOIN clientes c ON dp.id_cliente = c.id_cliente "
                    + "INNER JOIN productos p ON dp.id_producto = p.id_producto "
                    + "WHERE dp.id_cliente = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idCliente);
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
                detalle.setMetodoEnvio(rs.getString("metodo_envio"));
                // Datos del cliente
                detalle.setNombreCliente(rs.getString("nombre_cliente"));
                detalle.setApellidoCliente(rs.getString("apellido_cliente"));
                // Datos del producto
                detalle.setNombreProducto(rs.getString("nombre_producto"));
                detalle.setPrecioProducto(rs.getDouble("precio_producto"));
                historialCompras.add(detalle);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return historialCompras;
    }

    public Cliente buscarClientePorId(int idCliente) {
        Cliente cliente = null;

        try {
            // Establecer la conexión con la base de datos
            Connection cn = Conexion.getConnection();

            // Preparar la consulta SQL
            String sql = "SELECT * FROM clientes WHERE id_cliente = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idCliente);

            // Ejecutar la consulta
            ResultSet rs = ps.executeQuery();

            // Verificar si se encontró un cliente con el ID especificado
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId_Cliente(rs.getInt("id_cliente"));
                cliente.setCedula(rs.getString("cedula"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellidos(rs.getString("apellidos"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setProvincia(rs.getString("provincia"));
                cliente.setCanton(rs.getString("canton"));
                cliente.setDistrito(rs.getString("distrito"));
                cliente.setEmail(rs.getString("email"));
            }

            // Cerrar recursos
            rs.close();
            ps.close();
            cn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return cliente;
    }

    

    

}
