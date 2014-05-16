package dam.ptut.iutunice.Maps;

import java.util.ArrayList;
import java.util.List;

import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import android.os.Bundle;
import android.app.ActionBar;
import android.app.Activity;
import android.support.v4.app.NavUtils;
import android.text.Html;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

public class BusActivity extends Activity {
	
	List listBus = new ArrayList();

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_bus);
		
		this.setTitle("Liste des bus");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		
		final App app = (App) getApplication();
		TextView textViewBus = (TextView) findViewById(R.id.textViewBus);
		
		switch (app.idLieu) {
		case 1:
			textViewBus.setText(Html.fromHtml("<b>Nice :</b> <br><br> Arrêt : Vittone <br><br> ligne 12 <br><br><br> Arrêt : Carras <br><br> ligne 73"));
			break;
			
		case 2:
			textViewBus.setText("Non disponible");
			break;
			
		case 3:
			textViewBus.setText(Html.fromHtml("<b>Cannes La Bocca :</b> <br><br> Arrêt : Villa Arson <br><br> ligne 36"));
			break;
			
		case 4:
			textViewBus.setText(Html.fromHtml("<b>Cannes :</b> <br><br> Arrêt : Parking relais Coubertin <br><br> lignes 1, B, C, N1, D"));
			break;
			
		case 5:
			textViewBus.setText(Html.fromHtml("<b>Sophia Antipolis :</b> <br><br> Arrêt : Templiers <br><br> lignes 1, 100, 230"));
			break;
			
		default:
			textViewBus.setText("Erreur");
			break;
		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.bus, menu);
		return true;
	}

	@Override
	public void onBackPressed() {
		super.onBackPressed();
		// animation de "retour"
		overridePendingTransition(R.anim.in_details, R.anim.out_list);
	}

	// active sur l'action bar le bouton retour
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		// Respond to the action bar's Up/Home button
		case android.R.id.home:
			NavUtils.navigateUpFromSameTask(this);
			overridePendingTransition(R.anim.in_details, R.anim.out_list);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
