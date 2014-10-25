package Player;

public class Player {
	private String num;
	private String name;
	private String team;
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	private String sex;
	private String position;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Player()
	{
		num=null;
		name=null;
		team=null;
		sex=null;
		position=null;
	}
	public Player(String i,String t,String a,String d, String e)
	{
		num=i;
		name=t;
		team=a;
		sex=d;
		position=e;
	}

}
