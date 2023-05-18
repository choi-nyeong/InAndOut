package com.ino.report.controller;

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

import com.ino.report.service.ReportService;

@Controller
public class ReportController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReportService service;
	
	@RequestMapping(value = "/salesReport.go")
	public String salesReportForm(HttpSession session, Model model, @RequestParam String sales_no) {
		
		String page = "salesReportForm";
		String loginId = null;
		
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				logger.info("loginId :"+loginId);
				model.addAttribute("loginId",loginId);
				model.addAttribute("sales_no",sales_no);
			}
			
		}
			
		return page;
	}
	
	@RequestMapping(value = "/salesReportWrite.ajax")
	@ResponseBody
	public HashMap<String, Object> salesReportWrite(HttpSession session, @RequestParam HashMap<String, String> params) {

		String loginId = null;

		HashMap<String, Object> map = new HashMap<String, Object>();
		int row;
		
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(params.get("user_id").equals(loginId)) {
				logger.info("user_id + sessionId"+params.get("user_id")+"/"+loginId);
				
				row = service.salesReportWrite(params);
				map.put("row", row);
			}
		}
		
		return map;
	}
	
	@RequestMapping(value = "/galleryReport.go")
	public String galleryReportForm(HttpSession session, Model model, @RequestParam String gallery_no) {
		
		String page = "galleryReportForm";
		String loginId = null;
		
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				logger.info("loginId :"+loginId);
				logger.info("gallery_no :"+gallery_no);
				model.addAttribute("loginId",loginId);
				model.addAttribute("gallery_no",gallery_no);
			}
			
		}
			
		return page;
	}
	
	@RequestMapping(value = "/galleryReportWrite.ajax")
	@ResponseBody
	public HashMap<String, Object> galleryReportWrite(HttpSession session, @RequestParam HashMap<String, String> params) {

		String loginId = null;

		HashMap<String, Object> map = new HashMap<String, Object>();
		int row;
		
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(params.get("user_id").equals(loginId)) {
				logger.info("user_id + sessionId"+params.get("user_id")+"/"+loginId);
				
				row = service.galleryReportWrite(params);
				map.put("row", row);
			}
		}
		
		return map;
	}
}
