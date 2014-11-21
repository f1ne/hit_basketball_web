package indexNTable;

public class GroupBean {
	String TeamID;
	String GroupID;
	int Win;
	int Lose;
	GroupBean(String TeamID,String GroupID,int Win,int Lose){
		this.TeamID=TeamID;
		this.GroupID=GroupID;
		this.Win=Win;
		this.Lose=Lose;
	}
	GroupBean(){
		this.TeamID=null;
		this.GroupID=null;
		this.Win=0;
		this.Lose=0;
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
