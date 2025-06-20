using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.API
{
    public class InfoAlmacene
    {
        public Almacen almacen { get; set; }
        public double disponible { get; set; }
        public List<Promocione> promociones { get; set; }
        public double precio_unitario { get; set; }
        public double costo_reposicion { get; set; }
        public double precio_neto { get; set; }
    }
}
