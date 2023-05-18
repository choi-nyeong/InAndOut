package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.AdminSalesDAO;

import com.ino.admin.dto.AdminSalesDTO;

@Service
public class AdminSalesListService {

	@Autowired AdminSalesDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());

	public HashMap<String, Object> slist(HashMap<String, Object> params) {
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
	    int page = Integer.parseInt(String.valueOf(params.get("page")));
	    String search = String.valueOf(params.get("search"));
	    
	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    

	    int total = 0;	    		
		
	    if(search.equals("default") || search.equals("")) {

		    	  total = dao.stotalCount();

		      	}else {	      
		    	   	   
		    	  total = dao.stotalCountSearch(search);
		
		       }
	    logger.info("판매글 search :"+search);
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    

	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminSalesDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
	      if(search.equals("default") ||search.equals("")) {
	    	  
	    	  logger.info("search"+search);
	    	  list = dao.slist(offset);
		
		       
	      }else {

			  list = dao.slistSearch(params);
			      }
	      
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
		
		
	}

	public boolean sblind(String sales_no) {
		logger.info("체크한 판매글 블라인드 요청");
		
	    
	    
	    return dao.sblind(sales_no);
	}

	public AdminSalesDTO shistory(String sales_no) {
		
		return dao.shistory(sales_no);
	}

	public boolean snoblind(String sales_no) {
		logger.info("체크한 판매글 블라인드 해제 요청");
		
	    
	    
	    return dao.snoblind(sales_no);
	}


/*
	public int history_sblind(HashMap<String, String> params, String sales_no) {
		
		return dao.history_sblind;
	}

*/
	
}
