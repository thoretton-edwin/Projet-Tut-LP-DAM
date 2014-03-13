package dam.ptut.iutunice;

import android.os.Bundle;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ProgressDialog;
import android.view.Menu;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

public class TwitterActivity extends Activity {
	
	ProgressDialog chargement;
	WebView twitter;

	@SuppressLint("NewApi")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_twitter);
		
		chargement = new ProgressDialog(TwitterActivity.this);
		chargement.setMessage("Chargement de la page...");
		chargement.setCancelable(false);
		chargement.show();
		
		twitter = (WebView) findViewById(R.id.webViewTwitter);
		String url = "https://twitter.com/Univ_Nice";
		twitter.getSettings().setLoadsImagesAutomatically(true);
		twitter.getSettings().setJavaScriptEnabled(true);
		twitter.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
		twitter.loadUrl(url);
		twitter.setWebViewClient(new WebViewClient() {

			   public void onPageFinished(WebView view, String url) {   
				   if (view.isDirty())
					   chargement.dismiss();
			    }
			});
	}
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.twitter, menu);
		return true;
	}
}
