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
	public int idLieu = 5; // 1 : Nice, 2 :Menton, 3 : Bocca, 4 : Cannes, 5 :
							// Sophia
	public int suapsGroupPos, suapsChildPos;
	public User user; // identification de l'utilisateur
	// pour Allan :
	/*
	 * Au démarrage de l'app lors de la demande d'identification crée un objet
	 * User et stocke le avec User myUser = new User("snxxxxxx", "SCHERER",
	 * "NICOLAS3, "LP SIL DAM trad") //si l'utilisateur ne se connecte pas au
	 * départ ; mettre "" comme valeur //sachant que l'on ne se connecte pas
	 * réellement à la BDD pour vérifier les log //mettre des tests if //mettre
	 * le nom, prénom, et formation à ta guise App app = (App)
	 * getActivity().getApplication(); app.user = myUser;
	 */
}
