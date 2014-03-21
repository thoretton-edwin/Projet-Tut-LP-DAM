package dam.ptut.iutunice.Menu;

import java.util.List;

import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;
import dam.ptut.iutunice.R.drawable;
import dam.ptut.iutunice.R.id;
import dam.ptut.iutunice.R.layout;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class IconMenuListFragment extends Fragment implements
		OnItemClickListener {

	@Override
	public View onCreateView(final LayoutInflater inflater,
			ViewGroup container, Bundle savedInstanceState) {
		// TODO Auto-generated method stub
//		setHasOptionsMenu(true);

		View content = inflater.inflate(R.layout.icon_menu_list_fragment,
				container, false);

		App app = (App) getActivity().getApplication();

		final List<IconMenuListItem> iconItemList = app.iconItemList;

		ListView lvMenu = (ListView) content.findViewById(R.id.lvMenu);
		lvMenu.setAdapter(new BaseAdapter() {

			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
				View itemView = inflater.inflate(R.layout.item_list_menu,
						parent, false);
				TextView tvMenuItem = (TextView) itemView
						.findViewById(R.id.tvMenuItem);
				ImageView imgMenuItem = (ImageView) itemView
						.findViewById(R.id.imgMenuItem);
				ImageView imgArrow = (ImageView) itemView
						.findViewById(R.id.imgArrow);

				IconMenuListItem iconMenuListItem = getItem(position);
				tvMenuItem.setText(iconMenuListItem.title);
				imgMenuItem.setImageResource(iconMenuListItem.img);
				imgArrow.setImageResource(R.drawable.arrow);
				return itemView;
			}

			@Override
			public long getItemId(int position) {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public IconMenuListItem getItem(int position) {
				// TODO Auto-generated method stub
				return iconItemList.get(position);
			}

			@Override
			public int getCount() {
				// TODO Auto-generated method stub
				return iconItemList.size();
			}
		});

		lvMenu.setOnItemClickListener(this);

		return content;
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		// TODO Auto-generated method stub
		((MainActivity) getActivity()).itemClick(position);

	}

	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		// TODO Auto-generated method stub
//		Log.v("test", ""+inflater);
//		inflater.inflate(R.menu.icon_menu_list_fragment, menu);
		super.onCreateOptionsMenu(menu, inflater);
	}
}
