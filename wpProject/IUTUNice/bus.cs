using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class bus
    {
        public string ville { get; set; }
        public string nomArret { get; set; }
        public string[] ligne { get; set; }

        protected void InitDefaultValues()
        {
            ville = null;
            nomArret = null;
            ligne = null;
        }

        public bus()
        {
            InitDefaultValues();
        }
    }
}
