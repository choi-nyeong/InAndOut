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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.admin.dao.AdminGalleryDAO;
import com.ino.admin.dto.AdminGalleryDTO;
import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.dto.AdminStarDTO;

@Service
public class AdminGalleryService {
	
	@Autowired AdminGalleryDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());


	public HashMap<String, Object> list(HashMap<String, Object> params) {
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));

	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    

	    int total = 0;	    		
		
	    total = dao.totalCount();
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    

	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminGalleryDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      list = dao.list(offset);
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
		
		
	}

	public HashMap<String, Object> gblind(ArrayList<String> blindList) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		int blindSize = blindList.size(); 
		
		int successCnt = 0; // 총 몇개지울건지
		for(String id: blindList) {
			successCnt += dao.gblind(id);// delete 하면 한개의 업데이트 로우가 생기니까 증가시켜서 확인  
		}
		
		map.put("msg", blindSize+ "요청중"+successCnt+" 개 블라인드 했습니다.");
		
		map.put("success",true );
		return map;
	}





}
