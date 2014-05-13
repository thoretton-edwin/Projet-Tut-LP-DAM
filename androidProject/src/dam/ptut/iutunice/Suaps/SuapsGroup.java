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
	ArrayList<SuapsChild> SuapsArray;

	public SuapsGroup(int id, String title, XmlResourceParser xpp)
			throws XmlPullParserException, IOException {
		this.ID = id;
		this.Title = title;

		String type = null;
		switch (ID) {
		case 0:
			type = "activite";
			break;
		case 1:
			type = "renseignement";
			break;
		case 2:
			type = "lieux";
			break;
		case 3:
			type = "uel";
			break;
		case 4:
			type = null;
			break;

		default:
			break;
		}

		SuapsArray = new ArrayList<SuapsChild>();

		xpp.next();
		// Log.v("test", "xpp = " + xpp.getName()); // null
		xpp.require(XmlPullParser.START_DOCUMENT, null, null);
		xpp.nextTag();
		Log.v("debug", "xpp.nextTag = " + xpp.getName()); // root
		xpp.require(XmlPullParser.START_TAG, null, "root");

		while (xpp.getEventType() == XmlPullParser.START_TAG
				|| type.equals(xpp.getName())) {
			if (xpp.getEventType() == XmlPullParser.START_TAG
					&& type.equals(xpp.getName())) {
				Log.v("debug", "xpp.nextTag in While = " + xpp.getName());
				SuapsChild child = new SuapsChild(xpp, ID);
				SuapsArray.add(child);
			} else {
				xpp.next();
			}
			// Log.v("suaps array", "suaps array = " + SuapsArray.toString());
		}
		Log.v("end parse", "xpp.getName = " + xpp.getName());
		// xpp.require(XmlPullParser.END_TAG, null, type);
		// Log.v("end parse", "xpp.getName = " + xpp.getName());
		// xpp.next();
		xpp.require(XmlPullParser.END_TAG, null, "root");
		// xpp.next();
		// Log.v("end parse", "xpp.getName = " + xpp.getName());
		xpp.require(XmlPullParser.END_DOCUMENT, null, null);

	}
}
