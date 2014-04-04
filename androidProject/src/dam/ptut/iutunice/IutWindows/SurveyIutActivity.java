package dam.ptut.iutunice.IutWindows;

import java.io.IOException;

import org.xmlpull.v1.XmlPullParserException;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.NavUtils;
import android.view.Menu;
import android.view.MenuItem;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.TextHttpResponseHandler;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.SurveyFragment;
import dam.ptut.iutunice.Parameter.ParameterItemsFragment;

public class SurveyIutActivity extends FragmentActivity {

	// client pour connexion HTTP
	private AsyncHttpClient client = new AsyncHttpClient();
	// List sur la classe SondageItem
	// private ArrayList<SurveyItem> listSurvey;
	// barre de chargement
	ProgressDialog loading;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_survey_iut);

		this.setTitle("Sondage IUT");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		loading = new ProgressDialog(SurveyIutActivity.this);
		loading.setTitle("Chargement en cours...");
		loading.setMessage("Récupération du sondage depuis internet...");
		loading.setCancelable(true);
		loading.show();

		// test de la connexion internet
		ConnectivityManager connect = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = connect.getActiveNetworkInfo();
		if (networkInfo == null || !networkInfo.isConnected()) {
			loading.dismiss();
			AlertDialog.Builder alertDialog = new AlertDialog.Builder(
					SurveyIutActivity.this);
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

		// récupère le sondage
		recoveryXmlSurvey();
	}

	private void recoveryXmlSurvey() {
		client.get(
				this,
				"http://sd-6.archive-host.com/membres/up/4041201007a5bf3f0d5112ca7648a0adc66e3177/IUT_Nice_Cote_dAzur/sondageQuestions.xml",
				new TextHttpResponseHandler() {

					@Override
					public void onSuccess(String responseBody) {
						try {
							// parse XML
							parseSurvey(responseBody);
						} catch (XmlPullParserException e) {
							e.printStackTrace();
							loading.setTitle("Erreur !");
							loading.setMessage("Erreur de lecture des données. Vous pouvez retourner sur la page précédente.");
						} catch (IOException e) {
							e.printStackTrace();
							loading.setTitle("Erreur !");
							loading.setMessage("Erreur de connexion lors de la lecture des données. Vous pouvez retourner sur la page précédente.");
						}
						loading.dismiss();
						AlertDialog.Builder alertDialog = new AlertDialog.Builder(
								SurveyIutActivity.this);
						alertDialog.setTitle("Langue du Sondage.");
						alertDialog
								.setMessage("Choisissez dans quelle langue voulez-vous afficher le sondage. Choose the language in which you want to view the survey.");
						alertDialog.setPositiveButton("Français",
								new DialogInterface.OnClickListener() {
									@Override
									public void onClick(DialogInterface dialog,
											int id) {
										// français
										SurveyFragment surveyFragment = new SurveyFragment();
										getSupportFragmentManager()
												.beginTransaction()
												.replace(R.id.surveyContent,
														surveyFragment)
												.commit();
									}
								});
						alertDialog.setNegativeButton("English",
								new DialogInterface.OnClickListener() {
									@Override
									public void onClick(DialogInterface dialog,
											int which) {
										// anglais
									}
								});
						AlertDialog dialog = alertDialog.create();
						dialog.show();
					}

					@Override
					public void onFailure(String responseBody, Throwable error) {
						loading.dismiss();
						AlertDialog.Builder alertDialog = new AlertDialog.Builder(
								SurveyIutActivity.this);
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

	// - Méthode permettant de parser le xml sondage
	private void parseSurvey(String response) throws XmlPullParserException,
			IOException {
		// XmlPullParser parser = Xml.newPullParser();
		// parser.setInput(new StringReader(response));
		// sparser.require(XmlPullParser.START_DOCUMENT, null, null); //début

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
		getMenuInflater().inflate(R.menu.survey_iut_page, menu);
		return true;
	}

	@Override
	public void onBackPressed() {
		super.onBackPressed();
		// animation de "retour"
		overridePendingTransition(R.anim.in_details, R.anim.out_list);
	}
}
