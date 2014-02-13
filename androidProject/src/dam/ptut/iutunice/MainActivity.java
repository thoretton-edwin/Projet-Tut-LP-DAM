package dam.ptut.iutunice;

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

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		
		IconMenuFragment iconMenuFragment = new IconMenuFragment();
		getSupportFragmentManager().beginTransaction().replace(R.id.flContent, iconMenuFragment).commit();
		
		return super.onCreateOptionsMenu(menu);

	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle presses on the action bar items
		switch (item.getItemId()) {
		case R.id.action_settings:
            openSettings();
			return true;
		case R.id.action_list:
			switchListMenu();
		default:
			return super.onOptionsItemSelected(item);
		}
		
	}

	private void switchListMenu() {
		// TODO Auto-generated method stub
		
	}

	private void openSettings() {
		// TODO Auto-generated method stub
//		Intent intent = new Intent(MainActivity.this,
//				ClassName.class);
//		startActivity(intent);
	}
	


}
