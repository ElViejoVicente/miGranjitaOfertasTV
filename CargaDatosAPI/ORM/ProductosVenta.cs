using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CargaDatosAPI.ORM
{
    public  class ProductosVenta
    {
        public string nomSucursal { get; set; } = string.Empty;
        public int idInterno { get; set; }=0;
        public string CodProducto { get; set; }= string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public decimal PrecioMenudeo { get; set; } = 0; 
        public decimal PrecioMayoreo { get; set; } = 0;
        public string Moneda { get; set; } = string.Empty;
        public string Unidad { get; set; } = string.Empty;
        public string CondicionMayoreo { get; set; } = string.Empty;
    }
}
