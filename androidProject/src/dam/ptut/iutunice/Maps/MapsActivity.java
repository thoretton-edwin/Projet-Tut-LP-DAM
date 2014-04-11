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
		LatLng iutSophia = new LatLng(43.616984, 7.071000);
		LatLng iutCannes = new LatLng(43.550314, 7.000636);
		LatLng iutCannesBocca = new LatLng(43.553305, 6.967531);
		LatLng iutMenton = new LatLng(43.777035, 7.501133);
		LatLng iutNice = new LatLng(43.687409, 7.227308);
		
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
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.maps, menu);
		return true;
	}

}
