using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.API
{
    public class Result
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string codigo_origen { get; set; }
        public int medio_distribucion { get; set; }
        public string descripcion { get; set; }
        public string ce_fraccion_arancelaria { get; set; }
        public string descripcion_ingles { get; set; }
        public string descripcion_ecommerce { get; set; }
        public int tipo { get; set; }
        public string clave_prod_serv { get; set; }
        public int linea { get; set; }
        public int sublinea { get; set; }
        public int subsublinea { get; set; }
        public List<InfoAlmacene> info_almacenes { get; set; }
        public List<Composicione> composiciones { get; set; }
        public string descripcion_adicional { get; set; }
        public string unidad_aduana { get; set; }
        public string imagen_url { get; set; }
        public double costo_ensamble { get; set; }
        public double costo { get; set; }
        public string marca { get; set; }
        public double porcentaje_iva { get; set; }
        public double porcentaje_ieps { get; set; }
        public bool restringir_decimales { get; set; }
        public double precio { get; set; }
        public double precio_neto { get; set; }
        public string moneda { get; set; }
        public Unidad unidad { get; set; }
        public List<Unidade> unidades { get; set; }
    }
}
