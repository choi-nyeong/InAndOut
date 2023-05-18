package com.ino.star.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.sales.dto.SalesDTO;
import com.ino.star.dto.CategoryDTO;
import com.ino.star.service.StarService;

@Controller
public class StarController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired StarService service;
	
	@RequestMapping(value = "/areYouBuyer.ajax")
	@ResponseBody
	public HashMap<String, Object> areYouBuyer(HttpSession session, @RequestParam HashMap<String, String> params){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = null;
		
		String sales_no = params.get("sales_no");
		String user_id = params.get("user_id");
		
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				String buyerId = service.areYouBuyer(sales_no, user_id);
				map.put("buyerId", buyerId);
			}
			
		}
		
		return map;
	}
	
	@RequestMapping(value = "/starThrow.go")
	public String starThrowForm(HttpSession session, Model model, @RequestParam String sales_no, @RequestParam String user_id) {
		
		String page = "starThrowForm";
		String loginId = null;
		
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				logger.info("loginId :"+loginId);
				model.addAttribute("loginId", loginId);
				
				ArrayList<CategoryDTO> starList = service.getStarList();
				model.addAttribute("starList", starList);
				logger.info("starList :"+starList);
				SalesDTO detailData = service.salesDetail(Integer.parseInt(sales_no), "star");
				model.addAttribute("detailData", detailData);
				logger.info("detailData :"+detailData);
			}
			
		}
		return page;
	}
	
	@RequestMapping(value = "/starThrow.ajax")
	@ResponseBody
	public HashMap<String, Object> starThrow(HttpSession session, @RequestParam HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = null;
		
		if(session.getAttribute("loginId")!=null) {
			
			loginId = (String) session.getAttribute("loginId");
			
			if(loginId.length()>0) {
				int row = service.insertStar(params);
				map.put("row", row);
			}
			
		}

		return map;
	}
	
}
