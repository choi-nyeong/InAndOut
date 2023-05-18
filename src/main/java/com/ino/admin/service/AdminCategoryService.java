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
import com.ino.admin.dto.AdminCategoryDTO;
import com.ino.admin.dto.AdminStarDTO;


@Service
public class AdminCategoryService {
	
	@Autowired AdminCategoryDAO dao;
	Logger logger  = LoggerFactory.getLogger(this.getClass());

	public HashMap<String, Object> list(HashMap<String, Object> params) {
	
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    int page = Integer.parseInt(String.valueOf(params.get("page")));

	    int offset = 10*(page-1);	    
		
	    logger.info("offset : " + offset);
	
	    int total = 0;	    		
		
		
	    int range = total%10  == 0 ? total/10 : total/10+1;
	    
	    logger.info("전체 게시물 수: " + total);
	    logger.info("전체 페이지 수: " + range);
	      
	      page = page>range ? range:page;
	      
	      ArrayList<AdminCategoryDTO> list = null;	    
		
	      params.put("offset", offset);
		
	      logger.info("params : " + params);		
		
		
	      if (params.get("requestType").equals("category")) {
	          list = dao.clist(params);
	          total = dao.ctotalCount();
	          range = total % 10 == 0 ? total / 10 : total / 10 + 1;
	      } else if (params.get("requestType").equals("goods")) {
	          list = dao.glist(params);
	          total = dao.gtotalCount();
	          range = total % 10 == 0 ? total / 10 : total / 10 + 1;
	      }
		
	      map.put("list", list);
	      map.put("currPage", page);
	      map.put("pages", range);
	      
	      return map;		
	}

	public AdminCategoryDTO goodsdetail(String goods_id, String string) {
		
		return dao.goodsdetail(goods_id);
	}

	public int goodsupdate(HashMap<String, String> params) {
		return dao.goodsupdate(params);
		
		
	}



}
