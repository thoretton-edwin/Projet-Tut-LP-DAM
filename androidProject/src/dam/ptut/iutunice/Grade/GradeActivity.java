package dam.ptut.iutunice.Grade;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class GradeActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_grade);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.grade, menu);
		return true;
	}

}
