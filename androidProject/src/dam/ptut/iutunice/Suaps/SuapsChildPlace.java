package dam.ptut.iutunice.Suaps;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class SuapsChildPlace {
	ArrayList<SuapsChildPlaceAccountable> accountableArray;
	String name;
	String email;
	String equipments;
	String permanency;

	public SuapsChildPlace(XmlPullParser xpp) throws XmlPullParserException,
			IOException {
		accountableArray = new ArrayList<SuapsChildPlaceAccountable>();
		xpp.next();
		xpp.require(XmlPullParser.START_TAG, null, "adresse");

		while (xpp.getEventType() == XmlPullParser.START_TAG
				|| "adresse".equals(xpp.getName())) {

			if (xpp.getEventType() == XmlPullParser.START_TAG
					|| "adresse".equals(xpp.getName())) {
				xpp.next();
				xpp.require(XmlPullParser.START_TAG, null, "nom");
				name = xpp.nextText();
				xpp.next();
				xpp.require(XmlPullParser.START_TAG, null, "email");
				email = xpp.nextText();
				xpp.next();

				// Log.v("test", "name = " + name);
				SuapsChildPlaceAccountable childAccountable = new SuapsChildPlaceAccountable(
						name, email);
				accountableArray.add(childAccountable);

			}
			xpp.require(XmlPullParser.END_TAG, null, "adresse");
			xpp.nextTag();
		}

	}

	public ArrayList<SuapsChildPlaceAccountable> getAccountableArray() {
		return accountableArray;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getEquipments() {
		return equipments;
	}

	public String getPermanency() {
		return permanency;
	}
}
