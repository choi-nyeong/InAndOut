package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ino.admin.dao.AdminMemberListDAO;
import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.dto.AdminStarDTO;

@Service
public class AdminMemberListService {
	
	@Autowired AdminMemberListDAO dao;

	Logger logger  = LoggerFactory.getLogger(this.getClass());
	
	public HashMap<String, Object> list(HashMap<String, Object> params) {
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));
	    String userdiv = String.valueOf(params.get("userdiv"));
	    String userstate = String.valueOf(params.get("userstate"));
	    String userId = String.valueOf(params.get("userid"));
	    String search = String.valueOf(params.get("search"));
	    String categoryId = String.valueOf(params.get("categoryId"));


		
	    HashMap<String, Object> map = new HashMap<String, Object>();

	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    logger.info("params : " + params);
	    
	    int total = 0;	    
		
	    if(search.equals("default") || search.equals("")) {
	      if(userdiv.equals("default") && userstate.equals("default")) {
	      
	    	  
	    	  total = dao.totalCount();

	      	}else {	      
	    	   	   
	    	  total = dao.totalCountSearch(search);
	       }
	    }
	    
	    int range = total%10  == 0 ? total/10 : total/10+1;

	      page = page>range ? range:page;
	      
	      ArrayList<AdminMemberDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("user search:"+search);
	      
	      if(search.equals("default") ||search.equals("")) {
	        if(userdiv.equals("default") && userstate.equals("default")) {

	          list = dao.list(offset);
	       
	        }else if(!(userdiv.equals("default")) && userstate.equals("default")) {

	          list = dao.listUserdiv(params);
	        }
	         
	        else if(userdiv.equals("default") && !(userstate.equals("default"))){

	          list = dao.listUserstate(params);
	        
	        }else {

	          list = dao.listAll(params);
	         }
	     
	      }else {

	         list = dao.listSearch(params);
	      }
	      		
		
	      //logger.info("list size : "+ list.size());
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;
	   		
	
	}

	public AdminMemberDTO viewdetail(String user_id) {
	
		return dao.viewdetail(user_id);
	}



	public ArrayList<AdminMemberDTO> riderlist() {
		
		return dao.riderlist();
	}


	public AdminMemberDTO riderdetail(String user_id) {
		
		return dao.riderdetail(user_id);
	}






	public int uhistorywrite(HashMap<String, String> params) {
		
		return dao.uhistorywrite(params);
	}


	public AdminMemberDTO viewdetailextra(String user_id) {
		
		return dao.viewdetailextra(user_id);
	}

	public int history_userstate(HashMap<String, String> params, String user_id) {
		int result = dao.history_userstate(params);
		logger.info("유저인증 히스토리 작성"+params);
		dao.userchange(user_id);
		return result;		
		
	}

	public AdminMemberDTO riderdetailextra(String user_id) {
		
		
		return dao.riderdetailextra(user_id);
	}

	// 라이더 회원 가입대기 -> 정상으로 변경 
	public int history_riderstate(HashMap<String, String> params,String user_id) {
		int result = dao.history_riderstate(params);
		dao.riderchange(user_id);
		return result;
	}
	
	// 라이더 승인대기 승인처리
	public int history_riderstate2(HashMap<String, String> params, String user_id) {
		
		return dao.history_riderstate2(params);
	}


	public ArrayList<AdminMemberDTO> userhistory(String user_id) {
		
		return dao.userhistory(user_id);
	}



	public HashMap<String, Object> riderlist(HashMap<String, Object> params) {
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));
	    String userId = String.valueOf(params.get("user_id"));
	    String nickname = String.valueOf(params.get("nickname"));
	    String userdivName = String.valueOf(params.get("user_div_name"));
	    String userState = String.valueOf(params.get("user_state"));
	    String search = String.valueOf(params.get("search"));
	    String categoryId = String.valueOf(params.get("categoryId"));


	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    

	    int total = 0;	    	
	    
	    if(search.equals("default") || search.equals("")) {
		      if(userId.equals("default") && nickname.equals("default")) {
		      
		    	  
		    	  total = dao.rtotalCount();

		      	}else {	      
		    	   	   
		    	  total = dao.rtotalCountSearch(search);
		
		       }
	    } 
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    
	    
	      page = page>range ? range:page;
	      
	      ArrayList<AdminMemberDTO> riderlist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("rider params : " + params);		
		
	      logger.info("user search"+search);
	      
	      if(search.equals("default") ||search.equals("")) {
	    	  
	    	  logger.info("search"+search);
		       riderlist = dao.riderlist(offset);
		       logger.info("라이더 리스트"+riderlist);
		       
	      }else {

			   riderlist = dao.rlistSearch(params);
			      }
		
	      map.put("list", riderlist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;	
	}

	public HashMap<String, Object> authuserlist(HashMap<String, Object> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    		
		
	    total = dao.atotalCount();
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminMemberDTO> authuserlist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      authuserlist = dao.authuserlist(offset);
		
	      map.put("list", authuserlist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;
	}

	public int updateUserState(HashMap<String, String> params, String user_id, String user_state, String user_content, String admin_id) {
		int result = dao.updateUserState(params,user_id,user_content,user_state,admin_id);
		logger.info("회원 상태변경 히스토리 작성 기능 : "+params);
		dao.userStatechange(user_id,user_state);
		return result; 
	}

	public AdminMemberDTO uhistorydetail(String state_time, String user_id) {
		logger.info("히스토리 디테일 요청"+state_time,user_id);
		return dao.uhistorydetail(state_time,user_id);
	}



	}





