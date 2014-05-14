package dam.ptut.iutunice.Suaps;

public class SuapsChildUEL {
	String Name;
	String Day;
	String StartTime;
	String EndTime;
	String Site;

	public SuapsChildUEL(String name, String day, String startTime,
			String endTime, String site) {

		this.Name = name;
		this.Day = day;
		this.StartTime = startTime;
		this.EndTime = endTime;
		this.Site = site;
	}

	public String toString() {
		return Name + " " + Day + "\n";

	}

	public String getName() {
		return Name;
	}

	public String getDay() {
		return Day;
	}

	public String getStartTime() {
		return StartTime;
	}

	public String getEndTime() {
		return EndTime;
	}

	public String getSite() {
		return Site;
	}
}
