using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class adress
    {
        public string nom { get; set; }
        public string email { get; set; }

        protected void InitDefaultValues()
        {
            nom = null;
            email = null;
        }

        public adress()
        {
            InitDefaultValues();
        }
    }
}
