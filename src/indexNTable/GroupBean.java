package indexNTable;

public class GroupBean {
	String TeamID;
	String TeamName;
	String TeamLab;
	String GroupID;
	int Win;
	int Lose;
	GroupBean(String TeamID,String TeamName,String Lab,String GroupID,int Win,int Lose){
		this.TeamID=TeamID;
		this.TeamName=TeamName;
		this.TeamLab=Lab;
		this.GroupID=GroupID;
		this.Win=Win;
		this.Lose=Lose;
	}
	GroupBean(){
		this.TeamID=null;
		this.TeamName=null;
		this.TeamLab=null;
		this.GroupID=null;
		this.Win=0;
		this.Lose=0;
	}
	
	public String getTeamLab() {
		return TeamLab;
	}
	public void setTeamLab(String lab) {
		TeamLab = lab;
	}
	public String getTeamName() {
		return TeamName;
	}
	public void setTeamName(String teamName) {
		TeamName = teamName;
	}
	public String getTeamID() {
		return TeamID;
	}
	public void setTeamID(String teamID) {
		TeamID = teamID;
	}
	public String getGroupID() {
		return GroupID;
	}
	public void setGroupID(String groupID) {
		GroupID = groupID;
	}
	public int getWin() {
		return Win;
	}
	public void setWin(int win) {
		Win = win;
	}
	public int getLose() {
		return Lose;
	}
	public void setLose(int lose) {
		Lose = lose;
	}

}
