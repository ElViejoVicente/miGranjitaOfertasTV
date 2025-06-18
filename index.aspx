<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="miGranjitaOfertasTV.index" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos Cárnicos Mi granjita</title>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Bahnschrift:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Bahnschrift:wght@400;500;600&display=swap');
    
    body {
      margin: 0;
      font-family: 'Bahnschrift', sans-serif;
      min-height: 100vh;
      overflow-x: hidden;
      position: relative;
      padding-bottom: 60px; /* Espacio para el footer */
    }

    /* Efecto parallax */
    .parallax-container {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      overflow: hidden;
    }

    .parallax-bg {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 120%;
      background: url('imagenes/IMG.jpg') no-repeat center center;
      background-size: cover;
      will-change: transform;
      opacity: 0.5;
    }

    /* Encabezado */
    .encabezado {
      background-color: transparent;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 30px;
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 100;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .hora {
      font-size: 18px;
      color: #333;
    }
    
    .titulo-encabezado {
      font-size: 24px;
      font-weight: bold;
      color: #333;
      text-align: center;
      flex-grow: 1;
      margin: 0 20px;
      font-family: 'Bahnschrift', sans-serif;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    /* Contenido principal */
    .contenido {
      text-align: center;
      margin-top: 150px;
      color: black;
      position: relative;
      z-index: 2;
      padding: 20px;
      margin: 150px auto 0;
      width: 90%;
      padding-bottom: 100px; /* Espacio para el footer */
    }

    .texto-destacado {
      font-family: 'Lobster', cursive;
      font-size: 28px;
      color: black;
      margin: 30px 0;
      line-height: 1.4;
    }

    .logo-centro {
      width: 200px;
      margin: 30px auto;
      display: block;
    }

    .nombre-empresa {
      font-family: 'Lobster', cursive;
      font-size: 36px;
      color: black;
      margin: 20px 0 10px;
    }

    .eslogan {
      font-family: 'Lobster', cursive;
      font-size: 24px;
      color: black;
      font-style: italic;
      margin-top: 10px;
    }

    /* Footer - Fijo en la parte inferior */
    footer {
      text-align: center;
      padding: 10px;
      background-color: rgba(0,0,0,0.7);
      color: white;
      width: 100%;
      position: fixed;
      bottom: 0;
      left: 0;
      z-index: 99;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .footer-text {
      flex-grow: 1;
      text-align: center;
    }

    .footer-date {
      margin-right: 20px;
      font-size: 0.9em;
      opacity: 0.8;
    }

    /* Franja verde con firma - Más grande */
    .franja-firma {
      position: fixed;
      bottom: -200px;
      left: 0;
      width: 100%;
      height: 200px;
      background-color: rgba(76, 175, 80, 0.95);
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      z-index: 98;
      transition: transform 0.5s ease-out;
    }
    
    .franja-firma.visible {
      transform: translateY(-260px); /* 200px de la franja + 60px del footer */
    }
    
    .contenedor-firma {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 100%;
    }
    
    .imagen-firma {
      max-height: 80%;
      max-width: 90%;
      object-fit: contain;
    }

    /* Espacio adicional para permitir scroll */
    .espacio-scroll {
      height: 300px;
    }

    @media (max-width: 768px) {
      .encabezado {
        flex-direction: column;
        padding: 10px;
      }
      
      .titulo-encabezado {
        margin: 10px 0;
        font-size: 20px;
      }

      footer {
        flex-direction: column;
        padding: 5px;
      }

      .footer-date {
        margin-right: 0;
        margin-top: 5px;
        font-size: 0.8em;
      }
      
      .franja-firma {
        height: 150px;
      }
      
      .franja-firma.visible {
        transform: translateY(-210px); /* 150px de la franja + 60px del footer */
      }

      .texto-destacado {
        font-size: 24px;
      }

      .nombre-empresa {
        font-size: 30px;
      }

      .eslogan {
        font-size: 20px;
      }
    }
    </style>
</head>
<body onload="iniciarPagina()">
    <!-- Efecto parallax para la imagen de fondo -->
    <div class="parallax-container">
        <div class="parallax-bg" id="parallaxBg"></div>
    </div>

    <!-- Franja blanca superior con logo y hora -->
    <div class="encabezado">

        <div class="hora" id="hora"></div>
    </div>

    <!-- Contenido principal -->
    <div class="contenido">
       
        
        <!-- Logo en el centro -->
        <img src="imagenes/migranjita2.png" alt="Logo Mi granjita" class="logo-centro">
        
        <!-- Nombre de la empresa -->
        <div class="nombre-empresa">Productos Cárnicos Mi granjita</div>
        
        <!-- Eslogan -->
        <div class="eslogan">"Creando familias sanas"</div>
        
        <!-- Espacio adicional para permitir scroll -->
        <div class="espacio-scroll"></div>
    </div>

    <!-- Footer fijo en la parte inferior -->
    <footer>
        <div class="footer-text">&copy; 2023 Productos Cárnicos Mi granjita. Todos los derechos reservados.</div>
        <div class="footer-date" id="fechaFooter"></div>
    </footer>

    <!-- Franja verde con firma (más grande) -->
    <div class="franja-firma" id="franjaFirma">
        <div class="contenedor-firma">
            <!-- Reemplaza 'firma.png' con la ruta de tu imagen de firma -->
            <img src="imagenes/firma.png" alt="Firma de Mi granjita" class="imagen-firma">
        </div>
    </div>

    <script>
        // Función para iniciar la página
        function iniciarPagina() {
            actualizarHora();
            setInterval(actualizarHora, 1000);

            // Configurar evento de scroll para mostrar la franja de firma
            window.addEventListener('scroll', manejarScroll);
        }

        // Función para actualizar la hora
        function actualizarHora() {
            const ahora = new Date();
            const opciones = {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            };
            const fechaHora = ahora.toLocaleDateString('es-MX', opciones);
            document.getElementById('hora').textContent = fechaHora;
            document.getElementById('fechaFooter').textContent = fechaHora;
        }

        // Función para manejar el scroll y mostrar la franja de firma
        function manejarScroll() {
            const franjaFirma = document.getElementById('franjaFirma');
            const scrollPosition = window.scrollY || window.pageYOffset;
            const windowHeight = window.innerHeight;
            const documentHeight = document.body.scrollHeight;

            // Mostrar franja cuando el usuario llega al final
            if (scrollPosition + windowHeight >= documentHeight - 100) {
                franjaFirma.classList.add('visible');
            } else {
                franjaFirma.classList.remove('visible');
            }
        }
    </script>
</body>
</html>