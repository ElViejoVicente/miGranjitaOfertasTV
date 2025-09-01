using CargaDatosAPI.API;
using CargaDatosAPI.ORM;
using Dapper;
using Negocio.API;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace CargaDatosAPI.BI
{
    public class DatosBI
    {

        #region Propiedades

        protected String urlGranjita = ConfigurationManager.AppSettings["urlAPI.Granjita"];
        protected String urlGranjitaSubSubLinea = ConfigurationManager.AppSettings["urlAPI.GranjitaSubSubLineas"];
        protected String KeyGranjita = ConfigurationManager.AppSettings["urlAPIKey.Granjita"];

        protected String urlCorralito = ConfigurationManager.AppSettings["urlAPI.Corralito"];
        protected String urlCorralitoSubSubLinea = ConfigurationManager.AppSettings["urlAPI.CorralitoSubSubLineas"];
        protected String keyCorralito = ConfigurationManager.AppSettings["urlAPIKey.Corralito"];

        protected int LimiteLlamadas = 100;

        protected String cnn = ConfigurationManager.AppSettings["sqlConn.ConnectionString"];

        #endregion


        public Boolean AltaProductosVenta(ProductosVenta values)
        {
            try
            {
                using (var db = new SqlConnection(cnn))
                {
                    db.Execute(sql: "sp_CRUD_ProductosVenta_Insert", param: new
                    {
                        values.nomSucursal,
                        values.idInterno,
                        values.CodProducto,
                        values.Descripcion,
                        values.PrecioMenudeo,
                        values.PrecioMayoreo,
                        values.Moneda,
                        values.Unidad,
                        values.CondicionMayoreo

                    }, commandType: CommandType.StoredProcedure);
                }

                return true;

            }
            catch (Exception ex)
            {

                throw new Exception("Error al ejecutar sp_CRUD_ProductosVenta_Insert, detalle: \n" + ex.Message, ex);
            }
        }



        public Boolean BorrarTodosLosProductosVenta(string nombreSucursal)
        {
            try
            {
                using (var db = new SqlConnection(cnn))
                {
                    db.Execute(sql: "sp_BorraTodosLosProductosVenta", param: new
                    {
                        nombreSucursal

                    }, commandType: CommandType.StoredProcedure);
                }


                return true;

            }
            catch (Exception ex)
            {

                throw new Exception("Error al ejecutar sp_BorraTodosLosProductosVenta, detalle: \n" + ex.Message, ex);
            }
        }






        public string FnlogApp(string sMsg)
        {
            try
            {
                string Ruta = ConfigurationManager.AppSettings["rutalog"].ToString();
                System.IO.StreamWriter oSW = new System.IO.StreamWriter(Ruta + @"\Log_" + DateTime.Now.Date.ToString("yyyy-MM-dd") + ".txt", true);
                string scomando = string.Empty;
                oSW.WriteLine(DateTime.Now + " || Evento: " + sMsg);
                oSW.Flush();
                oSW.Close();
                return Ruta + @"\Log_" + DateTime.Now.Date.ToString("yyyy-MM-dd") + ".txt";
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public List<Result> ObtenerProductosGranjita()
        {
            try
            {


                //var url = "https://pcg.admintotal.com/api/v2/productos/";
                //var apiKey = "V3S2BQ7KR83NKW3Y47RSWEOOLNQMZ40JWEY";
                int contador = 0;


                // paso 1 obtener el catalogo de SubSubLines

                //FnlogApp("Intentando consultar catalogo de subsubLineas ! .");

                //RootSubSubLineaAPI resultadoSubSubLinea = new RootSubSubLineaAPI();
                //List<ResultsSubsSubLinea> resultadoSubSubLineas = new List<ResultsSubsSubLinea>();

                //contador = 0;

                //var requestSL = (HttpWebRequest)WebRequest.Create(urlGranjitaSubSubLinea);

                //requestSL.Method = "GET";
                //requestSL.Headers.Add("api-key", KeyGranjita);

                //using (var response = (HttpWebResponse)requestSL.GetResponse())
                //using (var stream = response.GetResponseStream())
                //using (var reader = new StreamReader(stream))
                //{
                //    var json = reader.ReadToEnd();
                //    resultadoSubSubLinea = JsonConvert.DeserializeObject<RootSubSubLineaAPI>(json);
                //}

                //resultadoSubSubLineas.AddRange(resultadoSubSubLinea.results);

                //while (resultadoSubSubLinea.next != null && contador < LimiteLlamadas)
                //{


                //    var requestNext = (HttpWebRequest)WebRequest.Create(resultadoSubSubLinea.next);


                //    requestNext.Method = "GET";
                //    requestNext.Headers.Add("api-key", KeyGranjita);

                //    using (var response = (HttpWebResponse)requestNext.GetResponse())
                //    using (var stream = response.GetResponseStream())
                //    using (var reader = new StreamReader(stream))
                //    {
                //        var json = reader.ReadToEnd();
                //        resultadoSubSubLinea = JsonConvert.DeserializeObject<RootSubSubLineaAPI>(json);
                //    }


                //    resultadoSubSubLineas.AddRange(resultadoSubSubLinea.results);
                //    contador++;
                //}


                //paso 2.1 filtrar las subsublineas que contienen Calle 7

                //FnlogApp(resultadoSubSubLineas.Count.ToString() + " subsubLineas colectadas..");

                //List<ResultsSubsSubLinea> SubSubLineaFiltradas = resultadoSubSubLineas
                //    .Where(x => x.nombre.Contains("Calle 7"))
                //    .ToList();


                //FnlogApp(SubSubLineaFiltradas.Count.ToString() + " subsubLineas son Calle 7..");

                RootllamadoAPI resultado = new RootllamadoAPI();

                List<Result> resultadoAcumulado = new List<Result>();

                // List<Result> resultadoFiltrado = new List<Result>();

                contador = 0;


                //System.Threading.Thread.Sleep(1000);

                // paso 2.2 obtener el catalogo de Productos Completo iterando  por subsublineas

                FnlogApp("Intentando consultar catalogo de productos ! .");

                //foreach (var subSubLinea in SubSubLineaFiltradas)
                //{


                    var request = (HttpWebRequest)WebRequest.Create(urlGranjita );


                    request.Method = "GET";
                    request.Headers.Add("api-key", KeyGranjita);

                    using (var response = (HttpWebResponse)request.GetResponse())
                    using (var stream = response.GetResponseStream())
                    using (var reader = new StreamReader(stream))
                    {
                        var json = reader.ReadToEnd();
                        resultado = JsonConvert.DeserializeObject<RootllamadoAPI>(json);
                    }

                    //  ojo considerar desde este punto hacer el filtrado de los productos y no en la capa superior front 

                    // esto es la carga 1 de n
                    resultadoAcumulado.AddRange(resultado.results);

                    while (resultado.next != null && contador < LimiteLlamadas)
                    {


                        var requestNext = (HttpWebRequest)WebRequest.Create(resultado.next);


                        requestNext.Method = "GET";
                        requestNext.Headers.Add("api-key", KeyGranjita);

                        using (var response = (HttpWebResponse)requestNext.GetResponse())
                        using (var stream = response.GetResponseStream())
                        using (var reader = new StreamReader(stream))
                        {
                            var json = reader.ReadToEnd();
                            resultado = JsonConvert.DeserializeObject<RootllamadoAPI>(json);
                        }


                        resultadoAcumulado.AddRange(resultado.results);
                        contador++;
                    }


                    System.Threading.Thread.Sleep(1000); // Pausa de 1 segundos entre cada llamada para evitar sobrecarga

               // }




                FnlogApp(resultadoAcumulado.Count().ToString() + " Productos colectados con Flag -> MostrarTV .");




                return resultadoAcumulado;

            }
            catch (Exception ex)
            {

                throw new Exception("Fallo en la llamada a la API de Granjita , Detalle: " + ex.Message);
            }


        }


        public List<Result> ObtenerProductosCorralito()
        {
            try
            {


                //var url = "https://corralito.admintotal.com/api/v2/productos/";
                //var apiKey = "D5QNWDH39NUGGRKCDR5VWEGXMMZMX3L77EM";
                int contador = 0;


                // paso 1 obtener el catalogo de SubSubLinea

                //RootSubSubLineaAPI resultadoSubSubLinea = new RootSubSubLineaAPI();
                //List<ResultsSubsSubLinea> resultadoSubSubLineas = new List<ResultsSubsSubLinea>();

                //contador = 0;

                //var requestSL = (HttpWebRequest)WebRequest.Create(urlCorralitoSubSubLinea);

                //requestSL.Method = "GET";
                //requestSL.Headers.Add("api-key", keyCorralito);

                //using (var response = (HttpWebResponse)requestSL.GetResponse())
                //using (var stream = response.GetResponseStream())
                //using (var reader = new StreamReader(stream))
                //{
                //    var json = reader.ReadToEnd();
                //    resultadoSubSubLinea = JsonConvert.DeserializeObject<RootSubSubLineaAPI>(json);
                //}

                //resultadoSubSubLineas.AddRange(resultadoSubSubLinea.results);

                //while (resultadoSubSubLinea.next != null && contador < LimiteLlamadas)
                //{


                //    var requestNext = (HttpWebRequest)WebRequest.Create(resultadoSubSubLinea.next);


                //    requestNext.Method = "GET";
                //    requestNext.Headers.Add("api-key", keyCorralito);

                //    using (var response = (HttpWebResponse)requestNext.GetResponse())
                //    using (var stream = response.GetResponseStream())
                //    using (var reader = new StreamReader(stream))
                //    {
                //        var json = reader.ReadToEnd();
                //        resultadoSubSubLinea = JsonConvert.DeserializeObject<RootSubSubLineaAPI>(json);
                //    }


                //    resultadoSubSubLineas.AddRange(resultadoSubSubLinea.results);
                //    contador++;
                //}



                ////paso 2.1 filtrar las subsublineas que contienen Calle 7

                //FnlogApp(resultadoSubSubLineas.Count.ToString() + " subsubLineas colectadas..");

                //List<ResultsSubsSubLinea> SubSubLineaFiltradas = resultadoSubSubLineas
                //    .Where(x => x.nombre.Contains("Corralito"))
                //    .ToList();



               // FnlogApp(SubSubLineaFiltradas.Count.ToString() + " subsubLineas son Corralito..");


                //paso 2.1 filtrar las subsublineas que contienen Calle 7



                RootllamadoAPI resultado = new RootllamadoAPI();

                List<Result> resultadoAcumulado = new List<Result>();

                List<Result> resultadoFiltrado = new List<Result>();

                contador = 0;


                // paso 2.2 obtener el catalogo de Productos Completo iterando  por subsublineas
                //System.Threading.Thread.Sleep(1000); // Pausa de 1 segundos entre cada llamada para evitar sobrecarga

                FnlogApp("Intentando consultar catalogo de productos ! .");



                //foreach (var subSubLinea in SubSubLineaFiltradas)
                //{

                    var request = (HttpWebRequest)WebRequest.Create(urlCorralito);


                    request.Method = "GET";
                    request.Headers.Add("api-key", keyCorralito);

                    using (var response = (HttpWebResponse)request.GetResponse())
                    using (var stream = response.GetResponseStream())
                    using (var reader = new StreamReader(stream))
                    {
                        var json = reader.ReadToEnd();
                        resultado = JsonConvert.DeserializeObject<RootllamadoAPI>(json);
                    }

                    //  ojo considerar desde este punto hacer el filtrado de los productos y no en la capa superior front 

                    // esto es la carga 1 de n
                    resultadoAcumulado.AddRange(resultado.results);

                    while (resultado.next != null && contador < LimiteLlamadas)
                    {


                        var requestNext = (HttpWebRequest)WebRequest.Create(resultado.next);


                        requestNext.Method = "GET";
                        requestNext.Headers.Add("api-key", keyCorralito);

                        using (var response = (HttpWebResponse)requestNext.GetResponse())
                        using (var stream = response.GetResponseStream())
                        using (var reader = new StreamReader(stream))
                        {
                            var json = reader.ReadToEnd();
                            resultado = JsonConvert.DeserializeObject<RootllamadoAPI>(json);
                        }


                        resultadoAcumulado.AddRange(resultado.results);
                        contador++;
                    }

                    System.Threading.Thread.Sleep(1000); // Pausa de 1 segundos entre cada llamada para evitar sobrecarga

              //  }



                FnlogApp(resultadoAcumulado.Count().ToString() + " Productos colectados con Flag -> MostrarTV .");





                return resultadoAcumulado;

            }
            catch (Exception ex)
            {

                throw new Exception("Fallo en la llamada a la API de El Corralito , Detalle: " + ex.Message);
            }


        }
    }
}