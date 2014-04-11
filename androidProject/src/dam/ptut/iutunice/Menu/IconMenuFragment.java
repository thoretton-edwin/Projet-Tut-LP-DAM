package dam.ptut.iutunice.Menu;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.IutWindows.IutWindowsActivity;
import dam.ptut.iutunice.Maps.MapsActivity;
import dam.ptut.iutunice.PostBac.PostBacActivity;
import dam.ptut.iutunice.R.id;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.Twitter.TwitterActivity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class IconMenuFragment extends Fragment {

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub

		View iconMenu = inflater.inflate(R.layout.icon_menu_fragment, container, false);

		TextView tvSuapsActuality = (TextView) iconMenu
				.findViewById(R.id.tvSuapsActuality);
		TextView tvTweetActuality = (TextView) iconMenu
				.findViewById(R.id.tvTweetsActuality);
		final ImageView imgIutWindow = (ImageView) iconMenu.findViewById(R.id.imgIutWindow);
		ImageView imgGrades = (ImageView) iconMenu.findViewById(R.id.imgGrades);
		ImageView imgCalendar = (ImageView) iconMenu.findViewById(R.id.imgCalendar);
		ImageView imgMap = (ImageView) iconMenu.findViewById(R.id.imgMap);
		ImageView imgSuaps = (ImageView) iconMenu.findViewById(R.id.imgSuaps);
		ImageView imgPostBac = (ImageView) iconMenu.findViewById(R.id.imgPostBac);
		ImageView imgDirectory = (ImageView) iconMenu.findViewById(R.id.imgDirectory);
		ImageView imgCompanyPartnership = (ImageView) iconMenu.findViewById(R.id.imgCompanyPartership);
		ImageView imgTwitter = (ImageView) iconMenu.findViewById(R.id.imgTwitter);

		tvSuapsActuality.setText("Titre Suaps");
		tvTweetActuality.setText("Dernier Tweet");

		// Appel du context de l'activity
		final Context context = getActivity();

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
		imgIutWindow.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				//ouverture page "Vitrine IUT"
				Intent intent = new Intent(getActivity().getApplicationContext(), IutWindowsActivity.class);
				startActivity(intent);				
			}
		});
		
		imgIutWindow.setOnLongClickListener(new OnLongClickListener() {
			
			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Vitrine IUT",Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgGrades.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgGrades.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Notes",Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgCalendar.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgCalendar.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Emploi du temps",Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgMap.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(getActivity().getApplicationContext(), MapsActivity.class);
				startActivity(intent);		
			}
		});
		// Affichage msg quand long click
		imgMap.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Plan des sites",Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgSuaps.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgSuaps.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Suaps",Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgPostBac.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				Intent intent = new Intent(getActivity()
						.getApplicationContext(), PostBacActivity.class);
				startActivity(intent);

			}
		});
		// Affichage msg quand long click
		imgPostBac.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context,"Informations Post-Bac", Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgDirectory.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgDirectory.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Annuaire",Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgCompanyPartnership.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgCompanyPartnership
				.setOnLongClickListener(new OnLongClickListener() {

					@Override
					public boolean onLongClick(View v) {
						// TODO Auto-generated method stub
						Toast mymessage = Toast.makeText(context, "Job Dating",Toast.LENGTH_SHORT);
						mymessage.setGravity(Gravity.CENTER, 0, 0);
						mymessage.show();
						return false;
					}
				});

		imgTwitter.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent i = new Intent(getActivity().getApplicationContext(), TwitterActivity.class);
				startActivity(i);
			}
		});
		// Affichage msg quand long click
		imgTwitter.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Twitter",Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		return iconMenu;
	}
}
