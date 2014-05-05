package dam.ptut.iutunice.Calendar;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.net.Uri;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;

public class CalendarActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_calendar);
		
		Intent i = new Intent(Intent.ACTION_VIEW);
		// Android 2.2+
		i.setData(Uri.parse("content://com.android.calendar/time"));  
		startActivity(i);
		finish();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.calendar, menu);
		return true;
	}

}
