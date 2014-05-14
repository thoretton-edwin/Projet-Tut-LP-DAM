package dam.ptut.iutunice.Suaps;

public class SuapsChildActivitiesSession {
	String Time;
	String Place;
	String Other;
	String Accountable;

	public SuapsChildActivitiesSession(String time, String place, String other,
			String accountable) {
		this.Time = time;
		this.Place = place;
		this.Other = other;
		this.Accountable = accountable;
	}

	public String getTime() {
		return Time;
	}

	public String getPlace() {
		return Place;
	}

	public String getOther() {
		return Other;
	}

	public String getAccountable() {
		return Accountable;
	}
}
