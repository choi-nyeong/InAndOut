package com.ino.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.dto.AdminReportDTO;
import com.ino.admin.service.AdminMemberListService;
import com.ino.admin.service.AdminReportService;

@Controller
public class AdminReportController {

	@Autowired
	AdminReportService service;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/userreportlist.do")
	public String ureportlist(Model model, HttpSession session) {
		String page = "redirect:/";
		if (session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "adUserReportList";
		}

		return page;
	}

	@RequestMapping(value = "/ureport.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> userlist(@RequestParam HashMap<String, Object> params

	) {
		logger.info("����Ʈ �ҷ�������");
		return service.userlist(params);
	}

	@RequestMapping(value = "/salesreportlist.do")
	public String sreportlist(Model mode, HttpSession session) {
		String page = "redirect:/";

		if (session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "adSalesReportList";
		}

		return page;
	}

	@RequestMapping(value = "/sreport.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> saleslist(@RequestParam HashMap<String, Object> params

	) {
		logger.info("판매글 신고 ajax 요청");
		return service.saleslist(params);
	}

	
	@RequestMapping(value = "/galleryreportlist.do")
	public String greportlist(Model mode, HttpSession session) {
		String page = "redirect:/";

		if (session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "adGalleryReportList";
		}

		return page;
	}

	@RequestMapping(value = "/greport.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> gallerylist(@RequestParam HashMap<String, Object> params

	) {
		logger.info("판매글 신고 ajax 요청:"+params);
		return service.gallerylist(params);
	}
	
	
	@RequestMapping(value = "/detail.ureport.do")
	public String ureportdetail(Model model, @RequestParam String report_no) {
		/*
		 * �α��� String page ="redirect:/ad.userlist.do";
		 */

		logger.info("회원 신고목록 " + report_no);
		AdminReportDTO dto = service.ureportdetail(report_no);
		logger.info("dto : ", dto);
		model.addAttribute("dto", dto);

		return "adUserReportDetail";
	}

	@RequestMapping(value = "/detail.sreport.do")
	public String sreportdetail(HttpServletRequest req,HttpSession session, Model model, @RequestParam String report_no) {

	    String page = "redirect:/";
	    if (session.getAttribute("loginId") != null) {
	        logger.info("로그인 여부 확인");
	  
	            page = "adSalesReportDetail";
	        }
	    

		logger.info("판매글 신고목록" + report_no);
		AdminReportDTO dto = service.sreportdetail(report_no);
		logger.info("dto : ", dto);
		model.addAttribute("dto", dto);

		return page;
	}
	
	@RequestMapping(value = "/detail.greport.do")
	public String greportdetail(HttpServletRequest req,HttpSession session, Model model, @RequestParam String report_no) {

	    String page = "redirect:/";
	    if (session.getAttribute("loginId") != null) {
	        logger.info("로그인 여부 확인");
	  
	            page = "adGalleryReportDetail";
	        }
	    

		logger.info("판매글 신고목록" + report_no);
		AdminReportDTO dto = service.greportdetail(report_no);
		logger.info("dto : ", dto);
		model.addAttribute("dto", dto);

		return page;
	}


	
	/*
	 * @RequestMapping(value="/detail.greport.do") public String greportdetail(Model
	 * model, @RequestParam String report_no) {
	 * 
	 * 
	 * logger.info("갤러리 신고목록"+report_no); AdminReportDTO dto
	 * =service.greportdetail(report_no); logger.info("dto : ",dto);
	 * model.addAttribute("dto", dto);
	 * 
	 * 
	 * return "adUserReportDetail"; }
	 */
	 


	// 갤러리 신고 처리
	@RequestMapping(value = "/ad.gblind.do", method = RequestMethod.POST)
	public String sblindyes(@RequestParam HashMap<String, String> params, 
			@RequestParam String report_no,
			@RequestParam String report_id, 
			@RequestParam String report_content, 
			Model model) {

		logger.info("params : {}"+ params);
		int row = service.gblindyes(params, report_no, report_id,report_content);
		logger.info("insert row : " + row);
		
		logger.info("판매글 신고처리할 번호" + report_no, report_id);
		AdminReportDTO dto = service.greportdetail(report_no);
		logger.info("dto : " + dto);

		model.addAttribute("dto", dto);
		return "adGalleryReportDetail";
	}

	// 갤러리 신고 반려

	@RequestMapping(value = "/ad.gblind.go", method = RequestMethod.POST)
	public String sblindno(@RequestParam HashMap<String, String> params, 
			@RequestParam String report_no,
			@RequestParam String report_id, 
			@RequestParam String report_content, 			
			Model model) {

		logger.info("params : {}", params);
		int row = service.sblindno(params, report_no, report_id,report_content);
		logger.info("insert row : " + row);

		logger.info("판매글 신고 반려처리할 번호" + report_no);
		AdminReportDTO dto = service.greportdetail(report_no);
		logger.info("dto : ", dto);
		model.addAttribute("dto", dto);
		return "adGalleryReportDetail";
	}
	
	// 회원 신고 처리
	@RequestMapping(value = "/ad.ublind.do", method = RequestMethod.POST)
	public String ublindyes(@RequestParam HashMap<String, String> params, 
			@RequestParam String report_no,
			@RequestParam String report_id, 
			@RequestParam String report_content, 
			Model model) {

		logger.info("회원 신고params : {}"+ params);
		int row = service.ublindyes(params, report_no, report_id,report_content);
		logger.info("insert row : " + row);
		
		logger.info("회원 신고처리할 번호" + report_no, report_id);
		AdminReportDTO dto = service.ureportdetail(report_no);
		logger.info("회원 신고처리 dto : " + dto);

		model.addAttribute("dto", dto);
		return "adUserReportDetail";
	}

	// 회원 신고 반려

	@RequestMapping(value = "/ad.ublind.go", method = RequestMethod.POST)
	public String ublindno(@RequestParam HashMap<String, String> params, 
			@RequestParam String report_no,
			@RequestParam String report_id, 
			@RequestParam String report_content, 			
			Model model) {

		logger.info("회원 신고 반려처리 params : {}", params);
		int row = service.sblindno(params, report_no, report_id,report_content);
		logger.info("insert row : " + row);

		logger.info("회원 신고 반려처리할 번호" + report_no);
		AdminReportDTO dto = service.ureportdetail(report_no);
		logger.info("dto : ", dto);
		model.addAttribute("dto", dto);
		return "adUserReportDetail";
	}	
	
	
	
	
	
	
	
	
}
