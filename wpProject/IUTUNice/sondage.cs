using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class sondage
    {
        public string nomSondage { get; set; }
        public questionSondage[] listeQuestions { get; set; }

        protected void InitDefaultValues()
        {
            nomSondage = null;
            listeQuestions = null;
        }

        public sondage()
        {
            InitDefaultValues();
        }
    }
}
