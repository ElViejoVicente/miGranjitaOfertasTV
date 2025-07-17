<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="corralito.aspx.cs" Inherits="miGranjitaOfertasTV.corralito" %>

<%@ Register assembly="DevExpress.Web.v24.2, Version=24.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

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
            background: url('imagenes/corralito3.jpg') no-repeat center center;
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
            height: 60px;
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
            margin-top: 80px;
            color: black;
            position: relative;
            z-index: 2;
            padding: 20px;
            width: 90%;
            padding-bottom: 100px;
        }

        .logo-centro {
            width: 900px;
            margin: 10px auto;
            display: block;
        }

        .nombre-empresa {
            font-family: 'Lobster', cursive;
            font-size: 36px;
            color: black;
            margin: 10px 0 5px;
        }

        .eslogan {
            font-family: 'Lobster', cursive;
            font-size: 24px;
            color: black;
            font-style: italic;
            margin-top: 5px;
        }

        .grid-container {
            margin: 0 auto;
            width: 98%;
            max-width: 1600px;
            height: calc(100vh - 100px);
            overflow: hidden;
            position: fixed;
            top: 60px;
            left: 50%;
            transform: translateX(-50%) scale(0.9);
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
            transform: translateX(-50%) scale(1);
        }

         .grid-logo-header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #E4080A;
            z-index: 3;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            gap: 15px; /* Espacio entre logo y texto */
        }

        .grid-logo-img {
            width: 80px;
            height: auto;
        }

        .grid-logo-text {
            font-family: 'Lobster', cursive;
            font-size: 28px;
            color: #333;
            margin: 0;
        }

        .contenedor-grid {
            width: 100%;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        .grid-header-fixed {
            position: absolute;
            top: 120px;
            left: 0;
            width: 100%;
            height: 100px;
            overflow: hidden;
            z-index: 2;
            background-color: #E4080A;
        }

        .grid-body-scrollable {
            position: absolute;
            top: 185px;
            bottom: 0;
            width: 100%;
            overflow: auto;
            margin-top: -1px;
        }

        /* Estilos para el encabezado fijo (gvHeader) */
        #gvHeader_DXMainTable {
            background-color: #E4080A !important;
            table-layout: fixed;
            width: 100% !important;
            font-family: 'Lobster', cursive !important;
        }

        .dxgvHeader_PlasticBlue {
            background-color: #E4080A !important;
            color: white !important;
            font-weight: bold;
            font-size: 20px !important;
            height: 80px;
            font-family: 'Lobster', cursive !important;
        }

        .dxgvHeader td {
            padding: 15px 5px !important;
            white-space: normal !important;
            line-height: 1.2 !important;
            color: white !important;
            text-align: center !important;
            vertical-align: middle !important;
        }

        /* Oculta solo los títulos de UNIDAD y CONDICIÓN MAYOREO */
        .header-hidden {
            visibility: hidden !important;
            font-size: 0 !important;
            padding: 0 !important;
            margin: 0 !important;
            height: 0 !important;
        }

        /* Asegura que las celdas del cuerpo mantengan su estilo */
        .col-unidad, .col-condicion {
            visibility: visible !important;
            font-size: 24px !important;
        }

        /* Ajustes de ancho de columnas */
        .col-codigo {
            width: 100px !important;
            min-width: 100px !important;
            max-width: 100px !important;
        }

        .col-descripcion {
            width: 300px !important;
            min-width: 300px !important;
            max-width: 300px !important;
            text-align: left !important;
            padding-left: 15px !important;
        }

        .col-precio-menudeo {
            width: 150px !important;
            min-width: 150px !important;
            max-width: 150px !important;
        }

        .col-precio-mayoreo {
            width: 150px !important;
            min-width: 150px !important;
            max-width: 150px !important;
        }

        .col-unidad {
            width: 80px !important;
            min-width: 80px !important;
            max-width: 80px !important;
        }

        .col-condicion {
            width: 200px !important;
            min-width: 200px !important;
            max-width: 200px !important;
        }

        /* Estilos para el cuerpo de la tabla (gvMiGranjita) */
        #gvCorralito_DXMainTable {
            border-top: none !important;
            margin-top: 0 !important;
            padding-top: 0 !important;
            table-layout: fixed;
            width: 100% !important;
        }

        .dxgvDataRow td {
            padding: 15px 5px !important;
            border-bottom: 1px solid #ddd !important;
            text-align: center !important;
            font-size: 24px;
            vertical-align: middle !important;
        }

        .dxgvDataRowAlt td {
            background-color: #f9f9f9 !important;
        }

        .dxgvDataRow:hover td {
            background-color: #f1f1f1 !important;
        }

        /* Estilos para filas con promoción */
        .dxgvDataRow-con-promocion td {
            background-color: #E9B68D !important; /* Amarillo claro */
        }

        .dxgvDataRowAlt-con-promocion td {
            background-color: #E9B68D !important; /* Amarillo un poco más intenso para filas alternas */
        }

        .dxgvDataRow-con-promocion:hover td,
        .dxgvDataRowAlt-con-promocion:hover td {
            background-color: #E9B68D !important; /* Amarillo más intenso al hacer hover */
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
            background-color: #E4080A;
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
                height: auto;
            }

            .titulo-encabezado {
                margin: 10px 0;
                font-size: 20px;
            }

            .contenido {
                margin-top: 100px;
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
                height: calc(100vh - 120px);
                transform: translateX(-50%) scale(0.8);
                top: 80px;
            }

            .grid-container.visible {
                transform: translateX(-50%) scale(0.9);
            }

            .grid-logo-header {
                height: 100px;
            }

            .grid-logo-img {
                width: 60px;
            }

            .grid-logo-text {
                font-size: 22px;
            }

            .grid-header-fixed {
                top: 100px;
                height: 50px;
            }

            .grid-body-scrollable {
                top: 150px;
            }

            .dxgvHeader td,
            .dxgvDataRow td {
                padding: 10px 5px !important;
                font-size: 16px;
            }

            .dxgvHeader {
                font-size: 20px !important;
                height: 50px !important;
            }

            .col-codigo {
                width: 70px !important;
                min-width: 70px !important;
                max-width: 70px !important;
            }

            .col-descripcion {
                width: 10px !important;
                min-width: 10px !important;
                max-width: 10px !important;
            }

            .col-precio-menudeo {
                width: 100px !important;
                min-width: 100px !important;
                max-width: 100px !important;
            }

            .col-precio-mayoreo {
                width: 100px !important;
                min-width: 100px !important;
                max-width: 100px !important;
            }

            .col-unidad {
                width: 60px !important;
                min-width: 60px !important;
                max-width: 60px !important;
            }

            .col-condicion {
                width: 120px !important;
                min-width: 120px !important;
                max-width: 120px !important;
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
            <img src="imagenes/corralito2.png" alt="Logo Corralito" class="logo-centro">
            <div class="nombre-empresa">Carnes El Corralito</div>
            <div class="eslogan">"Creando familias sanas"</div>
            <div class="espacio-scroll"></div>
        </div>

        <footer>
            <div class="footer-text">&copy; 2025 Carnes El Corralito. Todos los derechos reservados.</div>
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
            <div class="grid-logo-header">
                
                <h2 class="grid-logo-text">Carnes El Corralito </h2>
            </div>
            <div class="contenedor-grid">
                <div class="grid-header-fixed">
                    <dx:ASPxGridView ID="gvHeader" runat="server" AutoGenerateColumns="False"
                        Width="100%" EnableCallBacks="False" ShowHeader="True" ShowFooter="False"
                        EnableRowsCache="False" EnableTheming="False">
                        <Settings ShowVerticalScrollBar="False" ShowHorizontalScrollBar="False" />
                        <SettingsBehavior AllowSort="False" AllowDragDrop="False" />
                        <SettingsPager Mode="ShowAllRecords" Visible="False" />
                        <Styles>
                            <Header BackColor="#E4080A" Font-Bold="True" ForeColor="White" Font-Size="28px" />
                            <Cell Font-Size="0px" />
                            <HeaderPanel BackColor="#E4080A" />
                        </Styles>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="CodProducto" Caption="CÓDIGO" Width="100px" 
                                HeaderStyle-CssClass="col-codigo" CellStyle-CssClass="col-codigo">
                                <HeaderStyle Font-Bold="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Descripcion" Caption="DESCRIPCIÓN" Width="300px" 
                                HeaderStyle-CssClass="col-descripcion" CellStyle-CssClass="col-descripcion">
                                <HeaderStyle Font-Bold="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PrecioMenudeo" Caption="PRECIO MENUDEO" Width="150px" 
                                HeaderStyle-CssClass="col-precio-menudeo" CellStyle-CssClass="col-precio-menudeo">
                                <PropertiesTextEdit DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}" />
                                <HeaderStyle Font-Bold="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PrecioMayoreo" Caption="PRECIO MAYOREO" Width="150px" 
                                HeaderStyle-CssClass="col-precio-mayoreo" CellStyle-CssClass="col-precio-mayoreo">
                                <PropertiesTextEdit DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}" />
                                <HeaderStyle Font-Bold="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Unidad" Caption=" " Width="80px" 
                                HeaderStyle-CssClass="col-unidad header-hidden" CellStyle-CssClass="col-unidad">
                                <HeaderStyle Font-Bold="true" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CondicionMayoreo" Caption="CONDICION DE PRECIO DE MAYOREO " Width="200px" 
                                HeaderStyle-CssClass="col-condicion" CellStyle-CssClass="col-condicion">
                                <HeaderStyle Font-Bold="true" Wrap="True" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>

                <div class="grid-body-scrollable">
                    <dx:ASPxGridView ID="gvCorralito" runat="server" AutoGenerateColumns="False"
                        Width="100%" KeyFieldName="CodProducto" OnDataBinding="gvCorralito_DataBinding"
                        EnableCallBacks="False" ShowHeader="False" EnableTheming="False">
                        <Settings ShowVerticalScrollBar="False" ShowHorizontalScrollBar="False" />
                        <SettingsBehavior AllowSort="False" />
                        <SettingsPager Mode="ShowAllRecords" />
                        <Styles>
                            <Header BackColor="Transparent" Border-BorderWidth="0" />
                            <HeaderPanel BackColor="Transparent" Border-BorderWidth="0" />
                            <Cell Font-Size="24px" />
                            <AlternatingRow Enabled="True" BackColor="Transparent" />
                        </Styles>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="CodProducto" Width="100px" 
                                CellStyle-CssClass="col-codigo" />
                            <dx:GridViewDataTextColumn FieldName="Descripcion" Width="300px" 
                                CellStyle-CssClass="col-descripcion" />
                            <dx:GridViewDataTextColumn FieldName="PrecioMenudeo" Width="150px" 
                                CellStyle-CssClass="col-precio-menudeo">
                                <PropertiesTextEdit DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PrecioMayoreo" Width="150px" 
                                CellStyle-CssClass="col-precio-mayoreo">
                                <PropertiesTextEdit DisplayFormatString="{0:$0.00 MXN;-$0.00 MXN;--}" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Unidad" Width="80px" 
                                CellStyle-CssClass="col-unidad" />
                            <dx:GridViewDataTextColumn FieldName="CondicionMayoreo" Width="200px" 
                                CellStyle-CssClass="col-condicion" />
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

            // Modificación para mostrar precio de menudeo cuando no hay mayoreo
            setTimeout(function () {
                const filas = document.querySelectorAll('#gvCorralito_DXMainTable tr');
                filas.forEach(fila => {
                    const celdaCondicion = fila.querySelector('td:nth-child(6)');
                    const celdaMenudeo = fila.querySelector('td:nth-child(3)');
                    const celdaMayoreo = fila.querySelector('td:nth-child(4)');

                    // Verificar si es una fila de datos y si el precio mayoreo está vacío o es "--"
                    if (celdaMayoreo && (celdaMayoreo.textContent.trim() === '--' || celdaMayoreo.textContent.trim() === '')) {
                        // Copiar el precio de menudeo a mayoreo
                        if (celdaMenudeo) {
                            celdaMayoreo.textContent = celdaMenudeo.textContent;
                        }
                    }

                    // Resaltar filas con promoción (código original)
                    if (celdaCondicion && celdaCondicion.textContent.trim() !== '') {
                        if (fila.classList.contains('dxgvDataRow')) {
                            fila.classList.add('dxgvDataRow-con-promocion');
                        } else if (fila.classList.contains('dxgvDataRowAlt')) {
                            fila.classList.add('dxgvDataRowAlt-con-promocion');
                        }
                    }
                });
            }, 100);
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