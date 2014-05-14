package dam.ptut.iutunice.Directory;

import com.google.android.gms.maps.CameraUpdateFactory;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class DirectoryActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_directory);
		
		Button btDirectorySearch = (Button) findViewById(R.id.btDirectorySearch);
		btDirectorySearch.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				EditText edtName = (EditText) findViewById(R.id.edtName);
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.directory, menu);
		return true;
	}

}
