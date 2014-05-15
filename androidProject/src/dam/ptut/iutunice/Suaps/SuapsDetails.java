package dam.ptut.iutunice.Suaps;

import java.util.ArrayList;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
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
import android.widget.ListView;
import android.widget.TextView;
import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;

public class SuapsDetails extends Activity {
	App app;
	int groupPosition, childPosition;
	ArrayList<SuapsGroup> SuapsArray;
	ArrayList<SuapsChild> SuapsChildArray;

	SuapsGroup group;
	SuapsChild child;

	ListView lvSuaps;

	LayoutInflater inflater;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_suaps_details);
		// Show the Up button in the action bar.
		setupActionBar();
		inflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);

		app = (App) getApplication();
		childPosition = app.suapsChildPos;
		groupPosition = app.suapsGroupPos;
		SuapsArray = app.suapsGroupList;
		group = SuapsArray.get(groupPosition);
		// SuapsChildArray = group.getSuapsArray();
		child = group.getSuapsArray().get(childPosition);

		lvSuaps = (ListView) this.findViewById(R.id.lvSuaps);

		// Log.v("test", "SuapsArray = "
		// + SuapsArray.get(groupPosition).toString());
		// Log.v("test", "childPos = " + childPosition);
		// Log.v("test", "groupPos = " + groupPosition);
		// Log.v("test", "SuapsArray = " + SuapsArray.size());

		switch (groupPosition) {
		case 0:
			setTitle(child.getName());
			createViewActivity(child.getDaysArray());
			break;
		case 1:
			setTitle(child.getName());
			createViewInformations(child.getAddressArray());

			break;
		case 2:
			setTitle("Détails Site");
			createViewPlace(child.getSiteArray());
			break;
		case 3:
			// setTitle(child.getName());
			// createViewUEL(child.getUelArray());
			break;

		default:
			break;
		}
	}

	private void createViewActivity(
			final ArrayList<SuapsChildActivities> daysArray) {
		// TODO Auto-generated method stub
		// String title = group.getTitle();
		// String infos = child.getInfos();

		lvSuaps.setAdapter(new BaseAdapter() {

			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
				View itemView = inflater.inflate(
						R.layout.item_list_suaps_details, parent, false);
				TextView tvName = (TextView) itemView.findViewById(R.id.tvName);
				tvName.setText(getItem(position).getDay());
				return itemView;
			}

			@Override
			public long getItemId(int position) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public SuapsChildActivities getItem(int position) {
				// TODO Auto-generated method stub
				return daysArray.get(position);
			}

			@Override
			public int getCount() {
				// TODO Auto-generated method stub
				return daysArray.size();
			}
		});

		lvSuaps.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				// TODO Auto-generated method stub
				SuapsChildActivities childActivities = child.getDaysArray()
						.get(position);
				int i = 0;
				int j = 0;
				int a = 0;

				for (SuapsChildActivities suapsChildActivities : daysArray) {
					suapsChildActivities = daysArray.get(i);
					Log.v("test", "test = " + suapsChildActivities.Day);
					i++;
					AlertDialog.Builder builder = new AlertDialog.Builder(
							SuapsDetails.this);
					if (a == 0) {
						builder.setTitle("Informations :");
						builder.setMessage("Heure : "
								+ suapsChildActivities.getSessionArray().get(j)
										.getTime()
								+ "\n Lieux : "
								+ suapsChildActivities.getSessionArray().get(j)
										.getPlace()
								+ "\n Autre : "
								+ suapsChildActivities.getSessionArray().get(j)
										.getOther()
								+ "\n Responsable : "
								+ suapsChildActivities.getSessionArray().get(j)
										.getAccountable());
						builder.setCancelable(true);
						builder.setPositiveButton("OK", null);
						builder.show();
						a++;
					}
				}
			}
		});
	}

	private void createViewInformations(
			ArrayList<SuapsChildInformation> addressArray) {
		// TODO Auto-generated method stub
		// String title = group.getTitle();
		lvSuaps.setAdapter(new BaseAdapter() {

			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
				View itemView = inflater.inflate(R.layout.item_list_suaps_info,
						parent, false);
				TextView tvInfoName = (TextView) itemView
						.findViewById(R.id.tvInfoName);
				TextView tvInfoEmail = (TextView) itemView
						.findViewById(R.id.tvInfoEmail);

				tvInfoName.setText(getItem(position).getName());
				tvInfoEmail.setText(getItem(position).getEmail());

				return itemView;
			}

			@Override
			public long getItemId(int position) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public SuapsChildInformation getItem(int position) {
				// TODO Auto-generated method stub
				return child.getAddressArray().get(position);
			}

			@Override
			public int getCount() {
				// TODO Auto-generated method stub
				return child.getAddressArray().size();
			}
		});

		lvSuaps.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				SuapsChildInformation childInfo = child.getAddressArray().get(
						position);
				// TODO Auto-generated method stub
				Intent intent = new Intent(Intent.ACTION_SEND);
				String[] recipients = { childInfo.getEmail() };
				intent.putExtra(Intent.EXTRA_EMAIL, recipients);
				intent.setType("text/html");
				startActivity(Intent.createChooser(intent, "Send mail"));
			}
		});
	}

	private void createViewPlace(ArrayList<SuapsChildPlace> siteArray) {
		// TODO Auto-generated method stub

		// String title = group.getTitle();
		lvSuaps.setAdapter(new BaseAdapter() {

			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
				View itemView = (View) inflater.inflate(
						R.layout.item_list_suaps_site, parent, false);
				TextView tvSiteName = (TextView) itemView
						.findViewById(R.id.tvSiteName);
				TextView tvSiteAddress = (TextView) itemView
						.findViewById(R.id.tvSiteAddress);
				TextView tvSiteTel = (TextView) itemView
						.findViewById(R.id.tvSiteTel);
				TextView tvSiteFax = (TextView) itemView
						.findViewById(R.id.tvSiteFax);

				tvSiteName.setText(child.getName());
				tvSiteAddress.setText(getItem(position).getPostal());
				tvSiteTel.setText("Tel : " + getItem(position).getTel());
				tvSiteFax.setText("Fax : " + getItem(position).getFax());

				return itemView;
			}

			@Override
			public long getItemId(int position) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public SuapsChild getItem(int position) {
				// TODO Auto-generated method stub
				return group.getSuapsArray().get(position);
			}

			@Override
			public int getCount() {
				// TODO Auto-generated method stub
				return 1;
			}
		});

		lvSuaps.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				// TODO Auto-generated method stub

				AlertDialog.Builder builder = new AlertDialog.Builder(
						SuapsDetails.this);
				builder.setTitle("Appel");
				builder.setIcon(android.R.drawable.btn_star);
				builder.setMessage("Voulez-vous appeler le " + child.getName());
				builder.setPositiveButton(android.R.string.ok,
						new DialogInterface.OnClickListener() {
							public void onClick(DialogInterface dialog,
									int which) {
								Intent intent = new Intent(Intent.ACTION_DIAL);
								intent.setData(Uri.parse("tel:"
										+ child.getTel()));
								startActivity(intent);
								return;
							}
						});
				builder.setNegativeButton("CANCEL", null);
				builder.show();
			}
		});
	}

	/**
	 * Set up the {@link android.app.ActionBar}.
	 */
	private void setupActionBar() {

		getActionBar().setDisplayHomeAsUpEnabled(true);

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.suaps_details, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case android.R.id.home:
			// This ID represents the Home or Up button. In the case of this
			// activity, the Up button is shown. Use NavUtils to allow users
			// to navigate up one level in the application structure. For
			// more details, see the Navigation pattern on Android Design:
			//
			// http://developer.android.com/design/patterns/navigation.html#up-vs-back
			//
			NavUtils.navigateUpFromSameTask(this);
			overridePendingTransition(R.anim.in_details, R.anim.out_list);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

}
