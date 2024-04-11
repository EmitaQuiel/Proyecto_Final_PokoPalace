<%-- 
    Document   : index
    Created on : 7 abr 2024, 16:32:41
    Author     : Emi
--%>

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
    <link rel="stylesheet" href="./css/style.css" />
  </head>
  <body>
    <header>
        <div class="header-container">
            <nav>
        <a href="">Inicio</a>
        <a href="./productos.jsp">Productos</a>
        <a href="">Noticias</a>
        <a href="">Sobre Nosotros</a>
        <a href="">Descuentos</a>
        <a href="">Contacto</a>
      </nav>
        </div>
      
    </header>
    <section>
      <div class="tarjetas_desplegables">
        <!-- list item -->
        <div class="list">
          <div class="item">
            <img src="./assets/img/Slide_Principal_1.png" />
            <div class="contenido">
              <div class="autor">Videojuegos</div>
              <div class="titulo">VARIEDAD DE</div>
              <div class="topic">VIDEOJUEGOS</div>
              <div class="des">
                ¡Bienvenido a nuestra tienda de videojuegos, donde la diversidad
                de experiencias te espera en cada plataforma. Desde la magia de
                Nintendo con sus entrañables personajes como Mario y Zelda,
                hasta las emocionantes narrativas y gráficos de vanguardia en
                PC, pasando por la intensidad de las batallas en Xbox y las
                exclusivas inmersivas de PlayStation, ofrecemos una variada
                selección que abarca todas las preferencias y estilos de juego!
              </div>
              <div class="buttons">
                <button>COMPRAR</button>
                <button>MAS INFO</button>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="./assets/img/Slide_Principal_2.png" />
            <div class="contenido">
              <div class="autor">Peluches</div>
              <div class="titulo">VARIEDAD DE</div>
              <div class="topic">PELUCHES</div>
              <div class="des">
                En nuestro encantador rincón, te invitamos a descubrir la magia de los adorables personajes de Sanrio, cada uno más entrañable que el anterior.
                Desde el icónico Hello Kitty hasta los traviesos Keroppi y Badtz-Maru, pasando por la encantadora My Melody y el tierno Pompompurin, nuestra colección de peluches de Sanrio ofrece una amplia variedad para todos los amantes de la ternura y la nostalgia.
                Sumérgete en un universo de colores brillantes y sonrisas contagiosas mientras exploras nuestra selección de peluches de Sanrio. 
              </div>
              <div class="buttons">
                <button>COMPRAR</button>
                <button>MAS INFO</button>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="./assets/img/Slide_Principal_3.png" />
            <div class="contenido">
              <div class="autor">Figuras</div>
              <div class="titulo">VARIEDAD DE</div>
              <div class="topic">FIGURAS</div>
              <div class="des">
                ¡Bienvenido a nuestra tienda de figuras coleccionables, donde la magia de Nintendo, la emoción de Pokémon y la dulzura de Sanrio se unen para ofrecerte una experiencia única en el mundo de la colección! Sumérgete en un universo de aventuras.
                Desde los legendarios héroes de Nintendo como Mario, Link y Kirby, hasta los emblemáticos Pokémon como Pikachu, Charmander y Eevee, pasando por los entrañables personajes de Sanrio como Hello Kitty, My Melody y Pompompurin.
              </div>
              <div class="buttons">
                <button>COMPRAR</button>
                <button>MAS INFO</button>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="./assets/img/Slide_Principal_4.png" />
            <div class="contenido">
              <div class="autor">TCG Pokemon</div>
              <div class="titulo">VARIEDAD DE</div>
              <div class="topic">TCG POKEMON</div>
              <div class="des">
                ¡Bienvenido a nuestra tienda de cartas coleccionables Pokémon, donde la emoción de los combates y la estrategia se encuentran en cada paquete! Sumérgete en el emocionante mundo de Pokémon TCG (Trading Card Game) y descubre la magia de coleccionar las cartas más poderosas y buscadas.
                Desde los icónicos Pokémon legendarios hasta los populares entrenadores y energías, nuestra tienda ofrece una amplia variedad de cartas para satisfacer tanto a los coleccionistas novatos como a los más experimentados. 
              </div>
              <div class="buttons">
                <button>COMPRAR</button>
                <button>MAS INFO</button>
              </div>
            </div>
          </div>
        </div>
        <!-- lista de miniatura -->
        <div class="miniatura">
          <div class="item">
            <img src="./assets/img/Slider_Miniatura_1.png" />
          </div>
          <div class="item">
            <img src="./assets/img/Slider_Miniatura_2 .png" />
          </div>
          <div class="item">
            <img src="./assets/img/Slider_Miniatura_3 .png" />
          </div>
          <div class="item">
            <img src="./assets/img/Slider_Miniatura_4.png" />
          </div>
        </div>

        <div class="arrows">
          <button id="prev"><</button>
          <button id="next">></button>
        </div>
        <!-- time running -->
        <div class="time"></div>
      </div>
    </section>

    <section>
      <div class="img-zigzag"></div>
      <div class="contenedor-produc-recientes">
        <h2>Productos Recientes</h2>
        <img src="./assets/img/toad-verde.png" alt="" />
        <div class="productos-recientes">
          <div class="producto-reciente"></div>
        </div>
      </div>
    </section>

    <section>
      <div class="sobreNosotros">
        <h2>Sobre Nosotros</h2>
        <div class="imagen-zipzap-2"></div>
        <video id="miVideo" autoplay loop muted plays-inline>
          <source src="./assets/img/Nintendo_Link.mp4" type="video/mp4" />
        </video>
      </div>
    </section>

    <section>
      <div class="imagen-zipzap-3"></div>
      <div class="noticias">
        <h2>Noticias</h2>
        <img src="./assets/img/canelita.png" alt="" />
        
        </div>
      </div>
    </section>

    <section id="offers" class="py-5">
      <div class="imagen-zipzap-4"></div>
      <div class="container">
        <div
          class="row d-flex align-items-center justify-content-center text-center justify-content-lg-start text-lg-start"
        >
          <div class="offers-content">
            <span class="text-dark">15% de descuento comprando 3 unidades</span>
            <h2 class="mt-2 mb-4 text-dark">¡Gran oferta!</h2>
            <a href="./productos.jsp" class="btn">¡Compra ya!</a>
          </div>
        </div>
      </div>
    </section>
    
    <section class="mostrar-cartas" id="app">
      <div class="imagen-zipzap-5"></div>
        <h1>Cartas Destacadas</h1>
        <p>Entre estas cartas, algunas se destacan como las más buscadas, cautivando tanto a jugadores como a coleccionistas con su rareza, diseño y poder en el juego.</p>
        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_mew_ex.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_mewtwo_v.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_charizard_vmax.jpg">
        </div>
        
        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_sylveon_v.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_rayquaza_vmax.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_pikachu_vmax.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_dragonite_v.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_gengar_vmax.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_ninetales_ex.jpg">
        </div>

        <div class="card-pokemon">
          <img src="./assets/img/Cards/card_cinderace_vmax.jpg">
        </div>

        <style class="hover"></style>
      </section>

    <script src="./bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
    <script src="./js/funcionalidades_index.js"></script>
  </body>
</html>
