package com.ino.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

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


@Controller
public class AdminCategoryController {

	@Autowired AdminCategoryService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/ad.categorylist.do")
	public String goodslist() {

        return "adCategoryList";
	} 	
	
    @RequestMapping(value = "/ad.search.do", method = RequestMethod.GET)
    public String handleSearchRequest(@RequestParam("category") String category) {
        String page = "redirect:/ad.categorylist.do";
    	if (category.equals("업종별")) {
            page= "adCategoryList";
        } else if (category.equals("물품별")) {
            page= "adGoodsList";
        }
		return page;	
    } 
	
    @RequestMapping(value="/category.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> clist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	params.put("requestType", "category");
    	logger.info("카테고리 ajax 요청");
       return service.list(params);
    }	

    @RequestMapping(value="/goods.ajax", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> glist( @RequestParam HashMap<String, Object> params
 		  		
    		){
    	params.put("requestType", "goods");
    	logger.info("카테고리 ajax 요청");
       return service.list(params);
    }	
    
	@RequestMapping(value="/goodsdetail.do")
	public String detail(Model model, @RequestParam String goods_id) {
		logger.info("detail : "+goods_id);
			
		AdminCategoryDTO dto = service.goodsdetail(goods_id,"detail");
		

			model.addAttribute("detail", dto);
						
		return "adGoodsDetail";
   }    
    
	@RequestMapping(value = "/ad.goodsupdate.go")
	public String goodsupdateForm(Model model, @RequestParam String goods_id) {
		
		AdminCategoryDTO dto = service.goodsdetail(goods_id,"update");
		model.addAttribute("dto", dto);
		
		return "adGoodsUpdate";
	}	   

	@RequestMapping(value="/ad.goodsupdate.do",method=RequestMethod.POST)
	public String goodsUpdate(@RequestParam HashMap<String, String> params ) {
	
	//if(session.getAttribute("loginId") !=null) {}
		logger.info("������û");
		logger.info("params: "+params);
		service.goodsupdate(params);
		
	return "redirect:/ad.categorylist.do";
}  	    
	
	

	
	
	
}
