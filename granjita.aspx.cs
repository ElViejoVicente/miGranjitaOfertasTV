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
    public partial class granjita : System.Web.UI.Page
    {



        #region Propiedades


        const string nombreSucursalGranjita = "MiGranjita";




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
                    // Cargar datos
                    Session.Remove("sseListaProductosMiGranjita");
                    ListaProductos = datosProductos.ObtenerProductosVenta(nombreSucursalGranjita);

                    // Vincular datos a ambos grids
                    

                    gvMiGranjita.DataSource = ListaProductos;
                    gvMiGranjita.DataBind();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        $"alert('Error al cargar productos: {ex.Message.Replace("'", "")}');", true);
                }
            }
        }

        protected void gvMiGranjita_DataBinding(object sender, EventArgs e)
        {
            gvMiGranjita.DataSource = ListaProductos;

        }

    }
}