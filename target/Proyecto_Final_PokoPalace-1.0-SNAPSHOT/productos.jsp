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
            <nav>
                <a href="">Inicio</a>
                <a href="">Productos</a>
                <a href="">Sobre Nosotros</a>
                <a href="">Descuentos</a>
                <a href="">Contacto</a>
                <a href="Carrito_Controlador?accion=listar"> <i class="fa fa-shopping-cart"></i> <span class="fw-bold">${sessionScope.carrito != null? sessionScope.carrito.size():0}</span> Carrito </a>
            </nav>

            <li class="nav-item dropdown">
                <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                    >
                    Iniciar Sesion
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="#" class="btn btn-dark"
                           ><i class="fas fa-user-lock"></i> Login</a
                        >
                    </li>
                    <li><hr class="dropdown-divider" /></li>
                    <li>
                        <a class="dropdown-item" href="#" class="btn btn-dark"
                           ><i class="fas fa-user-plus"></i> Registrarse</a
                        >
                    </li>

                </ul>
            </li>
        </header>

        <main>
            <section>
                <div class="contenedor-productos">
                    <div class="slider-pokemon">
                        <div
                            class="contenedor_flexible flex--pikachu Flex_activo"
                            data-slide="1"
                            >
                            <div class="Flex_objeto Flex_objeto--left">
                                <div class="Flex_contenido">
                                    <p class="text--sub">Pokemon Gen I</p>
                                    <h1 class="text--big">Pikachu</h1>
                                    <p class="text--normal">
                                        Pikachu is an Electric-type Pokémon introduced in Generation
                                        I. Pikachu are small, chubby, and incredibly cute mouse-like
                                        Pokémon. They are almost completely covered by yellow fur.
                                    </p>
                                </div>
                                <p class="text__background">Pikachu</p>
                            </div>
                            <div class="Flex_objeto Flex_objeto--right"></div>
                            <img
                                class="pokemon__img"
                                src="../assets/img/Charizard_SSBU.webp"
                                />
                        </div>
                        <div
                            class="contenedor_flexible flex--piplup animate--start"
                            data-slide="2"
                            >
                            <div class="Flex_objeto Flex_objeto--left">
                                <div class="Flex_contenido">
                                    <p class="text--sub">Pokemon Gen IV</p>
                                    <h1 class="text--big">Piplup</h1>
                                    <p class="text--normal">
                                        Piplup is the Water-type Starter Pokémon of the Sinnoh
                                        region. It was introduced in Generation IV. Piplup has a
                                        strong sense of self-esteem. It seldom accepts food that
                                        people give because of its pride.
                                    </p>
                                </div>
                                <p class="text__background">Piplup</p>
                            </div>
                            <div class="Flex_objeto Flex_objeto--right"></div>
                            <img
                                class="pokemon__img"
                                src="https://s4.postimg.org/sa9dl4825/pilup.png"
                                />
                        </div>
                        <div
                            class="contenedor_flexible flex--blaziken animate--start"
                            data-slide="3"
                            >
                            <div class="Flex_objeto Flex_objeto--left">
                                <div class="Flex_contenido">
                                    <p class="text--sub">Pokemon Gen III</p>
                                    <h1 class="text--big">Blaziken</h1>
                                    <p class="text--normal">
                                        Blaziken is the Fire/Fighting-type Starter Pokémon of the
                                        Hoenn region, introduced in Generation III. Blaziken is a
                                        large, bipedal, humanoid bird-like Pokémon that resembles a
                                        rooster.
                                    </p>
                                </div>
                                <p class="text__background">Blaziken</p>
                            </div>
                            <div class="Flex_objeto Flex_objeto--right"></div>
                            <img
                                class="pokemon__img"
                                src="https://s4.postimg.org/6795hnlql/blaziken.png"
                                />
                        </div>
                        <div
                            class="contenedor_flexible flex--dialga animate--start"
                            data-slide="4"
                            >
                            <div class="Flex_objeto Flex_objeto--left">
                                <div class="Flex_contenido">
                                    <p class="text--sub">Pokemon Gen IV</p>
                                    <h1 class="text--big">Dialga</h1>
                                    <p class="text--normal">
                                        Dialga is a Steel/Dragon-type Legendary Pokémon. Dialga is a
                                        sauropod-like Pokémon. It is mainly blue with some gray,
                                        metallic portions, such as its chest plate, which has a
                                        diamond in the center. It also has various, light blue lines
                                        all over its body.
                                    </p>
                                </div>
                                <p class="text__background">Dialga</p>
                            </div>
                            <div class="Flex_objeto Flex_objeto--right"></div>
                            <img
                                class="pokemon__img"
                                src="https://s4.postimg.org/43yq9zlxp/dialga.png"
                                />
                        </div>
                        <div
                            class="contenedor_flexible flex--zekrom animate--start"
                            data-slide="5"
                            >
                            <div class="Flex_objeto Flex_objeto--left">
                                <div class="Flex_contenido">
                                    <p class="text--sub">Pokemon Gen V</p>
                                    <h1 class="text--big">Zekrom</h1>
                                    <p class="text--normal">
                                        Zekrom is a Dragon/Electric-type Legendary Pokémon. It is
                                        part of the Tao Trio, along with Reshiram and Kyurem. Zekrom
                                        is a large, black draconian Pokémon that seems to share its
                                        theme with its counterpart, Reshiram. It has piercing red
                                        eyes and dark gray to black skin that seems to be
                                        armor-like.
                                    </p>
                                </div>
                                <p class="text__background">Zekrom</p>
                            </div>
                            <div class="Flex_objeto Flex_objeto--right"></div>
                            <img
                                class="pokemon__img"
                                src="https://s4.postimg.org/malmhgn9p/zekrom.png"
                                />
                        </div>
                    </div>

                    <div class="slider__navi">
                        <a href="#" class="slide-nav active" data-slide="1">pikachu</a>
                        <a href="#" class="slide-nav" data-slide="2">piplup</a>
                        <a href="#" class="slide-nav" data-slide="3">blaziken</a>
                        <a href="#" class="slide-nav" data-slide="4">dialga</a>
                        <a href="#" class="slide-nav" data-slide="5">zekrom</a>
                    </div>
                </div>

                <section>
                    <c:forEach items="${productos}" var="item">
                        <form action="Carrito_Controlador" method="get">
                            <div class="cards-products">
                                <div class="container-products-principal">
                                    <div class="container-products">
                                        <div class="images">
                                            <img
                                                class="imagen-producto"
                                                src="assets/img/imagenes_productos/${item.imagen}"
                                                alt="${item.nombre}"/>
                                        </div>
                                        <div class="product-card">
                                            <p>${item.idCategoria}</p>
                                            <h1>${item.nombre}</h1>
                                            <h2>₡${item.precio}</h2>
                                            <p class="desc">
                                                ${item.descripcion}
                                            </p>
                                            <div class="buttons-product">
                                                <input type="hidden" name="accion" value="agregar">
                                                <input type="hidden" name="id" value="${item.idProd}">
                                                <button type="submit" class="add">Agregar a Carrito</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </section>

        </main>
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="./js/main.js"></script>
        <script src="./js/m.js"></script>
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

