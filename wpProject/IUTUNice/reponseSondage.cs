using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class reponseSondage
    {
        public string idReponse { get; set; }
        public string intitule { get; set; }

        protected void InitDefaultValues()
        {
            idReponse = null;
            intitule = null;
        }

        public reponseSondage()
        {
            InitDefaultValues();
        }
    }
}
