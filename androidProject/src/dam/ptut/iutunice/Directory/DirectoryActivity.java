package dam.ptut.iutunice.Directory;

import dam.ptut.iutunice.R;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.support.v4.app.NavUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class DirectoryActivity extends Activity {

	ProgressDialog chargement;
	WebView annuaire;
	NetworkInfo networkInfo;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_directory);
		
		this.setTitle("Annuaire");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		chargement = new ProgressDialog(DirectoryActivity.this);
		chargement.setMessage("Chargement de la page...");
		// chargement.setCancelable(false);
		chargement.show();
		
		// Connexion Internet en cours ou non
				ConnectivityManager connect = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
				networkInfo = connect.getActiveNetworkInfo();

				annuaire = (WebView) findViewById(R.id.webViewAnnuaire);
				String url = "https://annuaire.unice.fr";
				annuaire.getSettings().setLoadsImagesAutomatically(true);
				annuaire.getSettings().setJavaScriptEnabled(true);
				annuaire.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
				annuaire.loadUrl(url);
				
				annuaire.setWebViewClient(new WebViewClient() {

					public void onPageFinished(WebView view, String url) {
						if (networkInfo != null && networkInfo.isConnected()) {
							int progress = view.getProgress();
							if (progress > 99)
								chargement.dismiss();
						} else {
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
					}
				});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.directory, menu);
		return true;
	}
	
	// active sur l'action bar le bouton retour
		@Override
		public boolean onOptionsItemSelected(MenuItem item) {
			switch (item.getItemId()) {
			// Respond to the action bar's Up/Home button
			case android.R.id.home:
				NavUtils.navigateUpFromSameTask(this);
				return true;
			}
			return super.onOptionsItemSelected(item);
		}

}
