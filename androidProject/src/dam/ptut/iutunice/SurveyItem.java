package dam.ptut.iutunice;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.util.Log;

public class SurveyItem {
	String language;
	String type;
	ArrayList<SurveyQuestion> questionArray;
	
	public SurveyItem(XmlPullParser parser, String lang, String type) throws XmlPullParserException, IOException{
		this.language = lang;
		this.type = type;
		
		Log.v("sur balise question (début)", ""+parser.getName() );
		while(parser.nextTag() == XmlPullParser.START_TAG || "question".equals(parser.getName()) ){
			if("question".equals(parser.getName())){
				switch(parser.getEventType()){
				case XmlPullParser.START_TAG:
					Log.v("sur balise question (début)", ""+parser.getName() );
					break;
				case XmlPullParser.END_TAG:
					Log.v("sur balise question (fin)", ""+parser.getName() );
					parser.nextTag();
					break;
				}
				
			}else{
				String id = parser.nextText();
				parser.nextTag();
				String entitled = parser.nextText();
				parser.nextTag();
				Log.v("id question", id );
				Log.v("entitled question ", entitled );
				SurveyQuestion surveyQuestion= new SurveyQuestion(parser, id, entitled);
				this.questionArray.add(surveyQuestion);
			}
			
		}
	}
}
