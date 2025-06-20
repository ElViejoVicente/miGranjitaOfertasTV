using Negocio.API;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace CargaDatosAPI.BI
{
    public class DatosBI
    {

        protected String urlGranjita = ConfigurationManager.AppSettings["urlAPI.Granjita"];
        protected String KeyGranjita = ConfigurationManager.AppSettings["urlAPIKey.Granjita"];

        protected String urlCorralito = ConfigurationManager.AppSettings["urlAPI.Corralito"];
        protected String keyCorralito = ConfigurationManager.AppSettings["urlAPIKey.Corralito"];

        protected int LimiteLlamadas = 100;




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

                RootllamadoAPI resultado = new RootllamadoAPI();

                List<Result> resultadoAcumulado = new List<Result>();

                List<Result> resultadoFiltrado = new List<Result>();

                int contador = 0;



                var request = (HttpWebRequest)WebRequest.Create(urlGranjita);


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





                // Aquí puedes procesar el resultado filtrado
                resultadoFiltrado = resultadoAcumulado.Where(x => x.codigo.Length == 4 && x.codigo.StartsWith("9")).ToList();

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


                //var url = "https://pcg.admintotal.com/api/v2/productos/";
                //var apiKey = "V3S2BQ7KR83NKW3Y47RSWEOOLNQMZ40JWEY";

                RootllamadoAPI resultado = new RootllamadoAPI();

                List<Result> resultadoAcumulado = new List<Result>();

                List<Result> resultadoFiltrado = new List<Result>();

                int contador = 0;



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





                // Aquí puedes procesar el resultado filtrado
                resultadoFiltrado = resultadoAcumulado.Where(x => x.codigo.Length == 4 && x.codigo.StartsWith("9")).ToList();

                return resultadoAcumulado;

            }
            catch (Exception ex)
            {

                throw new Exception("Fallo en la llamada a la API de Granjita , Detalle: " + ex.Message);
            }


        }




    }
}
