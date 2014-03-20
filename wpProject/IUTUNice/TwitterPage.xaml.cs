using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Microsoft.Phone.Tasks;

using System.IO.IsolatedStorage;
using System.IO;
using System.Windows.Resources;

namespace IUTUNice
{
    public partial class TwitterPage : PhoneApplicationPage
    {
        public TwitterPage()
        {
            InitializeComponent();

            webView1.Navigate(new Uri("https://twitter.com/Univ_Nice"), null, /*"User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; HTC; T8788)"*/ "");

            //SupportedOrientations = SupportedPageOrientation.Portrait | SupportedPageOrientation.Landscape;

            //webView1.Loaded += WebBrowser_OnLoaded;
        }

        /*private void WebBrowser_OnLoaded(object sender, RoutedEventArgs e)
        {
            //SaveFilesToIsoStore();
            webView1.Navigate(new Uri("https://twitter.com/univ_nice", UriKind.Relative));
        }

        private void SaveFilesToIsoStore()
        {
            //These files must match what is included in the application package,
            //or BinaryStream.Dispose below will throw an exception.
            string[] files = {
            "readme.htm"
        };

            IsolatedStorageFile isoStore = IsolatedStorageFile.GetUserStoreForApplication();

            if (false == isoStore.FileExists(files[0]))
            {
                foreach (string f in files)
                {
                    StreamResourceInfo sr = Application.GetResourceStream(new Uri(f, UriKind.Relative));
                    using (BinaryReader br = new BinaryReader(sr.Stream))
                    {
                        byte[] data = br.ReadBytes((int)sr.Stream.Length);
                        SaveToIsoStore(f, data);
                    }
                }
            }
        }

        private void SaveToIsoStore(string fileName, byte[] data)
        {
            string strBaseDir = string.Empty;
            string delimStr = "/";
            char[] delimiter = delimStr.ToCharArray();
            string[] dirsPath = fileName.Split(delimiter);

            //Get the IsoStore.
            IsolatedStorageFile isoStore = IsolatedStorageFile.GetUserStoreForApplication();

            //Re-create the directory structure.
            for (int i = 0; i < dirsPath.Length - 1; i++)
            {
                strBaseDir = System.IO.Path.Combine(strBaseDir, dirsPath[i]);
                isoStore.CreateDirectory(strBaseDir);
            }

            //Remove the existing file.
            if (isoStore.FileExists(fileName))
            {
                isoStore.DeleteFile(fileName);
            }

            //Write the file.
            using (BinaryWriter bw = new BinaryWriter(isoStore.CreateFile(fileName)))
            {
                bw.Write(data);
                bw.Close();
            }
        }*/


    }
}