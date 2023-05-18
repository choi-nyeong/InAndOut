package com.ino.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

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

import com.ino.admin.dto.AdminCategoryDTO;
import com.ino.admin.dto.AdminStarDTO;
import com.ino.admin.service.AdminCategoryService;
import com.ino.admin.service.AdminStarService;


@Controller
public class AdminStarController {

	@Autowired AdminStarService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/adstarlist.do")
	public String starlist(Model model) {


        return "adStarList";
	} 	
	
    @RequestMapping(value="/star.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> list( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	logger.info("����Ʈ �ҷ�������");
       return service.list(params);
    }	
    
    
	@RequestMapping(value = "/ad.starwrite.go", method=RequestMethod.GET)
	public String starWriteForm() {
	
		return "adStarWrite";
	}
	
	@RequestMapping(value="/ad.starwrite.do",method=RequestMethod.POST)
	public String starWrite(HttpSession session,@RequestParam HashMap<String, String> params ) {
	
	//if(session.getAttribute("loginId") !=null) {}
		logger.info("params : {}",params);
		int row = service.starwrite(params);
		logger.info("insert row : "+row);
		
		String msg = "���� ��Ͽ� �����߽��ϴ�.";
		
		if(row>0) {
			msg = "���� ��Ͽ� �����߽��ϴ�.";
		}
		
		session.setAttribute("msg", msg);
	return "redirect:/adstarlist.do";
}  
	
	
	   @RequestMapping(value="/staroverlay.ajax")
	   @ResponseBody
	   public HashMap<String, Object> overlay(@RequestParam String cate_no){
	      logger.info("overlay : "+cate_no);
	      return service.staroverlay(cate_no);
	   }
	   
		@RequestMapping(value="/stardetail.do")
		public String detail(Model model, @RequestParam String cate_no) {
			logger.info("detail : "+cate_no);
				
			AdminStarDTO dto = service.stardetail(cate_no,"detail");
			

				model.addAttribute("detail", dto);
							
			return "adStarDetail";
	   }
	   
	   
	   

		@RequestMapping(value = "/ad.starupdate.go")
		public String starupdateForm(Model model, @RequestParam String cate_no) {
			
			AdminStarDTO dto = service.stardetail(cate_no,"update");
			model.addAttribute("dto", dto);
			
			return "adStarUpdate";
		}	   
	
		@RequestMapping(value="/ad.starupdate.do",method=RequestMethod.POST)
		public String starUpdate(@RequestParam HashMap<String, String> params ) {
		
		//if(session.getAttribute("loginId") !=null) {}
			logger.info("������û");
			logger.info("params: "+params);
			service.starupdate(params);
			
		return "redirect:/adstarlist.do";
	}  	
		
		
		



		
		
		
		
		
		
		
		
		
		
		
		
}
