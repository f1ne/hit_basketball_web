package Manager;

public class Manager {
	private String id;
	private String name;
	private String passcode;
    private String privilgeLevel;
    public Manager()
	{
		id=null;
		name=null;
		passcode=null;
		privilgeLevel=null;
	}
	public Manager(String i,String t,String a,String d)
	{
		id=i;
		name=t;
		passcode=a;
		privilgeLevel=d;
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
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public String getPrivilgeLevel() {
		return privilgeLevel;
	}
	public void setPrivilgeLevel(String privilgeLevel) {
		this.privilgeLevel = privilgeLevel;
	}
}
