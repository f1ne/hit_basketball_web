package com.hit.cs.basketball;

public class PlayerBean {
	private int PlayerID;
	private int TeamID;
	private String Name;
	private String StudentID;
	private int Score;
	private int NumberOfMatches;
	private int Fouls;
	private int Number;
	private String Sex;
	private int Age;
	private String IsSHB;
	private String Position;
	/*state有这几种
	 * bench 未上场
	 * oncourt 在场上
	 * fouledout 罚出
	 */
	private String State;
	public PlayerBean(){
		this.PlayerID=-1;
		this.TeamID=-1;
		this.Name="null";
		this.StudentID="null";
		this.Score=-1;
		this.NumberOfMatches=-1;
		this.Fouls=-1;
		this.Number=-1;
	}
	PlayerBean(int playerID,int teamID,String name,String studentID,int score,
		int numberOfMatches,int fouls,int number,String state){
		this.PlayerID=playerID;
		this.TeamID=teamID;
		this.Name=name;
		this.StudentID=studentID;
		this.Score=score;
		this.NumberOfMatches=numberOfMatches;
		this.Fouls=fouls;
		this.Number=number;
		this.State=state;
	}
	PlayerBean(int playerID,int teamID,String name,String studentID,int score,
			int numberOfMatches,int fouls,int number){
			this.PlayerID=playerID;
			this.TeamID=teamID;
			this.Name=name;
			this.StudentID=studentID;
			this.Score=score;
			this.NumberOfMatches=numberOfMatches;
			this.Fouls=fouls;
			this.Number=number;
			this.State="bench";
		}
	PlayerBean(int playerID,int teamID,String name,String studentID,int score,
			int numberOfMatches,int fouls,int number,String sex,int age,String isSHB,String position){
			this.PlayerID=playerID;
			this.TeamID=teamID;
			this.Name=name;
			this.StudentID=studentID;
			this.Score=score;
			this.NumberOfMatches=numberOfMatches;
			this.Fouls=fouls;
			this.Number=number;
			this.State="bench";
			this.Sex=sex;
			this.Age=age;
			this.IsSHB=isSHB;
			this.Position=position;
			
		}
	public int getPlayerID(){
		return PlayerID;
	}
	public void setPlayerID(int playerID){
		this.PlayerID=playerID;
	}
	public int getTeamID(){
		return TeamID;
	}
	public void setTeamID(int teamID){
		this.TeamID=teamID;
	}
	public String getName(){
		return Name;
	}
	public void setName(String name){
		this.Name=name;
	}
	public String getStudentID(){
		return StudentID;
	}
	public void setStudentID(String studentID){
		this.StudentID=studentID;
	}
	public int getScore(){
		return Score;
	}
	public void setScore(int score){
		this.Score=score;
	}
	public int getNumberOfMatches(){
		return NumberOfMatches;
	}
	public void setNumberOfMatches(int numberOfMatches){
		this.NumberOfMatches=numberOfMatches;
	}
	public int getFouls(){
		return Fouls;
	}
	public void setFouls(int fouls){
		this.Fouls=fouls;
	}
	public int getNumber(){
		return Number;
	}
	public void setNumber(int number){
		this.Number=number;
	}
	public String getState(){
		return State;
	}
	public void setState(String state){
		this.State=state;
	}
	public String getSex(){
		return Sex;
	}
	public void setSex(String sex){
		this.Sex=sex;
	}
	public String getIsSHB(){
		return IsSHB;
	}
	public void setIsSHB(String isSHB){
		this.IsSHB=isSHB;
	}
	public int getAge(){
		return this.Age;
	}
	public void setAge(int age){
		this.Age=age;
	}
	public String getPosition(){
		return Position;
	}
	public void setPosition(String position){
		this.Position=position;
	}
}
