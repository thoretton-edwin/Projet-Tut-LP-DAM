package dam.ptut.iutunice.PostBac;

import java.io.IOException;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import android.app.ActionBar;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.res.XmlResourceParser;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.util.Xml;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import dam.ptut.iutunice.R;

public class PostBacActivity extends Activity implements
		DialogInterface.OnCancelListener {
	private ArrayList<PostBac> postBac;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_post_bac);

		this.setTitle("Informations Post-Bac");

		// permet le retour sur la page principale
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);

		final ProgressDialog progressDialog = ProgressDialog.show(this, null,
				"Connexion en cours...", true, true, this);

		XmlResourceParser xpp = getResources().getXml(R.xml.infos_post_bac);
		try {
			int eventType = xpp.getEventType();
			parseResponse(eventType);
			setupList();
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		progressDialog.dismiss();
	}

	private void parseResponse(int eventType) throws XmlPullParserException,
			IOException {
		XmlPullParser parser = Xml.newPullParser();
		parser.require(XmlPullParser.START_DOCUMENT, null, null);
		parser.nextTag();
		parser.require(XmlPullParser.START_TAG, null, "formations");
		postBac = new ArrayList<PostBac>();
		while (eventType != XmlPullParser.END_DOCUMENT) {
			PostBac pb = new PostBac(parser);
			postBac.add(pb);
		}
		parser.require(XmlPullParser.END_TAG, null, "formations");
		parser.next();
		parser.require(XmlPullParser.END_DOCUMENT, null, null);
	}

	private void setupList() {
		ExpandableListView expandableListView = (ExpandableListView) findViewById(R.id.elvPostBac);
		final LayoutInflater inflater = getLayoutInflater();
		expandableListView.setAdapter(new ExpandableListAdapter() {

			@Override
			public void unregisterDataSetObserver(DataSetObserver observer) {
				// TODO Auto-generated method stub

			}

			@Override
			public void registerDataSetObserver(DataSetObserver observer) {
				// TODO Auto-generated method stub

			}

			@Override
			public void onGroupExpanded(int groupPosition) {
				// TODO Auto-generated method stub

			}

			@Override
			public void onGroupCollapsed(int groupPosition) {
				// TODO Auto-generated method stub

			}

			@Override
			public boolean isEmpty() {
				// TODO Auto-generated method stub
				return false;
			}

			@Override
			public boolean isChildSelectable(int groupPosition,
					int childPosition) {
				// TODO Auto-generated method stub
				return false;
			}

			@Override
			public boolean hasStableIds() {
				// TODO Auto-generated method stub
				return false;
			}

			@Override
			public View getGroupView(int groupPosition, boolean isExpanded,
					View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public long getGroupId(int groupPosition) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public int getGroupCount() {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public Object getGroup(int groupPosition) {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public long getCombinedGroupId(long groupId) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public long getCombinedChildId(long groupId, long childId) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public int getChildrenCount(int groupPosition) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public View getChildView(int groupPosition, int childPosition,
					boolean isLastChild, View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public long getChildId(int groupPosition, int childPosition) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public Object getChild(int groupPosition, int childPosition) {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public boolean areAllItemsEnabled() {
				// TODO Auto-generated method stub
				return false;
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.post_bac, menu);
		return true;
	}

	@Override
	public void onCancel(DialogInterface dialog) {
		// TODO Auto-generated method stub

	}

}
