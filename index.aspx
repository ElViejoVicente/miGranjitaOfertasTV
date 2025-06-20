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
      padding-bottom: 60px;
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
      padding-bottom: 100px;
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

    /* Tabla de productos - Centrada */
    .tabla-productos-container {
      margin: 40px auto;
      width: 95%;
      max-width: 1200px;
      height: 600px;
      overflow: hidden;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%) scale(0.9);
      background-color: rgba(255, 255, 255, 0.95);
      border-radius: 20px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      z-index: 101;
      opacity: 0;
      visibility: hidden;
      transition: all 0.5s ease;
    }
    
    .tabla-productos-container.visible {
      opacity: 1;
      visibility: visible;
      transform: translate(-50%, -50%) scale(1);
    }
    
    .contenedor-tabla {
      width: 100%;
      height: 100%;
      position: relative;
      overflow: hidden;
    }
    
    .tabla-productos {
      width: 100%;
      position: absolute;
      transition: transform 0.8s ease-out;
    }

    .tabla-productos h2 {
      color: #d32f2f;
      text-align: center;
      margin-bottom: 20px;
      font-family: 'Georgia', serif;
      padding-top: 20px;
      font-size: 32px;
    }

    .tabla-productos table {
      width: 100%;
      border-collapse: collapse;
      margin: 0 auto;
      font-size: 18px;
    }
    
    .tabla-productos th, .tabla-productos td {
      padding: 15px 20px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .tabla-productos th {
      background-color: #4CAF50;
      color: white;
      font-weight: bold;
      font-size: 23px;
    }

    .tabla-productos tr.categoria-title {
      background-color: #e8f5e9;
      font-weight: bold;
      color: #2e7d32;
      font-size: 25px;
    }

    .tabla-productos tr:nth-child(even):not(.categoria-title) {
      background-color: #f9f9f9;
    }

    .tabla-productos tr:hover:not(.categoria-title) {
      background-color: #f1f1f1;
    }

    .tabla-productos td:last-child {
      color: #4CAF50;
      font-weight: bold;
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

    /* Franja verde con firma */
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
      transform: translateY(-260px);
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

    /* Overlay para cuando la tabla está visible */
    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.7);
      z-index: 100;
      opacity: 0;
      visibility: hidden;
      transition: all 0.3s ease;
    }
    
    .overlay.visible {
      opacity: 1;
      visibility: visible;
    }

    /* Botón para cerrar la tabla */
    .cerrar-tabla {
      position: absolute;
      top: 15px;
      right: 15px;
      background: #d32f2f;
      color: white;
      border: none;
      width: 30px;
      height: 30px;
      border-radius: 50%;
      font-size: 18px;
      cursor: pointer;
      z-index: 102;
      display: flex;
      align-items: center;
      justify-content: center;
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
        transform: translateY(-210px);
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

      /* Tabla responsiva */
      .tabla-productos-container {
        width: 95%;
        height: 80vh;
        transform: translate(-50%, -50%) scale(0.8);
      }
      
      .tabla-productos-container.visible {
        transform: translate(-50%, -50%) scale(0.9);
      }
      
      .tabla-productos table {
        display: block;
        overflow-x: auto;
      }
      
      .tabla-productos th, .tabla-productos td {
        padding: 10px 15px;
        font-size: 16px;
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
        <h1 class="titulo-encabezado">Productos Cárnicos Mi granjita</h1>
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

    <!-- Franja verde con firma -->
    <div class="franja-firma" id="franjaFirma">
        <div class="contenedor-firma">
            <!-- Reemplaza 'firma.png' con la ruta de tu imagen de firma -->
            <img src="imagenes/firma.png" alt="Firma de Mi granjita" class="imagen-firma">
        </div>
    </div>

    <!-- Overlay para cuando la tabla está visible -->
    <div class="overlay" id="overlay"></div>

    <!-- Tabla de productos - Centrada -->
    <div class="tabla-productos-container" id="tablaProductosContainer">
        <button class="cerrar-tabla" onclick="ocultarTabla()">×</button>
        <div class="contenedor-tabla">
            <div class="tabla-productos" id="tablaProductos">
                <h2>Nuestros Productos</h2>

                <table>
                    <thead>
                        <tr>
                            <th>Producto</th>
                            <th>Precio Menudeo</th>
                            <th>Precio Mayoreo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Categoría Cerdo -->
                        <tr class="categoria-title">
                            <td colspan="3">Productos de Cerdo</td>
                        </tr>
                        <tr>
                            <td>Jamón de Cerdo</td>
                            <td>$120/kg</td>
                            <td>$100/kg (50+ kg)</td>
                        </tr>
                        <tr>
                            <td>Lomo Fino de Cerdo</td>
                            <td>$150/kg</td>
                            <td>$130/kg (30+ kg)</td>
                        </tr>
                        <tr>
                            <td>Chuleta de Cerdo</td>
                            <td>$130/kg</td>
                            <td>$110/kg (35+ kg)</td>
                        </tr>
                        <tr>
                            <td>Tocino</td>
                            <td>$140/kg</td>
                            <td>$120/kg (20+ kg)</td>
                        </tr>
                        <tr>
                            <td>Pierna de Cerdo</td>
                            <td>$125/kg</td>
                            <td>$105/kg (25+ kg)</td>
                        </tr>
                        <tr>
                            <td>Costilla de Cerdo</td>
                            <td>$110/kg</td>
                            <td>$90/kg (30+ kg)</td>
                        </tr>

                        <!-- Categoría Res -->
                        <tr class="categoria-title">
                            <td colspan="3">Productos de Res</td>
                        </tr>
                        <tr>
                            <td>Costilla de Res</td>
                            <td>$180/kg</td>
                            <td>$150/kg (25+ kg)</td>
                        </tr>
                        <tr>
                            <td>Hueso Carnudo de Res</td>
                            <td>$80/kg</td>
                            <td>$65/kg (40+ kg)</td>
                        </tr>
                        <tr>
                            <td>Filete de Res</td>
                            <td>$220/kg</td>
                            <td>$190/kg (15+ kg)</td>
                        </tr>
                        <tr>
                            <td>Chuleta de Res</td>
                            <td>$200/kg</td>
                            <td>$170/kg (20+ kg)</td>
                        </tr>
                        <tr>
                            <td>Falda de Res</td>
                            <td>$150/kg</td>
                            <td>$130/kg (25+ kg)</td>
                        </tr>

                        <!-- Categoría Pollo -->
                        <tr class="categoria-title">
                            <td colspan="3">Productos de Pollo</td>
                        </tr>
                        <tr>
                            <td>Pechuga de Pollo</td>
                            <td>$90/kg</td>
                            <td>$75/kg (40+ kg)</td>
                        </tr>
                        <tr>
                            <td>Muslo de Pollo</td>
                            <td>$70/kg</td>
                            <td>$60/kg (30+ kg)</td>
                        </tr>
                        <tr>
                            <td>Alas de Pollo</td>
                            <td>$65/kg</td>
                            <td>$55/kg (25+ kg)</td>
                        </tr>
                        <tr>
                            <td>Pollo Entero</td>
                            <td>$75/kg</td>
                            <td>$65/kg (20+ kg)</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Variables globales
        let tablaVisible = false;
        let posicionTabla = 0;
        let alturaTabla = 0;
        let alturaContenedor = 0;
        let animacionTabla;

        // Función para iniciar la página
        function iniciarPagina() {
            actualizarHora();
            setInterval(actualizarHora, 1000);

            // Configurar eventos
            window.addEventListener('scroll', manejarScroll);

            // Mostrar tabla después de 5 segundos
            setTimeout(mostrarTabla, 5000);
        }

        // Función para mostrar la tabla
        function mostrarTabla() {
            if (!tablaVisible) {
                const tablaContainer = document.getElementById('tablaProductosContainer');
                const overlay = document.getElementById('overlay');
                const tabla = document.getElementById('tablaProductos');
                const contenedor = document.querySelector('.contenedor-tabla');

                tablaContainer.classList.add('visible');
                overlay.classList.add('visible');
                tablaVisible = true;

                // Deshabilitar scroll del body
                document.body.style.overflow = 'hidden';

                // Configurar animación de la tabla
                alturaContenedor = contenedor.offsetHeight;
                alturaTabla = tabla.offsetHeight;

                // Iniciar animación
                animarTabla();
            }
        }

        // Función para animar la tabla
        function animarTabla() {
            const tabla = document.getElementById('tablaProductos');
            const velocidad = 0.5; // píxeles por frame
            let reboteActivo = false;

            function animar() {
                posicionTabla -= velocidad;

                // Si hemos llegado al final, reiniciar con efecto de rebote
                if (-posicionTabla >= alturaTabla - alturaContenedor) {
                    if (!reboteActivo) {
                        reboteActivo = true;
                        setTimeout(() => {
                            posicionTabla = 0;
                            reboteActivo = false;
                        }, 1000);
                    }
                }

                tabla.style.transform = `translateY(${posicionTabla}px)`;
                animacionTabla = requestAnimationFrame(animar);
            }

            // Detener cualquier animación previa
            cancelAnimationFrame(animacionTabla);

            // Reiniciar posición
            posicionTabla = 0;
            tabla.style.transform = `translateY(${posicionTabla}px)`;

            // Iniciar nueva animación
            animacionTabla = requestAnimationFrame(animar);
        }

        // Función para ocultar la tabla
        function ocultarTabla() {
            const tablaContainer = document.getElementById('tablaProductosContainer');
            const overlay = document.getElementById('overlay');

            tablaContainer.classList.remove('visible');
            overlay.classList.remove('visible');
            tablaVisible = false;

            // Habilitar scroll del body
            document.body.style.overflow = '';

            // Detener animación
            cancelAnimationFrame(animacionTabla);
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

        // Cerrar tabla al hacer clic en el overlay
        document.getElementById('overlay').addEventListener('click', ocultarTabla);
    </script>
</body>
</html>