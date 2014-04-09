package dam.ptut.iutunice;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.util.Log;

public class SurveyQuestion {
	String id;
	String entitled;
	ArrayList<SurveyAnswer> answerArray;
	
	
	public SurveyQuestion(XmlPullParser parser, String id, String entitled) throws XmlPullParserException, IOException{
		this.id = id;
		this.entitled = entitled;
		
		Log.v("sur balise response (début)", ""+parser.getName() );
		while(parser.nextTag() == XmlPullParser.START_TAG || "response".equals(parser.getName()) ){
			if("response".equals(parser.getName())){
				switch(parser.getEventType()){
				case XmlPullParser.START_TAG:
					Log.v("sur balise response (début)", ""+parser.getName() );
					break;
				case XmlPullParser.END_TAG:
					Log.v("sur balise response (fin)", ""+parser.getName() );
					parser.nextTag();
					break;
				}
				
			}else{
				String idAnswer = parser.nextText();
				parser.nextTag();
				String entitledAnswer = parser.nextText();
				Log.v("id answer", idAnswer );
				Log.v("entitled answer ", entitledAnswer );
				SurveyAnswer surveyAnswer = new SurveyAnswer(idAnswer, entitledAnswer);
				this.answerArray.add(surveyAnswer);
			}
			
		}
	}
}
