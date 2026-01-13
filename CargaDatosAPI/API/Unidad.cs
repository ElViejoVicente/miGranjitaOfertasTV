using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.API
{
    public class Unidad
    {
        public int id { get; set; }
        public string factor { get; set; }
        public bool seleccionado { get; set; }
        public bool seleccionado_compra { get; set; }
        public string codigo_barras { get; set; }
        public string @base { get; set; }
        public string altura { get; set; }
        public string profundidad { get; set; }
        public string peso { get; set; }
        public string nombre { get; set; }
    }
}
