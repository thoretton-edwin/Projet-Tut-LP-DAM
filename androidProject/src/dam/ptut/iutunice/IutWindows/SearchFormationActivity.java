package dam.ptut.iutunice.IutWindows;

import java.io.IOException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.JsonHttpResponseHandler;

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
import android.content.Intent;
import android.support.v4.app.NavUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.Toast;
import android.widget.SearchView.OnQueryTextListener;
import android.widget.TextView;

public class SearchFormationActivity extends Activity {

	// état des boutons
	private int stateBt = 0;
	// client pour connexion HTTP
	private AsyncHttpClient client = new AsyncHttpClient();
	// List sur la classe FormationItem
	private ArrayList<Formation> listFormation;
	private ArrayList<Formation> listFormationView;
	private ArrayList<Formation> listFormationTemp = new ArrayList<Formation>();
	// barre de chargement
	ProgressDialog loading;
	// succès récupération liste formation depuis internet
	boolean success = false;
	// adapter pour la liste
	ListAdapter adapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_search_formation);

		this.setTitle("Formations");
		// permet le retour sur la page père
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		loading = new ProgressDialog(SearchFormationActivity.this);
		loading.setTitle("Chargement en cours...");
		loading.setMessage("Récupération des formations depuis internet...");
		loading.setCancelable(true);
		loading.show();
		
		// gère le fonctionnement des boutons de tri
		btPressed();
	
		// récupère les formations
		recoveryApiFormation();

		// barre de recherche
		SearchView searchView = (SearchView) findViewById(R.id.searchView);
		searchView.setOnQueryTextListener(new OnQueryTextListener() {

			@Override
			public boolean onQueryTextSubmit(String query) {
				// récupère la chaine de caractère envoyé lors de la requête
				// Log.v("requete entière : ", query);
				switch (stateBt) {
				case 0:
					listFormationView.clear(); // supprime les éléments de la liste
					for (int i = 0; i < listFormation.size(); i++) {
						Formation oneFormation = listFormation.get(i);
						if( oneFormation.title.toLowerCase().contains(query.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				case 1:
					listFormationTemp.clear();
					listFormationTemp.addAll(listFormationView);
					listFormationView.clear();
					for (int i = 0; i < listFormationTemp.size(); i++) {
						Formation oneFormation = listFormationTemp.get(i);
						if( oneFormation.title.toLowerCase().contains(query.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				case 2:
					listFormationTemp.clear();
					listFormationTemp.addAll(listFormationView);
					listFormationView.clear();
					for (int i = 0; i < listFormationTemp.size(); i++) {
						Formation oneFormation = listFormationTemp.get(i);
						if( oneFormation.title.toLowerCase().contains(query.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				case 3:
					listFormationTemp.clear();
					listFormationTemp.addAll(listFormationView);
					listFormationView.clear();
					for (int i = 0; i < listFormationTemp.size(); i++) {
						Formation oneFormation = listFormationTemp.get(i);
						if( oneFormation.title.toLowerCase().contains(query.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				default:
					return false;
				}
			
			}

			@Override
			public boolean onQueryTextChange(String newText) {
				// récupère la chaine de caractère en cours
				//Log.v("requete par morceaux : ", newText);
				switch (stateBt) {
				case 0:
					listFormationView.clear(); // supprime les éléments de la liste
					for (int i = 0; i < listFormation.size(); i++) {
						Formation oneFormation = listFormation.get(i);
						if( oneFormation.title.toLowerCase().contains(newText.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				case 1:
					listFormationTemp.clear();
					listFormationTemp.addAll(listFormationView);
					listFormationView.clear();
					for (int i = 0; i < listFormationTemp.size(); i++) {
						Formation oneFormation = listFormationTemp.get(i);
						if( oneFormation.title.toLowerCase().contains(newText.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				case 2:
					listFormationTemp.clear();
					listFormationTemp.addAll(listFormationView);
					listFormationView.clear();
					for (int i = 0; i < listFormationTemp.size(); i++) {
						Formation oneFormation = listFormationTemp.get(i);
						if( oneFormation.title.toLowerCase().contains(newText.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				case 3:
					listFormationTemp.clear();
					listFormationTemp.addAll(listFormationView);
					listFormationView.clear();
					for (int i = 0; i < listFormationTemp.size(); i++) {
						Formation oneFormation = listFormationTemp.get(i);
						if( oneFormation.title.toLowerCase().contains(newText.toLowerCase()) ){
							listFormationView.add(oneFormation);
						}
					}
					adapter.notifyDataSetChanged();
					return true;
				default:
					return false;
				}
			}
		});

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
			//animation
			overridePendingTransition(R.anim.in_details, R.anim.out_list);
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
	@Override
	public void onBackPressed(){
		super.onBackPressed();
		//animation de "retour"
		overridePendingTransition(R.anim.in_details, R.anim.out_list);
		
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
				listFormationView.clear(); // supprime les éléments de la liste
				for (int i = 0; i < listFormation.size(); i++) {
					Formation oneFormation = listFormation.get(i);
					if ("DUT".equals(oneFormation.typeCode)) {
						listFormationView.add(oneFormation);
					}
				}
				adapter.notifyDataSetChanged();
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
				listFormationView.clear(); // supprime les éléments de la liste
				for (int i = 0; i < listFormation.size(); i++) {
					Formation oneFormation = listFormation.get(i);
					if ("LP".equals(oneFormation.typeCode)) {
						listFormationView.add(oneFormation);
					}
				}
				adapter.notifyDataSetChanged();
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
				listFormationView.clear(); // supprime les éléments de la liste
				for (int i = 0; i < listFormation.size(); i++) {
					Formation oneFormation = listFormation.get(i);
					if ("DU".equals(oneFormation.typeCode)) {
						listFormationView.add(oneFormation);
					}
				}
				adapter.notifyDataSetChanged();
			}

		});

	}

	private void recoveryApiFormation() {
		client.get(this, "http://www.iut.unice.fr/api/formations",
				new JsonHttpResponseHandler() {

					@Override
					public void onSuccess(JSONArray response) {
						try {
							// parse JSON
							parseJson(response);
							success = true;
						} catch (JSONException e) {
							e.printStackTrace();
							loading.setTitle("Erreur !");
							loading.setMessage("Erreur de lecture des données. Vous pouvez retourner sur la page précédente.");
							loading.setCancelable(true);
						} catch (IOException e) {
							e.printStackTrace();
							loading.setTitle("Erreur !");
							loading.setMessage("Erreur de connexion lors de la lecture des données. Vous pouvez retourner sur la page précédente.");
							loading.setCancelable(true);
						}

						if (success) {
							// init adapter
							adapter = new ListAdapter();
							listFormationView = new ArrayList<Formation>();
							listFormationView.addAll(listFormation);
							showFormation();
							loading.dismiss();
						}

					}
					
					@Override
					public void onFailure(Throwable e, String response) {
					   	loading.dismiss();
						AlertDialog.Builder alertDialog = new AlertDialog.Builder(
								SearchFormationActivity.this);
						alertDialog.setTitle("Erreur de connexion !");
						alertDialog
								.setMessage("Vous n'êtes probablement pas connecté à internet...");
						alertDialog.setPositiveButton("Retour",
								new DialogInterface.OnClickListener() {
									@Override
									public void onClick(DialogInterface dialog,
											int id) {
										finish();
									}
								});
						AlertDialog dialog = alertDialog.create();
						dialog.show();
					}
				});
	}

	// - Méthode permettant de parser le JSON des formations
	private void parseJson(JSONArray response) throws JSONException,
			IOException {
		listFormation = new ArrayList<Formation>();

		for (int i = 0; i < response.length(); i++) {
			JSONObject formation = response.getJSONObject(i);
			Formation oneFormation = new Formation(formation);
			listFormation.add(oneFormation);
		}
		// Log.v("count list", ""+listFormation.size());
	}

	// - Méthode permettant d'afficher les informations de Formations
	private void showFormation() {
		// affichage de la liste
		ListView listView = (ListView) findViewById(R.id.listViewFormation);
		listView.setAdapter(adapter);
		
		//gestion du détail
		listView.setOnItemClickListener(new OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> parent, View view, int position,
					long id) {
				Formation oneFormation = (Formation) parent.getItemAtPosition(position);
				Intent intent = new Intent(getApplicationContext(), DetailsFormationActivity.class);
				intent.putExtra("body", oneFormation.body);
				intent.putExtra("title", oneFormation.title);
				startActivity(intent);
				
			}
		});
	}

	/*****
	 * Classe ListAdapter adapter pour gérer la liste
	 *****/
	public class ListAdapter extends BaseAdapter {

		// Couleurs de fond des lignes de la liste
		// private final int[] BACKGROUND_GREYS = { 0xffFAFAFA, 0xffF0F0F0 };

		private LayoutInflater inflater;

		public ListAdapter() {
			this.inflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		}

		@Override
		public int getCount() {
			return listFormationView.size();
		}

		@Override
		public Formation getItem(int position) {
			return listFormationView.get(position);

		}

		@Override
		public long getItemId(int position) {
			return Long.valueOf(getItem(position).id); // type de id : int
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			if (convertView == null) {
				convertView = inflater.inflate(R.layout.item_list_formation,
						parent, false);
				
			}
			// convertView.setBackgroundColor(BACKGROUND_GREYS[position %
			// BACKGROUND_GREYS.length]);
			Formation oneFormation = getItem(position);
			TextView textView = ((TextView) convertView);
			textView.setText(oneFormation.title);

			return convertView;
		}

	}

}
