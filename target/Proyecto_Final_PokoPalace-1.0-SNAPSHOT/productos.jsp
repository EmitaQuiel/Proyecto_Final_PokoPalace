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
        <link rel="stylesheet" href="./css/style.css"/>
    </head>
    <body>
        <header style="background-color: white;">
            <div class="header-container">
                <nav>
                    <a href="./index.jsp">Inicio</a>
                    <a href="./productos.jsp">Productos</a>
                    <a href="">Contacto</a>
                    <a id="cartLink" href="Carrito_Controlador?accion=listar"> <i class="fa fa-shopping-cart"></i> <span class="fw-bold">${sessionScope.carrito != null? sessionScope.carrito.size():0}</span> Carrito </a>

                </nav>

                
                <section>
                    
                    <form action="Carrito_Controlador" method="get">
                        <input type="hidden" name="accion" value="buscar">
                        <input type="text" name="nombreProducto" placeholder="Buscar producto por nombre">
                        <button type="submit">Buscar</button>
                    </form>
                </section>
            </div>

        </header>

        <main>

            <section class="dropdown-categorias-menu">
                <div class="dropdown categorias">
                    <form action="Carrito_Controlador" method="post">
                        <select name="categoria">
                            <option value="">Todos los productos</option> 
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


            <c:forEach items="${productos}" var="item">
                <section id="emicard">
                    <div class="emicard">
                        <div class="emicard-image">
                            <img class="imagen-producto" src="assets/img/imagenes_productos/${item.imagen}" alt="${item.nombre}" />
                        </div>
                        <div class="emicard-title">
                            <h2>${item.nombre}</h2>
                        </div>
                        <div class="emicard-detail">
                            <h3>${item.nombreCategoria} | <span class="date">Stock: ${item.stock}</span></h3>
                        </div>
                        <div class="emicard-text">
                            <p>${item.descripcion}</p>
                        </div>
                        <div class="emicard-product-price">
                            <p>₡<span>${item.precio}</span></p>
                            <form action="Carrito_Controlador" method="get">
                                <input type="hidden" name="accion" value="agregar">
                                <input type="hidden" name="id" value="${item.idProd}">
                                <button type="button" onclick="agregarAlCarrito(${item.idProd})">Añadir</button>
                            </form>
                        </div>
                    </div>
                </section>

                <c:if test="${loop.index % 3 == 2}">
                    <div style="flex-basis: 100%; height: 0;"></div>
                </c:if>
            </c:forEach>


            
        </main>

        <script>
            function agregarAlCarrito(idProducto) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        
                        alert("Producto agregado al carrito");

                        
                        var cartLink = document.getElementById("cartLink");
                        var cartItemCount = parseInt(cartLink.querySelector(".fw-bold").innerText);
                        cartLink.querySelector(".fw-bold").innerText = cartItemCount + 1; 
                    }
                };
                xhttp.open("GET", "Carrito_Controlador?accion=agregar&id=" + idProducto, true);
                xhttp.send();
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

