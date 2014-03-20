using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class sportUEL
    {
        public string nomSport { get; set; }
        public string jourSport { get; set; }
        public string heureDebut { get; set; }
        public string heureFin { get; set; }
        public string siteSport { get; set; }

        protected void InitDefaultValues()
        {
            nomSport = null;
            jourSport = null;
            heureDebut = null;
            heureFin = null;
            siteSport = null;
        }

        public sportUEL()
        {
            InitDefaultValues();
        }
    }
}
