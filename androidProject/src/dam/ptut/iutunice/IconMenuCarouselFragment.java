package dam.ptut.iutunice;

import dam.ptut.iutunice.PostBac.PostBacActivity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

public class IconMenuCarouselFragment extends Fragment {

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub

		View iconMenu = inflater.inflate(R.layout.icon_menu_carousel_fragment,
				container, false);

		TextView tvSuapsActuality = (TextView) iconMenu
				.findViewById(R.id.tvSuapsActuality);
		TextView tvTweetActuality = (TextView) iconMenu
				.findViewById(R.id.tvTweetsActuality);
		ImageButton imgBtIutWindow = (ImageButton) iconMenu
				.findViewById(R.id.imgBtIutWindow);
		ImageButton imgBtGrades = (ImageButton) iconMenu
				.findViewById(R.id.imgBtGrades);
		ImageButton imgBtCalendar = (ImageButton) iconMenu
				.findViewById(R.id.imgBtCalendar);
		ImageButton imgBtMap = (ImageButton) iconMenu
				.findViewById(R.id.imgBtMap);
		ImageButton imgBtSuaps = (ImageButton) iconMenu
				.findViewById(R.id.imgBtSuaps);
		ImageButton imgBtPostBac = (ImageButton) iconMenu
				.findViewById(R.id.imgBtPostBac);
		ImageButton imgBtDirectory = (ImageButton) iconMenu
				.findViewById(R.id.imgBtDirectory);
		ImageButton imgBtCompanyPartnership = (ImageButton) iconMenu
				.findViewById(R.id.imgBtCompanyPartnership);
		ImageButton imgBtTwitter = (ImageButton) iconMenu
				.findViewById(R.id.imgBtTwitter);

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

		imgBtIutWindow.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				// ouverture page "Vitrine IUT"
				Intent intent = new Intent(getActivity()
						.getApplicationContext(), IutWindowsActivity.class);
				startActivity(intent);
			}
		});
		// Affichage msg quand long click
		imgBtIutWindow.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Vitrine IUT",
						Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgBtGrades.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgBtGrades.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Notes",
						Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgBtCalendar.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgBtCalendar.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Emploi du temps",
						Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgBtMap.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgBtMap.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Plan des sites",
						Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgBtSuaps.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgBtSuaps.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Suaps",
						Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgBtPostBac.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(getActivity()
						.getApplicationContext(), PostBacActivity.class);
				startActivity(intent);
			}
		});
		// Affichage msg quand long click
		imgBtPostBac.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context,
						"Informations Post-Bac", Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgBtDirectory.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgBtDirectory.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Annuaire",
						Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		imgBtCompanyPartnership.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub

			}
		});
		// Affichage msg quand long click
		imgBtCompanyPartnership
				.setOnLongClickListener(new OnLongClickListener() {

					@Override
					public boolean onLongClick(View v) {
						// TODO Auto-generated method stub
						Toast mymessage = Toast.makeText(context, "Job Dating",
								Toast.LENGTH_SHORT);
						mymessage.setGravity(Gravity.CENTER, 0, 0);
						mymessage.show();
						return false;
					}
				});

		imgBtTwitter.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent i = new Intent(getActivity().getApplicationContext(),
						TwitterActivity.class);
				startActivity(i);
			}
		});
		// Affichage msg quand long click
		imgBtTwitter.setOnLongClickListener(new OnLongClickListener() {

			@Override
			public boolean onLongClick(View v) {
				// TODO Auto-generated method stub
				Toast mymessage = Toast.makeText(context, "Twitter",
						Toast.LENGTH_SHORT);
				mymessage.setGravity(Gravity.CENTER, 0, 0);
				mymessage.show();
				return false;
			}
		});

		return iconMenu;
	}

}
