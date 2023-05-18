package com.ino.delivery.dto;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class RiderDTO {

	private String user_id;
	private String nickname;
	private int post_num;
	private String sido;
	private String sigungu;
	private String left_addr;
	private String interest_biz_id;
	private int sales_no;
	private String from_addr;
	private String to_addr;
	private Timestamp offer_date;
	private boolean accept;
	private String user_state;
	private Date state_time;
	private int delivery_offer_no; 
	private String goods_id;
	private String biz_id;
	private String goods_name;
	private String biz_name;
	private String content;
	private String delivery_state;
	private Timestamp delivery_time;
	private int delivery_accept_no;
	private Timestamp store_time;
	private int photo_no;
	private String ori_photo_name;
	private String new_photo_name;
	private String photo_div;
	private String cate_no;
	private String subject;
	private String rider_id;
	private int star_score;
	private int star_no;
	private String star_to_id;
	private int totalCountDS;
	private String user_div;
	
	public String getUser_div() {
		return user_div;
	}
	public void setUser_div(String user_div) {
		this.user_div = user_div;
	}
	public int getTotalCountDS() {
		return totalCountDS;
	}
	public void setTotalCountDS(int totalCountDS) {
		this.totalCountDS = totalCountDS;
	}
	private int msg_div_no;
	
	
	public int getMsg_div_no() {
		return msg_div_no;
	}
	public void setMsg_div_no(int msg_div_no) {
		this.msg_div_no = msg_div_no;
	}
	public int getStar_no() {
		return star_no;
	}
	public void setStar_no(int star_no) {
		this.star_no = star_no;
	}
	public String getStar_to_id() {
		return star_to_id;
	}
	public void setStar_to_id(String star_to_id) {
		this.star_to_id = star_to_id;
	}
	public int getStar_score() {
		return star_score;
	}
	public void setStar_score(int star_score) {
		this.star_score = star_score;
	}
	public String getRider_id() {
		return rider_id;
	}
	public void setRider_id(String rider_id) {
		this.rider_id = rider_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getOri_photo_name() {
		return ori_photo_name;
	}
	public void setOri_photo_name(String ori_photo_name) {
		this.ori_photo_name = ori_photo_name;
	}
	public String getNew_photo_name() {
		return new_photo_name;
	}
	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	public String getPhoto_div() {
		return photo_div;
	}
	public void setPhoto_div(String photo_div) {
		this.photo_div = photo_div;
	}
	public String getCate_no() {
		return cate_no;
	}
	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}
	public Timestamp getStore_time() {
		return store_time;
	}
	public void setStore_time(Timestamp store_time) {
		this.store_time = store_time;
	}
	public String getDelivery_state() {
		return delivery_state;
	}
	public void setDelivery_state(String delivery_state) {
		this.delivery_state = delivery_state;
	}
	public Timestamp getDelivery_time() {
		return delivery_time;
	}
	public void setDelivery_time(Timestamp delivery_time) {
		this.delivery_time = delivery_time;
	}
	public int getDelivery_accept_no() {
		return delivery_accept_no;
	}
	public void setDelivery_accept_no(int delivery_accept_no) {
		this.delivery_accept_no = delivery_accept_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getBiz_name() {
		return biz_name;
	}
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	public int getDelivery_offer_no() {
		return delivery_offer_no;
	}
	public void setDelivery_offer_no(int delivery_offer_no) {
		this.delivery_offer_no = delivery_offer_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getLeft_addr() {
		return left_addr;
	}
	public void setLeft_addr(String left_addr) {
		this.left_addr = left_addr;
	}
	public String getInterest_biz_id() {
		return interest_biz_id;
	}
	public void setInterest_biz_id(String interest_biz_id) {
		this.interest_biz_id = interest_biz_id;
	}
	public int getSales_no() {
		return sales_no;
	}
	public void setSales_no(int sales_no) {
		this.sales_no = sales_no;
	}
	public String getFrom_addr() {
		return from_addr;
	}
	public void setFrom_addr(String from_addr) {
		this.from_addr = from_addr;
	}
	public String getTo_addr() {
		return to_addr;
	}
	public void setTo_addr(String to_addr) {
		this.to_addr = to_addr;
	}
	public Timestamp getOffer_date() {
		return offer_date;
	}
	public void setOffer_date(Timestamp offer_date) {
		this.offer_date = offer_date;
	}
	public boolean isAccept() {
		return accept;
	}
	public void setAccept(boolean accept) {
		this.accept = accept;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public Date getState_time() {
		return state_time;
	}
	public void setState_time(Date state_time) {
		this.state_time = state_time;
	}
	public int getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}
	
	
	
}
