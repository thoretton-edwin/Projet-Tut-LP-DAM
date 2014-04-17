package dam.ptut.iutunice;

import java.util.ArrayList;
import java.util.HashMap;

import dam.ptut.iutunice.IutWindows.SurveyIutActivity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.BaseExpandableListAdapter;
import android.widget.CheckBox;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ExpandableListView.OnChildClickListener;
import android.widget.ExpandableListView.OnGroupCollapseListener;
import android.widget.ExpandableListView.OnGroupExpandListener;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

public class SurveyFragment extends Fragment {
	public final static String LANGUAGE = "language";
	public final static String TYPE = "type";
	
	private SurveyItem surveyItem;
	private SurveyItem oneSurvey = null;
	
	ExpandableListAdapter listAdapter;
	ExpandableListView expandableListViewSurvey;
	HashMap<String, ArrayList<SurveyAnswer>> listDataChild;
	
	//pourcentage bar de progression
	int lastPercent = 0;
	
	@Override
	public View onCreateView(final LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState){
		final String language = getArguments().getString(LANGUAGE);
		final String type = getArguments().getString(TYPE);
		App app = (App) getActivity().getApplication();
		
		Log.v("language :", language);
		Log.v("type :", type);
		for(int i=0 ; i<app.surveyList.size() ; i++){
			surveyItem = app.surveyList.get(i);
			if(surveyItem.language.equals(language) && surveyItem.type.equals(type)){
				Log.v("nombre de passage",""+i);
				oneSurvey = surveyItem;
			}
		}
		
		final View content = inflater.inflate(R.layout.fragment_survey, container,
				false);
		
		expandableListViewSurvey = (ExpandableListView) content.findViewById(R.id.expandableListViewSurvey);

		//listDataHeader égal à oneSurvey.questionArray
		listDataChild = new HashMap<String, ArrayList<SurveyAnswer>>();
		
		for(int i =0 ; i<oneSurvey.questionArray.size() ; i++){
			SurveyQuestion surveyQuestion = (SurveyQuestion) oneSurvey.questionArray.get(i);
			ArrayList<SurveyAnswer> surveyAnswer = surveyQuestion.answerArray;
			listDataChild.put(surveyQuestion.entitled, surveyAnswer);
		}
		
		expandableListViewSurvey.setAdapter(new BaseExpandableListAdapter() {
			
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
				SurveyQuestion question = (SurveyQuestion) getGroup(groupPosition);
				String idQuestion = question.id;
				String entitledQuestion = question.entitled;
				if(convertView == null){
					convertView = inflater.inflate(R.layout.list_group_survey, parent,
							false);				
				}
				
				TextView txtIdQuestion = (TextView) convertView.findViewById(R.id.txtIdQuestion);
				txtIdQuestion.setText(idQuestion);
				TextView txtQuestion = (TextView) convertView.findViewById(R.id.txtQuestion);
				txtQuestion.setText(entitledQuestion);
				
				return convertView;
			}
			
			@Override
			public long getGroupId(int groupPosition) {
				return groupPosition;
			}
			
			@Override
			public int getGroupCount() {
				return oneSurvey.questionArray.size();
			}
			
			@Override
			public SurveyQuestion getGroup(int groupPosition) {
				return oneSurvey.questionArray.get(groupPosition);
			}
			
			@Override
			public int getChildrenCount(int groupPosition) {
				SurveyQuestion surveyQuestion = oneSurvey.questionArray.get(groupPosition);
				ArrayList<SurveyAnswer> surveyAnswer = listDataChild.get(surveyQuestion.entitled);
				int nbChildren = surveyAnswer.size();
				return nbChildren;
			}
			
			@Override
			public View getChildView(int groupPosition, int childPosition,
					boolean isLastChild, View convertView, ViewGroup parent) {
				SurveyAnswer answer = (SurveyAnswer) getChild(groupPosition, childPosition);
				
				if(convertView == null){
					convertView = inflater.inflate(R.layout.item_list_survey, parent,
							false);				
				}
//				RadioButton radioBt = (RadioButton) convertView.findViewById(R.id.radioButton);
//				radioBt.setText(answer.entitled);
				TextView txtView = (TextView) convertView.findViewById(R.id.textViewCheck);
				txtView.setText(answer.entitled);
				
				CheckBox checkBoxSurvey = (CheckBox) convertView.findViewById(R.id.checkBoxSurvey);
				if(answer.isCheck == false)
					checkBoxSurvey.setChecked(false);
				else
					checkBoxSurvey.setChecked(true);
				
				return convertView;
			}
			
			@Override
			public long getChildId(int groupPosition, int childPosition) {
				return childPosition;
			}
			
			@Override
			public SurveyAnswer getChild(int groupPosition, int childPosition) {
				SurveyQuestion surveyQuestion = oneSurvey.questionArray.get(groupPosition);	
				ArrayList<SurveyAnswer> surveyAnswerArray = listDataChild.get(surveyQuestion.entitled);
				SurveyAnswer surveyAnswer = surveyAnswerArray.get(childPosition);
				return surveyAnswer;
			}
		});
		
		expandableListViewSurvey.setOnChildClickListener(new OnChildClickListener() {
			
			@Override
			public boolean onChildClick(ExpandableListView parent, View v,
					int groupPosition, int childPosition, long id) {
				
				Log.v("clique child","child");
	
				SurveyQuestion surveyQuestion = oneSurvey.questionArray.get(groupPosition);	
				ArrayList<SurveyAnswer> surveyAnswerArray = listDataChild.get(surveyQuestion.entitled);
				
				//test si réponse multiple car interdit
				boolean answerMultiple = false;
				for(int i=0 ; i< surveyAnswerArray.size() ; i++){
					SurveyAnswer surveyAnswer = surveyAnswerArray.get(i);
					
					//si déjà check dans la classe mais pas un décochage
					if(surveyAnswer.isCheck == true && (surveyAnswer != surveyAnswerArray.get(childPosition))){
						answerMultiple = true;
					}
						
				}
				
				//si réponse multiple
				if(answerMultiple == true){
					AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
					//langue fr
					if("fr".equals(language)){
						alertDialog.setTitle("Choix multiple impossible...");
						alertDialog
								.setMessage("Une seule réponse par question.");
						alertDialog.setPositiveButton("OK", null);
					}else{
						alertDialog.setTitle("Multiple choice impossible....");
						alertDialog
								.setMessage("Only one answer per question.");
						alertDialog.setPositiveButton("OK", null);
					}
					
					AlertDialog dialog = alertDialog.create();
					dialog.show();
				}else{
					//progressBar
					ProgressBar progressBarSurvey = (ProgressBar) content.findViewById(R.id.progressBarSurvey);
					int totalQuestion = oneSurvey.questionArray.size();
					int perQuestion = (100/totalQuestion);
					
					SurveyAnswer surveyAnswer = surveyAnswerArray.get(childPosition);
					surveyAnswer.isCheck = true;
					
					CheckBox checkBoxSurvey = (CheckBox) v.findViewById(R.id.checkBoxSurvey);
					if(checkBoxSurvey.isChecked()){
						//l'utilisateur souhaite décocher
						surveyAnswer.isCheck = false;
						checkBoxSurvey.setChecked(false);
						//progressBar
						lastPercent -= perQuestion;
						progressBarSurvey.setProgress(lastPercent);
					}else{
						//l'utilisateur souhaite cocher
						surveyAnswer.isCheck = true;
						checkBoxSurvey.setChecked(true);
						//avancé du progressbar, 1 réponse par question
						progressBarSurvey.setProgress(lastPercent+perQuestion);
						lastPercent += perQuestion;
					}
					
					//test si tout rempli
					if(lastPercent == (perQuestion*totalQuestion) ){
						AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
						//langue fr
						if("fr".equals(language)){
							alertDialog.setTitle("Sondage terminé.");
							alertDialog
									.setMessage("Voulez-vous l'enregistrer ?");
							alertDialog.setNegativeButton("Non, modifier le sondage", null);
							alertDialog.setPositiveButton("Oui", new OnClickListener() {
								
								@Override
								public void onClick(DialogInterface dialog, int which) {
									// TODO Auto-generated method stub
									
								}
							});
						}else{
							alertDialog.setTitle("Survey completed.");
							alertDialog
									.setMessage("Do you want to save?");
							alertDialog.setNegativeButton("No, change the survey.", null);
							alertDialog.setPositiveButton("Yes", new OnClickListener() {
								
								@Override
								public void onClick(DialogInterface dialog, int which) {
									// TODO Auto-generated method stub
									
								}
							});
						}
						
						AlertDialog dialog = alertDialog.create();
						dialog.show();
					}
					
				}
				
				
				
//				TextView txtValid = (TextView) v.findViewById(R.id.txtValid);
//				txtValid.setText("hello");
//				Toast.makeText(
//                        getApplicationContext(),
//                        listDataHeader.get(groupPosition)
//                                + " : "
//                                + listDataChild.get(
//                                        listDataHeader.get(groupPosition)).get(
//                                        childPosition), Toast.LENGTH_SHORT)
//                        .show();
				return true;
				
			}
		});
		
//		// Listview Group expanded listener
//		expandableListViewSurvey.setOnGroupExpandListener(new OnGroupExpandListener() {
//		 
//		    @Override
//		    public void onGroupExpand(int groupPosition) {
//		        Toast.makeText(getActivity().getApplicationContext(),
//		        		oneSurvey.questionArray.get(groupPosition) + " Expanded",
//		                Toast.LENGTH_SHORT).show();
//		    }
//		});
//		
//		// Listview Group collasped listener
//		expandableListViewSurvey.setOnGroupCollapseListener(new OnGroupCollapseListener() {
//		 
//		    @Override
//		    public void onGroupCollapse(int groupPosition) {
//		        Toast.makeText(getActivity().getApplicationContext(),
//		        		oneSurvey.questionArray.get(groupPosition) + " Collapsed",
//		                Toast.LENGTH_SHORT).show();
//		 
//		    }
//		});
		
//		ListView listView = (ListView) content.findViewById(R.id.listViewSurvey);
//		listView.setAdapter(new BaseAdapter() {
//			
//			@Override
//			public View getView(int position, View convertView, ViewGroup parent) {
//				View itemView = inflater.inflate(R.layout.item_list_survey, parent,
//						false);
//
//				SurveyQuestion surveyQuestion = (SurveyQuestion) getItem(position);
//				TextView txtIdQuestion = (TextView) itemView.findViewById(R.id.txtIdQuestion);
//				txtIdQuestion.setText(surveyQuestion.id);
//				TextView txtQuestion = (TextView) itemView.findViewById(R.id.txtQuestion);
//				txtQuestion.setText(surveyQuestion.entitled);
//				
//				return itemView;
//			}
//			
//			@Override
//			public long getItemId(int position) {
//				// TODO Auto-generated method stub
//				return 0;
//			}
//			
//			@Override
//			public Object getItem(int position) {
//				// TODO Auto-generated method stub
//				return oneSurvey.questionArray.get(position);
//			}
//			
//			@Override
//			public int getCount() {
//				// TODO Auto-generated method stub
//				return oneSurvey.questionArray.size();
//			}
//		});
		
//		if(oneSurvey.equals(null)){
//			AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
//			alertDialog.setTitle("Affichage sondage impossible...");
//			alertDialog
//					.setMessage("Sondage incorrect à afficher.");
//			alertDialog.setPositiveButton("Retour",
//					new DialogInterface.OnClickListener() {
//						@Override
//						public void onClick(DialogInterface dialog, int id) {
//							getActivity().finish();
//						}
//					});
//			AlertDialog dialog = alertDialog.create();
//			dialog.show();
//		}
		
		
		
		return content;
		
	}
}
