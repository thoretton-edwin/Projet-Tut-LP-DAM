using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class seance
    {
        public string heureSeance { get; set; }
        public string lieuSeance { get; set; }
        public string autreSeance { get; set; }
        public string responsableSeance { get; set; }
        
        protected void InitDefaultValues()
        {
            heureSeance = null;
            lieuSeance = null;
            autreSeance = null;
            responsableSeance = null;
        }

        public seance()
        {
            InitDefaultValues();
        }
    }
}
