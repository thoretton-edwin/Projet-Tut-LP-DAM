package dam.ptut.iutunice;

public class User {

	private String id;
	private String name;
	private String firstName;
	private String formation;
	
	public User(String id, String name, String firstName, String formation){
		this.id = id;
		this.name = name;
		this.firstName = firstName;
		this.formation = formation;
	}
	
	public String getId(){
		return this.id;
	}
	public String getName(){
		return this.name;
	}
	public String getFirstName(){
		return this.firstName;
	}
	public String getFormation(){
		return this.formation;
	}
}
