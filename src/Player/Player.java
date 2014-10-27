package Player;
public class Player {
	private int PlayerID;
	private int TeamID;
	private String Team;
	private String Name;
	private String Sex;
	private String Position;
	private String StudentID;
	private int Score;
	private int NumberOfMatches;
	private int Fouls;
	private int Number;
	Player(){
		this.PlayerID=-1;
		this.TeamID=-1;
		this.Name="null";
		this.Team="null";
		this.Position="null";
		this.Sex="null";
		this.StudentID="null";
		this.Score=-1;
		this.NumberOfMatches=-1;
		this.Fouls=-1;
		this.Number=-1;
	}
	Player(int playerID,int teamID,String name,String studentID,int score,
		int numberOfMatches,int fouls,int number,String position,String team,String sex){
		this.PlayerID=playerID;
		this.TeamID=teamID;
		this.Name=name;
		this.Team=team;
		this.Position=position;
		this.Sex=sex;
		this.StudentID=studentID;
		this.Score=score;
		this.NumberOfMatches=numberOfMatches;
		this.Fouls=fouls;
		this.Number=number;
	}
	
	public String getTeam() {
		return Team;
	}
	public void setTeam(String team) {
		this.Team = team;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		this.Sex = sex;
	}
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		this.Position = position;
	}
	public void setTeamID(int teamID) {
		TeamID = teamID;
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
	public void setTeadID(int teamID){
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
}
