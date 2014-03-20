using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class questionSondage
    {
        public string idQuestion {get; set;}
        public string intituleQuestion { get; set; }
        public reponseSondage[] listeReponses { get; set; }

        protected void InitDefaultValues()
        {
            idQuestion= null;
            intituleQuestion = null;
            listeReponses = null;
        }

        public questionSondage()
        {
            InitDefaultValues();
        }
    }
}
