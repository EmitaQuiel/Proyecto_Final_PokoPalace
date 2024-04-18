<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumen de Compra</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>

    <body class="bg-gray-100">

        <div class="container mx-auto py-8">
            <h1 class="text-3xl font-bold mb-4">Resumen de Compra</h1>

            <h2 class="text-xl font-bold mb-2">Datos del Cliente</h2>
            <div class="grid grid-cols-2 gap-4 mb-6">
                <p><span class="font-semibold">Cédula:</span> ${cedula}</p>
                <p><span class="font-semibold">Nombres:</span> ${nombres}</p>
                <p><span class="font-semibold">Apellidos:</span> ${apellidos}</p>
                <p><span class="font-semibold">Email:</span> ${email}</p>
                <p><span class="font-semibold">Teléfono:</span> ${telefono}</p>
                <p><span class="font-semibold">Provincia:</span> ${provincia}</p>
                <p><span class="font-semibold">Cantón:</span> ${canton}</p>
                <p><span class="font-semibold">Distrito:</span> ${distrito}</p>
                <p><span class="font-semibold">Dirección:</span> ${direccion}</p>
            </div>

            <h2 class="text-xl font-bold mb-2">Detalle de la Compra</h2>
            <table class="w-full border-collapse border border-gray-300 mb-6">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="border border-gray-300 px-4 py-2">Producto</th>
                        <th class="border border-gray-300 px-4 py-2">Cantidad</th>
                        <th class="border border-gray-300 px-4 py-2">Precio Unitario</th>
                        <th class="border border-gray-300 px-4 py-2">Precio Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${carrito}" var="item">
                        <tr>
                            <td class="border border-gray-300 px-4 py-2">${item.producto.nombre}</td>
                            <td class="border border-gray-300 px-4 py-2">${item.cantidad}</td>
                            <td class="border border-gray-300 px-4 py-2">${item.producto.precio}</td>
                            <td class="border border-gray-300 px-4 py-2">${item.cantidad * item.producto.precio}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <p class="text-xl font-semibold">Total Pagado: ${total}</p>

            <div class="fixed top-4 left-4">
            <a href="./productos.jsp">
                <button class="group flex items-center justify-start w-16 h-16 bg-red-600 rounded-full cursor-pointer relative overflow-hidden transition-all duration-200 shadow-lg hover:w-36 hover:rounded-lg active:translate-x-1 active:translate-y-1">
                    <div class="flex items-center justify-center w-full transition-all duration-300 group-hover:justify-start group-hover:px-3">
                        <svg class="w-6 h-6" viewBox="0 0 512 512" fill="white">
                            <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path>
                        </svg>
                    </div>
                    <div class="absolute left-5 transform -translate-x-full opacity-0 text-white text-lg font-semibold transition-all duration-300 group-hover:translate-x-0 group-hover:opacity-100">
                        Volver a productos
                    </div>
                </button>
            </a>
        </div>

        </div>
    </body>
</html>
