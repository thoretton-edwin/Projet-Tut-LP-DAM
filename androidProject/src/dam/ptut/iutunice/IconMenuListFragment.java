package dam.ptut.iutunice;

import java.util.List;

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

public class IconMenuListFragment extends Fragment implements OnItemClickListener{

	@Override
	public View onCreateView(final LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		
		View content = inflater.inflate(R.layout.icon_menu_list_fragment, container, false);
		
		App app = (App) getActivity().getApplication();
		
		final List<IconMenuListItem> iconItemList = app.iconItemList;
		
		ListView lvMenu = (ListView) content.findViewById(R.id.lvMenu);
		lvMenu.setAdapter(new BaseAdapter() {
			
			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
				View itemView = inflater.inflate(R.layout.item_list_menu, parent, false);
				TextView tvMenuItem = (TextView) itemView.findViewById(R.id.tvMenuItem);
				ImageView imgMenuItem = (ImageView) itemView.findViewById(R.id.imgMenuItem);
				ImageView imgArrow = (ImageView) itemView.findViewById(R.id.imgArrow);
				
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
	public void onItemClick(AdapterView<?> parent, View view, int positon, long id) {
		// TODO Auto-generated method stub
		
	}
}
