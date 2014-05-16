package dam.ptut.iutunice.Twitter;

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
import android.view.MenuItem;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class TwitterActivity extends Activity {

	ProgressDialog chargement;
	WebView twitter;
	NetworkInfo networkInfo;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_twitter);

		this.setTitle("Twitter");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		chargement = new ProgressDialog(TwitterActivity.this);
		chargement.setMessage("Chargement de la page...");
		// chargement.setCancelable(false);
		chargement.show();
		
		

		// Connexion Internet en cours ou non
		ConnectivityManager connect = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
		networkInfo = connect.getActiveNetworkInfo();

		twitter = (WebView) findViewById(R.id.webViewTwitter);
		String url = "https://mobile.twitter.com/Univ_Nice";
		twitter.getSettings().setLoadsImagesAutomatically(true);
		twitter.getSettings().setJavaScriptEnabled(true);
		twitter.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
		twitter.loadUrl(url);
		twitter.setWebViewClient(new WebViewClient() {

			public void onPageFinished(WebView view, String url) {
				if (networkInfo != null && networkInfo.isConnected()) {
					int progress = view.getProgress();
					if (progress > 99)
						chargement.dismiss();
				} else {
					AlertDialog.Builder alertDialog = new AlertDialog.Builder(
							TwitterActivity.this);
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
