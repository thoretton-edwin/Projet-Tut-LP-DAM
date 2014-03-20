using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IUTUNice
{
    class site
    {
        public string postalAdress { get; set; }
        public adress[] resps { get; set; }
        public string installations { get; set; }
        public string permanences { get; set; }
        public string tel { get; set; }
        public string fax { get; set; }

        protected void InitDefaultValues()
        {
            postalAdress = null;
            resps = null;
            installations = null;
            permanences = null;
            tel = null;
            fax = null;
        }

        public site()
        {
            InitDefaultValues();
        }
    }


}
