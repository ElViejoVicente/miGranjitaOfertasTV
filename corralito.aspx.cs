using Negocio.ORM;
using Negocio.ProductosCarnicos;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace miGranjitaOfertasTV
{
    public partial class corralito : System.Web.UI.Page
    {



        #region Propiedades

        protected DatosProductosVenta datosProductos = new DatosProductosVenta();


        public List<ProductosVenta> ListaProductos
        {
            get

            {
                List<ProductosVenta> sseListaProductosMiGranjita = new List<ProductosVenta>();
                if (this.Session["sseListaProductosMiGranjita"] != null)
                {
                    sseListaProductosMiGranjita = (List<ProductosVenta>)this.Session["sseListaProductosMiGranjita"];
                }

                return sseListaProductosMiGranjita;
            }
            set
            {
                this.Session["sseListaProductosMiGranjita"] = value;
            }

        }



        #endregion




        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    // var productos = DatosApi.ObtenerProductosGranjita();


                    ListaProductos = datosProductos.ObtenerProductosVenta("MiGranjita");   //Corralito






                }
                catch (Exception ex)
                {
                    // Manejar el error, por ejemplo mostrar un mensaje al usuario
                    // lblError.Text = "Error al cargar los productos: " + ex.Message;
                }
            }



        }
    }
}