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
                    <a href="./index.jsp"><img src="./assets/img/catlogo.png" alt="logo" width="60px"></a> 
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
            h1,
            h2,
            h3,
            h4,
            h5,
            h6 {
                font-family: "Inter", sans-serif;
                --font-sans: "Inter";
            }
            body {
                font-family: "Inter", sans-serif;
                --font-sans: "Inter";
                background-color: #464646;
                margin-top: 100px;
            }
        </style>    
        <div class="relative w-full overflow-auto">
            <table class="w-full caption-bottom text-sm">
                <thead class="[&amp;_tr]:border-b">
                    <tr
                        class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted"
                        >
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 w-[150px]"
                            >
                            Código Compra
                        </th>
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0"
                            >
                            Producto
                        </th>
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0"
                            >
                            Cantidad
                        </th>
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0"
                            >
                            Precio Compra
                        </th>
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0"
                            >
                            Método Pago
                        </th>
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0"
                            >
                            Precio Total
                        </th>
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0"
                            >
                            Estado Pago
                        </th>
                        <th
                            class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 w-[150px]"
                            >
                            Método de Envío
                        </th>
                    </tr>
                </thead>
                <tbody class="[&amp;_tr:last-child]:border-0">
                    <c:forEach var="detalle" items="${historialCompras}">
                        <tr
                            class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted"
                            >
                            <td
                                class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium"
                                >
                                00${detalle.idDetalle}
                            </td>
                            <td
                                class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-sm"
                                >
                                ${detalle.nombreProducto}
                            </td>
                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                ${detalle.cantidad}
                            </td>
                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                ${detalle.precioCompra}
                            </td>
                            <td
                                class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-sm"
                                >
                                ${detalle.metodoPago}
                            </td>
                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                ${detalle.precioTotal}
                            </td>
                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                ${detalle.estadoPago}
                            </td>
                            <td
                                class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium"
                                >
                                ${detalle.metodoEnvio}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>
