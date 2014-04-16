package dam.ptut.iutunice.Maps;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.os.Bundle;
import android.app.Activity;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.View;
import android.widget.Button;

public class MapsActivity extends FragmentActivity {

	private GoogleMap map;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_maps);
		
		this.setTitle("Détails de la formation");
		
		map = ((SupportMapFragment) getSupportFragmentManager()
				.findFragmentById(R.id.map)).getMap();
		
		// Coordonnées (latitute et longitude) des différents sites de l'IUT
		final LatLng iutSophia = new LatLng(43.616984, 7.071000);
		final LatLng iutCannes = new LatLng(43.550314, 7.000636);
		final LatLng iutCannesBocca = new LatLng(43.553305, 6.967531);
		final LatLng iutMenton = new LatLng(43.777035, 7.501133);
		final LatLng iutNice = new LatLng(43.687409, 7.227308);
		
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
		Button button = (Button) findViewById(R.id.btnMapsNice);
		button.setOnClickListener(new View.OnClickListener() {
		    public void onClick(View v) {
		        // Do something in response to button click
		    	map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutSophia, 15));
		    }
		});
		
		// Clic sur le bouton Nice 
		Button btnNice = (Button) findViewById(R.id.btnMapsNice);
		btnNice.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				 // Do something in response to button click
				 map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutNice, 15));
			}
		});
				
		// Clic sur le bouton Menton
		Button btnMenton = (Button) findViewById(R.id.btnMapsMenton);
		btnMenton.setOnClickListener(new View.OnClickListener() {
		public void onClick(View v) {
				// Do something in response to button click
				map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutMenton, 15));
			}
		});
		
		// Clic sur le bouton Cannes La Bocca
		Button btnCannesLB = (Button) findViewById(R.id.btnMapsCannesLB);
		btnCannesLB.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				// Do something in response to button click
				map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutCannesBocca, 15));
			}
		});
		
		// Clic sur le bouton Cannes
		Button btnCannes = (Button) findViewById(R.id.btnMapsCannes);
		btnCannes.setOnClickListener(new View.OnClickListener() {
				public void onClick(View v) {
				// Do something in response to button click
				map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutCannes, 15));
			}
		});
		
		// Clic sur le bouton Sophia 
		Button btnSophia = (Button) findViewById(R.id.btnMapsSophia);
		btnSophia.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				// Do something in response to button click
				map.moveCamera(CameraUpdateFactory.newLatLngZoom(iutSophia, 15));
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.maps, menu);
		return true;
	}

}
