package Modelo_DAO;

import Modelo.InformacionCompra;
import Modelo.Producto;
import Modelo.detallePedido;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Producto_DAO {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ArrayList<Producto> ListarTodos() {
        ArrayList<Producto> lista = new ArrayList<Producto>();

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT p.*, cp.nombre_categoria AS nombre_categoria FROM productos p INNER JOIN categorias_productos cp ON p.id_categoria = cp.id_categoria";

            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto obj = new Producto();
                obj.setIdProd(rs.getInt("id_producto"));
                obj.setNombre(rs.getString("nombre"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setImagen(rs.getString("imagen"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setNombreCategoria(rs.getString("nombre_categoria"));
                obj.setStock(rs.getInt("stock"));

                lista.add(obj);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return lista;
    }

    public Producto buscarId(int id) {
        Producto obj = null;

        try {
            cn = Conexion.getConnection();
            String sql = "select * from productos where id_producto = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                obj = new Producto();
                obj.setIdProd(rs.getInt("id_producto"));
                obj.setNombre(rs.getString("nombre"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setImagen(rs.getString("imagen"));
                obj.setDescripcion(rs.getString("descripcion"));

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return obj;
    }

    public ArrayList<Producto> buscarPorNombre(String nombre) {
        ArrayList<Producto> lista = new ArrayList<Producto>();

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM productos WHERE nombre LIKE ?";
            ps = cn.prepareStatement(sql);

            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto obj = new Producto();
                obj.setIdProd(rs.getInt("id_producto"));
                obj.setNombre(rs.getString("nombre"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setImagen(rs.getString("imagen"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setIdCategoria(rs.getInt("id_categoria"));
                obj.setStock(rs.getInt("stock"));
                lista.add(obj);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return lista;
    }

    public ArrayList<Producto> buscarPorCategoria(String categoria) {
        ArrayList<Producto> lista = new ArrayList<Producto>();

        try {
            cn = Conexion.getConnection();
            String sql;
            if (categoria == null || categoria.isEmpty()) {

                sql = "SELECT p.*, cp.nombre_categoria AS nombre_categoria FROM productos p INNER JOIN categorias_productos cp ON p.id_categoria = cp.id_categoria";
                ps = cn.prepareStatement(sql);
            } else {

                sql = "SELECT p.*, cp.nombre_categoria AS nombre_categoria FROM productos p INNER JOIN categorias_productos cp ON p.id_categoria = cp.id_categoria WHERE cp.nombre_categoria = ?";
                ps = cn.prepareStatement(sql);
                ps.setString(1, categoria);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                Producto obj = new Producto();
                obj.setIdProd(rs.getInt("id_producto"));
                obj.setNombre(rs.getString("nombre"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setImagen(rs.getString("imagen"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setNombreCategoria(rs.getString("nombre_categoria"));
                obj.setStock(rs.getInt("stock"));
                lista.add(obj);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return lista;
    }

    public int guardarDetallesPedido(int idCliente, String metodoPago, double precioTotal, String estadoPago, ArrayList<InformacionCompra> carrito) {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int idCompraGenerado = -1;

        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO detalles_pedido (id_cliente, id_producto, cantidad, precioCompra, metodo_pago, precio_total, estadoPago) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            cn.setAutoCommit(false);

            for (InformacionCompra detalle : carrito) {
                double precioTotalProducto = detalle.getPrecioCompra() * detalle.getCantidad();
                ps.setInt(1, idCliente);
                ps.setInt(2, detalle.getIdProducto());
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecioCompra());
                ps.setString(5, metodoPago);
                ps.setDouble(6, precioTotal);
                ps.setString(7, estadoPago);
                ps.executeUpdate();
            }

            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idCompraGenerado = rs.getInt(1);
            }

            cn.commit();
        } catch (SQLException ex) {
            ex.printStackTrace();
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.setAutoCommit(true);
                    cn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return idCompraGenerado;
    }

    public void disminuirStockProducto(int idProducto, int cantidadVendida) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Conexion.getConnection();

            String sql = "UPDATE productos SET stock = stock - ? WHERE id_producto = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, cantidadVendida);
            stmt.setInt(2, idProducto);

            int filasActualizadas = stmt.executeUpdate();

            if (filasActualizadas == 0) {
                System.out.println("No se pudo actualizar el stock del producto con id: " + idProducto);
            } else {
                System.out.println("Stock del producto con id " + idProducto + " actualizado correctamente.");
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar el stock del producto: " + e.getMessage());
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.out.println("Error al cerrar el statement: " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.out.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }
    }

}
