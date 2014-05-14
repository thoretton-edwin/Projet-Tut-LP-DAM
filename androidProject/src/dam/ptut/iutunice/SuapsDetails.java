package dam.ptut.iutunice;

import java.util.ArrayList;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.NavUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import dam.ptut.iutunice.Suaps.SuapsChild;
import dam.ptut.iutunice.Suaps.SuapsChildActivities;
import dam.ptut.iutunice.Suaps.SuapsGroup;

public class SuapsDetails extends Activity {
	App app;
	int groupPosition, childPosition;
	ArrayList<SuapsGroup> SuapsArray;
	ArrayList<SuapsChild> SuapsChildArray;

	SuapsGroup group;
	SuapsChild child;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_suaps_details);
		// Show the Up button in the action bar.
		setupActionBar();

		app = (App) getApplication();
		childPosition = app.suapsChildPos;
		groupPosition = app.suapsGroupPos;
		SuapsArray = app.suapsGroupList;
		group = SuapsArray.get(groupPosition);
		// SuapsChildArray = group.getSuapsArray();
		child = group.getSuapsArray().get(childPosition);

		// Log.v("test", "SuapsArray = "
		// + SuapsArray.get(groupPosition).toString());
		// Log.v("test", "childPos = " + childPosition);
		// Log.v("test", "groupPos = " + groupPosition);
		// Log.v("test", "SuapsArray = " + SuapsArray.size());
		Log.v("test", "SuapsChildArray = " + SuapsChildArray.size());

		switch (groupPosition) {
		case 0:
			setTitle(SuapsArray.get(groupPosition).getTitle());
			createViewActivity(child.getDaysArray());
			break;
		case 1:
			setTitle(SuapsArray.get(groupPosition).getTitle());

			break;
		case 2:
			setTitle(SuapsArray.get(groupPosition).getTitle());

			break;
		case 3:
			setTitle(SuapsArray.get(groupPosition).getTitle());

			break;

		default:
			break;
		}
	}

	private void createViewActivity(ArrayList<SuapsChildActivities> daysArray) {
		// TODO Auto-generated method stub
		String title = group.getTitle();
		String infos = child.getInfos();
	}

	/**
	 * Set up the {@link android.app.ActionBar}.
	 */
	private void setupActionBar() {

		getActionBar().setDisplayHomeAsUpEnabled(true);

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.suaps_details, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case android.R.id.home:
			// This ID represents the Home or Up button. In the case of this
			// activity, the Up button is shown. Use NavUtils to allow users
			// to navigate up one level in the application structure. For
			// more details, see the Navigation pattern on Android Design:
			//
			// http://developer.android.com/design/patterns/navigation.html#up-vs-back
			//
			NavUtils.navigateUpFromSameTask(this);
			overridePendingTransition(R.anim.in_details, R.anim.out_list);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

}
