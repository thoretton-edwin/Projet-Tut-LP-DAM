package dam.ptut.iutunice;

import java.util.ArrayList;
import java.util.List;

import dam.ptut.iutunice.R.menu;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.MenuItem;

public class MainActivity extends FragmentActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		this.setTitle("IUT Nice Côte d'Azur");

		// Toast.makeText(getApplicationContext(),"version Android  3= "+VERSION.SDK_INT,
		// Toast.LENGTH_SHORT).show();
		// Affichage de la version d'android du device
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
//		final MenuItem itemList = menu.findItem(R.id.action_list);
//		final MenuItem itemIcon = menu.findItem(R.id.action_icon);
		
		IconMenuFragment iconMenuFragment = new IconMenuFragment();
		IconMenuCarouselFragment iconMenuCarouselFragment = new IconMenuCarouselFragment();

		int orientation = getResources().getConfiguration().orientation;
		if (orientation == 1)// portrait
			getSupportFragmentManager().beginTransaction()
					.replace(R.id.flContent, iconMenuFragment).commit();
		else
			// 2 = paysage
			getSupportFragmentManager().beginTransaction()
					.replace(R.id.flContent, iconMenuCarouselFragment).commit();

		// getSupportFragmentManager().beginTransaction().replace(R.id.flContent,
		// iconMenuFragment).commit();

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
//		case R.id.action_icon:
//			switchIconMenu();
		default:
			return super.onOptionsItemSelected(item);
		}

	}

	private void switchIconMenu() {
		IconMenuFragment iconMenuFragment = new IconMenuFragment();
		getSupportFragmentManager().beginTransaction()
				.replace(R.id.flContent, iconMenuFragment).commit();
		
	}

	private void switchListMenu() {
		// TODO Auto-generated method stub
		collectMenuList();
		IconMenuListFragment iconMenuListFragment = new IconMenuListFragment();
		getSupportFragmentManager().beginTransaction()
				.replace(R.id.flContent, iconMenuListFragment).commit();
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

		int imgIutWindow = R.drawable.logo_iut_window;
		int imgGrades = R.drawable.logo_grades;
		int imgCalendar = R.drawable.logo_calendar;
		int imgMap = R.drawable.logo_maps;
		int imgSuaps = R.drawable.logo_suaps;
		int imgPostBac = R.drawable.logo_post_bac;
		int imgAddressBook = R.drawable.logo_addressbook;
		int imgCompanyPartnership = R.drawable.logo_compagny_partnership;
		int imgTwitter = R.drawable.logo_twitter;

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

	//ouvre les autres pages depuis le menu en liste
	void itemClick(int position) {
		App app = (App) getApplication();
		IconMenuListItem iconMenuListItem = app.iconItemList.get(position);
		switch (iconMenuListItem.img) {
		case R.drawable.logo_iut_window:
			Intent intent = new Intent(this, IutWindowsActivity.class);
			startActivity(intent);
			break;
		case R.drawable.logo_grades:
			break;
		case R.drawable.logo_calendar:
			break;
		case R.drawable.logo_maps:
			break;
		case R.drawable.logo_suaps:
			break;
		case R.drawable.logo_post_bac:
			break;
		case R.drawable.logo_addressbook:
			break;
		case R.drawable.logo_compagny_partnership:
			break;
		case R.drawable.logo_twitter:
			Intent i = new Intent(this, TwitterActivity.class);
			startActivity(i);
			break;
		}
	}
}
