using CargaDatosAPI.BI;
using CargaDatosAPI.ORM;
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

            const string nombreSucursalGranjita = "MiGranjita";
            const string nombreSucursalCorralito = "Corralito";



            try
            {

                List<Negocio.API.Result> listaProductos = new List<Negocio.API.Result>();


                datosBi.FnlogApp("Consultoría-It");
                datosBi.FnlogApp("Consulta los datos de productos de las sucursales  Mi granjita y Corralito por medio de API ..");
                datosBi.FnlogApp("Creation Date: 2025-06-20..............................");
                datosBi.FnlogApp("Last update Date: 2025-06-27...........................");
                datosBi.FnlogApp("V1.0");
                datosBi.FnlogApp("........................Start..........................");

                // carga de datos de la API Mi Granjita

                datosBi.FnlogApp("Consultando la llamada a la API Mi Granjita.");


                listaProductos = datosBi.ObtenerProductosGranjita();


                if (listaProductos.Count == 0)
                {
                    datosBi.FnlogApp("la API  Mi Granjita No retorno Productos ! .");


                }
                else
                {
                    datosBi.FnlogApp("la API Mi Granjita retorno: " + listaProductos.Count.ToString() + " Productos.");


                    // paso numero 1 limpiar los registros de la sucursal Mi Granjita


                    datosBi.FnlogApp("Intentando limpiar los productos de la sucursal Mi Granjita en BASE datos");
                    datosBi.BorrarTodosLosProductosVenta(nombreSucursalGranjita);




                    // paso numero 2 guardar los productos en la base de datos
                    datosBi.FnlogApp("Intentando guardar productos en BASE datos");


                    foreach (var item in listaProductos)
                    {

                        ProductosVenta datoAlta = new ProductosVenta
                        {
                            nomSucursal = nombreSucursalGranjita,
                            idInterno = item.id ,
                            CodProducto = item.codigo,
                            Descripcion = item.descripcion,
                            PrecioMenudeo =  Convert.ToDecimal( item.precio), 
                            PrecioMayoreo = Convert.ToDecimal(item.precio_neto),
                            Moneda =  item.moneda == null ? "" : item.moneda,
                            Unidad = item.unidad.nombre,
                            CondicionMayoreo = item.descripcion_ecommerce == null ? "" : item.descripcion_ecommerce
                        };




                        datosBi.AltaProductosVenta(datoAlta);
                    }


                    datosBi.FnlogApp("Datos Cargados Correctamente.");

                }





                // carga de datos de la API Corralito



                //listaProductos = datosBi.ObtenerProductosCorralito();

                //if (listaProductos.Count == 0)
                //{
                //    datosBi.FnlogApp("la API Corralito  No retorno Productos ! .");


                //}
                //else
                //{
                //    datosBi.FnlogApp("la API Corralito: " + listaProductos.Count.ToString() + " Productos.");

                //}




                datosBi.FnlogApp("Fin de la tarea");





            }
            catch (Exception ex)
            {

                datosBi.FnlogApp(ex.Message);
            }










        }
    }
}
