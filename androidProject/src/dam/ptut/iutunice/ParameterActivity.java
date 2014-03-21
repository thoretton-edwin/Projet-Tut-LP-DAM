package dam.ptut.iutunice;

import java.util.ArrayList;
import java.util.List;

import android.os.Bundle;
import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.app.Activity;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.NavUtils;
import android.view.Menu;
import android.view.MenuItem;

public class ParameterActivity extends FragmentActivity {

	@SuppressLint("NewApi")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_parameter);
		this.setTitle("Paramètres");
		
		//permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
	    actionBar.setDisplayHomeAsUpEnabled(true);
	    
	    //récupère la liste à afficher
	    collectListParameter();
	    
	    showItemsFragment();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.parameter, menu);
		return true;
	}
	
	@Override
	public boolean onPrepareOptionsMenu(Menu menu){
		MenuItem item = menu.findItem(R.id.action_settings);
		item.setVisible(false);
		return true;
	}
	
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
	
	private void collectListParameter(){
		List<ParameterItem> liste = new ArrayList<ParameterItem>();

		String connexion = "Connexion";
		String infosWifi = "Infos Wifi";
		String aPropos = "A propos";
		String sondage = "Sondage";
		String langue = "Langues";
		String credit = "Crédits";
		int imgc = R.drawable.connexion;
		int imgi = R.drawable.wifi;
		int imga = R.drawable.apropos;
		int imgs = R.drawable.sondage;
		int imgl = R.drawable.flag;
		int imgcr = R.drawable.credit;
		ParameterItem i1 = new ParameterItem(connexion, imgc);
		ParameterItem i2 = new ParameterItem(infosWifi, imgi);
		ParameterItem i3 = new ParameterItem(aPropos, imga);
		ParameterItem i4 = new ParameterItem(sondage, imgs);
		ParameterItem i5 = new ParameterItem(langue, imgl);
		ParameterItem i6 = new ParameterItem(credit, imgcr);
		liste.add(i1);
		liste.add(i2);
		liste.add(i3);
		liste.add(i4);
		liste.add(i5);
		liste.add(i6);
		App app = (App) getApplication();
		app.parameterListe = liste;
	}
	
	private void showItemsFragment() {
		ParameterItemsFragment parameterItemsFragment = new ParameterItemsFragment();
		getSupportFragmentManager().beginTransaction()
				.replace(R.id.vgContent, parameterItemsFragment).commit();
	}
	
	/**
	 * Affiche le détail d'un élément de la liste. Est appelée par le fragment
	 * affichant la liste, quand un élément de la liste est cliqué
	 */
	void clickItem(int position) {
		App app = (App) getApplication();
		ParameterItem parameterItem = app.parameterListe.get(position);
		switch(parameterItem.image){
			case R.drawable.connexion:
				break;
			case R.drawable.wifi:
				ParameterWifiFragment wifiFragment = new ParameterWifiFragment();
				getSupportFragmentManager()
					.beginTransaction()
					.setCustomAnimations(R.anim.in_from_right, R.anim.out_to_left,
						R.anim.in_details, R.anim.out_list)
				.replace(R.id.vgContent, wifiFragment).addToBackStack(null)
				.commit();
				break;
			case R.drawable.apropos:
				break;
			case R.drawable.sondage:
				break;
			case R.drawable.flag:
				break;
			case R.drawable.credit:
				break;
		}
	}
}
