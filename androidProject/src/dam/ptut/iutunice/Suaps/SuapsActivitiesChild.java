package dam.ptut.iutunice.Suaps;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParserException;

import android.content.res.XmlResourceParser;

public class SuapsActivitiesChild {

	String Name;
	String Infos;
	ArrayList<SuapsActivitiesChildDay>daysArray;
	
	public SuapsActivitiesChild(XmlResourceParser xpp)throws XmlPullParserException, IOException{
//		Log.v("debug", "xpp.name = " + xpp.getName());
		
		
//		xpp.require(XmlPullParser.START_TAG, null, "activite");
//		xpp.next();
//
//		xpp.require(XmlPullParser.START_TAG, null, "nom");
//		this.Name = xpp.nextText();
//		Log.v("debug", "name = " + this.Name);
//		xpp.next();
		
		
		if(xpp.getName().equals("nom")){
			this.Name = xpp.nextText();
			xpp.next();
//			Log.v("debug", "name = " + this.Name);
		}
		
//		if(xpp.getName().equals("renseignement")){
//			this.Infos = xpp.nextText();
//			Log.v("debug", "infos = " +this.Infos);
//			xpp.next();
//		}else{
//			this.Infos = "";
//			xpp.nextText();
//			xpp.next();
//		}
		
//		if(xpp.getName().equals("jour")){
////			daysArray = new ArrayList<SuapsActivitiesItemDay>;
//			Log.v("debug", "day = " + xpp.nextText());
//			SuapsActivitiesItemDay day = new SuapsActivitiesItemDay(xpp.nextText());
//			daysArray.add(day);
//			xpp.next();
//		}
	}

	public String toString(){
		return "nom : " + Name;
		
	}

	
}
