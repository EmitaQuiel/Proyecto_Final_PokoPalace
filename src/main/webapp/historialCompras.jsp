<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Historial de Compras</title>
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

        <h1>Historial de Compras</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo Compra</th>

                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Compra</th>
                    <th>Método de Pago</th>
                    <th>Precio Total</th>
                    <th>Estado de Pago</th>
                    <th>Método de Envío</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="detalle" items="${historialCompras}">
                    <tr>
                        <td>00${detalle.idDetalle}</td>

                        <td>${detalle.nombreProducto}</td>
                        <td>${detalle.cantidad}</td>
                        <td>${detalle.precioCompra}</td>
                        <td>${detalle.metodoPago}</td>
                        <td>${detalle.precioTotal}</td>
                        <td>${detalle.estadoPago}</td>
                        <td>${detalle.metodoEnvio}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </body>
</html>
