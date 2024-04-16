<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Historial de Compras</title>
    
</head>
<body>
    <h1>Historial de Compras</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID Detalle</th>
                <th>ID Cliente</th>
                <th>ID Producto</th>
                <th>Cantidad</th>
                <th>Precio Compra</th>
                <th>Método de Pago</th>
                <th>Precio Total</th>
                <th>Estado de Pago</th>
            </tr>
        </thead>
        <tbody>
            <%-- Aquí iteramos sobre la lista de detalles de compra y mostramos la información --%>
            <c:forEach var="detalle" items="${listaDetalles}">
                <tr>
                    <td>${detalle.idDetalle}</td>
                    <td>${detalle.idCliente}</td>
                    <td>${detalle.idProducto}</td>
                    <td>${detalle.cantidad}</td>
                    <td>${detalle.precioCompra}</td>
                    <td>${detalle.metodoPago}</td>
                    <td>${detalle.precioTotal}</td>
                    <td>${detalle.estadoPago}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
