using Dapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Negocio.ORM;

namespace Negocio.ProductosCarnicos
{



    public class DatosProductosVenta
    {

        protected String cnn = ConfigurationManager.AppSettings["sqlConn.ConnectionString"];



        public List<ProductosVenta> ObtenerProductosVenta(string nombreSucursal)
        {
            try
            {
                List<ProductosVenta> resultado = new List<ProductosVenta>();

                using (var db = new SqlConnection(cnn))
                {
                    resultado = db.Query<ProductosVenta>
                        (
                        sql: "sp_DameProductosXSucursal", param: new
                        {
                            nombreSucursal

                        }, commandType: CommandType.StoredProcedure
                        ).ToList();
                }
                return resultado;



            }
            catch (Exception ex)
            {
                // Manejar el error, por ejemplo, registrar el error o lanzar una excepción personalizada
                throw new Exception("Error al obtener los productos de venta: " + ex.Message);
            }
        }

    }
}
