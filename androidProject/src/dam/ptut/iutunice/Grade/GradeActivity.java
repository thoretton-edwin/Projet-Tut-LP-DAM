package dam.ptut.iutunice.Grade;

import java.util.ArrayList;
import java.util.HashMap;

import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.SurveyAnswer;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import dam.ptut.iutunice.User;
import android.os.Bundle;
import android.app.ActionBar;
import android.app.Activity;
import android.support.v4.app.NavUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ExpandableListView;
import android.widget.TextView;

public class GradeActivity extends Activity {

	ExpandableListView expandableListViewGrade;
	HashMap<String, ArrayList<Subject>> listDataChild;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_grade);

		this.setTitle("Notes");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		
		expandableListViewGrade = (ExpandableListView) findViewById(R.id.expandableListViewGrade);
		
		// charge les informations qui s'afficheront sur la page
		//ceci est de la simulation
		completeList();
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
