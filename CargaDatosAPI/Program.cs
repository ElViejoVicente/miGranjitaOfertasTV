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

                        // validacion si existe almcen nombre 003 Calle 7

                        if (item.info_almacenes.Exists(x=> x.almacen.nombre.Contains("Calle 7")))   // Validar a OJo que no existan variantes de Calle 7 
                        {


                            var datAlmacen = item.info_almacenes.Where(x => x.almacen.nombre.Contains("Calle 7")).FirstOrDefault();

                            if (datAlmacen== null)
                            {
                                datosBi.FnlogApp("No se encontraron datos correctos del almacen de donde tomar los montos.");
                                continue;
                            }


                            var promocionesDisp = datAlmacen.promociones.FirstOrDefault();

                            if (promocionesDisp == null)
                            {
                                datosBi.FnlogApp("No se encontraron datos correctos de Promociones de donde tomar los montos.");
                                continue;

                            }


                            ProductosVenta datoAlta = new ProductosVenta
                            {
                                nomSucursal = nombreSucursalGranjita,
                                idInterno = item.id,
                                CodProducto = item.codigo,
                                Descripcion = item.descripcion,
                                PrecioMenudeo = Convert.ToDecimal(datAlmacen.precio_neto),
                                PrecioMayoreo = Convert.ToDecimal(promocionesDisp.precio_neto),
                                Moneda = item.moneda == null ? "" : item.moneda,
                                Unidad = item.unidad.nombre == "Kilogramos" ? "Kg" : item.unidad.nombre,
                                CondicionMayoreo = "Al comprar " + Math.Round(Convert.ToDecimal(promocionesDisp.cantidad), 2).ToString() + " " + 
                                (promocionesDisp.nombre_unidad == "Kilogramos" ? "Kg" : promocionesDisp.nombre_unidad) + " o más."
                            };



                            datosBi.AltaProductosVenta(datoAlta);
                        }





                    }


                    datosBi.FnlogApp("Datos Cargados Correctamente.");

                }





                // carga de datos de la API Corralito

                datosBi.FnlogApp("Consultando la llamada a la API Corralito.");


                listaProductos = datosBi.ObtenerProductosCorralito();


                if (listaProductos.Count == 0)
                {
                    datosBi.FnlogApp("la API Corralito No retorno Productos ! .");


                }
                else
                {
                    datosBi.FnlogApp("la API Corralito retorno: " + listaProductos.Count.ToString() + " Productos.");


                    // paso numero 1 limpiar los registros de la sucursal Corralito


                    datosBi.FnlogApp("Intentando limpiar los productos de la sucursal Corralito en BASE datos");
                    datosBi.BorrarTodosLosProductosVenta(nombreSucursalCorralito);




                    // paso numero 2 guardar los productos en la base de datos
                    datosBi.FnlogApp("Intentando guardar productos en BASE datos");


                    foreach (var item in listaProductos)
                    {

                        ProductosVenta datoAlta = new ProductosVenta
                        {
                            nomSucursal = nombreSucursalCorralito,
                            idInterno = item.id,
                            CodProducto = item.codigo,
                            Descripcion = item.descripcion,
                            PrecioMenudeo = Convert.ToDecimal(item.precio),
                            PrecioMayoreo = Convert.ToDecimal(item.precio_neto),
                            Moneda = item.moneda == null ? "" : item.moneda,
                            Unidad = item.unidad.nombre,
                            CondicionMayoreo = item.descripcion_ecommerce == null ? "" : item.descripcion_ecommerce
                        };




                        datosBi.AltaProductosVenta(datoAlta);
                    }


                    datosBi.FnlogApp("Datos Cargados Correctamente.");

                }




                datosBi.FnlogApp("Fin de la tarea");





            }
            catch (Exception ex)
            {

                datosBi.FnlogApp(ex.Message);
            }










        }
    }
}
