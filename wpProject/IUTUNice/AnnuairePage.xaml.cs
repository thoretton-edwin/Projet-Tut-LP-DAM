using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;

namespace IUTUNice
{
    public partial class AnnuairePage : PhoneApplicationPage
    {
        public AnnuairePage()
        {
            InitializeComponent();
            webView1.Navigate(new Uri("http://annuaire.unice.fr"), null, /*"User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; HTC; T8788)"*/ "");
        }
    }
}