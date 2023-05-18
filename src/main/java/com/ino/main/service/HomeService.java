package com.ino.main.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ino.main.dao.HomeDAO;
import com.ino.main.dto.HomeDTO;
import com.ino.member.dto.MemberDTO;





@Service
public class HomeService {
	
	@Autowired HomeDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<HomeDTO> normalTopList() {
		
		return dao.normalTopList();
	}


	public ArrayList<HomeDTO> hitGallery() {
		
		return dao.hitGallery();
	}

	public ArrayList<HomeDTO> attentionTopList() {
		
		return dao.attentionTopList();
	}

	
	//home연습
	
	public String afterList(String user_id) {
		
		return dao.afterList(user_id);
	}
	
	
public String userCategory(String user_id) {
		
		return dao.userCategory(user_id);
	}

	public String interest_biz_id(String user_id) {
		
		return dao.interest_biz_id(user_id);
	}

	public ArrayList<HomeDTO> memberAttentionTopList(String interest_biz_id) {
		
		return dao.memberAttentionTopList(interest_biz_id);
	}

	public String sigungu(String user_id) {
		
		return dao.sigungu(user_id);
	}

	public ArrayList<HomeDTO> sigunguTopList(String sigungu) {
		
		return dao.sigunguTopList(sigungu);
	}


	


	
}
