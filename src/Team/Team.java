package Team;

public class Team {
	public Team()
	{
		id=null;
		name=null;
		lab=null;
		passcode=null;
	}
	public Team(String i,String t,String a,String d)
	{
		id=i;
		name=t;
		lab=a;
		passcode=d;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLab() {
		return lab;
	}
	public void setLab(String lab) {
		this.lab = lab;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	private String id;
	private String name;
	private String lab;
	private String passcode;


}
