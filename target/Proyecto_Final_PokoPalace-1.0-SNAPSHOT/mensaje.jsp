<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    </head>
    
            <h1>Resumen de Compra</h1>
            <h2>Datos del Cliente</h2>
            <p>Cédula: ${cedula}</p>
            <p>Nombres: ${nombres}</p>
            <p>Apellidos: ${apellidos}</p>
            <p>Email: ${email}</p>
            <p>Teléfono: ${telefono}</p>
            <p>Provincia: ${provincia}</p>
            <p>Cantón: ${canton}</p>
            <p>Distrito: ${distrito}</p>
            <p>Dirección: ${direccion}</p>

            <h2>Detalle de la Compra</h2>
            <table border="1">
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Precio Total</th>
                </tr>
                <c:forEach items="${carrito}" var="item">
                    <tr>
                        <td>${item.producto.nombre}</td>
                        <td>${item.cantidad}</td>
                        <td>${item.producto.precio}</td>
                        <td>${item.cantidad * item.producto.precio}</td>
                    </tr>
                </c:forEach>
            </table>

            <p>Total a Pagar: ${total}</p>
        



























    <!--        <div class="container mt-4">
                <div class="col-sm-4">
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">¡Compra realizada con éxito!</h4>
                        <p>Tu compra se ha registrado correctamente.</p>
                        <a href="./productos.jsp" class="btn btn-warning">Volver</a>
                    </div>
                </div>
            </div>
    
            <div class="container mt-4">
                <div>
                     Mostrar la información del cliente 
                    <h2>Información del Cliente:</h2>
                    <p>Cédula: ${cliente.cedula}</p>
                    <p>Nombre: ${cliente.nombres}</p>
                    <p>Apellidos: ${cliente.apellidos}</p>
                    <p>Correo electrónico: ${cliente.email}</p>
                     Mostrar los detalles de la compra 
                    <h2>Detalles de la Compra:</h2>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID del Producto</th>
                                <th>Nombre del Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Precio Total</th>
                            </tr>
                        </thead>
                        <tbody>
    <c:forEach items="${detallesCompra}" var="detalle">
        <tr>
            <td>${detalle.idProducto}</td>
            <td>${detalle.nombreProducto}</td>
            <td>${detalle.cantidad}</td>
            <td>${detalle.precioProducto}</td>
            <td>${detalle.precioTotal}</td>
        </tr>
    </c:forEach>
</tbody>
</table>
</div>
</div>-->

</body>
</html>
