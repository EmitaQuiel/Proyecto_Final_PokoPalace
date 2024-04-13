package Modelo;

import java.io.Serializable;

public class detallePedido implements Serializable{

    private Producto producto;
    private int cantidad;

    public void aumentarCantidad(int cantidad) {
        this.cantidad += cantidad;
    }

    public double importe() {
        return producto.getPrecio() * cantidad;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
