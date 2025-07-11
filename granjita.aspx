<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="granjita.aspx.cs" Inherits="miGranjitaOfertasTV.granjita" %>

<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos Cárnicos Mi granjita</title>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Bahnschrift:wght@400;500;600&display=swap" rel="stylesheet">
    <style type="text/css">
        body {
            margin: 0;
            font-family: 'Bahnschrift', sans-serif;
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
            padding-bottom: 60px;
        }

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

        .grid-container {
            margin: 40px auto;
            width: 98%;
            max-width: 1600px;
            height: 85vh;
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

        .grid-header-fixed {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 60px;
            overflow: hidden;
            z-index: 2;
            background-color: #4CAF50;
        }

        .grid-body-scrollable {
            position: absolute;
            top: 60px;
            bottom: 0;
            width: 100%;
            overflow: auto;
        }

        .dxgvTable {
            width: 100% !important;
            table-layout: fixed;
            border-collapse: collapse;
        }

        .dxgvHeader {
            background-color: #4CAF50 !important;
            color: white !important;
            font-weight: bold;
            font-size: 28px !important;
        }

            /* Aumentar espacio para encabezados */
            .dxgvHeader td {
                padding: 12px 5px !important; /* Más espacio vertical, menos horizontal */
                white-space: normal !important; /* Permite múltiples líneas */
                line-height: 1.2 !important; /* Mejor espaciado entre líneas */
                font-size: 24px !important; /* Tamaño de fuente reducido */
            }

        /* Ajustar específicamente la columna de condición */
        .col-condicion {
            width: 180px !important; /* Aumentado a 180px */
        }

        /* Asegurar que el texto del encabezado se ajuste */
        .dxgvHeader .col-condicion {
            word-break: break-word; /* Rompe palabras largas */
        }

        .dxgvDataRow td {
            padding: 15px 10px !important;
            border-bottom: 1px solid #ddd !important;
            text-align: center !important;
            font-size: 24px;
        }

        .dxgvDataRowAlt td {
            background-color: #f9f9f9 !important;
        }

        .dxgvDataRow:hover td {
            background-color: #f1f1f1 !important;
        }

        .col-codigo {
            width: 120px !important;
        }

        .col-descripcion {
            width: 350px !important;
        }

        .col-precio {
            width: 180px !important;
        }

        .col-unidad {
            width: 100px !important;
        }

        .col-condicion {
            width: 150px !important;
        }


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

            .nombre-empresa {
                font-size: 30px;
            }

            .eslogan {
                font-size: 20px;
            }

            .grid-container {
                width: 95%;
                height: 80vh;
                transform: translate(-50%, -50%) scale(0.8);
            }

                .grid-container.visible {
                    transform: translate(-50%, -50%) scale(0.9);
                }

            .dxgvHeader td,
            .dxgvDataRow td {
                padding: 10px 5px !important;
                font-size: 16px;
            }

            .dxgvHeader {
                font-size: 20px !important;
            }

            .grid-header-fixed {
                height: 50px;
            }

            .grid-body-scrollable {
                top: 50px;
            }

            .col-codigo {
                width: 80px !important;
            }

            .col-descripcion {
                width: 150px !important;
            }

            .col-precio {
                width: 100px !important;
            }

            .col-moneda {
                width: 70px !important;
            }

            .col-unidad {
                width: 70px !important;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="parallax-container">
            <div class="parallax-bg"></div>
        </div>

        <div class="encabezado">
            <h1 class="titulo-encabezado">Productos Cárnicos Mi granjita</h1>
            <div class="hora" id="hora"></div>
        </div>

        <div class="contenido">
            <img src="imagenes/migranjita2.png" alt="Logo Mi granjita" class="logo-centro">
            <div class="nombre-empresa">Productos Cárnicos Mi Granjita</div>
            <div class="eslogan">"Creando familias sanas"</div>
            <div class="espacio-scroll"></div>
        </div>

        <footer>
            <div class="footer-text">&copy; 2023 Productos Cárnicos Mi granjita. Todos los derechos reservados.</div>
            <div class="footer-date" id="fechaFooter"></div>
        </footer>

        <div class="refresh-notification" id="refreshNotification">La página se actualizará en 10 segundos</div>

        <div class="franja-firma" id="franjaFirma">
            <div class="contenedor-firma">
                <img src="imagenes/firma.png" alt="Firma de Mi granjita" class="imagen-firma">
            </div>
        </div>

        <div class="overlay" id="overlay"></div>

        <div class="grid-container" id="gridContainer">
            <button class="cerrar-tabla" onclick="ocultarGrid(); return false;">×</button>
            <div class="contenedor-grid">
                <div class="grid-header-fixed">
                    <dx:ASPxGridView ID="gvHeader" runat="server" AutoGenerateColumns="False"
                        Width="100%" EnableCallBacks="False" ShowHeader="True" ShowFooter="False">
                        <Settings ShowVerticalScrollBar="False" ShowHorizontalScrollBar="False" />
                        <SettingsBehavior AllowSort="False" AllowDragDrop="False" />
                        <SettingsPager Mode="ShowAllRecords" Visible="False" />
                        <Styles>
                            <Header BackColor="#4CAF50" Font-Bold="True" Font-Size="28px" ForeColor="White" />
                        </Styles>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="CodProducto" Caption="Código" Width="150px" HeaderStyle-CssClass="col-codigo" />
                            <dx:GridViewDataTextColumn FieldName="Descripcion" Caption="Descripción" Width="300px" HeaderStyle-CssClass="col-descripcion" />
                            <dx:GridViewDataTextColumn FieldName="PrecioMenudeo" Width="200px" CellStyle-CssClass="col-precio">
                                <PropertiesTextEdit
                                    DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}"
                                    DisplayFormatInEditMode="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PrecioMayoreo" Width="200px" CellStyle-CssClass="col-precio">
                                <PropertiesTextEdit
                                    DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}"
                                    DisplayFormatInEditMode="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Unidad" Caption="Unidad" Width="100px" HeaderStyle-CssClass="col-moneda" />
                            <dx:GridViewDataTextColumn FieldName="CondicionMayoreo" Caption="Condición Mayoreo"
                                Width="180px" HeaderStyle-CssClass="col-condicion">
                                <HeaderStyle Wrap="True" />                              
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>

                <div class="grid-body-scrollable">
                    <dx:ASPxGridView ID="gvMiGranjita" runat="server" AutoGenerateColumns="False"
                        Width="100%" KeyFieldName="CodProducto" OnDataBinding="gvMiGranjita_DataBinding"
                        EnableCallBacks="False" ShowHeader="False">
                        <Settings ShowVerticalScrollBar="False" ShowHorizontalScrollBar="False" />
                        <SettingsBehavior AllowSort="False" />
                        <SettingsPager Mode="ShowAllRecords" />
                        <Styles>
                            <Cell Font-Size="24px" />
                            <AlternatingRow Enabled="True" BackColor="#F9F9F9" />
                        </Styles>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="CodProducto" Width="150px" CellStyle-CssClass="col-codigo" />
                            <dx:GridViewDataTextColumn FieldName="Descripcion" Width="300px" CellStyle-CssClass="col-descripcion" />
                            <dx:GridViewDataTextColumn FieldName="PrecioMenudeo" Width="200px" CellStyle-CssClass="col-precio">
                                <PropertiesTextEdit
                                    DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}"
                                    DisplayFormatInEditMode="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PrecioMayoreo" Width="200px" CellStyle-CssClass="col-precio">
                                <PropertiesTextEdit
                                    DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}"
                                    DisplayFormatInEditMode="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Unidad" Width="100px" CellStyle-CssClass="col-moneda" />
                            <dx:GridViewDataTextColumn FieldName="CondicionMayoreo" Width="100px" CellStyle-CssClass="col-CondicionMayoreo" />
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        let gridVisible = false;
        let posicionGrid = 0;
        let animacionGrid;
        let refreshTimeout;

        function iniciarPagina() {
            actualizarHora();
            setInterval(actualizarHora, 1000);
            window.addEventListener('scroll', manejarScroll);
            setTimeout(mostrarGrid, 5000);
        }

        function mostrarGrid() {
            if (!gridVisible) {
                document.getElementById('gridContainer').classList.add('visible');
                document.getElementById('overlay').classList.add('visible');
                gridVisible = true;
                document.body.style.overflow = 'hidden';
                animarGrid();
            }
        }

        function animarGrid() {
            const gridBody = document.querySelector('.grid-body-scrollable');
            const velocidad = 0.5;
            let refrescoProgramado = false;

            function animar() {
                posicionGrid += velocidad;
                gridBody.scrollTop = posicionGrid;

                if (posicionGrid >= gridBody.scrollHeight - gridBody.clientHeight) {
                    if (!refrescoProgramado) {
                        refrescoProgramado = true;
                        document.getElementById('refreshNotification').textContent = "Mostrando últimos productos...";
                        document.getElementById('refreshNotification').classList.add('visible');

                        setTimeout(() => {
                            document.getElementById('refreshNotification').textContent = "Actualizando información...";
                            setTimeout(() => {
                                location.reload();
                            }, 2000);
                        }, 2000);
                    }
                }

                animacionGrid = requestAnimationFrame(animar);
            }

            cancelAnimationFrame(animacionGrid);
            posicionGrid = 0;
            animacionGrid = requestAnimationFrame(animar);
        }

        function ocultarGrid() {
            document.getElementById('gridContainer').classList.remove('visible');
            document.getElementById('overlay').classList.remove('visible');
            gridVisible = false;
            document.body.style.overflow = '';
            cancelAnimationFrame(animacionGrid);
        }

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

        function manejarScroll() {
            const franjaFirma = document.getElementById('franjaFirma');
            const scrollPosition = window.scrollY || window.pageYOffset;
            const windowHeight = window.innerHeight;
            const documentHeight = document.body.scrollHeight;

            if (scrollPosition + windowHeight >= documentHeight - 100) {
                franjaFirma.classList.add('visible');
            } else {
                franjaFirma.classList.remove('visible');
            }
        }

        window.addEventListener('load', iniciarPagina);
        window.addEventListener('beforeunload', () => {
            clearTimeout(refreshTimeout);
        });
        document.getElementById('overlay').addEventListener('click', ocultarGrid);
    </script>
</body>
</html>
