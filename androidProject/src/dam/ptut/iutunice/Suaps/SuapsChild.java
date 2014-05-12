package dam.ptut.iutunice.Suaps;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.content.res.XmlResourceParser;
import android.util.Log;

public class SuapsChild {

	String Name;
	String Infos;
	ArrayList<SuapsChildActivities> daysArray;

	public SuapsChild(XmlResourceParser xpp, int ID)
			throws XmlPullParserException, IOException {
		daysArray = new ArrayList<SuapsChildActivities>();

		switch (ID) {
		case 0:
			parseActivities(xpp);
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			break;
		case 4:
			break;

		default:
			break;
		}
		// if(xpp.getName().equals("nom")){
		// this.Name = xpp.nextText();
		// xpp.next();
		// // Log.v("debug", "name = " + this.Name);
		// }

		// if(xpp.getName().equals("renseignement")){
		// this.Infos = xpp.nextText();
		// Log.v("debug", "infos = " +this.Infos);
		// xpp.next();
		// }

	}

	private void parseActivities(XmlResourceParser xpp)
			throws XmlPullParserException, IOException {
		xpp.require(XmlPullParser.START_TAG, null, "activite");
		xpp.next();
		// Log.v("debug", "xpp in actChild = " + xpp.getName());

		xpp.require(XmlPullParser.START_TAG, null, "nom");
		this.Name = xpp.nextText();
		Log.v("debug", "name = " + this.Name);
		xpp.next();

		if ("renseignement".equals(xpp.getName())) {
			xpp.require(XmlPullParser.START_TAG, null, "renseignement");
			if (xpp.isEmptyElementTag()) {
				this.Infos = "";
				xpp.nextText();
			} else {
				this.Infos = xpp.nextText();
			}
			xpp.next();
			// Log.v("ActChild Before", "xpp.getName = " + xpp.getName()); //
			// balise
			// jour
		}

		xpp.require(XmlPullParser.START_TAG, null, "jour");
		while (xpp.getEventType() == XmlPullParser.START_TAG
				|| "jour".equals(xpp.getName())) {

			if (xpp.getEventType() == XmlPullParser.START_TAG
					&& "jour".equals(xpp.getName())
					|| !"".equals(xpp.getAttributeValue(null, "nom"))) {
				Log.v("AttrValue",
						"xpp jour = " + xpp.getAttributeValue(null, "nom"));
				SuapsChildActivities childDay = new SuapsChildActivities(
						xpp.getAttributeValue(null, "nom"), xpp);
				daysArray.add(childDay);
			} else {
				xpp.next();
			}
			// Log.v("debug end parse", "xpp.getName = " + xpp.getName());
			xpp.require(XmlPullParser.END_TAG, null, "jour");
			// xpp.nextTag();
			// Log.v("daysArray", "days array = " + daysArray.toString());
			xpp.nextTag();

		}
		// Log.v("debug end parse", "xpp.getName = " + xpp.getName());
		xpp.require(XmlPullParser.END_TAG, null, "activite");
	}

	public String toString() {
		return "nom : " + Name;

	}

}
