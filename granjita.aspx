<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="granjita.aspx.cs" Inherits="miGranjitaOfertasTV.granjita" %>

<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


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
      color: transparent;
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

    /* Contenedor personalizado para el grid */
    .grid-container {
      margin: 40px auto;
      width: 95%;
      max-width: 1400px;
      height: 800px;
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
    
    .grid-container.visible {
      opacity: 1;
      visibility: visible;
      transform: translate(-50%, -50%) scale(1);
    }
    
    .contenedor-grid {
      width: 100%;
      height: 100%;
      position: relative;
      overflow: hidden;
    }
    
    .grid-scrollable {
      width: 100%;
      position: absolute;
      transition: transform 0.8s ease-out;
    }

    /* Estilos personalizados para el ASPxGridView */
    .dxgvTable {
      width: 100% !important;
      border-collapse: collapse;
      margin: 0 auto;
      font-size: 24px;
    }
    
    .dxgvHeader {
      background-color: #4CAF50 !important;
      color: white !important;
      font-weight: bold;
      font-size: 28px !important;
    }
    
    .dxgvHeader td {
      padding: 20px 30px !important;
    }
    
    .dxgvDataRow {
      font-size: 24px;
    }
    
    .dxgvDataRow td {
      padding: 20px 30px !important;
      border-bottom: 1px solid #ddd !important;
    }
    
    .dxgvDataRow:nth-child(even) {
      background-color: #f9f9f9 !important;
    }
    
    .dxgvDataRow:hover {
      background-color: #f1f1f1 !important;
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
      width: 40px;
      height: 40px;
      border-radius: 50%;
      font-size: 24px;
      cursor: pointer;
      z-index: 102;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    /* Notificación de refresco */
    .refresh-notification {
      position: fixed;
      bottom: 70px;
      right: 20px;
      background-color: rgba(76, 175, 80, 0.9);
      color: white;
      padding: 10px 15px;
      border-radius: 5px;
      z-index: 1000;
      opacity: 0;
      transition: opacity 0.3s ease;
      font-size: 16px;
    }

    .refresh-notification.visible {
      opacity: 1;
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

      /* Grid responsivo */
      .grid-container {
        width: 95%;
        height: 80vh;
        transform: translate(-50%, -50%) scale(0.8);
      }
      
      .grid-container.visible {
        transform: translate(-50%, -50%) scale(0.9);
      }
      
      .dxgvTable {
        font-size: 18px;
      }
      
      .dxgvHeader td, .dxgvDataRow td {
        padding: 10px 15px !important;
        font-size: 16px;
      }

      .dxgvHeader {
        font-size: 20px !important;
      }
    }
    </style>
</head>
<body onload="iniciarPagina()">
    <form id="form1" runat="server">
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
        <div class="nombre-empresa">Productos Cárnicos El Corralito</div>
        
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

    <!-- Notificación de refresco -->
    <div class="refresh-notification" id="refreshNotification">La página se actualizará en 10 segundos</div>

    <!-- Franja verde con firma -->
    <div class="franja-firma" id="franjaFirma">
        <div class="contenedor-firma">
            <img src="imagenes/firma.png" alt="Firma de Mi granjita" class="imagen-firma">
        </div>
    </div>

    <!-- Overlay para cuando la tabla está visible -->
    <div class="overlay" id="overlay"></div>

    <!-- Contenedor personalizado para el grid -->
    <div class="grid-container" id="gridContainer">
        <button class="cerrar-tabla" onclick="ocultarGrid()">×</button>
        <div class="contenedor-grid">
            <div class="grid-scrollable" id="gridScrollable">
                <!-- Aquí colocamos nuestro ASPxGridView -->
                <dx:ASPxGridView ID="gvMiGranjita" ClientInstanceName="gvMiGranjita" runat="server"                  
                    OnDataBinding="gvMiGranjita_DataBinding" EnableCallBacks="false">
                    
                    <SettingsPager Mode="ShowAllRecords" /> 
                    <Settings ShowVerticalScrollBar="false" /> 
                    <SettingsBehavior AllowSort="false" /> 
                    
                    <Styles>
                        <Header Font-Bold="true" ForeColor="White" BackColor="#4CAF50" Font-Size="28px" />
                        <Cell Font-Size="24px" />
                        <AlternatingRow Enabled="True" BackColor="#F9F9F9" />
                    </Styles>
                    
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="nomSucursal" Caption="Sucursal" Width="200px" />
                        <dx:GridViewDataTextColumn FieldName="idInterno" Caption="ID Interno" Width="150px" />
                        <dx:GridViewDataTextColumn FieldName="CodProducto" Caption="Código" Width="150px" />
                        <dx:GridViewDataTextColumn FieldName="Descripcion" Caption="Producto" Width="300px" />
                        <dx:GridViewDataTextColumn FieldName="PrecioMenudeo" Caption="Precio Menudeo" Width="200px">
                            <PropertiesTextEdit DisplayFormatString="{0:C}" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PrecioMayoreo" Caption="Precio Mayoreo" Width="200px">
                            <PropertiesTextEdit DisplayFormatString="{0:C}" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Moneda" Caption="Moneda" Width="100px" />
                        <dx:GridViewDataTextColumn FieldName="Unidad" Caption="Unidad" Width="100px" />
                    </Columns>
                </dx:ASPxGridView>
            </div>
        </div>
    </div>
    </form>

    <script>
        // Variables globales
        let gridVisible = false;
        let posicionGrid = 0;
        let alturaGrid = 0;
        let alturaContenedor = 0;
        let animacionGrid;
        let refreshInterval;
        let refreshTimeout;

        // Función para iniciar la página
        function iniciarPagina() {
            actualizarHora();
            setInterval(actualizarHora, 1000);

            // Configurar eventos
            window.addEventListener('scroll', manejarScroll);

            // Mostrar grid después de 5 segundos
            setTimeout(mostrarGrid, 5000);

            // Configurar auto-refresco cada 10 segundos
            configurarAutoRefresco();
        }

        // Función para configurar el auto-refresco
        function configurarAutoRefresco() {
            // Mostrar notificación 5 segundos antes del refresco
            refreshInterval = setInterval(() => {
                const notification = document.getElementById('refreshNotification');
                notification.classList.add('visible');

                // Ocultar notificación después de 5 segundos
                setTimeout(() => {
                    notification.classList.remove('visible');
                }, 5000);

                // Programar el refresco 5 segundos después de mostrar la notificación
                refreshTimeout = setTimeout(() => {
                    location.reload();
                }, 10000);
            }, 5000); // 5 segundos de intervalo (10 segundos total)
        }

        // Función para mostrar el grid
        function mostrarGrid() {
            if (!gridVisible) {
                const gridContainer = document.getElementById('gridContainer');
                const overlay = document.getElementById('overlay');
                const gridScrollable = document.getElementById('gridScrollable');
                const contenedor = document.querySelector('.contenedor-grid');

                gridContainer.classList.add('visible');
                overlay.classList.add('visible');
                gridVisible = true;

                // Deshabilitar scroll del body
                document.body.style.overflow = 'hidden';

                // Configurar animación del grid
                alturaContenedor = contenedor.offsetHeight;
                alturaGrid = gridScrollable.offsetHeight;

                // Iniciar animación
                animarGrid();
            }
        }

        // Función para animar el grid
        function animarGrid() {
            const gridScrollable = document.getElementById('gridScrollable');
            const velocidad = 0.5; // píxeles por frame
            let reboteActivo = false;

            function animar() {
                posicionGrid -= velocidad;

                // Si hemos llegado al final, reiniciar con efecto de rebote
                if (-posicionGrid >= alturaGrid - alturaContenedor) {
                    if (!reboteActivo) {
                        reboteActivo = true;
                        setTimeout(() => {
                            posicionGrid = 0;
                            reboteActivo = false;
                        }, 1000);
                    }
                }

                gridScrollable.style.transform = `translateY(${posicionGrid}px)`;
                animacionGrid = requestAnimationFrame(animar);
            }

            // Detener cualquier animación previa
            cancelAnimationFrame(animacionGrid);

            // Reiniciar posición
            posicionGrid = 0;
            gridScrollable.style.transform = `translateY(${posicionGrid}px)`;

            // Iniciar nueva animación
            animacionGrid = requestAnimationFrame(animar);
        }

        // Función para ocultar el grid
        function ocultarGrid() {
            const gridContainer = document.getElementById('gridContainer');
            const overlay = document.getElementById('overlay');

            gridContainer.classList.remove('visible');
            overlay.classList.remove('visible');
            gridVisible = false;

            // Habilitar scroll del body
            document.body.style.overflow = '';

            // Detener animación
            cancelAnimationFrame(animacionGrid);
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

        // Limpiar intervalos al cerrar la página
        window.addEventListener('beforeunload', () => {
            clearInterval(refreshInterval);
            clearTimeout(refreshTimeout);
        });

        // Cerrar grid al hacer clic en el overlay
        document.getElementById('overlay').addEventListener('click', ocultarGrid);

        // Ajustar el grid cuando se cargan los datos
        function onGridDataBound(s, e) {
            // Esperar un momento para que el grid termine de renderizar
            setTimeout(function () {
                const gridElement = gvCorralito.GetMainElement();
                const gridScrollable = document.getElementById('gridScrollable');

                // Clonar el grid dentro de nuestro contenedor scrollable
                gridScrollable.innerHTML = '';
                gridScrollable.appendChild(gridElement);

                // Aplicar estilos adicionales
                gridElement.style.width = '100%';
                gridElement.style.margin = '0 auto';

                // Mostrar el grid
                mostrarGrid();
            }, 100);
        }

        // Asignar el evento de databound si el grid está definido
        if (typeof gvMiGranjita !== 'undefined') {
            gvMiGranjita.DataBound.AddHandler(onGridDataBound);
        }
    </script>
</body>
</html>