package dam.ptut.iutunice.PostBac;

import java.io.IOException;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.util.Log;

public class PostBac {
	int id;
	String name;
	String descr;
	String duree;

	public PostBac(XmlPullParser parser) throws XmlPullParserException,
			IOException {

		parser.require(XmlPullParser.START_TAG, null, "formations");
		parser.next();

		parser.require(XmlPullParser.START_TAG, null, "id");
		id = Integer.parseInt(parser.nextText());
		parser.next();

		parser.require(XmlPullParser.START_TAG, null, "nom");
		name = parser.nextText();
		parser.next();

		parser.require(XmlPullParser.START_TAG, null, "descr");
		descr = parser.nextText();
		parser.next();

		parser.require(XmlPullParser.START_TAG, null, "duree");
		if (parser.isEmptyElementTag()) {
			duree = "";
			parser.nextText();
		} else {
			duree = parser.nextText();
		}
		parser.next();

		parser.require(XmlPullParser.END_TAG, null, "formations");

		Log.v("test parser", "formations :  id : " + id + " - name : " + name
				+ " - descr : " + descr);
	}

	public String toString() {
		return "id : " + id + " - nom : " + name + " - descr : " + descr + "\n";
	}
}
