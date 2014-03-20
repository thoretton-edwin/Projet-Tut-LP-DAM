using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Microsoft.Phone.Maps.Controls;

namespace IUTUNice
{
    public partial class MapPage : PhoneApplicationPage
    {
        public MapPage()
        {
            InitializeComponent();
            Map MyMap = new Map();
            ContentPanel.Children.Add(MyMap);
        }
    }
}