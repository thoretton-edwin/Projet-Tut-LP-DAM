package dam.ptut.iutunice;

import java.util.List;

import dam.ptut.iutunice.Menu.IconMenuListItem;
import dam.ptut.iutunice.Parameter.ParameterItem;

import android.app.Application;

public class App extends Application {
	public List<ParameterItem> parameterListe;
	public List<IconMenuListItem> iconItemList;
	public List<SurveyItem> surveyList;
	public int menuType; //0=icons 1=list 2=carousel
	public boolean iutSurveyIsCheck = false;
}
