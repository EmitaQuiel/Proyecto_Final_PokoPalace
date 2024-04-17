<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
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
                    <li class="modern-nav-items"><a href="./productos.jsp"><span class="link-text">Productos</span><i class="fa-solid fa-store"></i></a></li>
                    <li class="modern-nav-items"><a href=""><span class="link-text">Contacto</span><i class="fa-solid fa-user"></i></a></li>
                    <li class="modern-nav-items"><a id="cartLink" href="Carrito_Controlador?accion=listar"><span class="link-text">Carrito&nbsp;&nbsp;</span><i class="fa-solid fa-cart-shopping"></i> <span class="fw-bold"> ${sessionScope.carrito != null? sessionScope.carrito.size():0}</span></a></li>
                </ul>
                <form action="Carrito_Controlador" method="get" class="search-form">
                    <input type="hidden" name="accion" value="buscar">
                    <div class="search-container">
                        <input type="text" name="nombreProducto" class="search-input" placeholder="Busca un producto...">
                        <button type="submit" class="search-button"><i class="fa-solid fa-search"></i></button>
                    </div>
                </form>
            </nav>
        </header>


        <main>
            <style>
                h1, h2, h3, h4, h5, h6 {
                    font-family: 'Inter', sans-serif;
                    --font-sans: 'Inter';
                }
                body {
                    font-family: 'Inter', sans-serif;
                    --font-sans: 'Inter';
                    background-color: black;
                    margin: 150px;
                }
            </style>

            <div class="rounded-lg border bg-card text-card-foreground shadow-sm w-full max-w-4xl mx-auto" data-v0-t="card">
                <div class="flex-col space-y-1.5 p-6 flex gap-4">
                    <h3 class="whitespace-nowrap text-2xl font-semibold leading-none tracking-tight">Resumen de Productos</h3>

                </div>
                <div class="p-6">
                    <div class="relative w-full overflow-auto">
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&amp;_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 w-[100px]">
                                        Imagen
                                    </th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                                        Producto
                                    </th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                                        Precio
                                    </th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                                        Cantidad
                                    </th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                                        Total
                                    </th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 w-1"></th>
                                </tr>
                            </thead>
                            <tbody class="[&amp;_tr:last-child]:border-0">
                                <c:forEach items="${carrito}" var="item" varStatus="loop">
                                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                        <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                            <img src="assets/img/imagenes_productos/${item.producto.imagen}" alt="Product image" width="80" height="80" class="aspect-square overflow-hidden" />
                                        </td>
                                        <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-semibold">${item.producto.nombre}</td>
                                        <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${item.producto.precio}</td>
                                        <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${item.cantidad}</td>
                                        <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">${item.importe()}</td>
                                        <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-[0.9]">

                                            <form action="Carrito_Controlador" method="post">
                                                <input type="hidden" name="accion" value="disminuir">
                                                <input type="hidden" name="indice" value="${loop.index}">
                                                <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4">
                                                    <path d="M5 12h14"></path>
                                                    </svg>
                                                    <span class="sr-only">Decrease</span>
                                                </button> 
                                            </form>
                                            <form action="Carrito_Controlador" method="post">
                                                <input type="hidden" name="accion" value="aumentar">
                                                <input type="hidden" name="indice" value="${loop.index}">
                                                <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4">
                                                    <path d="M5 12h14"></path>
                                                    <path d="M12 5v14"></path>
                                                    </svg>
                                                    <span class="sr-only">Increase</span>
                                                </button>
                                            </form>

                                            <button class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10">
                                                <a href="Carrito_Controlador?accion=eliminar&indice=${loop.index}" title="Eliminar">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4">
                                                    <path d="M3 6h18"></path>
                                                    <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
                                                    <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
                                                    </svg>
                                                    <span class="sr-only">Delete</span>
                                                </a>
                                            </button>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="p-6 flex items-center gap-4">
                    <a href="Carrito_Controlador?accion=vaciar" class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-white text-black hover:bg-gray-300 hover:text-black h-9 rounded-md px-3">
                        <i class="fas fa-trash-alt"></i>
                        <span class="ml-2">Vaciar Carrito</span>
                    </a>




                    <div class="ml-auto flex items-center gap-4">
                        <div class="text-sm">¿Tiene un codigo de descuento?</div>
                        <input class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-[100px]" placeholder="Enter code" type="text" />
                        <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-white text-black hover:bg-gray-300 hover:text-black h-9 rounded-md px-3">
                            <i class="fas fa-tag"></i>
                            <span class="ml-2">Aplicar</span>
                        </button>


                    </div>
                </div>
                <div class="flex items-center p-6">
                    <div class="grid grid-cols-2 items-center gap-4 text-sm">
                        <div class="flex items-center gap-2">
                            <div>Subtotal</div>
                            <div class="ml-auto">₡ ${total}</div>
                        </div>
                        <form action="informacion_compra.jsp" method="post">
                            <button type="submit" name="accion" value="generarCompra" class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-white text-black hover:bg-gray-300 hover:text-black h-11 rounded-md px-8 w-full">
                                <i class="fas fa-money-check"></i>
                                <span class="ml-2">Procesar Pago</span>
                            </button>

                        </form>

                    </div>
                </div>
            </div>


        </main>



    </body>
</html>
