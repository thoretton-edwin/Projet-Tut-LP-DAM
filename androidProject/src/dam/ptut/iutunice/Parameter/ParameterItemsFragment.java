package dam.ptut.iutunice.Parameter;

import java.util.List;

import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.drawable;
import dam.ptut.iutunice.R.id;
import dam.ptut.iutunice.R.layout;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class ParameterItemsFragment extends Fragment implements OnItemClickListener {
	
	@Override
	public View onCreateView(final LayoutInflater inflater,
			ViewGroup container, Bundle savedInstanceState) {
		View content = inflater.inflate(R.layout.fragment_item_parameter, container,
				false);

		App app = (App) getActivity().getApplication();
		/*
		 * Ce fragment est créé une fois que la liste est téléchargée et parsée.
		 * On sait donc qu'on peut y accéder ici
		 */
		final List<ParameterItem> parameterListe = app.parameterListe;

		ListView listView = (ListView) content.findViewById(R.id.listViewParameter);
		listView.setAdapter(new BaseAdapter() {
			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				View itemView = inflater.inflate(R.layout.item_list_parameter, parent,
						false);
				TextView txtParameter = (TextView) itemView.findViewById(R.id.txtParameterItem);
				ImageView imgArrow = (ImageView) itemView.findViewById(R.id.imgParameterArrow);
				ImageView imgParameter = (ImageView) itemView.findViewById(R.id.imgParameterItem);
				
				ParameterItem parameterItem = getItem(position);
				txtParameter.setText(parameterItem.title);
				imgParameter.setImageResource(parameterItem.image);
				imgArrow.setImageResource(R.drawable.arrow);
				return itemView;
			}

			@Override
			public long getItemId(int position) {
				return 0;
			}

			@Override
			public ParameterItem getItem(int position) {
				return parameterListe.get(position);
			}

			@Override
			public int getCount() {
				return parameterListe.size();
			}
		});

		listView.setOnItemClickListener(this);

		return content;
	}

	/*
	 * Un élément de la liste a été cliqué
	 */
	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		((ParameterActivity) getActivity()).clickItem(position);
	}

}


