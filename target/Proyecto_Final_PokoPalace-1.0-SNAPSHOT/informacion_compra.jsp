<%@page import="Modelo.detallePedido"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Cliente</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto py-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Formulario de Cliente -->
                <div class="max-w-md mr-auto md:mx-0 md:max-w-none">
                    <h2 class="text-3xl font-semibold mb-4">Formulario de Cliente</h2>
                    <form action="Carrito_Controlador" method="POST" class="space-y-4">
                        <div class="grid grid-cols-2 gap-6">
                            <div class="mb-8">
                                <label for="cedula" class="block mb-1">Cédula:</label>
                                <input type="text" id="cedula" name="cedula" maxlength="9" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="nombres" class="block mb-1">Nombres:</label>
                                <input type="text" id="nombres" name="nombres" maxlength="100" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="apellidos" class="block mb-1">Apellidos:</label>
                                <input type="text" id="apellidos" name="apellidos" maxlength="150" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="email" class="block mb-1">Correo electrónico:</label>
                                <input type="email" id="email" name="email" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="telefono" class="block mb-1">Teléfono:</label>
                                <input type="text" id="telefono" name="telefono" maxlength="15" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="provincia" class="block mb-1">Provincia:</label>
                                <input type="text" id="provincia" name="provincia" maxlength="15" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="canton" class="block mb-1">Cantón:</label>
                                <input type="text" id="canton" name="canton" maxlength="50" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="distrito" class="block mb-1">Distrito:</label>
                                <input type="text" id="distrito" name="distrito" maxlength="50" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="direccion" class="block mb-1">Dirección:</label>
                                <input type="text" id="direccion" name="direccion" maxlength="255" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                        </div>



                        <div class="space-y-2">
                            <label class="block">Método de Pago:</label>
                            <input type="radio" id="pago-tarjeta" name="metodo-pago" value="tarjeta"
                                   class="mr-2"><label for="pago-tarjeta">Pagar con tarjeta</label>
                            <input type="radio" id="pago-tienda" name="metodo-pago" value="tienda"
                                   class="mr-2"><label for="pago-tienda">Pagar en tienda</label>
                            
                        </div>

                        <div class="space-y-2">
                            <label class="block">Método de envío:</label>
                            <input type="radio" id="envio-tienda" name="metodo-envio" value="tienda" class="mr-2">
                            <label for="envio-tienda">Recoger en tienda</label>
                            <input type="radio" id="envio-correos" name="metodo-envio" value="correos" class="mr-2">
                            <label for="envio-correos">Correos de Costa Rica</label>
                        </div>



                        <div id="detalles-tarjeta" class="hidden">
                            <label for="numero-tarjeta" class="block">Número de Tarjeta:</label>
                            <input type="text" id="numero-tarjeta" name="numero-tarjeta"
                                   class="w-full border rounded-md px-3 py-2">

                            <label for="nombre-tarjeta" class="block">Nombre en la Tarjeta:</label>
                            <input type="text" id="nombre-tarjeta" name="nombre-tarjeta"
                                   class="w-full border rounded-md px-3 py-2">

                            <label for="fecha-vencimiento" class="block">Fecha de Vencimiento:</label>
                            <input type="text" id="fecha-vencimiento" name="fecha-vencimiento" placeholder="MM/AA"
                                   class="w-full border rounded-md px-3 py-2">

                            <label for="cvv" class="block">CVV:</label>
                            <input type="text" id="cvv" name="cvv" class="w-full border rounded-md px-3 py-2">
                        </div>

                        <input type="hidden" name="accion" value="guardarCliente">
                        <input type="submit" value="Generar Compra"
                               class="bg-black hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
                    </form>
                </div>


                <div class="bg-white rounded-lg border border-gray-200 shadow-md p-6">
                    <h3 class="text-xl font-semibold mb-4">Detalles del Carrito:</h3>
                    <table class="w-full border-collapse border border-gray-200">
                        <thead>
                            <tr>
                                <th class="border border-gray-200 px-4 py-2">Producto</th>
                                <th class="border border-gray-200 px-4 py-2">Cantidad</th>
                                <th class="border border-gray-200 px-4 py-2">Precio Unitario</th>
                                <th class="border border-gray-200 px-4 py-2">Precio Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${carrito}" var="detalle">
                                <tr>
                                    <td class="border border-gray-200 px-4 py-2">${detalle.producto.nombre}</td>
                                    <td class="border border-gray-200 px-4 py-2">${detalle.cantidad}</td>
                                    <td class="border border-gray-200 px-4 py-2">${detalle.producto.precio}</td>
                                    <td class="border border-gray-200 px-4 py-2">${detalle.importe()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


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


