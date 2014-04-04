package dam.ptut.iutunice.IutWindows;

import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.anim;
import dam.ptut.iutunice.R.drawable;
import dam.ptut.iutunice.R.id;
import dam.ptut.iutunice.R.layout;
import dam.ptut.iutunice.R.menu;
import android.os.Bundle;
import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.support.v4.app.NavUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.ViewFlipper;

public class IutWindowsActivity extends Activity {

	private ViewFlipper myViewFlipper;
	int[] image = { R.drawable.iut_menton, R.drawable.iut_menton2,
			R.drawable.iut_nice, R.drawable.iut_nice2, R.drawable.iut_sophia };

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_iut_windows);

		this.setTitle("Vitrine IUT");
		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		// diapo image
		myViewFlipper = (ViewFlipper) findViewById(R.id.myflipper);
		for (int i = 0; i < image.length; i++) {
			ImageView imageView = new ImageView(IutWindowsActivity.this);
			imageView.setImageResource(image[i]);
			myViewFlipper.addView(imageView);
		}
		// animation
		myViewFlipper.setInAnimation(AnimationUtils.loadAnimation(
				getApplicationContext(), R.anim.in_from_top));
		myViewFlipper.setOutAnimation(AnimationUtils.loadAnimation(
				getApplicationContext(), R.anim.out_to_bottom));

		// diapo automatique
		myViewFlipper.setAutoStart(true);
		myViewFlipper.setFlipInterval(3500);
		myViewFlipper.startFlipping();

		// boutons
		TextView btSurvey = (TextView) findViewById(R.id.btSurveyIut);
		TextView btFormations = (TextView) findViewById(R.id.btFormation);
		btSurvey.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				// nouvelle activité
				Intent intent = new Intent(IutWindowsActivity.this,
						SurveyIutActivity.class);
				startActivity(intent);

			}
		});
		btFormations.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				// nouvelle activité
				Intent intent = new Intent(IutWindowsActivity.this,
						SearchFormationActivity.class);
				startActivity(intent);
			}
		});
	}

	// swipe diapo image
	/*
	 * @Override public boolean onTouchEvent(MotionEvent event) { switch
	 * (event.getAction()) { case MotionEvent.ACTION_DOWN: initialXPoint =
	 * event.getX(); break; case MotionEvent.ACTION_UP: float finalx =
	 * event.getX(); if (initialXPoint > finalx) { if
	 * (myViewFlipper.getDisplayedChild() == image.length) break;
	 * myViewFlipper.showNext(); } else { if (myViewFlipper.getDisplayedChild()
	 * == 0) break; myViewFlipper.showPrevious(); } break; } return false; }
	 */
	@Override
	public void onBackPressed() {
		super.onBackPressed();
		// animation de "retour"
		overridePendingTransition(R.anim.in_details, R.anim.out_list);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.iut_windows, menu);
		return true;
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

}
