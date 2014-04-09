package dam.ptut.iutunice.Maps;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class MapsActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_maps);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.maps, menu);
		return true;
	}

}
