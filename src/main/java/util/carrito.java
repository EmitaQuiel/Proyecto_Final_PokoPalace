package util;

import Modelo.detallePedido;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

public class carrito {

    public void agregarCarrito(detallePedido detalle, HttpServletRequest request) {
        ArrayList<detallePedido> lista = obtenerSesion(request);
        int posicion = existeProducto(lista, detalle.getProducto().getIdProd());
        if (posicion == -1) {
            lista.add(detalle);
        } else {
            detallePedido objDet = lista.get(posicion);
            objDet.aumentarCantidad(detalle.getCantidad());
            lista.set(posicion, objDet);
        }
        guardarSesion(request, lista);
    }

    public double importeTotal(ArrayList<detallePedido> lista) {
        double total = 0;
        for (detallePedido item : lista) {
            total += item.importe();
        }
        return total;
    }

    public void removerItemCarrito(HttpServletRequest request, int indice) {
        ArrayList<detallePedido> lista = obtenerSesion(request);
        lista.remove(indice);
        guardarSesion(request, lista);
    }

    public ArrayList<detallePedido> obtenerSesion(HttpServletRequest request) {
        ArrayList<detallePedido> lista;

        if (request.getSession().getAttribute("carrito") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<detallePedido>) request.getSession().getAttribute("carrito");
        }
        return lista;
    }

    public void guardarSesion(HttpServletRequest request, ArrayList<detallePedido> lista) {
        request.getSession().setAttribute("carrito", lista);

    }

    public int existeProducto(ArrayList<detallePedido> lista, int idProd) {
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getProducto().getIdProd() == idProd) {
                return i;
            }
        }
        return -1;
    }

    public void vaciarCarrito(HttpServletRequest request) {
        ArrayList<detallePedido> lista = obtenerSesion(request);
        lista.clear();
        guardarSesion(request, lista);
    }

    public boolean carritoEstaVacio(HttpServletRequest request) {
        ArrayList<detallePedido> lista = obtenerSesion(request);
        return lista.isEmpty();
    }

}
