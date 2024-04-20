
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" contenido="width=device-width, initial-scale=1.0" />
        <title>Poko Palace</title>
        <link
            rel="stylesheet"
            href="./bootstrap-5.3.2-dist/css/bootstrap.min.css"
            />
        <script src="./bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="./bootstrap-5.3.2-dist/css/bootstrap-grid.css"></script>
        <script src="https://unpkg.com/scrollreveal"></script>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/style.css"/>
    </head>
    <body>
        <header id="home">
            <nav class="modern-navbar">
                <div class="modern-logo">
                    <a href="./index.jsp"><img src="./assets/img/logoPokoPalace.png" alt="logo" style="max-width: 100px; max-height: 70px;"></a> 
                </div>
                <ul class="modern-nav">
                    <li class="modern-nav-items"><a href="./productos.jsp"><span class="link-text">Productos</span><i class="fa-solid fa-store"></i></a></li>
                    <li class="modern-nav-items"><a href="#about"><span class="link-text">Sobre nosotros</span><i class="fa-solid fa-info-circle"></i></a></li>
                    <li class="modern-nav-items"><a href="#discover"><span class="link-text">Figuras</span><i class="fa-solid fa-swatchbook"></i></a></li>
                    <li class="modern-nav-items"><a href="#app"><span class="link-text">Cartas</span><i class="fa-solid fa-scroll"></i></a></li>
                    <li class="modern-nav-items"><a href="#blog"><span class="link-text">Exclusivos</span><i class="fa-solid fa-gem"></i></a></li>
                    <li class="modern-nav-items"><a href="#journals"><span class="link-text">Ultimos Lanzamientos</span><i class="fa-solid fa-rocket"></i></a></li>
                    <li class="modern-nav-items"><a href="#gallery"><span class="link-text">Soulsborne</span><i class="fa-solid fa-users"></i></a></li>
                    <li class="modern-nav-items"><a href="#razones"><span class="link-text">Noticias</span><i class="fa-solid fa-newspaper"></i></a></li>
                </ul>
                <form action="Carrito_Controlador" method="get" class="search-form">
                    <input type="hidden" name="accion" value="buscar">
                    <div class="search-container">
                        <input type="text" name="nombreProducto" class="search-input" placeholder="Busca un producto...">
                        <button type="submit" class="search-button"><i class="fa-solid fa-search"></i></button>
                    </div>
                </form>
            </nav>

            <div class="section__container header__container">
                <div class="video-background">
                    <video autoplay muted loop id="video-background">
                        <source src="./assets/video/ds_header.mp4" type="video/mp4" />
                    </video>
                    <div class="video-overlay"></div>
                </div>
                <h1 style="color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
                    Tu puerta de entrada al mundo del entretenimiento. Descubre la magia de los juegos y la tecnología.
                </h1>
                <h4 style="color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Poko Palace</h4>
            </div>
        </header>

        <section class="about" id="about">
            <div class="section__container about__container">
                <div class="about__content">
                    <h2 class="section__header">Sobre nosotros</h2>
                    <p class="section__subheader">
                        En Poko Palace nos dedicamos a proporcionarte una experiencia de entretenimiento incomparable. Somos apasionados por los juegos, la tecnología y la diversión sin límites. Desde los clásicos de Nintendo hasta las encantadoras creaciones de Sanrio, nuestra tienda en línea ofrece una amplia selección de productos que abarcan desde consolas de última generación hasta accesorios únicos.
                        <br />
                        <br />
                        Nos enorgullece ofrecer productos de alta calidad y un servicio al cliente excepcional. Ya sea que estés buscando el último lanzamiento de Nintendo Switch, un regalo adorable de Sanrio o simplemente quieras explorar nuevas aventuras digitales, estamos aquí para ayudarte a encontrar exactamente lo que necesitas.
                    </p>
                    <div class="about__flex">
                        <div class="about__card">
                            <h4>5</h4>
                            <p>Años de exp</p>
                        </div>
                        <div class="about__card">
                            <h4>+50k</h4>
                            <p>de ventas</p>
                        </div>
                        <div class="about__card">
                            <h4>+150</h4>
                            <p>productos</p>
                        </div>
                    </div>
                </div>
                <div class="about__image">
                    <img src="./assets/img/sobrenosotros.png" alt="about" />
                </div>
            </div>
        </section>

        <section class="discover" id="discover">
            <div class="section__container discover__container">
                <h2 class="section__header">¡Figuras mas exclusivas!</h2>
                <p class="section__subheader">
                    Un repaso a las esculturas mas deseadas por nuestros clientes
                </p>
                <div class="discover__grid">
                    <div class="discover__card">
                        <div class="discover__image">
                            <img src="./assets/img/figura4.png" alt="discover"
                                 class="small-image" />
                        </div>
                        <div class="discover__card__content">
                            <h4>Artorias</h4>
                            <p>
                                Explora el misterio y la oscuridad con la figura de Artorias, el legendario Caballero Abisal. Con su espada maldita y su aura de tragedia, Artorias es un símbolo de nobleza y sacrificio en el mundo de Dark Souls. Hazte con esta figura y adéntrate en las sombras de Lordran.
                            </p>
                        </div>
                    </div>
                    <div class="discover__card">
                        <div class="discover__image">
                            <img src="./assets/img/figura1.png" alt="discover" />
                        </div>
                        <div class="discover__card__content">
                            <h4>Guts</h4>
                            <p>
                                Descubre la imponente figura de Guts, el guerrero legendario. Con su espada masiva y su determinación inquebrantable, Guts es un símbolo de fuerza y valentía en el campo de batalla. Llévate a casa esta figura y añade el poderío de Guts a tu colección.
                            </p>
                        </div>
                    </div>
                    <div class="discover__card">
                        <div class="discover__image">
                            <img src="./assets/img/figura2.png" alt="discover" />
                        </div>
                        <div class="discover__card__content">
                            <h4>El Cazador</h4>
                            <p>
                                Adéntrate en el mundo de pesadilla con la figura del Cazador de Bloodborne. Con su sombrío atuendo y su arsenal de armas, el Cazador es una fuerza imparable en la lucha contra las criaturas de la noche. Añade esta figura a tu colección y prepárate para cazar bestias en las calles de Yharnam.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <h2 class="section__header" id="categorias_pagina">Categorias</h2>
        <p class="section__subheader">
            ¡Explora nuestras distintas categorias!
        </p>
        <section class="categorycont">
            <div class="cardcategory">
                <div class="contentcategory">
                    <h2 class="titlecategory">Peluches</h2>
                </div>
            </div>
            <div class="cardcategory">
                <div class="contentcategory">
                    <h2 class="titlecategory">Consolas</h2>
                </div>
            </div>
            <div class="cardcategory">
                <div class="contentcategory">
                    <h2 class="titlecategory">TCG</h2>
                </div>
            </div>
            <div class="cardcategory">
                <div class="contentcategory">
                    <h2 class="titlecategory">Videojuegos</h2>
                </div>
            </div>
            <div class="cardcategory">
                <div class="contentcategory">
                    <h2 class="titlecategory">Figuras</h2>
                </div>
            </div>
        </section>

        <br>
        <br>
        <br>
        <h2 class="section__header">Nuestras cartas</h2>
        <p class="section__subheader">
            Entre estas cartas, algunas se destacan como las más buscadas, cautivando tanto a jugadores como a coleccionistas con su rareza, diseño y poder en el juego.
        </p>
        <section class="mostrar-cartas" id="app">
            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_arceus.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_charizard.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_dragapult.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_eevee.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_giratina.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_greninja.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_lugia.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_mewtwo_v.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_moltres.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_pikachu.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_poliwhirl.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_rayquaza.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_reshiram.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_sylveon.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_trio.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_umbreon.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_zekrom.jpg">
            </div>

            <div class="card-pokemon">
                <img src="./assets/img/Cards/card_zoroark.jpg">
            </div>

            <style class="hover"></style>
        </section>

        <section class="blogs" id="blog">
            <div class="blogs__container">

                <h2 class="section__header">Exclusivos del momento</h2>

                <p class="section__subheader">
                    ¡Consigue los ultimos exclusivos de las consolas actuales!
                </p>
                <div class="blogs__grid">
                    <div class="blogs__card">
                        <img src="./assets/img/exclusivo1.webp" alt="blog" />
                        <div class="blogs__content">
                            God of War
                        </div>
                    </div>
                    <div class="blogs__card">
                        <img src="./assets/img/exclusivo2.png" alt="blog" />
                        <div class="blogs__content">
                            Final Fantasy XVI
                        </div>
                    </div>
                    <div class="blogs__card">
                        <img src="./assets/img/exclusivo3.jpg" alt="blog" />
                        <div class="blogs__content">
                            Horizon Forbidden West
                        </div>
                    </div>
                    <div class="blogs__card">
                        <img src="./assets/img/exclusivo4.avif" alt="blog" />
                        <div class="blogs__content">
                            The Last of Us II
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="journals" id="journals">
            <div class="section__container journals__container">
                <h2 class="section__header">Ultimos lanzamientos</h2>
                <p class="section__subheader">
                    ¡Los ultimos lanzamientos de videojuegos en PS4, PS5, Nintendo Switch, Xbox Series X y más!
                </p>
                <div class="journals__grid">
                    <div class="journals__card">
                        <img src="./assets/img/juego_stellarblade.png" alt="journal" />
                        <div class="journals__content">
                            <h4>Stellar Blade</h4>
                            <div class="journals__footer">
                                <p>Salva a la humanidad de la extinción y descubre la verdad en esta electrizante historia de acción y aventura.</p>
                            </div>
                        </div>
                    </div>
                    <div class="journals__card">
                        <img src="./assets/img/juego_ghostoftsushima.png" alt="journal" />
                        <div class="journals__content">
                            <h4>Ghost of Tsushima</h4>
                            <div class="journals__footer">
                                <p>Aventura ambientada en el Japón feudal y en el que un samurái trata de hacer frente a la invasión del ejército mongol.</p>
                            </div>
                        </div>
                    </div>
                    <div class="journals__card">
                        <img src="./assets/img/juego_riseoftheronin.png" alt="journal" />
                        <div class="journals__content">
                            <h4>Rise of the Ronin</h4>
                            <div class="journals__footer">
                                <p>Se nos trasladará al Japón del 1863, justo después de tres siglos de opresión por parte del shogunato Tokugawa. </p>
                            </div>
                        </div>
                    </div>
                    <div class="journals__card">
                        <img src="./assets/img/juego_luigimansion2_1.jpg" alt="journal" />
                        <div class="journals__content">
                            <h4>Luigi Mansion 2 HD</h4>
                            <div class="journals__footer">
                                <p>Rescata a Mario del Rey Boo y recuperar los fragmentos de Dark Moon, un objeto que puede calmar a los fantasmas.</p>
                            </div>
                        </div>
                    </div>
                    <div class="journals__card">
                        <img src="./assets/img/juego_peach.jpg" alt="journal" />
                        <div class="journals__content">
                            <h4>Princess Peach Showtime!</h4>
                            <div class="journals__footer">
                                <p>Ayuda a Peach a salvar el Teatro Esplendor de las garras de la malvada Grape y la Compañía Malaúva.</p>
                            </div>
                        </div>
                    </div>
                    <div class="journals__card">
                        <img src="./assets/img/juego_anothercode.jpg" alt="journal" />
                        <div class="journals__content">
                            <h4>Another Code</h4>
                            <div class="journals__footer">
                                <p>Juego de resolución de misterios en donde una joven llamada Ashley debe resolver los misterios de su pasado.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="gallery" id="gallery">
            <div class="gallery__container">
                <h2 class="section__header">Saga Soulsborne</h2>
                <p class="section__subheader">
                    Consigue la coleccion completa y explora este oscuro mundo poniendo a prueba tu habilidad
                </p>
                <div class="gallery__grid">
                    <div class="gallery__card">
                        <img src="./assets/img/cover1.jpg" alt="gallery" />
                        <div class="gallery__content">
                            <h4>Dark Souls 1</h4>
                        </div>
                    </div>
                    <div class="gallery__card">
                        <img src="./assets/img/cover2.jpg" alt="gallery" />
                        <div class="gallery__content">
                            <h4>Dark Souls 2</h4>
                        </div>
                    </div>
                    <div class="gallery__card">
                        <img src="./assets/img/cover3.jpg" alt="gallery" />
                        <div class="gallery__content">
                            <h4>Dark Souls 3</h4>
                        </div>
                    </div>
                    <div class="gallery__card">
                        <img src="./assets/img/cover4.webp" alt="gallery" />
                        <div class="gallery__content">
                            <h4>Elden Ring</h4>
                        </div>
                    </div>
                    <div class="gallery__card">
                        <img src="./assets/img/cover5.jpg" alt="gallery" />
                        <div class="gallery__content">
                            <h4>Bloodborne</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div id="razones" class="projcard-container">
            <h2 class="section__header">Ultimas Noticias</h2>
            <div class="projcard projcard-blue">
                <div class="projcard-innerbox">
                    <img class="projcard-img" src="./assets/img/noticia1.jpeg" />
                    <div class="projcard-textbox">
                        <div class="projcard-title">Genshin Impact</div>
                        <div class="projcard-subtitle">
                            Cuatro años después de su lanzamiento, Genshin Impact ha roto una importante tradición. La próxima actualización no traerá de vuelta un personaje muy esperado 
                        </div>
                        <div class="projcard-bar"></div>
                        <div class="projcard-description">
                            Los arcontes o líderes de cada región siempre habían regresado a los banners cuatro parches después de su estreno. Era una costumbre que se había cumplido desde el lanzamiento de Venti y que permitía a los usuarios planificar su gasto de recursos. Sin embargo, el retraso en el 'rerun' de Furina ha acabado con la tradición.
                        </div>
                    </div>
                </div>
            </div>

            <div class="projcard projcard-red">
                <div class="projcard-innerbox">
                    <img class="projcard-img" src="./assets/img/noticia3.jpeg" />
                    <div class="projcard-textbox">
                        <div class="projcard-title">Fallout</div>
                        <div class="projcard-subtitle">
                            Se veía venir, y Bethesda lo celebra. La serie de Fallout ha provocado que los juegos hayan resucitado en Steam con un incremento de muchos jugadores
                        </div>
                        <div class="projcard-bar"></div>
                        <div class="projcard-description">
                            Llevamos hablando varios días de Fallout de Prime Video, una obra que los jugadores han visto y con la que casi todos están encantados. Sin embargo, ya es hora de hablar de sus videojuegos y de lo bien que le ha venido a la franquicia de Bethesda el estreno de la serie. Ahora es el momento de centrarse en la saga RPG.
                        </div>
                    </div>
                </div>
            </div>

            <div class="projcard projcard-green">
                <div class="projcard-innerbox">
                    <img class="projcard-img" src="./assets/img/noticia2.jpeg" />
                    <div class="projcard-textbox">
                        <div class="projcard-title">Blizzard</div>
                        <div class="projcard-subtitle">
                            Muchos están en total desacuerdo, pero el exdirectivo de Xbox y Blizzard propone que los jugadores puedan dar propinas para tus juegos favoritos
                        </div>
                        <div class="projcard-bar"></div>
                        <div class="projcard-description">
                            ¿Alguna te ha pasado que has comprado un juego a precio completo, te lo has pasado, se ha convertido en uno de tus favoritos y has pensado que has pagado poco por él? Posiblemente sí, y la propuesta del expresidente de Blizzard, Mike Ybarra, va en esa dirección, planteando algo que no gustará a todo el mundo.
                        </div>
                    </div>
                </div>
            </div>

            <div class="projcard projcard-customcolor" style="--projcard-color: #f5af41">
                <div class="projcard-innerbox">
                    <img class="projcard-img" src="./assets/img/noticia4.webp" />
                    <div class="projcard-textbox">
                        <div class="projcard-title">The Legend of Zelda: Ocarina of Time</div>
                        <div class="projcard-subtitle">
                            El uso de la primera persona podría haber arruinado uno de los mejores juegos de la historia. Zelda Ocarina of Time 
                        </div>
                        <div class="projcard-bar"></div>
                        <div class="projcard-description">
                            Resulta sorprendente, pero está perfectamente documentado que Miyamoto propuso inicialmente la idea de que Ocarina of Time se jugara desde la primera persona, como si fuese un FPS. El gurú así lo manifestó en una edición de Iwata Pregunta, reflexionando sobre que siempre le llamaban la atención estos juegos.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="section service" aria-label="service">
            <div class="container">
                <ul class="grid-list flex-container">

                    <li>
                        <div class="service-card">

                            <figure class="card-icon">
                                <i class="fas fa-truck" style="color: #ff7f7f; font-size: 48px;"></i>
                            </figure>

                            <h3 class="h3 card-title">Envios Gratis a todo el pais</h3>

                            <p class="card-text">
                                ¡Haz tu pedido el primer dia del mes y sera absolutamente gratis! </p>

                        </div>
                    </li>

                    <li>
                        <div class="service-card">

                            <figure class="card-icon">
                                <i class="far fa-calendar-alt" style="color: #ff7f7f; font-size: 48px;"></i>
                            </figure>

                            <h3 class="h3 card-title">30 Dias de devolución</h3>

                            <p class="card-text">
                                Luego de tu primera compra tienes 30 dias de devolución.
                            </p>

                        </div>
                    </li>

                    <li>
                        <div class="service-card">

                            <figure class="card-icon">
                                <i class="fas fa-shield-alt" style="color: #ff7f7f; font-size: 48px;"></i>
                            </figure>

                            <h3 class="h3 card-title">Seguridad de Pago</h3>

                            <p class="card-text">
                                ¡Contamos con amplia experiencia y sellos de seguridad!
                            </p>

                        </div>
                    </li>

                    <li>
                        <div class="service-card">

                            <figure class="card-icon">
                                <i class="far fa-comments" style="color: #ff7f7f; font-size: 48px;"></i>
                            </figure>

                            <h3 class="h3 card-title" >Soporte 24 horas en linea</h3>

                            <p class="card-text">
                                DM's abiertos en todas nuestras redes 24/7.
                            </p>

                        </div>
                    </li>

                </ul>

            </div>
        </section>

        <footer>
            <div class="footer-container">
                <div class="footer-row">
                    <div class="footer-col" id="company">
                        <img src="./assets/img/logopokopalace-blanco (2).png" alt="" class="footer-logo">
                        <p>
                            Tu puerta de entrada al mundo del entretenimiento. Descubre la magia de los juegos y la tecnología. 
                        </p>
                        <div class="footer-social">
                            <a href="https://www.facebook.com/?locale=es_LA"><i class="fab fa-facebook"></i></a>
                            <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                            <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
                            <a href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                            <a href="https://www.linkedin.com/"><i class="fab fa-linkedin"></i></a>
                        </div>
                    </div>


                    <div class="footer-col" id="services">
                        <h3>Servicios</h3>
                        <div class="footer-links">
                            <a href="./index.jsp">Inicio</a>
                            <a href="./productos.jsp">Productos</a>
                            <a href="#categorias_pagina">Categorias</a>
                            <a href="./carrito.jsp">Carrito</a>
                        </div>
                    </div>

                    <div class="footer-col" id="useful-footer-links">
                        <h3>Pagina</h3>
                        <div class="footer-links">
                            <a href="#about">Sobre nosotros</a>
                            <a href="#discover">Figuras</a>
                            <a href="#app">Cartas</a>
                            <a href="#journals">Ultimos Lanzamientos</a>

                        </div>
                    </div>

                    <div class="footer-col" id="contact">
                        <h3>Contacto</h3>
                        <div class="contact-details">
                            <i class="fa fa-location"></i>
                            <p>Guapiles, <br> Costa Rica</p>
                        </div>
                        <div class="contact-details">
                            <i class="fa fa-phone"></i>
                            <p>+506 6778-0987</p>
                        </div>
                    </div>
                </div>

                <div class="footer-row">
                    <div class="footer-form">
                        <form action="Carrito_Controlador" method="get" class="search-form">
                            <input type="hidden" name="accion" value="buscar">
                            <div class="search-container">
                                <input type="text" name="nombreProducto" class="search-input" placeholder="Busca un producto..." style="color: white;">
                                <button type="submit" class="search-button"><i class="fa-solid fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <div class="footer__bar">
                Copyright © 2024 Emily Fernanda Castillo Quiel
            </div>
        </footer>



        <script >

            const scrollRevealOption = {
                distance: "50px",
                origin: "bottom",
                duration: 1000,
            };


            ScrollReveal().reveal(".header__container h1", scrollRevealOption);

            ScrollReveal().reveal(".header__container h4", {
                ...scrollRevealOption,
                delay: 500,
            });

            ScrollReveal().reveal(".header__container .btn", {
                ...scrollRevealOption,
                delay: 1000,
            });


            ScrollReveal().reveal(".about__container .section__header", scrollRevealOption);
            ScrollReveal().reveal(".about__container .section__subheader", {
                ...scrollRevealOption,
                delay: 500,
            });

            ScrollReveal().reveal(".about__container .about__flex", {
                ...scrollRevealOption,
                delay: 1000,
            });

            ScrollReveal().reveal(".about__container .btn", {
                ...scrollRevealOption,
                delay: 1500,
            });


            ScrollReveal().reveal(".discover__card", {
                ...scrollRevealOption,
                interval: 500,
            });

            ScrollReveal().reveal(".discover__card__content", {
                ...scrollRevealOption,
                interval: 500,
                delay: 200,
            });


            ScrollReveal().reveal(".blogs__card", {
                duration: 1000,
                interval: 400,
            });


            ScrollReveal().reveal(".journals__card", {
                ...scrollRevealOption,
                interval: 400,
            });

            window.addEventListener("scroll", function () {
                const navbar = document.querySelector(".sticky-navbar");
                if (window.scrollY > 0) {
                    navbar.classList.add("scrolled");
                } else {
                    navbar.classList.remove("scrolled");
                }
            });


            document.querySelectorAll(".projcard-description").forEach(function (box) {
                $clamp(box, {clamp: 6});
            });

        </script>

        <script src="./bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>

    </body>
</html>
