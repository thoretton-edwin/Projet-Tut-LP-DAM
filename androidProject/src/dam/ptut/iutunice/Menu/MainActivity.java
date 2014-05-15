package dam.ptut.iutunice.Menu;

import java.util.ArrayList;
import java.util.List;

import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.User;
import dam.ptut.iutunice.Calendar.CalendarActivity;
import dam.ptut.iutunice.Directory.DirectoryActivity;
import dam.ptut.iutunice.Grade.GradeActivity;
import dam.ptut.iutunice.IutWindows.IutWindowsActivity;
import dam.ptut.iutunice.Maps.MapActivity;
import dam.ptut.iutunice.Parameter.ParameterActivity;
import dam.ptut.iutunice.PostBac.PostBacActivity;
import dam.ptut.iutunice.Suaps.SuapsActivity;
import dam.ptut.iutunice.Twitter.TwitterActivity;

public class MainActivity extends FragmentActivity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		this.setTitle("IUT Nice Côte d'Azur");
		final App app = (App) getApplication();
		app.arrayID = new ArrayList<String>();
		app.arrayID.add("damtest");
		app.arrayID.add("damtest1");
		app.arrayID.add("damtest2");
		app.arrayID.add("aa");
		app.arrayPWD = new ArrayList<String>();
		app.arrayPWD.add("passe");
		app.arrayPWD.add("passe1");
		app.arrayPWD.add("passe2");
		app.arrayPWD.add("aa");
		if(app.firstTime == 0){
			openLogin();
			app.firstTime++;
		}
    }

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);

		collectMenuList();
		IconMenuFragment iconMenuFragment = new IconMenuFragment();
		
		App app = (App) getApplication();
		app.listMenu = false; //menu icons by default
		getSupportFragmentManager().beginTransaction()
				.replace(R.id.flContent, iconMenuFragment).commit();
		
		return super.onCreateOptionsMenu(menu);

	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle presses on the action bar items
		switch (item.getItemId()) {
		case R.id.action_settings:
			openSettings();
			break;
		case R.id.action_list:
			switchListMenu();
			break;
		default:
			return super.onOptionsItemSelected(item);
		}
		return false;

	}

	private void switchListMenu() {
		App app = (App) getApplication();
		if(!app.listMenu){ //icons menu
			collectMenuList();
			IconMenuListFragment iconMenuListFragment = new IconMenuListFragment();
			getSupportFragmentManager().beginTransaction()
					.replace(R.id.flContent, iconMenuListFragment).commit();
			app.listMenu = true;
		}else{//list menu
			IconMenuFragment iconMenuFragment = new IconMenuFragment();
			getSupportFragmentManager().beginTransaction()
			.replace(R.id.flContent, iconMenuFragment).commit();
			app.listMenu = false;
		}
		
	}

	private void openSettings() {
		// TODO Auto-generated method stub
		Intent intent = new Intent(MainActivity.this, ParameterActivity.class);
		startActivity(intent);
	}
	
	private void openLogin() {
		final App app = (App) getApplication();
		// Create Object of Dialog class
        final Dialog login = new Dialog(this);
        // Set GUI of login screen
        login.setContentView(R.layout.login_screen);
        login.setTitle("Connexion à l'IUT");

        // Init button of login GUI
        Button btnLogin = (Button) login.findViewById(R.id.btnLogin);
        Button btnCancel = (Button) login.findViewById(R.id.btnCancel);
        final EditText txtUsername = (EditText)login.findViewById(R.id.txtUsername);
        final EditText txtPassword = (EditText)login.findViewById(R.id.txtPassword);

        // Attached listener for login GUI button
        btnLogin.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if(txtUsername.getText().toString().trim().length() > 0 && txtPassword.getText().toString().trim().length() > 0)
                {
                	boolean succeded = false;
                	for(int i = 0; i < app.arrayID.size(); i++)
                	{
                		if(app.arrayID.get(i).equals(txtUsername.getText().toString()) && app.arrayPWD.get(i).equals(txtPassword.getText().toString()))
                		{
                			// Validate Your login credential here than display message
        	                Toast.makeText(MainActivity.this,
        	                        "Identification réussie", Toast.LENGTH_LONG).show();
        	                User myUser = new User(txtUsername.getText().toString(), "SCHERER", "NICOLAS", "LP_SIL_DAM_trad");
        	                app.user = myUser;
        	                // Redirect to dashboard / home screen.
        	                login.dismiss();
        	                succeded = true;
                		}
                	}
                	if(!succeded){
                	Toast.makeText(MainActivity.this,
                            "Identifiant ou mot de passe incorrect(s)", Toast.LENGTH_LONG).show();
                	}
                }
                else
                {
                    Toast.makeText(MainActivity.this,
                            "Entrez votre identifiant et votre mot de passe", Toast.LENGTH_LONG).show();

                }
            }
        });
        btnCancel.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
            	User myUser = new User("", "", "", "");
                app.user = myUser;
                login.dismiss();
            }
        });

        // Make dialog box visible.
        login.show();
	}

	@Override
	public void onBackPressed() {
		// TODO Auto-generated method stub
		finish();
	}

	private void collectMenuList() {
		List<IconMenuListItem> list = new ArrayList<IconMenuListItem>();

		int imgIutWindow = R.drawable.logo_iut_window;
		int imgGrades = R.drawable.logo_grades;
		int imgCalendar = R.drawable.logo_schedule_256;
		int imgMap = R.drawable.logo_maps_256;
		int imgSuaps = R.drawable.logo_suaps_256;
		int imgPostBac = R.drawable.logo_post_bac;
		int imgAddressBook = R.drawable.logo_addressbook;
		int imgCompanyPartnership = R.drawable.logo_compagny_partnership;
		int imgTwitter = R.drawable.logo_twitter_256;

		IconMenuListItem i1 = new IconMenuListItem(imgIutWindow, "Vitrine IUT");
		IconMenuListItem i2 = new IconMenuListItem(imgGrades, "Notes");
		IconMenuListItem i3 = new IconMenuListItem(imgCalendar,
				"Emploi du temps");
		IconMenuListItem i4 = new IconMenuListItem(imgMap, "Plan des sites");
		IconMenuListItem i5 = new IconMenuListItem(imgSuaps, "Suaps");
		IconMenuListItem i6 = new IconMenuListItem(imgPostBac,
				"Informations Post-Bac");
		IconMenuListItem i7 = new IconMenuListItem(imgAddressBook,
				"Annuaire des Profs");
		IconMenuListItem i8 = new IconMenuListItem(imgCompanyPartnership,
				"Job Dating");
		IconMenuListItem i9 = new IconMenuListItem(imgTwitter, "Twitter");

		list.add(i1);
		list.add(i2);
		list.add(i3);
		list.add(i4);
		list.add(i5);
		list.add(i6);
		list.add(i7);
		list.add(i8);
		list.add(i9);

		App app = (App) getApplication();
		app.iconItemList = list;
	}

	// ouvre les autres pages depuis les menu en icones et en liste
	void itemClick(int position) {
		Intent intent;
		App app = (App) getApplication();
		IconMenuListItem iconMenuListItem = app.iconItemList.get(position);
		switch (iconMenuListItem.img) {
		case R.drawable.logo_iut_window:
			intent = new Intent(this, IutWindowsActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_grades:
			if (app.user.getId().equals(""))
			{
				Toast.makeText(MainActivity.this,
                        "Connectez-vous pour accéder a ce service", Toast.LENGTH_LONG).show();
				openLogin();
			}
			else
			{
				intent = new Intent(this, GradeActivity.class);
				startActivity(intent);
			}
			break;
		case R.drawable.logo_schedule_256:
			if (app.user.getId().equals(""))
			{
				Toast.makeText(MainActivity.this,
                        "Connectez-vous pour accéder a ce service", Toast.LENGTH_LONG).show();
				openLogin();
			}
			else
			{
				intent = new Intent(this, CalendarActivity.class);
				startActivity(intent);
			}
			break;
		case R.drawable.logo_maps_256:
			intent = new Intent(this, MapActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_suaps_256:
			intent = new Intent(this, SuapsActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_post_bac:
			intent = new Intent(this, PostBacActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_addressbook:
			Toast.makeText(MainActivity.this,"Module 'Annuaire' non disponible", Toast.LENGTH_LONG).show();
			//intent = new Intent(this, DirectoryActivity.class);
			//startActivity(intent);
			break;
		case R.drawable.logo_compagny_partnership:
			Toast.makeText(MainActivity.this,"Module 'Job Dating' non disponible", Toast.LENGTH_LONG).show();
			break;
		case R.drawable.logo_twitter_256:
			intent = new Intent(this, TwitterActivity.class);
			startActivity(intent);
			break;
		}
	}

	
}
