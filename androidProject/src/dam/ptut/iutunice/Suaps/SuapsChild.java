package dam.ptut.iutunice.Suaps;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.content.res.XmlResourceParser;

public class SuapsChild {

	String Name;
	String Infos;
	ArrayList<SuapsChildActivities> daysArray;
	ArrayList<SuapsChildInformation> addressArray;
	ArrayList<SuapsChildPlace> siteArray;
	ArrayList<SuapsChildUEL> uelArray;

	// variable pour le parse du lieux
	String postal;
	String equipment;
	String permanency;
	String tel;
	String fax;

	public SuapsChild(XmlResourceParser xpp, int ID)
			throws XmlPullParserException, IOException {

		switch (ID) {
		case 0:
			parseActivities(xpp);
			break;
		case 1:
			parseInformations(xpp);
			break;
		case 2:
			parsePlace(xpp);
			break;
		case 3:
			parserUEL(xpp);
			break;
		case 4:
			break;

		default:
			break;
		}

	}

	private void parseActivities(XmlResourceParser xpp)
			throws XmlPullParserException, IOException {
		daysArray = new ArrayList<SuapsChildActivities>();
		xpp.require(XmlPullParser.START_TAG, null, "activite");
		xpp.next();
		// Log.v("debug", "xpp in actChild = " + xpp.getName());

		xpp.require(XmlPullParser.START_TAG, null, "nom");
		this.Name = xpp.nextText();
		// Log.v("debug", "name = " + this.Name);
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
				// Log.v("AttrValue",
				// "xpp jour = " + xpp.getAttributeValue(null, "nom"));
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

	private void parseInformations(XmlResourceParser xpp)
			throws XmlPullParserException, IOException {
		// TODO Auto-generated method stub
		addressArray = new ArrayList<SuapsChildInformation>();
		String name;
		String email;
		xpp.require(XmlPullParser.START_TAG, null, "renseignement");
		Name = xpp.getAttributeValue(null, "type");
		// Log.v("test parseInfo", "name = " + Name);
		xpp.nextTag();
		xpp.require(XmlPullParser.START_TAG, null, "adresse");

		while (xpp.getEventType() == XmlPullParser.START_TAG
				|| "adresse".equals(xpp.getName())) {
			if (xpp.getEventType() == XmlPullParser.START_TAG
					&& "adresse".equals(xpp.getName())) {
				xpp.next();
				xpp.require(XmlPullParser.START_TAG, null, "nom");
				name = xpp.nextText();
				xpp.next();

				xpp.require(XmlPullParser.START_TAG, null, "email");
				email = xpp.nextText();
				xpp.next();

				SuapsChildInformation childInfos = new SuapsChildInformation(
						name, email);
				addressArray.add(childInfos);
			}
			xpp.require(XmlPullParser.END_TAG, null, "adresse");
			xpp.nextTag();
		}
	}

	private void parsePlace(XmlResourceParser xpp)
			throws XmlPullParserException, IOException {
		// TODO Auto-generated method stub
		siteArray = new ArrayList<SuapsChildPlace>();
		equipment = "";
		permanency = "";
		tel = "";
		fax = "";
		xpp.require(XmlPullParser.START_TAG, null, "site");
		this.Name = xpp.getAttributeValue(null, "nom");
		xpp.next();
		xpp.require(XmlPullParser.START_TAG, null, "postal");
		this.postal = xpp.nextText();
		// Log.v("debug parsePlace", "name = " + Name);
		xpp.nextTag();

		xpp.require(XmlPullParser.START_TAG, null, "responsable");
		while (xpp.getEventType() == XmlPullParser.START_TAG
				&& "responsable".equals(xpp.getName())) {

			if (xpp.getEventType() == XmlPullParser.START_TAG
					&& "responsable".equals(xpp.getName())) {

				SuapsChildPlace childPlace = new SuapsChildPlace(xpp);
				siteArray.add(childPlace);
			}
			xpp.require(XmlPullParser.END_TAG, null, "responsable");
			xpp.nextTag();
		}
		if ("installations".equals(xpp.getName())) {
			xpp.require(XmlPullParser.START_TAG, null, "installations");
			if (xpp.isEmptyElementTag()) {
				equipment = "";
				xpp.nextText();
			} else {
				equipment = xpp.nextText();
			}
			xpp.next();
		}

		if ("permanences".equals(xpp.getName())) {
			xpp.require(XmlPullParser.START_TAG, null, "permanences");
			if (xpp.isEmptyElementTag()) {
				permanency = "";
			} else {
				permanency = xpp.nextText();
			}
			xpp.next();
		}

		if ("tel".equals(xpp.getName())) {
			xpp.require(XmlPullParser.START_TAG, null, "tel");
			if (xpp.isEmptyElementTag()) {
				tel = "";
			} else {
				tel = xpp.nextText();
			}
			xpp.next();
		}

		if ("fax".equals(xpp.getName())) {
			xpp.require(XmlPullParser.START_TAG, null, "fax");
			if (xpp.isEmptyElementTag()) {
				fax = "";
			} else {
				fax = xpp.nextText();
			}
			xpp.next();
		}
		// Log.v("test", "equipment = " + equipment + "\n permanency = "
		// + permanency + "\n tel = " + tel + "\n fax = " + fax);
		// Log.v("debug", "xpp.getName = " + xpp.getName()
		// + "\n xpp.getEventType = " + xpp.getEventType());
		xpp.require(XmlPullParser.END_TAG, null, "site");
	}

	private void parserUEL(XmlResourceParser xpp)
			throws XmlPullParserException, IOException {
		// TODO Auto-generated method stub
		uelArray = new ArrayList<SuapsChildUEL>();

		String day = "";
		String startTime = "";
		String endTime = "";
		String site = "";

		// xpp.require(XmlPullParser.START_TAG, null, "uel");

		// xpp.nextTag();
		xpp.require(XmlPullParser.START_TAG, null, "sport");
		this.Name = "";

		xpp.next();

		xpp.require(XmlPullParser.START_TAG, null, "nom");
		this.Name = xpp.nextText();
		xpp.next();

		xpp.require(XmlPullParser.START_TAG, null, "jour");
		day = xpp.nextText();
		xpp.next();

		xpp.require(XmlPullParser.START_TAG, null, "heuredeb");
		startTime = xpp.nextText();
		xpp.next();

		xpp.require(XmlPullParser.START_TAG, null, "heurefin");
		endTime = xpp.nextText();
		xpp.next();

		xpp.require(XmlPullParser.START_TAG, null, "site");
		site = xpp.nextText();
		xpp.next();

		SuapsChildUEL childUEL = new SuapsChildUEL(this.Name, day, startTime,
				endTime, site);
		uelArray.add(childUEL);

		xpp.require(XmlPullParser.END_TAG, null, "sport");
		xpp.nextTag();
	}

	public String toString() {
		return "nom : " + Name;
	}

	public String getName() {
		return Name;
	}

	public String getInfos() {
		return Infos;
	}

	public ArrayList<SuapsChildActivities> getDaysArray() {
		return daysArray;
	}

	public ArrayList<SuapsChildInformation> getAddressArray() {
		return addressArray;
	}

	public ArrayList<SuapsChildPlace> getSiteArray() {
		return siteArray;
	}

	public ArrayList<SuapsChildUEL> getUelArray() {
		return uelArray;
	}

	public String getPostal() {
		return postal;
	}

	public String getEquipment() {
		return equipment;
	}

	public String getPermanency() {
		return permanency;
	}

	public String getTel() {
		return tel;
	}

	public String getFax() {
		return fax;
	}

}
