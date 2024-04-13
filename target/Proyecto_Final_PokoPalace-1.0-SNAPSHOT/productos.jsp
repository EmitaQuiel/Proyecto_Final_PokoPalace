<%-- 
    Document   : productos
    Created on : 7 abr 2024, 16:32:52
    Author     : Emi
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" contenido="width=device-width, initial-scale=1.0" />
        <title>Poko Palace</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!-- Pokemon Slider Styles -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
            />
        <link
            rel="stylesheet prefetch"
            href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
            />
        <link
            rel="stylesheet prefetch"
            href="https://fonts.googleapis.com/css?family=Poppins:400,700"
            />
        <link rel="stylesheet" href="./css/style.css" />
    </head>
    <body>
        <header>
            <div class="header-container">
                <nav>
                    <a href="./index.jsp">Inicio</a>
                    <a href="./productos.jsp">Productos</a>
                    <a href="">Contacto</a>
                    <a id="cartLink" href="Carrito_Controlador?accion=listar"> <i class="fa fa-shopping-cart"></i> <span class="fw-bold">${sessionScope.carrito != null? sessionScope.carrito.size():0}</span> Carrito </a>

                </nav>

                
                <section>
                    <!-- Formulario de búsqueda -->
                    <form action="Carrito_Controlador" method="get">
                        <input type="hidden" name="accion" value="buscar">
                        <input type="text" name="nombreProducto" placeholder="Buscar producto por nombre">
                        <button type="submit">Buscar</button>
                    </form>

                    <!-- Mostrar los resultados de la búsqueda -->
                    <c:forEach items="${productos}" var="item">
                        <div class="cards-products">
                            <!-- Resto del código para mostrar cada producto -->
                        </div>
                    </c:forEach>
                </section>
            </div>

        </header>

        <main>



            <section class="dropdown-categorias-menu">
                <div class="dropdown categorias">
                    <form action="Carrito_Controlador" method="post">
                        <select name="categoria">
                            <option value="">Todos los productos</option> <!-- Esta opción representa seleccionar todos los productos -->
                            <option value="Peluche">Peluche</option>
                            <option value="Videojuego">Videojuego</option>
                            <option value="TCG">TCG</option>
                            <option value="Figuras">Figuras</option>
                            <option value="Consolas">Consolas</option>
                        </select>
                        <input type="hidden" name="accion" value="filtrar">
                        <input type="submit" value="Filtrar">
                    </form>
                </div>
            </section>


            <section class="contenedor-productos">
                <div class="cards-products">
                    <div class="container-products-principal">
                        <c:forEach items="${productos}" var="item" varStatus="loop">
                            <div class="container-products">
                                <form action="Carrito_Controlador" method="get">
                                    <div class="images">
                                        <img class="imagen-producto" src="assets/img/imagenes_productos/${item.imagen}" alt="${item.nombre}" />
                                    </div>
                                    <div class="product-card">
                                        <p>${item.nombreCategoria}</p>
                                        <h1>${item.nombre}</h1>
                                        <h2>₡${item.precio}</h2>
                                        <p class="desc">${item.descripcion}</p>
                                        <div class="buttons-product">
                                            <input type="hidden" name="accion" value="agregar">
                                            <input type="hidden" name="id" value="${item.idProd}">
                                            <button type="button" class="add" onclick="agregarAlCarrito(${item.idProd})">Agregar a Carrito</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Insertar un salto de línea después de cada tercer producto -->
                            <c:if test="${loop.index % 3 == 2}">
                                <div style="flex-basis: 100%; height: 0;"></div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </section>

            <c:if test="${totalPaginas > 1}">
                <div class="pagination">
                    <c:if test="${paginaActual > 1}">
                        <a href="Carrito_Controlador?accion=listar&pagina=1">&laquo; Primera</a>
                        <a href="Carrito_Controlador?accion=listar&pagina=${paginaActual - 1}">&lt; Anterior</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPaginas}" var="i">
                        <c:choose>
                            <c:when test="${i == paginaActual}">
                                <span class="current">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="Carrito_Controlador?accion=listar&pagina=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${paginaActual < totalPaginas}">
                        <a href="Carrito_Controlador?accion=listar&pagina=${paginaActual + 1}">Siguiente &gt;</a>
                        <a href="Carrito_Controlador?accion=listar&pagina=${totalPaginas}">Última &raquo;</a>
                    </c:if>
                </div>
            </c:if>
        </main>

        <script>
            function agregarAlCarrito(idProducto) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Manejar la respuesta del servlet aquí
                        alert("Producto agregado al carrito");

                        // Actualizar el número de elementos en el carrito en el enlace
                        var cartLink = document.getElementById("cartLink");
                        var cartItemCount = parseInt(cartLink.querySelector(".fw-bold").innerText); // Obtener el número actual de elementos en el carrito
                        cartLink.querySelector(".fw-bold").innerText = cartItemCount + 1; // Incrementar el número de elementos en 1
                    }
                };
                xhttp.open("GET", "Carrito_Controlador?accion=agregar&id=" + idProducto, true);
                xhttp.send();
            }

            function mostrarLogin() {
                // Aquí puedes mostrar un formulario de inicio de sesión
                console.log("Mostrando formulario de inicio de sesión...");
            }

            function mostrarRegistro() {
                // Aquí puedes mostrar un formulario de registro
                console.log("Mostrando formulario de registro...");
            }

        </script>

        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="./js/funcionalidades_index.js"></script>
        <script src="./js/funcionalidades_productos_pagina.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"
        ></script>
    </body>
</html>

