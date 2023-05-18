package com.ino.chat.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImgChatDTO {
	private String id;
	private String roomid;
	private MultipartFile[] uploadFile;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoomid() {
		return roomid;
	}
	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}
	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}
}


