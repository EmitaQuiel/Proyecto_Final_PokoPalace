<%@page import="Modelo.detallePedido"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Cliente</title>
    </head>
    <body>

        <h2>Información de Compra</h2>

        <h3>Detalles del Carrito:</h3>
        <table border="1">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Precio Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${carrito}" var="detalle">
                    <tr>
                        <td>${detalle.producto.nombre}</td>
                        <td>${detalle.cantidad}</td>
                        <td>${detalle.producto.precio}</td>
                        <td>${detalle.importe()}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

        <h2>Formulario de Cliente</h2>
        <form action="Carrito_Controlador" method="POST">
            <label for="cedula">Cédula:</label>
            <input type="text" id="cedula" name="cedula" maxlength="9" required><br><br>

            <label for="nombres">Nombres:</label>
            <input type="text" id="nombres" name="nombres" maxlength="100" required><br><br>

            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="apellidos" maxlength="150" required><br><br>

            <label for="email">Correo electrónico:</label>
            <input type="email" id="email" name="email" required><br><br>

            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" maxlength="15" required><br><br>

            <label for="provincia">Provincia:</label>
            <input type="text" id="provincia" name="provincia" maxlength="15" required><br><br>

            <label for="canton">Cantón:</label>
            <input type="text" id="canton" name="canton" maxlength="50" required><br><br>

            <label for="distrito">Distrito:</label>
            <input type="text" id="distrito" name="distrito" maxlength="50" required><br><br>

            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" maxlength="255" required><br><br>

            
            <input type="radio" id="pago-tarjeta" name="metodo-pago" value="tarjeta">
            <label for="pago-tarjeta">Pagar con tarjeta</label><br>
            <input type="radio" id="pago-tienda" name="metodo-pago" value="tienda">
            <label for="pago-tienda">Pagar en tienda</label><br><br>

            
            <div id="detalles-tarjeta" style="display: none;">
                <label for="numero-tarjeta">Número de Tarjeta:</label>
                <input type="text" id="numero-tarjeta" name="numero-tarjeta"><br><br>

                <label for="nombre-tarjeta">Nombre en la Tarjeta:</label>
                <input type="text" id="nombre-tarjeta" name="nombre-tarjeta"><br><br>

                <label for="fecha-vencimiento">Fecha de Vencimiento:</label>
                <input type="text" id="fecha-vencimiento" name="fecha-vencimiento" placeholder="MM/AA"><br><br>

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv"><br><br>
            </div>

            <input type="hidden" name="accion" value="guardarCliente">
            <input type="submit" value="Generar Compra">
        </form>

        
        <script>
            const pagoTarjeta = document.getElementById('pago-tarjeta');
            const detallesTarjeta = document.getElementById('detalles-tarjeta');

            pagoTarjeta.addEventListener('change', function () {
                if (pagoTarjeta.checked) {
                    detallesTarjeta.style.display = 'block';
                } else {
                    detallesTarjeta.style.display = 'none';
                }
            });
        </script>

    </body>
</html>


