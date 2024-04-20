package Modelo;

import java.io.Serializable;

//Esta clase tiene una interfaz Serializable lo que representa que los objetos pueden ser serializados, o sea que 
//convierte el objeto en una secuencia de bytes, lo que quiere decir es que puede ser almacenada en memoria

public class detallePedido implements Serializable{

    private Producto producto;
    private int cantidad;

//    Este metodo aumenta la cantidad del producto 
    public void aumentarCantidad(int cantidad) {
        this.cantidad += cantidad;
    }

//    Este representa el valor total de la cantidad de productos seleccionada por el usuario
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
