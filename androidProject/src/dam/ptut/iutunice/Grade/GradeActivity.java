package dam.ptut.iutunice.Grade;

import java.util.ArrayList;
import java.util.HashMap;

import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.SurveyAnswer;
import dam.ptut.iutunice.SurveyQuestion;
import dam.ptut.iutunice.PostBac.PostBac;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import dam.ptut.iutunice.User;
import android.os.Bundle;
import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.support.v4.app.NavUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.TextView;

public class GradeActivity extends Activity {

	ExpandableListView expandableListViewGrade;
	HashMap<String, ArrayList<Subject>> listDataChild;
	ArrayList<String> ueArray;
	LayoutInflater inflater;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_grade);

		this.setTitle("Notes");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		inflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);

		expandableListViewGrade = (ExpandableListView) findViewById(R.id.expandableListViewGrade);

		// listDataHeader égal à ueArray
		listDataChild = new HashMap<String, ArrayList<Subject>>();

		// charge les informations qui s'afficheront sur la page
		// ceci est de la simulation
		completeList();

		expandableListViewGrade.setAdapter(new BaseExpandableListAdapter() {

			@Override
			public boolean isChildSelectable(int groupPosition,
					int childPosition) {
				// permet le clic sur l'enfant
				return true;
			}

			@Override
			public boolean hasStableIds() {
				return false;
			}

			@Override
			public View getGroupView(int groupPosition, boolean isExpanded,
					View convertView, ViewGroup parent) {
				String ue = (String) getGroup(groupPosition);
				if (convertView == null) {
					convertView = inflater.inflate(R.layout.list_group_grade,
							parent, false);
				}

				TextView txtUE = (TextView) convertView
						.findViewById(R.id.txtUE);
				txtUE.setText(ue);

				return convertView;
			}

			@Override
			public long getGroupId(int groupPosition) {
				return groupPosition;
			}

			@Override
			public int getGroupCount() {
				return ueArray.size();
			}

			@Override
			public String getGroup(int groupPosition) {
				return ueArray.get(groupPosition);
			}

			@Override
			public int getChildrenCount(int groupPosition) {
				String ue = ueArray.get(groupPosition);
				ArrayList<Subject> subjectArray = listDataChild.get(ue);
				int nbChildren = subjectArray.size();
				return nbChildren;
			}

			@Override
			public View getChildView(int groupPosition, int childPosition,
					boolean isLastChild, View convertView, ViewGroup parent) {
				Subject subject = getChild(groupPosition, childPosition);

				if (convertView == null) {
					convertView = inflater.inflate(R.layout.item_list_grade,
							parent, false);
				}
				TextView txtSubject = (TextView) convertView
						.findViewById(R.id.txtSubject);
				txtSubject.setText(subject.entitled);

				return convertView;
			}

			@Override
			public long getChildId(int groupPosition, int childPosition) {
				return childPosition;
			}

			@Override
			public Subject getChild(int groupPosition, int childPosition) {
				String ue = ueArray.get(groupPosition);
				ArrayList<Subject> subjectArray = listDataChild.get(ue);
				Subject subject = subjectArray.get(childPosition);
				return subject;
			}
		});

	}

	private void completeList() {
		App app = (App) getApplication();
		User user = app.user;
		TextView txtStudentId = (TextView) findViewById(R.id.txtStudentId);
		txtStudentId.setText(user.getId());
		TextView txtStudentName = (TextView) findViewById(R.id.txtStudentName);
		txtStudentName.setText(user.getName());
		TextView txtStudentFirstName = (TextView) findViewById(R.id.txtStudentFirstName);
		txtStudentFirstName.setText(user.getFirstName());
		TextView txtStudentFormation = (TextView) findViewById(R.id.txtStudentFormation);
		txtStudentFormation.setText(user.getFormation());

		ueArray = new ArrayList<String>();
		ueArray.add("UE1 : Informatique fondamentale");
		ueArray.add("UE2 : Enseignements complémentaires de base");
		ueArray.add("UE3 : Enseignements de spécialité");

		ArrayList<Subject> subjectArray1;
		subjectArray1 = new ArrayList<Subject>();

		Subject subject = new Subject(1,
				"Génie Logiciel et Outils de Conception");
		subjectArray1.add(subject);
		subject = new Subject(2, "Systèmes de Gestion de Base de Données");
		subjectArray1.add(subject);
		subject = new Subject(3, "Programmation Orientée objet");
		subjectArray1.add(subject);
		subject = new Subject(4, " Programmation Web");
		subjectArray1.add(subject);
		listDataChild.put(ueArray.get(0), subjectArray1);
		
		ArrayList<Subject> subjectArray2;
		subjectArray2 = new ArrayList<Subject>();

		subject = new Subject(5, "Anglais technique");
		subjectArray2.add(subject);
		subject = new Subject(6, "Communication");
		subjectArray2.add(subject);
		subject = new Subject(7, "Droit des Nouvelles Technologies");
		subjectArray2.add(subject);
		subject = new Subject(8, "IHM et Ergonomie");
		subjectArray2.add(subject);
		subject = new Subject(9, "Gestion de Projet Informatique");
		subjectArray2.add(subject);
		listDataChild.put(ueArray.get(1), subjectArray2);
		
		ArrayList<Subject> subjectArray3;
		subjectArray3 = new ArrayList<Subject>();

		subject = new Subject(10, "Développement Android");
		subjectArray3.add(subject);
		subject = new Subject(11, "Développement iOS");
		subjectArray3.add(subject);
		subject = new Subject(12, "Développement Windows Phone");
		subjectArray3.add(subject);
		subject = new Subject(13, "Technologies mobiles");
		subjectArray3.add(subject);
		subject = new Subject(14, "Géolocalisation et Cartographie");
		subjectArray3.add(subject);
		listDataChild.put(ueArray.get(2), subjectArray3);

	}

	// active sur l'action bar le bouton retour
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		// Respond to the action bar's Up/Home button
		case android.R.id.home:
			NavUtils.navigateUpFromSameTask(this);
			overridePendingTransition(R.anim.in_details, R.anim.out_list);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	// desactive sur l'action bar le bouton parametre
	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		MenuItem item = menu.findItem(R.id.action_settings);
		item.setVisible(false);
		return true;
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.grade, menu);
		return true;
	}

	@Override
	public void onBackPressed() {
		super.onBackPressed();
		// animation de "retour"
		overridePendingTransition(R.anim.in_details, R.anim.out_list);
	}

}
