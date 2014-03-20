using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class jourActivite
    {
        public string nomJour { get; set; }
        public seance[] listeSeances { get; set; }

        protected void InitDefaultValues()
        {
            nomJour = null;
            listeSeances = null;
        }

        public jourActivite()
        {
            InitDefaultValues();
        }
    }
}
