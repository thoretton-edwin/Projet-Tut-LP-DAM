package dam.ptut.iutunice.Suaps;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.content.res.XmlResourceParser;

public class SuapsChildActivities {
	String Day;
	ArrayList<SuapsChildActivitiesSession> SessionArray;

	String time;
	String place;
	String other;
	String accountable;

	public SuapsChildActivities(String Day, XmlResourceParser xpp)
			throws XmlPullParserException, IOException {
		this.Day = Day;
		SessionArray = new ArrayList<SuapsChildActivitiesSession>();

		xpp.next();
		xpp.require(XmlPullParser.START_TAG, null, "seance");

		while (xpp.getEventType() == XmlPullParser.START_TAG) {

			if ("seance".equals(xpp.getName())) {

				xpp.next();
				xpp.require(XmlPullParser.START_TAG, null, "heure");
				if (xpp.isEmptyElementTag()) {
					time = "";
					xpp.nextText();
				} else {
					time = xpp.nextText();
				}
				xpp.next();

				xpp.require(XmlPullParser.START_TAG, null, "lieu");
				if (xpp.isEmptyElementTag()) {
					place = "";
					xpp.nextText();
				} else {
					place = xpp.nextText();
				}
				xpp.next();

				xpp.require(XmlPullParser.START_TAG, null, "autre");
				if (xpp.isEmptyElementTag()) {
					other = "";
					xpp.nextText();
				} else {
					other = xpp.nextText();
				}
				xpp.next();

				xpp.require(XmlPullParser.START_TAG, null, "responsable");
				if (xpp.isEmptyElementTag()) {
					accountable = "";
					xpp.nextText();
				} else {
					accountable = xpp.nextText();
				}
				xpp.next();

				SuapsChildActivitiesSession session = new SuapsChildActivitiesSession(
						time, place, other, accountable);
				SessionArray.add(session);
			}
			xpp.require(XmlPullParser.END_TAG, null, "seance");
			xpp.nextTag();
			// Log.v("test before require End", "xpp.getName = " +
			// xpp.getName()); // jour;
			// Log.v("session array", "session array = " +
			// SessionArray.toString());
		}
	}

	public String toString() {
		return "heure : " + time + " - place : " + place + " - autre : "
				+ other + " - Responsable : " + accountable;

	}
}
