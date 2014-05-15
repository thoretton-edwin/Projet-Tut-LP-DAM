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

		SuapsArray = new ArrayList<SuapsChild>();

		String type = null;
		switch (ID) {
		case 0:
			type = "activite";
			parse(xpp, type);
			break;
		case 1:
			type = "renseignement";
			parse(xpp, type);
			break;
		case 2:
			type = "site";
			parse(xpp, type);
			break;
		case 3:
			type = "sport";
			parse(xpp, type);
			break;
		// case 4:
		// type = null;
		// break;

		default:
			break;
		}
	}

	private void parse(XmlResourceParser xpp, String type)
			throws XmlPullParserException, IOException {
		// TODO Auto-generated method stub

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
				// Log.v("debug", "xpp.nextTag in While = " + xpp.getName());
				SuapsChild child = new SuapsChild(xpp, ID);
				SuapsArray.add(child);
			} else {
				xpp.next();
			}
			// Log.v("suaps array", "suaps array = " + SuapsArray.toString());
		}
		Log.v("end parse", "xpp.getName = " + xpp.getName() + " " + type);
		xpp.require(XmlPullParser.END_TAG, null, "root");
		xpp.next();
		// Log.v("end parse", "xpp.getName = " + xpp.getName());
		xpp.require(XmlPullParser.END_DOCUMENT, null, null);
	}

	public int getID() {
		return ID;
	}

	public String getTitle() {
		return Title;
	}

	public ArrayList<SuapsChild> getSuapsArray() {
		return SuapsArray;
	}
}
