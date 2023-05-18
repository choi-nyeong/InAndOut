package com.ino.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.main.dto.HomeDTO;
import com.ino.member.dto.MemberDTO;





public interface HomeDAO {

	ArrayList<HomeDTO> normalTopList();

	
	

	

	//연습
	

	String afterList(String user_id);
	
	
	String userCategory(String user_id);

	int userChange(String user_id, String user_div2);

	String interest_biz_id(String user_id);

	ArrayList<HomeDTO> memberAttentionTopList(String interest_biz_id);

	String sigungu(String user_id);

	ArrayList<HomeDTO> sigunguTopList(String sigungu);

	ArrayList<HomeDTO> hitGallery();

	ArrayList<HomeDTO> attentionTopList();

	

	

	


	

	

}
