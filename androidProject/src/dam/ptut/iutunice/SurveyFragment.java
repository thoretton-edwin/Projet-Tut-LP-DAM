package dam.ptut.iutunice;

import dam.ptut.iutunice.IutWindows.SurveyIutActivity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;

public class SurveyFragment extends Fragment {
	public final static String LANGUAGE = "language";
	public final static String TYPE = "type";
	
	private SurveyItem surveyItem;
	private SurveyItem oneSurvey = null;
	
	@Override
	public View onCreateView(final LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState){
		String language = getArguments().getString(LANGUAGE);
		String type = getArguments().getString(TYPE);
		App app = (App) getActivity().getApplication();
		
		Log.v("language :", language);
		Log.v("type :", type);
		for(int i=0 ; i<app.surveyList.size() ; i++){
			surveyItem = app.surveyList.get(i);
			if(surveyItem.language.equals(language) && surveyItem.type.equals(type)){
				oneSurvey = surveyItem;
			}
		}
		
		View content = inflater.inflate(R.layout.fragment_survey, container,
				false);
		
		ListView listView = (ListView) content.findViewById(R.id.listViewSurvey);
		listView.setAdapter(new BaseAdapter() {
			
			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				View itemView = inflater.inflate(R.layout.item_list_survey, parent,
						false);

				SurveyQuestion surveyQuestion = (SurveyQuestion) getItem(position);
				TextView txtIdQuestion = (TextView) itemView.findViewById(R.id.txtIdQuestion);
				txtIdQuestion.setText(surveyQuestion.id);
				TextView txtQuestion = (TextView) itemView.findViewById(R.id.txtQuestion);
				txtQuestion.setText(surveyQuestion.entitled);
				
				return itemView;
			}
			
			@Override
			public long getItemId(int position) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Object getItem(int position) {
				// TODO Auto-generated method stub
				return oneSurvey.questionArray.get(position);
			}
			
			@Override
			public int getCount() {
				// TODO Auto-generated method stub
				return oneSurvey.questionArray.size();
			}
		});
		
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
