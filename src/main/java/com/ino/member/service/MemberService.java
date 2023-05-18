package com.ino.member.service;

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

import com.ino.main.dto.HomeDTO;
import com.ino.member.dao.MemberDAO;
import com.ino.member.dto.MemberDTO;




@Service
public class MemberService {
	
	@Autowired MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> overlay(String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 같은 아이디가 있는가? 있으면 1 없으면 0
		map.put("overlay", dao.overlay(user_id));		
		return map;
	}
	
	public HashMap<String, Object> overlay2(String nickname) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 같은 닉네임이 있는가? 있으면 1 없으면 0
		map.put("overlay2", dao.overlay2(nickname));		
		return map;
	}
	
	
	public ArrayList<MemberDTO> normalTopList() {
		
		return dao.normalTopList();
	}
	
	/*
	//아작스 로그인 
	
	public HashMap<String, Object> ajaxUserRegist(MultipartFile file1, HashMap<String, String> params, 
			MultipartFile file2) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(params.get("user_id"));
		
		
		String user_id = dto.getUser_id();
		logger.info("if문 밖에는 있나???"+user_id);
		
		//
		//**이거 idx 값으로 해서 dto로 넣어야 할까?? 고민중..,,,
		String user_div = "a";
		params.put("user_div", user_div);
		//int userRegistrow = dao.userRegist(params);
		map.put("success",dao.userRegist(params));
		//logger.info("userRegistrow변경되면 이거 나옴!!: "+userRegistrow);
		

		
		if(!file1.getOriginalFilename().equals(""))  {
			logger.info("profile파일 업로드 작업");
			fileSave(user_id, file1);
		}
		//****  만약인증사용자 추가 정보가 들어오면 실행되는 구문
		if(!params.get("store_name").equals("")) {
			
			String user_div2 = "b";
			params.put("user_div2", user_div2);
			int userChangerow = dao.userChange(user_id,user_div2);
			logger.info("인증사용자로 변경되면 나오는 row : " +userChangerow);
			
			int biz_num = Integer.parseInt((params.get("biz_num")));
			String biz = params.get("biz");
			String store_name =  params.get("store_name");
			String state = "인증대기";
			logger.info(user_id+biz_num+biz+store_name+state);
			int bizregistrow = dao.bizregist(user_id,biz_num,biz,store_name,state);
			logger.info("이거 안들어가나??"+user_id);
			logger.info("bizregistrow변경되면 이거 나옴!!: "+bizregistrow);
		
			//dao.user_div(user_div2, user_id, user_div_name2);
			
			
		}
		
		
		
		
		if(!file2.getOriginalFilename().equals("")) {
			logger.info("bizprofile파일 업로드 작업");
			bizfileSave(user_id, file2);
		}
		 // map.put("success", dao.join(params)); 
		return map;
	}
	
	*/
	
	
	
	public int userRegist(MultipartFile profile, HashMap<String, String> params, 
			MultipartFile bizprofile) {
		
		
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(params.get("user_id"));
		
		
		String user_id = dto.getUser_id();
		logger.info("if문 밖에는 있나???"+user_id);
		
		//
		//**이거 idx 값으로 해서 dto로 넣어야 할까?? 고민중..,,,
		String user_div = "a";
		params.put("user_div", user_div);
		int userRegistrow = dao.userRegist(params);
		logger.info("userRegistrow변경되면 이거 나옴!!: "+userRegistrow);
		

		
		if(!profile.getOriginalFilename().equals("")) {
			logger.info("profile파일 업로드 작업");
			fileSave(user_id, profile);
		}
		//****  만약인증사용자 추가 정보가 들어오면 실행되는 구문
		if(!params.get("store_name").equals("")) {
			
			String user_div2 = "b";
			params.put("user_div2", user_div2);
			int userChangerow = dao.userChange(user_id,user_div2);
			logger.info("인증사용자로 변경되면 나오는 row : " +userChangerow);
			
			int biz_num = Integer.parseInt((params.get("biz_num")));
			String biz = params.get("biz");
			String store_name =  params.get("store_name");
			String state = "인증대기";
			logger.info(user_id+biz_num+biz+store_name+state);
			int bizregistrow = dao.bizregist(user_id,biz_num,biz,store_name,state);
			logger.info("이거 안들어가나??"+user_id);
			logger.info("bizregistrow변경되면 이거 나옴!!: "+bizregistrow);
		
			//dao.user_div(user_div2, user_id, user_div_name2);
			
			
		}
		
		
		
		
		if(!bizprofile.getOriginalFilename().equals("")) {
			logger.info("bizprofile파일 업로드 작업");
			bizfileSave(user_id, bizprofile);
		}
		return userRegistrow;
	}
	
	
	
	
	public int riderRegist(MultipartFile profile, HashMap<String, String> params, MultipartFile bizprofile) {
		
		
		//**이거 idx 값으로 해서 dto로 넣어야 할까?? 고민중..,,,
		String user_div = "c";
		params.put("user_div", user_div);
		int riderRegistrow = dao.riderRegist(params);
		logger.info("riderRegistrow변경되면 이거 나옴!!: "+riderRegistrow);
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(params.get("user_id"));
		dto.setNickname(params.get("nickname"));
		logger.info("라이더 파람!! nickname 출력!!  : "+ params.get("nickname"));
		
		
		
		
		String user_id = dto.getUser_id();
		String Nickname = dto.getNickname();
		logger.info("라이더 Nickname 출력!!  : "+ Nickname);
		logger.info("if문 밖에는 있나???"+user_id);
		//dao.user_div(user_div3, user_id, user_div_name3);
		
		
		
		
		if(!profile.getOriginalFilename().equals("")) {
			logger.info("profile파일 업로드 작업");
			fileSave(user_id, profile);
		}
		//****  만약인증사용자 추가 정보가 들어오면 실행되는 구문
		if(!params.get("intro").equals("")) {
			
			
			int biz_num = Integer.parseInt((params.get("biz_num")));
			
			String intro =  params.get("intro");
			String news =  params.get("news");
			String store_time = params.get("store_time");
			
			logger.info(user_id+biz_num+intro+news+Nickname);
			int riderbizregist = dao.riderbizregist(user_id,biz_num,intro,news,store_time,Nickname);
			
			logger.info("이거 안들어가나??"+user_id);
			logger.info("riderbizregistrow변경되면 이거 나옴!!: "+riderbizregist);
			
		}
		if(!bizprofile.getOriginalFilename().equals("")) {
			logger.info("riderbizprofile파일 업로드 작업");
			bizfileSave(user_id, bizprofile);
		}
		return riderRegistrow;
	}
	
	

	public HashMap<String, Object> join(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", dao.join(params));
		return map;
	}

	public int login(String id, String pw) {
		return dao.login(id,pw);
	}
	
	public String afterList(String user_id) {
		// TODO Auto-generated method stub
		return dao.afterList(user_id);
	}

	

	public HashMap<String, Object> delete(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = delList.size();
		//몇 개 인건지!!
		int successCnt = 0;
		for (String id : delList) {
			successCnt += dao.delete(id);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
	}

	public HashMap<String, Object> detail(String id) {		
		return dao.detail(id);
	}

	private void fileSave(String user_id, MultipartFile file) {
		String oriFileName = file.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		logger.info(oriFileName+" => " + newFileName);
		try {
			byte[] bytes= file.getBytes();
			Path path = Paths.get("C:/img/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"save OK");
			String cate_no = "p001";
			dao.fileWrite(oriFileName,newFileName,user_id,cate_no);
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		
	}
	private void bizfileSave(String user_id, MultipartFile bizprofile) {
		String oriFileName = bizprofile.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		logger.info(oriFileName+" => " + newFileName);
		try {
			byte[] bytes= bizprofile.getBytes();
			Path path = Paths.get("C:/img/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName +" : bizsave OK ");
			String cate_no = "p002";
			dao.bizfileWrite(oriFileName,newFileName,user_id,cate_no);
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		
	}

	public String userCategory(String user_id) {
		
		return dao.userCategory(user_id);
	}

	public String interest_biz_id(String user_id) {
		
		return dao.interest_biz_id(user_id);
	}

	public ArrayList<MemberDTO> memberAttentionTopList(String interest_biz_id) {
		
		return dao.memberAttentionTopList(interest_biz_id);
	}

	public String sigungu(String user_id) {
		
		return dao.sigungu(user_id);
	}

	public ArrayList<MemberDTO> sigunguTopList(String sigungu) {
		
		return dao.sigunguTopList(sigungu);
	}

	public ArrayList<MemberDTO> hitGallery() {
		
		return dao.hitGallery();
	}
	
	
	
	
public ArrayList<MemberDTO> attentionTopList() {
		
		return dao.attentionTopList();
	}

public int updateSigungu(String user_id, String sigungu ) {
	
	return dao.updateSigungu(user_id,sigungu);
}
	



	
	



	
	
}
