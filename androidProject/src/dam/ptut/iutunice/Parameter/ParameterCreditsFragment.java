package dam.ptut.iutunice.Parameter;

import dam.ptut.iutunice.R;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class ParameterCreditsFragment extends Fragment {

	@Override
	public View onCreateView(final LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {

		View content = inflater.inflate(R.layout.fragment_credits, container,
				false);	
		return content;
	}

}
