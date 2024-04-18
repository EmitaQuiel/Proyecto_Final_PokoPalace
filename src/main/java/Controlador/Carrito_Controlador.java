package Controlador;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.color.PDDeviceRGB;
import org.apache.pdfbox.pdmodel.graphics.color.PDDeviceRGB;

import Modelo.Cliente;
import Modelo.InformacionCompra;
import Modelo.Producto;
import Modelo.Usuario;
import Modelo.detallePedido;
import Modelo_DAO.Cliente_DAO;
import Modelo_DAO.DetallePedido_DAO;
import Modelo_DAO.Producto_DAO;
import Modelo_DAO.Usuario_DAO;
import java.io.IOException;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            case "registrarUsuario":
                registrarUsuario(request, response);
                break;
            case "iniciarSesion":
                iniciarSesion(request, response);
                break;
            case "aplicarDescuento":
                aplicarDescuento(request, response);
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

        Cliente_DAO clienteDAO = new Cliente_DAO();
        Cliente clienteExistente = clienteDAO.buscarPorCedula(cedula);

        int idCliente;
        if (clienteExistente != null) {
            idCliente = clienteExistente.getId_Cliente();
        } else {
            Cliente nuevoCliente = new Cliente();
            nuevoCliente.setCedula(cedula);
            nuevoCliente.setNombre(nombres);
            nuevoCliente.setApellidos(apellidos);
            nuevoCliente.setEmail(email);
            nuevoCliente.setTelefono(telefono);
            nuevoCliente.setProvincia(provincia);
            nuevoCliente.setCanton(canton);
            nuevoCliente.setDistrito(distrito);
            nuevoCliente.setDireccion(direccion);

            clienteDAO.insertarCliente(nuevoCliente);

            idCliente = clienteDAO.obtenerUltimoId();
        }

        double precioTotal = 0.0;

        ArrayList<detallePedido> carrito = objCarrito.obtenerSesion(request);

        String metodoEnvio = request.getParameter("metodo-envio");

        if (metodoEnvio.equals("correos")) {
            precioTotal += 2500;
        }

        String metodoPago = request.getParameter("metodo-pago");

        String estado;
        if (metodoPago.equals("tarjeta")) {
            estado = "cancelado";
        } else {
            estado = "sin cancelar";
        }

        DetallePedido_DAO detallePedidoDAO = new DetallePedido_DAO();
        Producto_DAO productoDAO = new Producto_DAO();

        for (detallePedido item : carrito) {
            InformacionCompra detallePedido = new InformacionCompra();
            detallePedido.setIdCliente(idCliente);
            detallePedido.setIdProducto(item.getProducto().getIdProd());
            detallePedido.setCantidad(item.getCantidad());
            detallePedido.setPrecioCompra(item.getProducto().getPrecio());
            detallePedido.setMetodoPago(metodoPago);
            double precioTotalDetalle = item.getProducto().getPrecio() * item.getCantidad();
            detallePedido.setPrecioTotal(precioTotalDetalle);
            detallePedido.setEstadoPago(estado);
            detallePedido.setMetodoEnvio(metodoEnvio);

            detallePedidoDAO.insertarDetallePedido(detallePedido);
            productoDAO.disminuirStockProducto(item.getProducto().getIdProd(), item.getCantidad());

        }
//        generarPDF(request, response);
//        response.sendRedirect("mensaje.jsp");
        objCarrito.vaciarCarrito(request);
        prepareCompraSummary(request, response);
    }

    private void prepareCompraSummary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos del cliente desde la solicitud
        String cedula = request.getParameter("cedula");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String provincia = request.getParameter("provincia");
        String canton = request.getParameter("canton");
        String distrito = request.getParameter("distrito");
        String direccion = request.getParameter("direccion");

        // Obtener los detalles del carrito de la sesión
        ArrayList<detallePedido> carrito = objCarrito.obtenerSesion(request);

        // Calcular el total a pagar
        double total = objCarrito.importeTotal(carrito);

        // Establecer los atributos en el request para pasarlos a la página JSP
        request.setAttribute("cedula", cedula);
        request.setAttribute("nombres", nombres);
        request.setAttribute("apellidos", apellidos);
        request.setAttribute("email", email);
        request.setAttribute("telefono", telefono);
        request.setAttribute("provincia", provincia);
        request.setAttribute("canton", canton);
        request.setAttribute("distrito", distrito);
        request.setAttribute("direccion", direccion);
        request.setAttribute("carrito", carrito);
        request.setAttribute("total", total);

        // Redirigir a la página de resumen de compra
        request.getRequestDispatcher("mensaje.jsp").forward(request, response);
    }

    protected void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombreUsuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String emailCliente = request.getParameter("email");

        Usuario_DAO usuarioDAO = new Usuario_DAO();
        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setNombreUsuario(nombreUsuario);
        nuevoUsuario.setContrasena(contrasena);
        nuevoUsuario.setEmailCliente(emailCliente);

        if (!usuarioDAO.emailExistente(emailCliente)) {

            if (usuarioDAO.insertarUsuario(nuevoUsuario)) {
                request.getRequestDispatcher("iniciarSesion.jsp").forward(request, response);
                return;
            }
        }
        request.getRequestDispatcher("mensajeRealizarCompra.jsp").forward(request, response);
    }

    protected void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");

        Usuario_DAO usuarioDAO = new Usuario_DAO();
        Usuario usuario = usuarioDAO.obtenerPorNombreUsuario(nombreUsuario);

        if (usuario != null && validarContrasena(contrasena, usuario.getContrasena())) {

            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            DetallePedido_DAO detallePedidoDAO = new DetallePedido_DAO();
            ArrayList<InformacionCompra> historialCompras = detallePedidoDAO.obtenerHistorialCompras(usuario.getIdUsuario());

            request.setAttribute("historialCompras", historialCompras);

            request.getRequestDispatcher("historialCompras.jsp").forward(request, response);
        } else {

            request.setAttribute("error", "Nombre de usuario o contraseña incorrectos");
            request.getRequestDispatcher("iniciarSesion.jsp").forward(request, response);
        }
    }

    private boolean validarContrasena(String contrasenaIngresada, String contrasenaAlmacenada) {
        return contrasenaIngresada.equals(contrasenaAlmacenada);
    }

    private void generarPDF(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=compra.pdf");

        try (PDDocument document = new PDDocument()) {
            PDPage page = new PDPage();
            document.addPage(page);

            try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
                contentStream.beginText();
                contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);
                contentStream.newLineAtOffset(100, 700);

                String cedula = request.getParameter("cedula");
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String email = request.getParameter("email");
                String telefono = request.getParameter("telefono");
                String provincia = request.getParameter("provincia");
                String canton = request.getParameter("canton");
                String distrito = request.getParameter("distrito");
                String direccion = request.getParameter("direccion");

                contentStream.showText("Información del Cliente:");
                contentStream.newLine();
                contentStream.showText("Cédula: " + cedula);
                contentStream.newLine();
                contentStream.showText("Nombres: " + nombres);
                contentStream.newLine();
                contentStream.showText("Apellidos: " + apellidos);
                contentStream.newLine();
                contentStream.showText("Correo Electrónico: " + email);
                contentStream.newLine();
                contentStream.showText("Teléfono: " + telefono);
                contentStream.newLine();
                contentStream.showText("Provincia: " + provincia);
                contentStream.newLine();
                contentStream.showText("Cantón: " + canton);
                contentStream.newLine();
                contentStream.showText("Distrito: " + distrito);
                contentStream.newLine();
                contentStream.showText("Dirección: " + direccion);
                contentStream.newLine();
                contentStream.newLine();

                ArrayList<detallePedido> carrito = objCarrito.obtenerSesion(request);

                contentStream.showText("Detalles del Carrito:");
                contentStream.newLine();
                for (detallePedido detalle : carrito) {
                    contentStream.showText("Producto: " + detalle.getProducto().getNombre());
                    contentStream.newLine();
                    contentStream.showText("Cantidad: " + detalle.getCantidad());
                    contentStream.newLine();
                    contentStream.showText("Precio Unitario: " + detalle.getProducto().getPrecio());
                    contentStream.newLine();
                    contentStream.showText("Precio Total: " + detalle.importe());
                    contentStream.newLine();
                    contentStream.newLine();
                }

                contentStream.endText();
            }

            document.save(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void aplicarDescuento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codigoDescuento = request.getParameter("codigoDescuento");

        HttpSession session = request.getSession();
        ArrayList<detallePedido> carrito = (ArrayList<detallePedido>) session.getAttribute("carrito");

        if (carrito == null || carrito.isEmpty()) {
            String mensajeError = "El carrito está vacío. No se pueden aplicar descuentos.";
            request.setAttribute("mensajeError", mensajeError);
        } else {

            Set<String> codigosUtilizados = (Set<String>) session.getAttribute("codigosUtilizados");

            if (codigosUtilizados == null) {
                codigosUtilizados = new HashSet<>();
            }

            boolean descuentoAplicado = session.getAttribute("descuentoAplicado") != null;

            if (descuentoAplicado) {
                String mensajeError = "Ya has aplicado un descuento.";
                request.setAttribute("mensajeError", mensajeError);
            } else {

                Producto_DAO productoDAO = new Producto_DAO();
                boolean cuponExistente = productoDAO.verificarExistenciaCupon(codigoDescuento);

                if (!cuponExistente) {

                    String mensajeError = "El código de descuento no es válido.";
                    request.setAttribute("mensajeError", mensajeError);
                } else {

                    double porcentajeDescuento = productoDAO.obtenerDescuentoPorCodigo(codigoDescuento);
                    for (detallePedido detalle : carrito) {
                        double precioConDescuento = detalle.getProducto().getPrecio() * (1 - porcentajeDescuento / 100);
                        detalle.getProducto().setPrecio(precioConDescuento);
                    }

                    codigosUtilizados.add(codigoDescuento);
                    session.setAttribute("codigosUtilizados", codigosUtilizados);
                    session.setAttribute("descuentoAplicado", true);

                    String mensaje = "Descuento aplicado con éxito";
                    request.setAttribute("mensaje", mensaje);
                }
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("carrito.jsp");
        dispatcher.forward(request, response);
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
