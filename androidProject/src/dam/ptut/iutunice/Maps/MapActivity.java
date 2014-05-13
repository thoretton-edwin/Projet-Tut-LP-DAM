package dam.ptut.iutunice.Maps;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.Menu.MainActivity;
import dam.ptut.iutunice.Parameter.ParameterActivity;
import dam.ptut.iutunice.PostBac.PostBacActivity;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.NavUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MapActivity extends FragmentActivity {
	
	private GoogleMap map;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_map);
		
		this.setTitle("Plan des sites");
		final App app = (App) getApplication();
		
		map = ((SupportMapFragment) getSupportFragmentManager()
				.findFragmentById(R.id.map)).getMap();
		
		// Coordonnées (latitute et longitude) des différents sites de l'IUT
				final LatLng iutSophia = new LatLng(43.616984, 7.071000);
				final LatLng iutCannes = new LatLng(43.550314, 7.000636);
				final LatLng iutCannesBocca = new LatLng(43.553305, 6.967531);
				final LatLng iutMenton = new LatLng(43.777035, 7.501133);
				final LatLng iutNice = new LatLng(43.687409, 7.227308);
				
				final String adrSophia = "IUT Nice Côte d'Azur \n650, Route des Colles \n06560 Valbonne";
				final String adrCannes = "IUT Nice Côte d'Azur \n4, avenue Stephen Liegeard \n06400 Cannes";
				final String adrCannesBocca = "IUT Nice Côte d'Azur \n54, Rue de Cannes \n06150 Cannes La Bocca";
				final String adrMenton = "IUT Nice Côte d'Azur \n58, chemin du Collège \n06500 Menton";
				final String adrNice = "IUT Nice Côte d'Azur \n41, Bd Napoléon III \n06206 Nice Cedex 3";
				
				final TextView textview = (TextView) findViewById(R.id.textViewAdress);
				textview.setText(adrSophia);
				
				int hue = 0;
				map.addMarker(new MarkerOptions().title("iut Sophia")
						.icon(BitmapDescriptorFactory.defaultMarker(hue))
						.position(iutSophia));
				map.addMarker(new MarkerOptions().title("iut Cannes")
						.icon(BitmapDescriptorFactory.defaultMarker(hue))
						.position(iutCannes));
				map.addMarker(new MarkerOptions().title("iut La Bocca")
						.icon(BitmapDescriptorFactory.defaultMarker(hue))
						.position(iutCannesBocca));
				map.addMarker(new MarkerOptions().title("iut Menton")
						.icon(BitmapDescriptorFactory.defaultMarker(hue))
						.position(iutMenton));
				map.addMarker(new MarkerOptions().title("iut Nice")
						.icon(BitmapDescriptorFactory.defaultMarker(hue))
						.position(iutNice));
				
				map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutSophia, 15));
				
				// Clic sur le bouton Nice 
				Button btnNice = (Button) findViewById(R.id.btnMapsNice);
				btnNice.setOnClickListener(new View.OnClickListener() {
					public void onClick(View v) {
						 // Do something in response to button click
						 map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutNice, 15));
						 textview.setText(adrNice);
						 app.idLieu = 1;
					}
				});
						
				// Clic sur le bouton Menton
				Button btnMenton = (Button) findViewById(R.id.btnMapsMenton);
				btnMenton.setOnClickListener(new View.OnClickListener() {
				public void onClick(View v) {
						// Do something in response to button click
						map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutMenton, 15));
						textview.setText(adrMenton);
						app.idLieu = 2;
					}
				});
				
				// Clic sur le bouton Cannes La Bocca
				Button btnCannesLB = (Button) findViewById(R.id.btnMapsCannesLB);
				btnCannesLB.setOnClickListener(new View.OnClickListener() {
					public void onClick(View v) {
						// Do something in response to button click
						map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutCannesBocca, 15));
						textview.setText(adrCannesBocca);
						app.idLieu = 3;
					}
				});
				
				// Clic sur le bouton Cannes
				Button btnCannes = (Button) findViewById(R.id.btnMapsCannes);
				btnCannes.setOnClickListener(new View.OnClickListener() {
						public void onClick(View v) {
						// Do something in response to button click
						map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutCannes, 15));
						textview.setText(adrCannes);
						app.idLieu = 4;
					}
				});
				
				// Clic sur le bouton Sophia 
				Button btnSophia = (Button) findViewById(R.id.btnMapsSophia);
				btnSophia.setOnClickListener(new View.OnClickListener() {
					public void onClick(View v) {
						// Do something in response to button click
						textview.setText(adrSophia);
						app.idLieu = 5;
						map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutSophia, 15));
						
					}
				});
				
//				// Clic sur le bouton Trajet 
//				Button btnRoad = (Button) findViewById(R.id.btnTrajet);
//				btnSophia.setOnClickListener(new View.OnClickListener() {
//					public void onClick(View v) {
//						// Do something in response to button click
//						map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutSophia, 15));
//					}
//				});
				
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
		case R.id.action_bus:
			switchListMenu();
		}
		return super.onOptionsItemSelected(item);
	}
	
	private void switchListMenu() {
		Intent intent = new Intent(this, BusActivity.class);
		startActivity(intent);
	}

	// desactive sur l'action bar le bouton parametre
	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		MenuItem item = menu.findItem(R.id.action_settings);
		item.setVisible(false);
		return true;
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.map, menu);
		return true;
	}

}
