package dam.ptut.iutunice.Directory;


import dam.ptut.iutunice.R;
import dam.ptut.iutunice.IutWindows.SurveyIutActivity;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
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
				// test de la connexion internet
				ConnectivityManager connect = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
				NetworkInfo networkInfo = connect.getActiveNetworkInfo();
				if (networkInfo == null || !networkInfo.isConnected()) {
					AlertDialog.Builder alertDialog = new AlertDialog.Builder(
							DirectoryActivity.this);
					alertDialog.setTitle("Connexion internet impossible...");
					alertDialog
							.setMessage("Vous n'êtes probablement pas connecté à internet...");
					alertDialog.setPositiveButton("Retour",
							new DialogInterface.OnClickListener() {
								@Override
								public void onClick(DialogInterface dialog, int id) {
									finish();
								}
							});
					AlertDialog dialog = alertDialog.create();
					dialog.show();
				}
				EditText edtName = (EditText) findViewById(R.id.edtName);
				edtName.append("hello");
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
