using CargaDatosAPI.BI;
using DevExpress.Web;
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

        const string nombreSucursalCorralito = "Corralito";

        protected DatosProductosVenta datosProductos = new DatosProductosVenta();


        public List<ProductosVenta> ListaProductos
        {
            get

            {
                List<ProductosVenta> sseListaProductosCorralito = new List<ProductosVenta>();
                if (this.Session["sseListaProductosCorralito"] != null)
                {
                    sseListaProductosCorralito = (List<ProductosVenta>)this.Session["sseListaProductosCorralito"];
                }

                return sseListaProductosCorralito;
            }
            set
            {
                this.Session["sseListaProductosCorralito"] = value;
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


                    ListaProductos = datosProductos.ObtenerProductosVenta(nombreSucursalCorralito);   //Corralito

                    gvCorralito.DataSource = ListaProductos;
                    gvCorralito.DataBind();
                }
                catch (Exception ex)
                {
                    // Manejar el error, por ejemplo mostrar un mensaje al usuario
                    // lblError.Text = "Error al cargar los productos: " + ex.Message;
                }
            }

    

        }

        protected void gvCorralito_DataBinding(object sender, EventArgs e)
        {
           
            gvCorralito.DataSource = ListaProductos;
        }

    }
}