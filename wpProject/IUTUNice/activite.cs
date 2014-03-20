using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class activite
    {
        public string nomActivite { get; set; }
        public jourActivite listeJours { get; set; }
        public string renseignement { get; set; }

        protected void InitDefaultValues()
        {
            nomActivite = null;
            listeJours = null;
            renseignement = null;
        }

        public activite()
        {
            InitDefaultValues();
        }
    }
}
