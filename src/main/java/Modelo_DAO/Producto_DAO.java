package Modelo_DAO;

import Modelo.Producto;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
            // Agregar el '%' para que busque nombres que contengan la cadena proporcionada
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
            // Si no se proporciona una categoría, selecciona todos los productos
            sql = "SELECT p.*, cp.nombre_categoria AS nombre_categoria FROM productos p INNER JOIN categorias_productos cp ON p.id_categoria = cp.id_categoria";
            ps = cn.prepareStatement(sql);
        } else {
            // Si se proporciona una categoría, filtra por esa categoría
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


}
