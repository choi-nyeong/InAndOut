package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ino.admin.dao.AdminCategoryDAO;
import com.ino.admin.dao.AdminStarDAO;
import com.ino.admin.dto.AdminCategoryDTO;
import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.dto.AdminStarDTO;


@Service
public class AdminStarService {
	
@Autowired AdminStarDAO dao;
Logger logger  = LoggerFactory.getLogger(this.getClass());


	public HashMap<String, Object> list(HashMap<String, Object> params) {
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    // 1������  offset 0
	    // 2������ offset 5
	    // 3 ������ offset 10
	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	    // ���� �� �ִ� �� ������ �� : ��ü �Խñ��� �� / �������� ������ �� �ִ� ��
	    int total = 0;	    		
		
	    total = dao.totalCount();
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    
	      logger.info("�ѰԽñ� �� : "+ total);
	      logger.info("�� ������ �� : "+ range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminStarDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      list = dao.list(offset);
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
		
		

	}


	public int starwrite(HashMap<String, String> params) {
		logger.info("�������");
		return dao.starwrite(params);
	}


	public HashMap<String, Object> staroverlay(String cate_no) {
	      HashMap<String, Object> map2 = new HashMap<String, Object>();
	      // ���� ���̵� �ִ°�? ������ 1 ������ 0
	      map2.put("staroverlay", dao.staroverlay(cate_no));      
	      return map2;

	}


	public int starupdate(HashMap<String, String> params) {
		
		return dao.starupdate(params);
	}




	public AdminStarDTO stardetail(String cate_no, String string) {
		
		return dao.stardetail(cate_no);
	}









	



}
