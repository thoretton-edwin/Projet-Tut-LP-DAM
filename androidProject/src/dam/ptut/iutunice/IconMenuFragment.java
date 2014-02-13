package dam.ptut.iutunice;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;


public class IconMenuFragment extends Fragment {

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub
//		int position = getArguments().getInt("position", -1);
		
		View iconMenu = inflater.inflate(R.layout.icon_menu_fragment, container, false);
		
		TextView tvSuapsActuality = (TextView)iconMenu.findViewById(R.id.tvSuapsActuality);
		TextView tvTweetActuality = (TextView)iconMenu.findViewById(R.id.tvTweetsActuality);
		ImageButton imgBtIutWindow = (ImageButton)iconMenu.findViewById(R.id.imgBtIutWindow);
		ImageButton imgBtGrades = (ImageButton)iconMenu.findViewById(R.id.imgBtGrades);
		ImageButton imgBtCalendar = (ImageButton)iconMenu.findViewById(R.id.imgBtCalendar);
		ImageButton imgBtMap = (ImageButton)iconMenu.findViewById(R.id.imgBtMap);
		ImageButton imgBtSuaps = (ImageButton)iconMenu.findViewById(R.id.imgBtSuaps);
		ImageButton imgBtPostBac = (ImageButton)iconMenu.findViewById(R.id.imgBtPostBac);
		ImageButton imgBtDirectory = (ImageButton)iconMenu.findViewById(R.id.imgBtDirectory);
		ImageButton imgBtCompanyPartnership = (ImageButton)iconMenu.findViewById(R.id.imgBtCompanyPartnership);
		ImageButton imgBtTwitter = (ImageButton)iconMenu.findViewById(R.id.imgBtTwitter);
		
		tvSuapsActuality.setText("Titre Suaps");
		tvTweetActuality.setText("Dernier Tweet");
		
		tvSuapsActuality.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		tvTweetActuality.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtIutWindow.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		
		imgBtGrades.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtCalendar.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtMap.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtSuaps.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtPostBac.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtDirectory.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtCompanyPartnership.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		imgBtTwitter.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				
			}
		});
		
		return iconMenu;
	}
}
