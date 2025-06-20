using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.API
{
    public class Promocione
    {
        public string cantidad { get; set; }
        public string valor_unitario { get; set; }
        public string precio_neto { get; set; }
        public string inicio { get; set; }
        public string vencimiento { get; set; }
        public string cliente { get; set; }
        public string porcentaje { get; set; }
        public string cliente_id { get; set; }
        public string clasificacion { get; set; }
        public string clasificacion_id { get; set; }
        public bool? usa_porcentaje { get; set; }
        public bool restringir_unidad { get; set; }
        public string nombre_unidad { get; set; }
        public string factor { get; set; }
    }
}
