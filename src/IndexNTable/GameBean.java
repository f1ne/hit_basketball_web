package IndexNTable;

public class GameBean {
      private int GameID;
      private int HomeTeamID;
      private int AwayTeamID;
      private String Time;
      private String Place;
      GameBean(int gameID,int homeTeamID,int awayTeamID,String time,String place){
    	  setGameID(gameID);
    	  setHomeTeamID(homeTeamID);
    	  setAwayTeamID(awayTeamID);
    	  setTime(time);
    	  setPlace(place);      
    	  }
      public void setGameID(int gameID){
    	  this.GameID=gameID;
      }
      public int getGameID(){
    	  return GameID;
      }
      public void setHomeTeamID(int homeTeamID){
    	  this.HomeTeamID=homeTeamID;
      }
      public int getHomeTeamID(){
    	  return HomeTeamID;
      }
      public void setAwayTeamID(int awayTeamID){
    	  this.AwayTeamID=awayTeamID;
      }
      public int getAwayTeamID(){
    	  return AwayTeamID;
      }
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public String getPlace() {
		return Place;
	}
	public void setPlace(String place) {
		Place = place;
	}
      
}