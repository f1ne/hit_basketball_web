package com.hit.cs.basketball;

import java.sql.Timestamp;

public class RecordBean { 
	private int PlayerID;
	private String Event;
	private Timestamp Time;
	RecordBean(int playerID,String event,Timestamp time){
		setPlayerID(playerID);
		setEvent(event);
		setTime(time);
	}
	public int getPlayerID(){
		return PlayerID;
	}
	public void setPlayerID(int playerID){
		this.PlayerID=playerID;
	}
	public String getEvent(){
		return Event;
	}
	public void setEvent(String event){
		this.Event=event;
	}
	public Timestamp getTime(){
		return Time;
	}
	public void setTime(Timestamp time){
		this.Time=time;
	}
}
