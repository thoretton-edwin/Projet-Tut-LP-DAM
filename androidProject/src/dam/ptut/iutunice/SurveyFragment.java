package dam.ptut.iutunice;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class SurveyFragment extends Fragment {

	@Override
	public View onCreateView(final LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState){
		View content = inflater.inflate(R.layout.fragment_survey, container,
				false);
		return content;
		
	}
}
