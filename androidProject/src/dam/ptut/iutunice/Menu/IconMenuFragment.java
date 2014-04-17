package dam.ptut.iutunice.Menu;

import java.util.List;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import dam.ptut.iutunice.App;
import dam.ptut.iutunice.R;

public class IconMenuFragment extends Fragment implements OnItemClickListener {

	@Override
	public View onCreateView(final LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		
		View content = inflater.inflate(R.layout.icon_menu_fragment, container, false);
		final App app = (App) getActivity().getApplication();
		
		final List<IconMenuListItem> iconItemList = app.iconItemList;
		GridView gvMenu = (GridView) content.findViewById(R.id.gridview);
		
		//récupère la taille du layout de l'activité
		FrameLayout flContent = (FrameLayout) getActivity().findViewById(R.id.flContent);
		final int height = flContent.getHeight();
		
		gvMenu.setAdapter(new BaseAdapter() {
			
			@Override
			public View getView(int position, View convertView, ViewGroup parent) {
				// TODO Auto-generated method stub
								
				ImageView imageView = (ImageView) inflater.inflate(R.layout.item_grid_menu, parent, false);
			
		        IconMenuListItem iconMenuListItem = getItem(position);
		        imageView.setImageResource(iconMenuListItem.img);
		        //rend visible sur tout les appareils (sans scroll)
		        imageView.getLayoutParams().height = height/5;
		        return imageView;
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

//		gvMenu.setOnItemClickListener(new OnItemClickListener() {
//	        public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
//	            Toast.makeText(getActivity(), "" + position, Toast.LENGTH_SHORT).show();
//	        }
//	    });
		gvMenu.setOnItemClickListener(this);
		return content;
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
		// TODO Auto-generated method stub
		((MainActivity) getActivity()).itemClick(position);
	}
}
