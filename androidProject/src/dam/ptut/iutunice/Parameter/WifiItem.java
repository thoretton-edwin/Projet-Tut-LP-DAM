package dam.ptut.iutunice.Parameter;

import java.io.IOException;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.util.Log;

public class WifiItem {
	final String place;
	final String id;
	final String name;
	final String ssid;
	final String key;
	final String login;
	final String password;
	
	//-- constructeur, parse XML
	public WifiItem(XmlPullParser parser, String place) throws XmlPullParserException, IOException{
		this.place = place;
		
		//Log.v("sur balise reseau (début)", ""+parser.getName() );
		this.id = parser.getAttributeValue(null,"id");
		//Log.v("valeur id :", this.id );
		
		parser.nextTag();
		//Log.v("sur balise nom", ""+parser.getName() );
		this.name = parser.nextText();
		//Log.v("valeur name :", this.name );
		
		parser.nextTag();
		//Log.v("sur balise ssid", ""+parser.getName() );
		this.ssid = parser.nextText();
		//Log.v("valeur ssid :", this.ssid );
		
		parser.nextTag();
		//Log.v("sur balise clef", ""+parser.getName() );
		this.key = parser.nextText();
		//Log.v("valeur key :", this.key );
		
		parser.nextTag();
		//Log.v("sur balise login", ""+parser.getName() );
		this.login = parser.nextText();
		//Log.v("valeur login :", this.login );
		
		parser.nextTag();
		//Log.v("sur balise mdp", ""+parser.getName() );
		this.password = parser.nextText();
		//Log.v("valeur password :", this.password );
		
		parser.nextTag();
		//Log.v("sur balise reseau (fin)", ""+parser.getName() );
		//parser.require(XmlPullParser.END_TAG, null, "reseau");
	}
}
