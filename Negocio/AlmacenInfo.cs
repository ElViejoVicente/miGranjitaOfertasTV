using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class AlmacenInfo
    {

        public Almacen Almacen { get; set; }
        public decimal Disponible { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal CostoReposicion { get; set; }
        public decimal PrecioNeto { get; set; }
    }
}
