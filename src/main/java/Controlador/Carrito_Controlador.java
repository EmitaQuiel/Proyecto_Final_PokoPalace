package Controlador;

import Modelo.Cliente;
import Modelo.InformacionCompra;
import Modelo.Producto;
import Modelo.detallePedido;
import Modelo_DAO.Cliente_DAO;
import Modelo_DAO.DetallePedido_DAO;
import Modelo_DAO.Producto_DAO;
import java.io.IOException;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.carrito;

public class Carrito_Controlador extends HttpServlet {

    private Producto_DAO prodDAO = new Producto_DAO();
    private String listarCarrito = "carrito.jsp";
    private String pagProducto = "productos.jsp";
    private carrito objCarrito = new carrito();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");

        switch (accion) {
            case "listar":
                Listar(request, response);
                break;
            case "agregar":
                Agregar(request, response);
                break;
            case "eliminar":
                Eliminar(request, response);
                break;
            case "buscar":
                Buscar(request, response);
                break;
            case "filtrar":
                FiltrarPorCategoria(request, response);
                break;
            case "vaciar":
                VaciarCarrito(request, response);
                break;
            case "aumentar":
                Aumentar(request, response);
                break;
            case "disminuir":
                Disminuir(request, response);
                break;
            case "guardarCliente":
                guardarCliente(request, response);
                break;

            default:
                throw new AssertionError();
        }
    }

    protected void Buscar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreProducto = request.getParameter("nombreProducto");
        ArrayList<Producto> productosEncontrados = prodDAO.buscarPorNombre(nombreProducto);

        request.setAttribute("productos", productosEncontrados);
        request.getRequestDispatcher(pagProducto).forward(request, response);
    }

    protected void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        int indice = Integer.parseInt(request.getParameter("indice"));

        objCarrito.removerItemCarrito(request, indice);

        response.sendRedirect("Carrito_Controlador?accion=listar");

    }

    protected void Agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        int idProd = Integer.parseInt(request.getParameter("id"));
        Producto obj = prodDAO.buscarId(idProd);

        if (obj != null) {
            detallePedido objDet = new detallePedido();
            objDet.setProducto(obj);
            objDet.setCantidad(1);

            objCarrito.agregarCarrito(objDet, request);
        }

        request.getRequestDispatcher(pagProducto).forward(request, response);
    }

    protected void Listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");

        ArrayList<detallePedido> lista = objCarrito.obtenerSesion(request);
        request.setAttribute("carrito", lista);
        request.setAttribute("total", objCarrito.importeTotal(lista));

        request.getRequestDispatcher(listarCarrito).forward(request, response);
    }

    protected void FiltrarPorCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoriaSeleccionada = request.getParameter("categoria");
        ArrayList<Producto> productosFiltrados = prodDAO.buscarPorCategoria(categoriaSeleccionada);

        request.setAttribute("productos", productosFiltrados);
        request.getRequestDispatcher(pagProducto).forward(request, response);
    }

    protected void VaciarCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        objCarrito.vaciarCarrito(request);
        response.sendRedirect("Carrito_Controlador?accion=listar");
    }

    protected void Aumentar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int indice = Integer.parseInt(request.getParameter("indice"));
        ArrayList<detallePedido> lista = objCarrito.obtenerSesion(request);
        detallePedido item = lista.get(indice);
        item.aumentarCantidad(1);
        objCarrito.guardarSesion(request, lista);
        response.sendRedirect("Carrito_Controlador?accion=listar");
    }

    protected void Disminuir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int indice = Integer.parseInt(request.getParameter("indice"));
        ArrayList<detallePedido> lista = objCarrito.obtenerSesion(request);
        detallePedido item = lista.get(indice);
        int cantidad = item.getCantidad();
        if (cantidad > 1) {
            item.setCantidad(cantidad - 1);
        }
        objCarrito.guardarSesion(request, lista);
        response.sendRedirect("Carrito_Controlador?accion=listar");
    }

    protected void guardarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cedula = request.getParameter("cedula");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String provincia = request.getParameter("provincia");
        String canton = request.getParameter("canton");
        String distrito = request.getParameter("distrito");
        String direccion = request.getParameter("direccion");
        String metodoPago = request.getParameter("metodo-pago");

        
        if (metodoPago == null || metodoPago.isEmpty()) {
            request.setAttribute("mensajeError", "Debe seleccionar un método de pago.");
            request.getRequestDispatcher("informacion.jsp").forward(request, response);
            return;
        }

        
        if (metodoPago.equals("tarjeta")) {
            String numeroTarjeta = request.getParameter("numero-tarjeta");
            String nombreTarjeta = request.getParameter("nombre-tarjeta");
            String fechaVencimiento = request.getParameter("fecha-vencimiento");
            String cvv = request.getParameter("cvv");

            
            if (numeroTarjeta == null || numeroTarjeta.isEmpty()
                    || nombreTarjeta == null || nombreTarjeta.isEmpty()
                    || fechaVencimiento == null || fechaVencimiento.isEmpty()
                    || cvv == null || cvv.isEmpty()) {
                request.setAttribute("mensajeError", "Por favor complete todos los campos de la tarjeta.");
                request.getRequestDispatcher("informacion.jsp").forward(request, response);
                return;
            }
        }

        
        if (cedula.isEmpty() || nombres.isEmpty() || apellidos.isEmpty() || email.isEmpty()
                || telefono.isEmpty() || provincia.isEmpty() || canton.isEmpty() || distrito.isEmpty()
                || direccion.isEmpty()) {
            request.setAttribute("mensajeError", "Por favor complete todos los campos del cliente.");
            request.getRequestDispatcher("informacion.jsp").forward(request, response);
            return;
        }

        
        ArrayList<detallePedido> carrito = objCarrito.obtenerSesion(request);

        
        if (carrito.isEmpty()) {
            request.setAttribute("mensajeError", "El carrito de la compra está vacío.");
            request.getRequestDispatcher("informacion.jsp").forward(request, response);
            return;
        }
        Producto_DAO objProductoDAO = new Producto_DAO();
        
        for (detallePedido item : carrito) {
            objProductoDAO.disminuirStockProducto(item.getProducto().getIdProd(), item.getCantidad());
        }

        objCarrito.vaciarCarrito(request);

        response.sendRedirect("mensaje.jsp");
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
