
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <li class="modern-nav-items"><a id="cartLink" href="Carrito_Controlador?accion=listar"><span class="link-text">Carrito&nbsp;&nbsp;</span><i class="fa-solid fa-cart-shopping"></i> <span class="fw-bold">${sessionScope.carrito != null? sessionScope.carrito.size():0}</span></a></li>
                    <li class="modern-nav-items dropdown">
                        <a href="#" class="dropbtn"><span class="link-text">Cuenta</span><i class="fa-solid fa-user"></i></a>
                        <div class="dropdown-content">
                            <a href="./iniciarSesion.jsp">Iniciar Sesión</a>
                            <a href="./registrarse.jsp">Registrarse</a>
                        </div>
                    </li>
                </ul>
                <form action="Carrito_Controlador" method="get" class="search-form">
                    <input type="hidden" name="accion" value="buscar">
                    <input type="text" name="nombreProducto" placeholder="Buscar producto por nombre">
                    <button type="submit"><i class="fa-solid fa-chevron-right ok"></i></button>
                </form>
            </nav>
        </header>


        <main>


            <div id="overlay" style="display: none;"></div>
            <form id="filterForm" action="Carrito_Controlador" method="post">
                <div class="filterbody">
                    <div class="filtertabs">
                        <input checked="" value="" name="categoria" id="todos" type="radio" class="input" />
                        <label for="todos" class="filterlabel">Todos</label>
                        <input value="Peluche" name="categoria" id="peluche" type="radio" class="input" />
                        <label for="peluche" class="filterlabel">Peluches</label>
                        <input value="Videojuego" name="categoria" id="videojuego" type="radio" class="input" />
                        <label for="videojuego" class="filterlabel">Videojuegos</label>
                        <input value="TCG" name="categoria" id="tcg" type="radio" class="input" />
                        <label for="tcg" class="filterlabel">TCG</label>
                        <input value="Figuras" name="categoria" id="figuras" type="radio" class="input" />
                        <label for="figuras" class="filterlabel">Figuras</label>
                        <input value="Consolas" name="categoria" id="consolas" type="radio" class="input" />
                        <label for="consolas" class="filterlabel">Consolas</label>
                    </div>
                </div>
                <input type="hidden" name="accion" value="filtrar">
            </form>



            <div id="loader" class="spinner" style="display:none;">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
            
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

        <script>
            const filterLabels = document.querySelectorAll('.filterlabel');
            filterLabels.forEach(label => {
                label.addEventListener('click', function () {
                    const category = this.getAttribute('for');
                    document.getElementById(category).checked = true;
                    document.getElementById('overlay').style.display = 'block'; // Mostrar overlay
                    document.getElementById('loader').style.display = 'block'; // Mostrar loader
                    // Agregar un retraso de 2 segundos (2000 milisegundos) antes de ocultar el overlay y el loader
                    setTimeout(function () {
                        document.getElementById('overlay').style.display = 'none'; // Ocultar overlay
                        document.getElementById('loader').style.display = 'none'; // Ocultar loader
                        // Enviar el formulario después de ocultar el overlay y el loader
                        document.getElementById('filterForm').submit();
                    }, 2000);
                });
            });
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

