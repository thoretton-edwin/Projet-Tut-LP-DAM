package dam.ptut.iutunice.IutWindows;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.TextHttpResponseHandler;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.drawable;
import dam.ptut.iutunice.R.id;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.os.Bundle;
import android.app.ActionBar;
import android.app.Activity;
import android.app.ProgressDialog;
import android.support.v4.app.NavUtils;
import android.util.JsonReader;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

public class SearchFormationActivity extends Activity {

	// état des boutons
	private int stateBt = 0;
	// client pour connexion HTTP
	private AsyncHttpClient client = new AsyncHttpClient();
	// List sur la classe FormationItem
	//private ArrayList<FormationItem> listFormation;
	//barre de chargement
	ProgressDialog loading;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_search_formation);

		this.setTitle("Formations");
		// permet le retour sur la page père
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		// gère le fonctionnement des boutons de tri
		btPressed();
		
		loading = new ProgressDialog(SearchFormationActivity.this);
		loading.setMessage("Récupération des formations depuis internet... Chargement en cours...");
		loading.setCancelable(false);
		loading.show();
		
		//récupère les formations
		recoveryApiFormation();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.search_formation, menu);
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

	// desactive sur l'action bar le bouton parametre
	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		MenuItem item = menu.findItem(R.id.action_settings);
		item.setVisible(false);
		return true;
	}

	private void btPressed() {
		TextView sortDut = (TextView) findViewById(R.id.sortDut);
		sortDut.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v1) {
				switch (stateBt) {
				case 0:
					v1.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				case 1:
					// il ne se passe rien
					break;
				case 2:
					View v2 = (View) findViewById(R.id.sortLp);
					v2.setBackgroundResource(R.drawable.bt_iut_windows);
					v1.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				case 3:
					View v3 = (View) findViewById(R.id.sortDu);
					v3.setBackgroundResource(R.drawable.bt_iut_windows);
					v1.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				default:
					break;
				}
				stateBt = 1;
			}
		});

		TextView sortLp = (TextView) findViewById(R.id.sortLp);
		sortLp.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v2) {
				switch (stateBt) {
				case 0:
					v2.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				case 1:
					View v1 = (View) findViewById(R.id.sortDut);
					v1.setBackgroundResource(R.drawable.bt_iut_windows);
					v2.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				case 2:
					// il ne se passe rien
					break;
				case 3:
					View v3 = (View) findViewById(R.id.sortDu);
					v3.setBackgroundResource(R.drawable.bt_iut_windows);
					v2.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				default:
					break;
				}
				stateBt = 2;
			}
		});

		TextView sortDu = (TextView) findViewById(R.id.sortDu);
		sortDu.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v3) {
				switch (stateBt) {
				case 0:
					v3.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				case 1:
					View v1 = (View) findViewById(R.id.sortDut);
					v1.setBackgroundResource(R.drawable.bt_iut_windows);
					v3.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				case 2:
					View v2 = (View) findViewById(R.id.sortLp);
					v2.setBackgroundResource(R.drawable.bt_iut_windows);
					v3.setBackgroundResource(R.drawable.bt_iut_windows_pressed);
					break;
				case 3:
					// rien ne se passe
					break;
				default:
					break;
				}
				stateBt = 3;
			}

		});

	}

	private void recoveryApiFormation(){
		client.get(this,"http://www.iut.unice.fr/api/formations", new TextHttpResponseHandler(){
			@Override
			public void onFinish(){}
			
			@Override
			public void onSuccess(String responseBody){
//				InputStream in = new ByteArrayInputStream(responseBody.getBytes());
//				try {
//					readJsonStream(in);
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}

			}
			
			@Override
			public void onFailure(String responseBody, Throwable error){}
		});
	}
	
//	 public List readJsonStream(InputStream in) throws IOException {
//	     JsonReader reader = new JsonReader(new InputStreamReader(in, "UTF-8"));
//	     try {
//	       return readMessagesArray(reader);
//	     }
//	      finally {
//	       reader.close();
//	     }
//	   }

}
