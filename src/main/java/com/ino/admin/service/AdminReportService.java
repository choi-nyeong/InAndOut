package com.ino.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.admin.dao.AdminReportDAO;
import com.ino.admin.dto.AdminReportDTO;
import com.ino.admin.dto.AdminStarDTO;

@Service
public class AdminReportService {

	@Autowired AdminReportDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());



	public AdminReportDTO ureportdetail(String report_no) {
		logger.info("회원 신고 디테일 "+report_no);
		
		return dao.ureportdetail(report_no);
	}

	public HashMap<String, Object> userlist(HashMap<String, Object> params) {
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));

	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	  
	    int total = 0;	    		
		
	    total = dao.utotalCount();
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminReportDTO> ulist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      ulist = dao.ulist(offset);
		
	      map.put("list", ulist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}

	public HashMap<String, Object> saleslist(HashMap<String, Object> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));

	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	
	    int total = 0;	    		
		
	    total = dao.stotalCount();
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminReportDTO> slist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      slist = dao.slist(offset);
		
	      map.put("list", slist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}

	public AdminReportDTO sreportdetail(String report_no) {
		return dao.sreportdetail(report_no);
	}


	public HashMap<String, Object> gallerylist(HashMap<String, Object> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));

	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	    
	
	    int total = 0;	    		
		
	    total = dao.gtotalCount();
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	   
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminReportDTO> glist = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      glist = dao.glist(offset);
		
	      map.put("list", glist);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}

	public AdminReportDTO greportdetail(String report_no) {
		
		return dao.greportdetail(report_no);
	}
	public int gblindyes(HashMap<String, String> params, String report_no, String report_id,String report_content) {
		logger.info("갤러리 신고처리 요청");
		int result = dao.blind_history(report_no,report_id,report_content);
		
		dao.gblindchange(report_no);
		return result;
	}
	
	public int sblindno(HashMap<String, String> params,String report_no, String report_id,String report_content) {
		int result = dao.blind_history(report_no,report_id,report_content);
		dao.blindnochange(report_no);
		return result;
	}

	public int ublindyes(HashMap<String, String> params, String report_no, String report_id, String report_content) {
		logger.info("회원 신고처리 요청");
		int result = dao.blind_history(report_no,report_id,report_content);
		
		dao.ublindchange(report_no);
		return result;
	}


	/*
	 * public AdminReportDTO greportdetail(String report_no) { return
	 * dao.greportdetail(report_no); }
	 */
	
}
