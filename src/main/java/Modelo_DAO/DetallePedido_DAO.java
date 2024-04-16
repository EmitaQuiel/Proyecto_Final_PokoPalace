package Modelo_DAO;

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
        } finally {
            // Cerrar recursos (ResultSet, PreparedStatement, Connection)
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return historialCompras;
    }

}
