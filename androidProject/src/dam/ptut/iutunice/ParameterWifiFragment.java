package dam.ptut.iutunice;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.TextHttpResponseHandler;

import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.Fragment;

import android.util.Log;
import android.util.Xml;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TableRow.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;

public class ParameterWifiFragment extends Fragment {

	//client pour connexion HTTP
	private AsyncHttpClient client = new AsyncHttpClient();
	//List sur la classe WifiItem
	private ArrayList<WifiItem> listWifi;
	//succès récupération liste wifi depuis internet
	boolean success = false;
		
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {

		View content = inflater.inflate(R.layout.fragment_wifi, container,
				false);
		
		recoveryXmlWifi(content);
		if(success){
			//affichage de la liste
		}
		
		

//		TableLayout tLayout = (TableLayout) content.findViewById(R.id.tableWifi);
//		TableRow tRow;
//		LinearLayout lLayout = new LinearLayout(getActivity());
//		lLayout.setOrientation(LinearLayout.VERTICAL);
//		tLayout.
//
//        LayoutParams layoutParams = new LayoutParams(LayoutParams.WRAP_CONTENT,
//                        LayoutParams.WRAP_CONTENT);
//        layoutParams.setMargins(5, 5, 5, 5);
//
//        for (int i = 0; i < 10; i++) {
//                tRow = new TableRow(getActivity());
//                tRow.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT,
//                                LayoutParams.WRAP_CONTENT));
//                
//                tRow.addView(generateTextView("je vais y arriver", layoutParams));
//                tRow.addView(generateTextView(String.valueOf(i), layoutParams));
//                tLayout.addView(tRow, layoutParams);
//        }
//        
//		
		
		return content;
	}
	//- Méthode permettant de récupérer le xml Wifi
	private void recoveryXmlWifi(final View content){
		client.get(getActivity(), "http://sd-6.archive-host.com/membres/up/4041201007a5bf3f0d5112ca7648a0adc66e3177/IUT_Nice_Cote_dAzur/infosWifi.xml", 
		new TextHttpResponseHandler() {
			@Override
			public void onFinish() {
		
			}

			@Override
			public void onSuccess(String responseBody) {
				try {
				//parse XML
				parseWifi(responseBody);
				success = true;
				} catch (XmlPullParserException e) {
					e.printStackTrace();
					Toast.makeText(getActivity(), "Erreur de lecture des données", Toast.LENGTH_LONG).show();
				} catch (IOException e) {
					e.printStackTrace();
					Toast.makeText(getActivity(), "Erreur de connexion lors de la lecture des données", Toast.LENGTH_LONG).show();
				}
				//barre de progression
				ProgressBar bar = (ProgressBar) content.findViewById(R.id.progressBarWifi);
				//rend invisible la barre de chargement
				bar.setVisibility(ProgressBar.GONE);
				
			}

			@Override
			public void onFailure(String responseBody, Throwable error) {
				Toast.makeText(getActivity(), "Erreur de connexion", Toast.LENGTH_LONG).show();
			}
		});
	}
	//- Méthode permettant de parser le xml Wifi
	private void parseWifi(String responseBody)
		throws XmlPullParserException, IOException {
		//création objet XmlPullParser
		XmlPullParser parser = Xml.newPullParser();
		parser.setInput(new StringReader(responseBody));
		parser.require(XmlPullParser.START_DOCUMENT, null, null);	//début
		parser.nextTag();	//balise suivante root
		parser.require(XmlPullParser.START_TAG, null, "root");	//vérif root
		listWifi = new ArrayList<WifiItem>();	//nouvelle liste
		
		//Log.v("sur balise root", ""+parser.getName() );
		String place = "";
		while(parser.nextTag() == XmlPullParser.START_TAG || "site".equals(parser.getName()) ){
			if("site".equals( parser.getName() )){
				int event = parser.getEventType();
				switch(event){
				case XmlPullParser.START_TAG:
					place = parser.getAttributeValue(null,"lieu");
					//Log.v("sur balise site (début)", ""+parser.getName() );
					break;
				case XmlPullParser.END_TAG:
					//Log.v("sur balise site (fin)", ""+parser.getName() );
					break;
				}
			}else{
				WifiItem wifi = new WifiItem(parser, place);
				listWifi.add(wifi);
			}
		}
		
		parser.require(XmlPullParser.END_TAG, null, "root");
		parser.next();
		parser.require(XmlPullParser.END_DOCUMENT, null, null);
	}
//	public TextView generateTextView(String texte, LayoutParams ly) {
//        TextView result = new TextView(getActivity());
//        result.setBackgroundColor(Color.LTGRAY);
//        result.setTextColor(Color.DKGRAY);
//        result.setGravity(Gravity.CENTER);
//        result.setPadding(2, 2, 2, 2);
//        result.setText(texte);
//        result.setTextSize(20);
//        result.setVisibility(View.VISIBLE);
//        result.setLayoutParams(ly);
//        return result;
//    }

}
