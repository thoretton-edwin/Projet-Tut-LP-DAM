package dam.ptut.iutunice;

import java.util.ArrayList;
import java.util.List;

import android.app.Application;
import dam.ptut.iutunice.Menu.IconMenuListItem;
import dam.ptut.iutunice.Parameter.ParameterItem;
import dam.ptut.iutunice.Suaps.SuapsGroup;

public class App extends Application {
	public List<ParameterItem> parameterListe;
	public List<IconMenuListItem> iconItemList;
	public List<SurveyItem> surveyList;
	public ArrayList<SuapsGroup> suapsGroupList;
	public boolean listMenu;
	public boolean iutSurveyIsCheck = false;
	public boolean feedbackSurveyIsCheck = false;
	public ArrayList<String> arrayID;
	public ArrayList<String> arrayPWD;
	public int firstTime = 0;
	public int idLieu = 5; // 1 : Nice, 2 :Menton, 3 : Bocca, 4 : Cannes, 5 : Sophia
	public int suapsGroupPos, suapsChildPos;
	public User user; // identification de l'utilisateur

}
