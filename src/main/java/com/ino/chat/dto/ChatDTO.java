package com.ino.chat.dto;

// chatroom의 정보를 담는 DTO

public class ChatDTO {
	private int roomid;
	private String roomname;
	private String recent_msg;
	private int recent_no;
	private String recent_time;
	private String from_time;
	private String msg_div;
	private String msg_div_no;
	
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getRecent_msg() {
		return recent_msg;
	}
	public void setRecent_msg(String recent_msg) {
		this.recent_msg = recent_msg;
	}
	public int getRecent_no() {
		return recent_no;
	}
	public void setRecent_no(int recent_no) {
		this.recent_no = recent_no;
	}
	public String getFrom_time() {
		return from_time;
	}
	public void setFrom_time(String from_time) {
		this.from_time = from_time;
	}
	public String getRecent_time() {
		return recent_time;
	}
	public void setRecent_time(String recent_time) {
		this.recent_time = recent_time;
	}
	public String getMsg_div() {
		return msg_div;
	}
	public void setMsg_div(String msg_div) {
		this.msg_div = msg_div;
	}
	public String getMsg_div_no() {
		return msg_div_no;
	}
	public void setMsg_div_no(String msg_div_no) {
		this.msg_div_no = msg_div_no;
	}
	
	

}
