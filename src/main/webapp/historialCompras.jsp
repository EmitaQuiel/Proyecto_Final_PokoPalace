<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Historial de Compras</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="./css/style.css" />
    </head>
    <body>

        <header>
            <nav class="modern-navbar">
                <div class="modern-logo">
                    <a href="./index.jsp"><img src="./assets/img/logoPokoPalace.png" alt="logo" style="max-width: 100px; max-height: 70px"></a> 
                </div>
                <ul class="modern-nav">
                    <li class="modern-nav-items"><a href="./index.jsp"><span class="link-text">Inicio</span><i class="fa-solid fa-store"></i></a></li>
                    <li class="modern-nav-items"><a href="./productos.jsp"><span class="link-text">Productos</span><i class="fa-solid fa-store"></i></a></li>
                    <li class="modern-nav-items"><a href=""><span class="link-text">Contacto</span><i class="fa-solid fa-user"></i></a></li>
                    <li class="modern-nav-items"><a href=""><span class="link-text">${historialCompras[0].nombreCliente} ${historialCompras[0].apellidoCliente}</span><i class="fa-solid fa-user"></i></a></li>
                </ul>

            </nav>
        </header>
        <style>
            body{
                margin-top: 120px;
                
            }
        </style>
        <div class="grid gap-6 md:gap-8 px-4 md:px-6">
            <div class="flex items-center justify-between">
                <h1 class="text-2xl font-bold">Historial de compras</h1>
            </div>
            <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                <c:forEach var="detalle" items="${historialCompras}">
                    <div
                        class="rounded-lg border bg-white text-black shadow-sm"
                        data-v0-t="card"
                        >
                        <div class="flex flex-col space-y-1.5 p-6">
                            <div class="flex items-center justify-between">
                                <div class="text-lg font-medium">#00${detalle.idDetalle}</div>
                                <div
                                    class="inline-flex w-fit items-center whitespace-nowrap rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2"
                                    >
                                    ${detalle.estadoPago}
                                </div>
                            </div>
                        </div>
                        <div class="p-6 grid gap-4">
                            <div class="grid gap-2">
                                <div class="text-sm text-gray-500 dark:text-gray-400">
                                    Producto
                                </div>
                                <div class="font-medium">${detalle.nombreProducto}</div>
                            </div>
                            <div class="grid gap-2">
                                <div class="text-sm text-gray-500 dark:text-gray-400">
                                    Cantidad
                                </div>
                                <div>${detalle.cantidad}</div>
                            </div>
                            <div class="grid gap-2">
                                <div class="text-sm text-gray-500 dark:text-gray-400">
                                    Método de pago
                                </div>
                                <div>${detalle.metodoPago}</div>
                            </div>
                            <div class="grid gap-2">
                                <div class="text-sm text-gray-500 dark:text-gray-400">
                                    Precio total
                                </div>
                                <div class="font-medium">₡${detalle.precioTotal}</div>
                            </div>
                            <div class="grid gap-2">
                                <div class="text-sm text-gray-500 dark:text-gray-400">
                                    Método de envío
                                </div>
                                <div>${detalle.metodoEnvio}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


    </body>
</html>
