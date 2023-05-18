package com.ino.gallery.dto;

import java.sql.Date;

public class GalleryDTO {
	
	private int gallery_no;
	private String user_id;
	private String store_name;
	private String gallery_subject;
	private String gallery_content;
	private Date gallery_date;
	private int gallery_hit;
	private int gallery_jjim;
	
	private String new_photo_name;
	private String nickname;



	public int getGallery_no() {
		return gallery_no;
	}

	public void setGallery_no(int gallery_no) {
		this.gallery_no = gallery_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getGallery_subject() {
		return gallery_subject;
	}

	public void setGallery_subject(String gallery_subject) {
		this.gallery_subject = gallery_subject;
	}

	public String getGallery_content() {
		return gallery_content;
	}

	public void setGallery_content(String gallery_content) {
		this.gallery_content = gallery_content;
	}

	public Date getGallery_date() {
		return gallery_date;
	}

	public void setGallery_date(Date gallery_date) {
		this.gallery_date = gallery_date;
	}

	public int getGallery_hit() {
		return gallery_hit;
	}

	public void setGallery_hit(int gallery_hit) {
		this.gallery_hit = gallery_hit;
	}

	public int getGallery_jjim() {
		return gallery_jjim;
	}

	public void setGallery_jjim(int gallery_jjim) {
		this.gallery_jjim = gallery_jjim;
	}

	public String getNew_photo_name() {
		return new_photo_name;
	}

	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
