package dam.ptut.iutunice.PostBac;

import java.util.ArrayList;
import java.util.HashMap;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.NavUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.BaseExpandableListAdapter;
import android.widget.CheckBox;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.TextView;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.SurveyAnswer;
import dam.ptut.iutunice.SurveyQuestion;

public class PostBacActivity extends Activity {

	ExpandableListAdapter listAdapter;
	ExpandableListView expandableListViewPostBac;
	HashMap<String, String> listDataChild; //formations, description
	ArrayList<String> formations;
	ArrayList<String> description;
	LayoutInflater inflater;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_post_bac);
		
		inflater = (LayoutInflater)getSystemService(Context.LAYOUT_INFLATER_SERVICE);

		this.setTitle("Informations Post-Bac");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		expandableListViewPostBac = (ExpandableListView) findViewById(R.id.expandableListViewPostBac);

		//charge les informations qui s'afficheront sur la page
		completeList();
		
		expandableListViewPostBac.setAdapter(new BaseExpandableListAdapter() {
			
			@Override
			public boolean isChildSelectable(int groupPosition, int childPosition) {
				//permet le clic sur l'enfant
				return true;
			}
			
			@Override
			public boolean hasStableIds() {
				return false;
			}
			
			@Override
			public View getGroupView(int groupPosition, boolean isExpanded,
					View convertView, ViewGroup parent) {
				String formation = (String) getGroup(groupPosition);
				if(convertView == null){
					convertView = inflater.inflate(R.layout.list_group_postbac, parent,
							false);				
				}
				
				TextView txtFormation = (TextView) convertView.findViewById(R.id.txtFormation);
				txtFormation.setText(formation);
				
				return convertView;
			}
			
			@Override
			public long getGroupId(int groupPosition) {
				return groupPosition;
			}
			
			@Override
			public int getGroupCount() {
				return formations.size();
			}
			
			@Override
			public String getGroup(int groupPosition) {
				return formations.get(groupPosition);
			}
			
			@Override
			public int getChildrenCount(int groupPosition) {
				//String formation = formations.get(groupPosition);
				//String description = listDataChild.get(formation);
				//int nbChildren = surveyAnswer.size();
				//return nbChildren;
				return 1;
			}
			
			@Override
			public View getChildView(int groupPosition, int childPosition,
					boolean isLastChild, View convertView, ViewGroup parent) {
				String description = (String) getChild(groupPosition, childPosition);
				
				if(convertView == null){
					convertView = inflater.inflate(R.layout.item_list_postbac, parent,
							false);				
				}
				WebView webViewPostBac = (WebView) convertView.findViewById(R.id.webViewPostBac);
				String typeMime = "text/html";
				String encoding = "utf-8";
				webViewPostBac.getSettings().setJavaScriptEnabled(true);
				webViewPostBac.loadDataWithBaseURL(null, description, typeMime, encoding, null);
				webViewPostBac.setBackgroundColor(Color.TRANSPARENT);
				
				return convertView;
			}
			
			@Override
			public long getChildId(int groupPosition, int childPosition) {
				return childPosition;
			}
			
			@Override
			public String getChild(int groupPosition, int childPosition) {
				String formation = formations.get(groupPosition);	
				String description = listDataChild.get(formation);
				return description;
			}
		});

	}
	
	private void completeList(){
		formations = new ArrayList<String>();
		formations.add("DUT");
		formations.add("LP");
		formations.add("Années Spéciales");
		
		description = new ArrayList<String>();
		String descDut = "<!DOCTYPE html><html  xmlns='http://www.w3.org/1999/xhtml' xml:lang='fr'><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /></head><body><h2>Demande de dossiers d'admission</h2><p>Comment poser sa candidature : <a href='http://www.iut.unice.fr/service-scolarite'> Service de la Scolarité</a>, <b>Bureau 1</b>.</p><h2>Le Diplôme Universitaire de Technologie (DUT)</h2><p>Diplôme national à vocation professionnelle, le DUT est très apprécié par les entreprises car il est immédiatement reconnu sur le marché de l’emploi. Il permet à ses titulaires d’exercer des responsabilités techniques et d’encadrement importants tout en étant capables de s’adapter à l’évolution technologique et économique.</p><h2>L'organisation des études</h2><p>Le DUT s’inscrit depuis 2005 dans l’espace européen de l’Enseignement Supérieur et dans le schéma LMD (Licence-Master-Doctorat) en adoptant une nouvelle organisation des études.<br /><br /></p><p><span style='font-weight: bold;'>Formation générale et professionnelle : </span></p><ul><li>de 1600 à 1800 heures d’enseignement dispensées selon la spécialité ; enseignements définis par des Programmes Pédagogiques Nationaux.</li><li>Stages en entreprise et projets tuteurés effectués durant le cursus.</li></ul><span style='font-weight: bold;'>Formation dispensée sur 4 semestres</span><p>Le contenu des enseignements est organisé sur 4 semestres avec un système de crédits capitalisables. Chaque semestre est composé de 1 à 4 Unités d’Enseignement (U.E.), elles-mêmes divisées en modules d’enseignement.</p><br /><span style='font-weight: bold;'> Projet Personnel et Professionnel (P.P.P.)</span><p>Le Projet Personnel et Professionnel de l’étudiant est un dispositif d’accompagnement des étudiants dans l’élaboration de leur projet personnel et professionnel. Un dispositif d’accueil, de tutorat et de soutien à l’orientation de chaque étudiant est mis en place afin de favoriser la construction et la réussite de son Projet Personnel et Professionnel tout au long de son cursus.</p><h2>Les conditions d'admission</h2><p>Le DUT se prépare en formation initiale, <a class='link-iut' href='http://www.iut.unice.fr/formations/type/id/5'>en alternance</a> ou en <a class='link-iut' href='http://www.iut.unice.fr/alternance-apprentissage'>formation continue</a>.</p><ul><li>Pour candidater au DUT en formation initiale, il faut être titulaire d’un baccalauréat ou d’un titre admis en équivalence.</li><li><a class='link-iut' href='http://www.iut.unice.fr/formations/type/id/5'>L’alternance</a> s’adresse aux jeunes de 16 à 25 ans, titulaires d’un baccalauréat ou d’une formation équivalente.</li><li><a class='link-iut' href='http://www.iut.unice.fr/alternance-apprentissage'>En formation continue</a>, les candidats peuvent suivre l’intégralité des formations ou bien des modules, ou encore bénéficier de la validation des acquis professionnels et de l’expérience.</li></ul><h2>L'évaluation</h2><p>Le niveau des connaissances est contrôlé de façon régulière et continue au cours des quatre semestres. Le DUT est obtenu après validation de tous les semestres, ce qui donne lieu à l’attribution de 120 crédits européens (ECTS), à raison de 30 crédits européens par semestre.<br />Les jurys sont composés d’enseignants et de représentants de la profession concernés par le diplôme.</p><h2>L'année spéciale</h2><p>Certains DUT peuvent être préparés en une seule année appelée « année spéciale ». Cette possibilité est accordée aux étudiants pouvant justifier d’un niveau Bac + 2 et souhaitant accéder à la vie professionnelle par une formation diplômante technologique courte, grâce à un enseignement adapté et intensif.</p><h2>Après le DUT</h2><strong>Une Insertion professionnelle immédiate</strong> ou une spécialisation (Diplôme d’Université Post-DUT). Certification de niveau III : Technicien Supérieur. <br /><strong>Une poursuite d’études courtes</strong> en Licence Professionnelle<br />Certification de niveau II : Cadre Intermédiaire.<br /><strong>Une poursuite d’études longues</strong> en Master, IUP, écoles d’ingénieur, écoles de commerce, etc.<br />Certification de niveau I : Cadre Supérieur.<br /></body></html>";
		description.add(descDut);
		String descLp = "<!DOCTYPE html><html  xmlns='http://www.w3.org/1999/xhtml' xml:lang='fr'><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /></head><body><h2>Demande de dossiers d'admission</h2><p>Pour poser votre candidature, Connectez vous sur <a href='https://adiut1.iut-candidatures.fr/CiellCommun/' target='_blank' title='demandes de dossier d admission niveau bac +2'>CIELL2</a>.</p><h2>La Licence Professionnelle (LP)</h2><p>Créée en 1999 dans le cadre de l'harmonisation européenne de l'enseignement supérieur, la Licence Professionnelle est un diplôme qui correspond au premier niveau de cadre (Bac+3). Cette formation est organisée sur une année (ou deux semestres).</p><p> Comme le DUT, la spécificité de ce diplôme réside dans son mode d'élaboration fondé sur la mise en place de partenariats étroits entre Universités, établissements de formation, entreprises et branches professionnelles.</p><h2>L'insertion professionnelle favorisée</h2><p>	La Licence Professionnelle est conçue dans l'objectif d'insertion professionnelle. Elle répond aux engagements européens qui prévoient un cursus licence adapté aux exigences du marché du travail ainsi qu'à la demande de nouvelles qualifications, entre le niveau technicien supérieur et le niveau ingénieur-cadre supérieur.</p><p>Cette formation conduit à l'obtention de connaissances et de compétences nouvelles dans les secteurs concernés et permet l'accès aux <strong>emplois de responsabilité dans les PME-PMI</strong> ou <strong>dans les services de grandes entreprises</strong>.</p><p>Ce diplôme doit permettre aux étudiants qui le souhaitent d'acquérir rapidement une qualification professionnelle répondant à des besoins et à des métiers clairement identifiés.</p><p>La Licence Professionnelle propose des enseignements théoriques, des enseignements pratiques, l'apprentissage de méthodes et d'outils. Elle comprend des périodes de formation en milieu professionnel, notamment lors du stage (environ 16 semaines en entreprise) et du projet tutoré.</p><p>La Licence Professionnelle réalise une mise en contact réelle de l'étudiant avec le monde du travail de manière à lui permettre d'approfondir ses connaissances et son projet professionnel et à faciliter son insertion dans la vie active.</p><h2>Les conditions d'admission</h2><p>La Licence Professionnelle peut se préparer en formation initiale et en <a href='http://www.iut.unice.fr/alternance-apprentissage'>formation continue</a>. Ce cursus est ouvert à des publics diversifiés. Des parcours différenciés permettent de conduire des jeunes issus de filières différentes vers les mêmes compétences. </p><p>Elle est accessible aux étudiants pouvant justifier :</p><dl><dt>Soit d'un BAC+2 ce qui permet :</dt><dd>- aux titulaires d'un brevet de technicien supérieur (B.T.S) ou d'un Diplôme d'Université de Technologie (D.U.T) d'obtenir un niveau supérieur de qualification dans le prolongement de leurs études antérieures.</dd><dd>- aux titulaires d'une deuxième année de Licence (L2) d'obtenir en un an un diplôme facilitant leur insertion dans la vie active.</dd><dt>Soit de la validation des études, expériences professionnelles ou acquis.</dt></dl><p>Elle offre ainsi aux techniciens en situation d'activité professionnelle la possibilité de développer leur carrière. Elle a notamment recours à la validation des acquis de l'expérience professionnelle.</p><h2>Evaluation</h2><p>Le niveau des connaissances est contrôlé de façon régulière et continue au cours de la formation. L'évaluation du stage et du projet tuteuré est aussi déterminante que l'évaluation des unités d'enseignement. Le jury comprend, pour au moins un quart et au plus la moitié, des professionnels des secteurs concernés par la Licence Professionnelle.</p></body></html>";
		description.add(descLp);
		String descAS = "<!DOCTYPE html><html  xmlns='http://www.w3.org/1999/xhtml' xml:lang='fr'><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /></head><body><h2>Demande de dossiers d'admission</h2><p>Pour poser votre candidature, contacter <a class='link-iut' href='http://www.iut.unice.fr/pages/dossier/id/2'>le Service de la Scolarité</a>, <strong>Bureau 1</strong>.<h2>Le DUT Année Spéciale</h2><p>Cette formation permet de préparer un DUT en une seule année, grâce à <strong>un enseignement adapté et intensif</strong>.</p><p>La durée de la scolarité est de 30 à 36 semaines, selon les DUT, dont <strong>10 semaines de stages en entreprise</strong>.</p><p>La présence des étudiants est obligatoire à tous les cours, travaux dirigés, conférences et stages en entreprises.</p><p>L'Année Spéciale est accessible aux étudiants pouvant justifier d'un niveau Bac + 2 (deuxième année de premier cycle universitaire), et aux titulaires d'un Bac + 2 (L2, BTS, DUT ou diplôme équivalent) qui souhaitent acquérir <strong>une double compétence</strong>.</p></body></html>";
		description.add(descAS);
			
		//listDataHeader égal à formations
		listDataChild = new HashMap<String, String>();
		for(int i=0 ; i<formations.size() ; i++){
			String oneFormation = formations.get(i);
			String oneDescription = description.get(i);
			listDataChild.put(oneFormation, oneDescription);
		}
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
		getMenuInflater().inflate(R.menu.post_bac, menu);
		return true;
	}

	@Override
	public void onBackPressed() {
		super.onBackPressed();
		// animation de "retour"
		overridePendingTransition(R.anim.in_details, R.anim.out_list);
	}
}
