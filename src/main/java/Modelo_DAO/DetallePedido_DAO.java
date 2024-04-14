package Modelo_DAO;

import Modelo.InformacionCompra;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class DetallePedido_DAO {
    private Connection cn = null;
    private PreparedStatement ps = null;

    public void insertarDetallePedido(InformacionCompra detallePedido) {
        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO detalles_pedido (id_cliente, id_producto, cantidad, precioCompra, metodo_pago, precio_total, estadoPago) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, detallePedido.getIdCliente());
            ps.setInt(2, detallePedido.getIdProducto());
            ps.setInt(3, detallePedido.getCantidad());
            ps.setDouble(4, detallePedido.getPrecioCompra());
            ps.setString(5, detallePedido.getMetodoPago());
            ps.setDouble(6, detallePedido.getPrecioTotal());
            ps.setString(7, detallePedido.getEstadoPago());
            
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            
        }
    }
}
