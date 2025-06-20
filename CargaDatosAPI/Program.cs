using CargaDatosAPI.BI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CargaDatosAPI
{
    internal class Program
    {
        static void Main(string[] args)

        {
            DatosBI datosBi = new DatosBI();



            try
            {

                List<Negocio.API.Result> listaProductos = new List<Negocio.API.Result>();

                datosBi.FnlogApp("Consultoría-It");
                datosBi.FnlogApp("Consulta los datos de productos de las sucursales  Mi granjita y Corralito por medio de API ..");
                datosBi.FnlogApp("Creation Date: 2025-06-20..............................");
                datosBi.FnlogApp("Last update Date: 2025-06-20...........................");
                datosBi.FnlogApp("V1.0");
                datosBi.FnlogApp("........................Start..........................");


                datosBi.FnlogApp("Consultando la llamada a la API Mi Granjita.");


                listaProductos = datosBi.ObtenerProductosGranjita();


                if (listaProductos.Count == 0)
                {
                    datosBi.FnlogApp("la API  Mi Granjita No retorno Productos ! .");


                }
                else
                {
                    datosBi.FnlogApp("la API Mi Granjita retorno: " + listaProductos.Count.ToString() + " Productos.");

                    datosBi.FnlogApp("Intentando guardar productos en BASE datos");






                }




                listaProductos = datosBi.ObtenerProductosCorralito();

                if (listaProductos.Count == 0)
                {
                    datosBi.FnlogApp("la API Corralito  No retorno Productos ! .");


                }
                else
                {
                    datosBi.FnlogApp("la API Corralito: " + listaProductos.Count.ToString() + " Productos.");

                }








            }
            catch (Exception ex)
            {

                datosBi.FnlogApp(ex.Message);
            }










        }
    }
}
