package dam.ptut.iutunice;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class IconMenuListFragment extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.icon_menu_list_fragment);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.icon_menu_list_framgment, menu);
		return true;
	}

}
