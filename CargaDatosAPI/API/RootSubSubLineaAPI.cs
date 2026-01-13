using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CargaDatosAPI.API
{
    public  class RootSubSubLineaAPI
    {
        public int count { get; set; }
        public string next { get; set; }
        public object previous { get; set; }
        public List<ResultsSubsSubLinea> results { get; set; }
    }
}
