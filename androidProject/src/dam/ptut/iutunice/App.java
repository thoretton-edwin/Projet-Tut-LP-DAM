package dam.ptut.iutunice;

import java.util.ArrayList;
import java.util.List;

import android.app.Application;
import dam.ptut.iutunice.Menu.IconMenuListItem;
import dam.ptut.iutunice.Parameter.ParameterItem;
import dam.ptut.iutunice.Suaps.SuapsActivitiesChild;

public class App extends Application {
	public List<ParameterItem> parameterListe;
	public List<IconMenuListItem> iconItemList;
	public List<SurveyItem> surveyList;
	public ArrayList<SuapsActivitiesChild> suapsList;
	public int menuType; //0=icons 1=list 2=carousel
	public boolean iutSurveyIsCheck = false;
}
