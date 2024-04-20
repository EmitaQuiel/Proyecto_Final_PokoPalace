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

                <a href="carrito.jsp" class="fixed top-4 left-4 z-50">
                    <button class="cursor-pointer duration-200 hover:scale-125 active:scale-100 bg-black text-white rounded-full" title="Regresar">
                        <svg xmlns="http://www.w3.org/2000/svg" width="50px" height="50px" viewBox="0 0 24 24" class="stroke-current">
                        <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" d="M11 6L5 12M5 12L11 18M5 12H19"></path>
                        </svg>
                    </button>
                </a>

                <div class="max-w-md mr-auto md:mx-0 md:max-w-none">
                    <h2 class="text-3xl font-semibold mb-4">Formulario de Cliente</h2>
                    <form action="Carrito_Controlador" method="POST" class="space-y-4">
                        <div class="grid grid-cols-2 gap-6">
                            <div class="mb-8">
                                <label for="cedula" class="block mb-1">Cédula:</label>
                                <input type="text" id="cedula" name="cedula" maxlength="9" pattern="[0-9]{9}" required class="w-[22rem] border rounded-md px-3 py-2" title="Por favor, introduce una cédula válida de 9 dígitos numéricos">
                            </div>
                            <div class="mb-8">
                                <label for="nombres" class="block mb-1">Nombres:</label>
                                <input type="text" id="nombres" name="nombres" maxlength="100" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" required class="w-[22rem] border rounded-md px-3 py-2" title="Por favor, introduce solo letras">
                            </div>
                            <div class="mb-8">
                                <label for="apellidos" class="block mb-1">Apellidos:</label>
                                <input type="text" id="apellidos" name="apellidos" maxlength="150" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" required class="w-[22rem] border rounded-md px-3 py-2" title="Por favor, introduce solo letras">
                            </div>
                            <div class="mb-8">
                                <label for="email" class="block mb-1">Correo electrónico:</label>
                                <input type="email" id="email" name="email" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                            <div class="mb-8">
                                <label for="telefono" class="block mb-1">Teléfono:</label>
                                <input type="text" id="telefono" name="telefono" maxlength="8" pattern="[0-9]{8}" required class="w-[22rem] border rounded-md px-3 py-2" title="Por favor, introduce un número de teléfono válido de 8 dígitos numéricos">
                            </div>
                            <div class="mb-8">
                                <label for="provincia" class="block mb-1">Provincia:</label>
                                <select id="provincia" name="provincia" required class="w-[22rem] border rounded-md px-3 py-2">
                                    <option value="" disabled selected>Selecciona una provincia</option>
                                    <option value="San Jose">San José</option>
                                    <option value="Alajuela">Alajuela</option>
                                    <option value="Cartago">Cartago</option>
                                    <option value="Heredia">Heredia</option>
                                    <option value="Guanacaste">Guanacaste</option>
                                    <option value="Puntarenas">Puntarenas</option>
                                    <option value="Limon">Limón</option>
                                </select>
                            </div>
                            <div class="mb-8">
                                <label for="canton" class="block mb-1">Cantón:</label>
                                <input type="text" id="canton" name="canton" maxlength="50" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" required class="w-[22rem] border rounded-md px-3 py-2" title="Por favor, introduce solo letras">
                            </div>
                            <div class="mb-8">
                                <label for="distrito" class="block mb-1">Distrito:</label>
                                <input type="text" id="distrito" name="distrito" maxlength="50" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" required class="w-[22rem] border rounded-md px-3 py-2" title="Por favor, introduce solo letras">
                            </div>
                            <div class="mb-8">
                                <label for="direccion" class="block mb-1">Dirección:</label>
                                <input type="text" id="direccion" name="direccion" maxlength="255" required class="w-[22rem] border rounded-md px-3 py-2">
                            </div>
                        </div>



                        <div class="space-y-2">
                            <label class="block">Método de Pago:</label>
                            <input type="radio" id="pago-tarjeta" name="metodo-pago" value="tarjeta" class="mr-2" required>
                            <label for="pago-tarjeta">Pagar con tarjeta</label>
                            <input type="radio" id="pago-tienda" name="metodo-pago" value="tienda" class="mr-2">
                            <label for="pago-tienda">Pagar en tienda</label>
                        </div>
                        <div id="detalles-tarjeta" class="hidden">
                            <label for="numero-tarjeta" class="block">Número de Tarjeta:</label>
                            <input type="text" id="numero-tarjeta" name="numero-tarjeta" class="w-full border rounded-md px-3 py-2" placeholder="XXXX XXXX XXXX XXXX" pattern="[0-9]{16}" title="Por favor, introduce 16 dígitos numéricos" required>

                            <label for="nombre-tarjeta" class="block">Nombre en la Tarjeta:</label>
                            <input type="text" id="nombre-tarjeta" name="nombre-tarjeta" class="w-full border rounded-md px-3 py-2" placeholder="Titular" required>

                            <label for="fecha-vencimiento" class="block">Fecha de Vencimiento:</label>
                            <input type="text" id="fecha-vencimiento" name="fecha-vencimiento" placeholder="MM/AA" class="w-full border rounded-md px-3 py-2" pattern="(0[1-9]|1[0-2])\/?([0-9]{2})" title="Por favor, introduce una fecha válida en formato MM/AA" required>

                            <label for="cvv" class="block">CVV:</label>
                            <input type="text" id="cvv" name="cvv" class="w-full border rounded-md px-3 py-2" placeholder="CVV" pattern="[0-9]{3,4}" title="Por favor, introduce 3 o 4 dígitos numéricos" required>
                        </div>

                        <div class="space-y-2">
                            <label class="block">Método de envío:</label>
                            <input type="radio" id="envio-tienda" name="metodo-envio" value="tienda" class="mr-2" required>
                            <label for="envio-tienda">Recoger en tienda</label>
                            <input type="radio" id="envio-correos" name="metodo-envio" value="correos" class="mr-2" required>
                            <label for="envio-correos">Correos de Costa Rica (2500)</label>
                        </div>

                        <form action="mensaje.jsp" method="post" id="compraForm">

                            <input type="hidden" name="accion" value="guardarCliente">
                            <input type="submit" value="Generar Compra"
                                   class="bg-black hover:bg-gray-700 text-white font-bold py-2 px-4 rounded"
                                   id="submitButton">
                        </form>

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
            document.addEventListener('DOMContentLoaded', function () {
                const metodoTarjetaInput = document.getElementById('pago-tarjeta');
                const metodoTiendaInput = document.getElementById('pago-tienda');
                const detallesTarjeta = document.getElementById('detalles-tarjeta');
                const envioCorreos = document.getElementById('envio-correos');

                metodoTarjetaInput.addEventListener('change', function () {
                    detallesTarjeta.classList.toggle('hidden', !metodoTarjetaInput.checked);
                    if (metodoTarjetaInput.checked) {
                        document.getElementById('numero-tarjeta').required = true;
                        document.getElementById('nombre-tarjeta').required = true;
                        document.getElementById('fecha-vencimiento').required = true;
                        document.getElementById('cvv').required = true;
                        envioCorreos.disabled = false; // Habilitar opción de envío por correo cuando se paga con tarjeta
                    } else {
                        document.getElementById('numero-tarjeta').required = false;
                        document.getElementById('nombre-tarjeta').required = false;
                        document.getElementById('fecha-vencimiento').required = false;
                        document.getElementById('cvv').required = false;
                    }
                });

                metodoTiendaInput.addEventListener('change', function () {
                    detallesTarjeta.classList.add('hidden');
                    document.getElementById('numero-tarjeta').required = false;
                    document.getElementById('nombre-tarjeta').required = false;
                    document.getElementById('fecha-vencimiento').required = false;
                    document.getElementById('cvv').required = false;
                    envioCorreos.disabled = metodoTiendaInput.checked;
                });

                metodoTiendaInput.checked ? envioCorreos.disabled = true : envioCorreos.disabled = false;
            });
        </script>
    </body>
</html>


