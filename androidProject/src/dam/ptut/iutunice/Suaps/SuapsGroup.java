package dam.ptut.iutunice.Suaps;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.content.res.XmlResourceParser;
import android.util.Log;

public class SuapsGroup {
	int ID;
	String Title;
	ArrayList<SuapsActivitiesChild> SuapsArray;
	
	public SuapsGroup(int id, String title, XmlResourceParser xpp)
			throws XmlPullParserException, IOException{
		this.ID = id;
		this.Title = title;
		
		SuapsArray = new ArrayList<SuapsActivitiesChild>();
		
		Log.v("sur balise response (début)", ""+xpp.getName() );
		while (xpp.getEventType() != XmlPullParser.END_DOCUMENT) {
			// if (xpp.getEventType() == XmlPullParser.START_TAG &&
			// "activite".equals(xpp.getName())) {
			if (xpp.getEventType() == XmlPullParser.START_TAG) {
				// Log.v("debug", "xpp = " + xpp.getName());
				if ("nom".equals(xpp.getName())) {
					SuapsActivitiesChild item = new SuapsActivitiesChild(xpp);
					SuapsArray.add(item);
				}
			}
			xpp.next();
		}
		Log.v("Parse", "suapsItem = " + SuapsArray.toString());
	}
}
