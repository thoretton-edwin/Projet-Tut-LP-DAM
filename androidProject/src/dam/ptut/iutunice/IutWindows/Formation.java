package dam.ptut.iutunice.IutWindows;

import org.json.JSONException;
import org.json.JSONObject;

public class Formation {
	final int id;
	final String title;
	final String code;
	final String body;
	final String typeCode;
	final String typeTitle;
	
	//-- constructeur, parse JSON
	public Formation(JSONObject formation) throws JSONException{
		this.id = Integer.parseInt( formation.getString("id") );
		this.title = formation.getString("title");
		this.code = formation.getString("code");
		this.body = formation.getString("body");
		this.typeCode = formation.getString("type_code");
		this.typeTitle = formation.getString("type_title");
		
	}
}
