package dam.ptut.iutunice.Menu;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.Calendar.CalendarActivity;
import dam.ptut.iutunice.IutWindows.IutWindowsActivity;
import dam.ptut.iutunice.Maps.MapActivity;
import dam.ptut.iutunice.Parameter.ParameterActivity;
import dam.ptut.iutunice.PostBac.PostBacActivity;
import dam.ptut.iutunice.Twitter.TwitterActivity;

public class MainActivity extends FragmentActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		this.setTitle("IUT Nice C�te d'Azur");
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);

		collectMenuList();
		IconMenuFragment iconMenuFragment = new IconMenuFragment();
		IconMenuCarouselFragment iconMenuCarouselFragment = new IconMenuCarouselFragment();

		App app = (App) getApplication();
		int orientation = getResources().getConfiguration().orientation;
		if (orientation == 1){// portrait
			app.menuType = 0;//menu icons by default
			getSupportFragmentManager().beginTransaction()
					.replace(R.id.flContent, iconMenuFragment).commit();
		}else{
			// 2 = paysage
			app.menuType = 2;//menu carousel
			getSupportFragmentManager().beginTransaction()
					.replace(R.id.flContent, iconMenuCarouselFragment).commit();

		
		}
		return super.onCreateOptionsMenu(menu);

	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle presses on the action bar items
		switch (item.getItemId()) {
		case R.id.action_settings:
			openSettings();
		case R.id.action_list:
			switchListMenu();
		default:
			return super.onOptionsItemSelected(item);
		}

	}

	private void switchListMenu() {
		App app = (App) getApplication();
		if(app.menuType == 0){//icons menu
			collectMenuList();
			IconMenuListFragment iconMenuListFragment = new IconMenuListFragment();
			getSupportFragmentManager().beginTransaction()
					.replace(R.id.flContent, iconMenuListFragment).commit();
			app.menuType = 1;
		}else if(app.menuType == 1){//list menu
			IconMenuFragment iconMenuFragment = new IconMenuFragment();
			getSupportFragmentManager().beginTransaction()
			.replace(R.id.flContent, iconMenuFragment).commit();
			app.menuType = 0;
		}else{
			//carousel menu
			collectMenuList();
			IconMenuListFragment iconMenuListFragment = new IconMenuListFragment();
			getSupportFragmentManager().beginTransaction()
					.replace(R.id.flContent, iconMenuListFragment).commit();
			app.menuType = 1;
		}
		
	}

	private void openSettings() {
		// TODO Auto-generated method stub
		Intent intent = new Intent(MainActivity.this, ParameterActivity.class);
		startActivity(intent);
	}

	@Override
	public void onBackPressed() {
		// TODO Auto-generated method stub
		finish();
	}

	private void collectMenuList() {
		List<IconMenuListItem> list = new ArrayList<IconMenuListItem>();

		//int imgIutWindow = R.drawable.logo_iut_window;
		int imgIutWindow = R.drawable.logo_iut_window_256;
		//int imgGrades = R.drawable.logo_grades;
		int imgGrades = R.drawable.logo_grades_256;
		//int imgCalendar = R.drawable.logo_calendar;
		int imgCalendar = R.drawable.logo_schedule_256;
		//int imgMap = R.drawable.logo_maps;
		int imgMap = R.drawable.logo_maps_256;
		//int imgSuaps = R.drawable.logo_suaps;
		int imgSuaps = R.drawable.logo_suaps_256;
		int imgPostBac = R.drawable.logo_post_bac;
		//int imgAddressBook = R.drawable.logo_addressbook;
		int imgAddressBook = R.drawable.logo_directory_256;
		int imgCompanyPartnership = R.drawable.logo_compagny_partnership;
		//int imgTwitter = R.drawable.logo_twitter;
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
		case R.drawable.logo_iut_window_256:
			intent = new Intent(this, IutWindowsActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_grades_256:
			break;
		case R.drawable.logo_schedule_256:
			intent = new Intent(this, CalendarActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_maps_256:
			intent = new Intent(this, MapActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_suaps_256:
			break;
		case R.drawable.logo_post_bac:
			intent = new Intent(this, PostBacActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_directory_256:
			break;
		case R.drawable.logo_compagny_partnership:
			break;
		case R.drawable.logo_twitter_256:
			intent = new Intent(this, TwitterActivity.class);
			startActivity(intent);
			break;
		}
	}

}
