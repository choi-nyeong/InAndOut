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

import com.ino.admin.dto.AdminGalleryDTO;
import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.dto.AdminReportDTO;
import com.ino.admin.dto.AdminSalesDTO;
import com.ino.admin.service.AdminGalleryService;
import com.ino.admin.service.AdminSalesListService;
import com.ino.sales.service.SalesService;

@Controller
public class AdminSalesController {
	
	@Autowired AdminSalesListService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/adsaleslist.do")
	public String adSaleslist(HttpSession session,Model model) {
		String page = "redirect:/";
		if(session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "adSalesList";
		}	
	    return page;
	}

	   @RequestMapping(value="/adsales.ajax", method = RequestMethod.POST)
	    @ResponseBody
	    public HashMap<String, Object> list( @RequestParam HashMap<String, Object> params
	 		  		
	    		){
	    	logger.info("판매글 목록 리스트 요청");
	       return service.slist(params);
	    }		
	

	    @RequestMapping(value = "/ad.sblind", method = RequestMethod.GET)
	    public String postdelete(String no) throws Exception {
	    	service.sblind(no);
	       return "redirect:/adsaleslist.do";
	    }
	    //게시물 선택 블라인드
	    @RequestMapping(value = "/ad.sblind")
	    public String ajaxTest(HttpServletRequest request) throws Exception {

	        String[] ajaxMsg = request.getParameterValues("valueArr");
	        int size = ajaxMsg.length;
	       
	        for(int i=0; i<size; i++) {
	        	service.sblind(ajaxMsg[i]);
	        	
	        }
	        return "redirect:/adsaleslist.do";
	    }
	    
	    @RequestMapping(value = "/ad.sNoblind", method = RequestMethod.GET)
	    public String snoblind(String no) throws Exception {
	    	service.snoblind(no);
	       return "redirect:/adsaleslist.do";
	    }
	    //게시물 선택 블라인드
	    @RequestMapping(value = "/ad.sNoblind")
	    public String ajaxsno(HttpServletRequest request) throws Exception {

	        String[] ajaxMsg = request.getParameterValues("valueArr");
	        int size = ajaxMsg.length;
	       
	        for(int i=0; i<size; i++) {
	        	service.snoblind(ajaxMsg[i]);
	        	
	        }
	        return "redirect:/adsaleslist.do";
	    }		    
	
	    // 판매글 히스토리 상세보기 
		@RequestMapping(value="/shistory.go")
		public String userdetail(Model model, @RequestParam (required=false, value="sales_no")String sales_no) {

			
			logger.info("판매글 히스토리 이동"+sales_no);
			AdminSalesDTO dto = service.shistory(sales_no);
			logger.info("dto : "+dto);
			model.addAttribute("user", dto);

			
			return "adSaleshistory";
		}  
	
		/*
		 * // 판매글 블라인드 히스토리 작성
		 * 
		 * @RequestMapping(value = "/ad.sblindhistory.do", method=RequestMethod.POST)
		 * public String history_userstate(HttpServletRequest req,HttpSession
		 * session,@RequestParam HashMap<String, String> params, @RequestParam String
		 * sales_no, Model model) {
		 * 
		 * String page = "redirect:/"; if(session.getAttribute("loginId") != null) {
		 * logger.info("로그인 여부 확인"); page = "adSaleshistory"; }
		 * 
		 * logger.info("params : {}",params); int row = service.history_sblind(params,
		 * sales_no); logger.info("insert row : "+row);
		 * 
		 * logger.info("블라인드할 판매글번호"+sales_no); AdminSalesDTO dto =
		 * service.shistory(sales_no); logger.info("dto : ",dto);
		 * model.addAttribute("user", dto); return page; }
		 */
		
		
		

	    
}
