package dam.ptut.iutunice.IutWindows;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.app.ActionBar;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.NavUtils;
import android.util.Xml;
import android.view.Menu;
import android.view.MenuItem;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.TextHttpResponseHandler;

import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.SurveyFragment;
import dam.ptut.iutunice.SurveyItem;

public class SurveyIutActivity extends FragmentActivity {

	// client pour connexion HTTP
	private AsyncHttpClient client = new AsyncHttpClient();
	// List sur la classe SondageItem
	private ArrayList<SurveyItem> listSurvey;
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
								.setMessage("Choisissez dans quelle langue voulez-vous afficher le sondage. Choose the language of the survey.");
						alertDialog.setPositiveButton("Français",
								new DialogInterface.OnClickListener() {
									@Override
									public void onClick(DialogInterface dialog,
											int id) {
										// français
										SurveyFragment surveyFragment = new SurveyFragment();
										Bundle args = new Bundle(1);
										args.putString(SurveyFragment.LANGUAGE,
												"fr");
										args.putString(SurveyFragment.TYPE,
												"IUT");
										surveyFragment.setArguments(args);
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
										SurveyFragment surveyFragment = new SurveyFragment();
										Bundle args = new Bundle(1);
										args.putString(SurveyFragment.LANGUAGE,
												"en");
										args.putString(SurveyFragment.TYPE,
												"IUT");
										surveyFragment.setArguments(args);
										getSupportFragmentManager()
												.beginTransaction()
												.replace(R.id.surveyContent,
														surveyFragment)
												.commit();
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
		XmlPullParser parser = Xml.newPullParser();
		parser.setInput(new StringReader(response));
		parser.require(XmlPullParser.START_DOCUMENT, null, null); // début
		parser.nextTag(); // balise suivante root
		parser.require(XmlPullParser.START_TAG, null, "root"); // vérif root
		listSurvey = new ArrayList<SurveyItem>(); // nouvelle liste

		String lang = "";
		String type = "";
		while(parser.nextTag() == XmlPullParser.START_TAG || "sondage".equals(parser.getName()) || "questionnaire".equals(parser.getName()) ){
			if("sondage".equals( parser.getName() )){
				switch(parser.getEventType()){
				case XmlPullParser.START_TAG:
					lang = parser.getAttributeValue(null, "lang");
					//Log.v("langue : ", ""+lang);
					//Log.v("sur balise sondage (début)", ""+parser.getName() );
					break;
				case XmlPullParser.END_TAG:
					//Log.v("sur balise sondage (fin)", ""+parser.getName() );
					break;
				}

			}else if("questionnaire".equals( parser.getName() )){
				switch(parser.getEventType()){
				case XmlPullParser.START_TAG:
					type = parser.getAttributeValue(null, "type");
					//Log.v("type : ", type);
					//Log.v("sur balise questionnaire (début)", ""+parser.getName() );
					break;
				case XmlPullParser.END_TAG:
					//Log.v("sur balise questionnaire (fin)", ""+parser.getName() );
					break;
				}
			
			}else{
				SurveyItem survey = new SurveyItem(parser, lang, type);
				listSurvey.add(survey);
			}
		}
		
		parser.require(XmlPullParser.END_TAG, null, "root");
		parser.next();
		parser.require(XmlPullParser.END_DOCUMENT, null, null);
		
		App app = (App) getApplication();
		app.surveyList = listSurvey;
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
