package com.ino.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.main.dto.HomeDTO;
import com.ino.member.dto.MemberDTO;




public interface MemberDAO {

	int overlay(String user_id);
	
	int overlay2(String nickname);
	
	ArrayList<MemberDTO> normalTopList();
	
	int join(HashMap<String, String> params);

	int login(String id, String pw);

	ArrayList<MemberDTO> list();

	int delete(String id);

	HashMap<String, Object> detail(String user_id);

	
	
	
	int userRegist(HashMap<String, String> params);
	
	

	void fileWrite(String oriFileName, String newFileName, String user_id, String cate_no);

	int bizregist(String user_id, int biz_num, String biz, String store_name, String state);
	
	int riderbizregist(String user_id, int biz_num, String biz, String store_name,  String news, String nickname);

	
	
	void bizfileWrite(String oriFileName, String newFileName, String user_id, String cate_no);

	String afterList(String user_id);

	int riderRegist(HashMap<String, String> params);



	String userCategory(String user_id);

	int userChange(String user_id, String user_div2);

	String interest_biz_id(String user_id);

	ArrayList<MemberDTO> memberAttentionTopList(String interest_biz_id);

	String sigungu(String user_id);

	
	
	ArrayList<MemberDTO> sigunguTopList(String sigungu);

	ArrayList<MemberDTO> hitGallery();

	

	
	ArrayList<MemberDTO> attentionTopList();

	int updateSigungu( String user_id , String sigungu);
	

	

	

	

	

	


	

	

}
