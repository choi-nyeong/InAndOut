package com.ino.sales.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.ino.sales.dto.BizDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dto.goodsDTO;
import com.ino.sales.service.SalesService;

@Controller
public class SalesController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SalesService service;
	
	@RequestMapping(value = "/salesList.do", method = RequestMethod.GET)
	public String salesList(Model model, HttpSession session, @RequestParam HashMap<String, String> userParams) {
		
		logger.info("salesList call");
		
		String biz_id = null;
		
		if(userParams.get("biz_id")!=null) {
			biz_id = userParams.get("biz_id");
			if(userParams.get("biz_id").length()>0) {
				biz_id = userParams.get("biz_id");
				// biz_id에 따른 goods의 리스트를 받아오기 -> 화면에 뿌려주기 위해서...
				ArrayList<goodsDTO> goodsList = service.goodsCall(biz_id);
				model.addAttribute("goodsList", goodsList);
				//조건별 검색을 위해 화면에 숨겨놓는 용도
				model.addAttribute("biz_id", biz_id);
				//화면에서 id에 따른 name을 가져오는 메서드와 model에 저장
				model.addAttribute("biz_name", service.getBiz_name(biz_id));
			}
		}
		
		String loginId = null;

		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				model.addAttribute("flag", "first"); //로그인한 사람이 처음으로 salesList 진입 시 플래그 삽입
			}
		}
		
		return "salesList";
	}
	
	@RequestMapping(value = "/salesList.ajax")
	@ResponseBody
	public HashMap<String, Object> filtering(HttpSession session, Model model, @RequestParam HashMap<String, String> userParams) {
		
		return service.filtering(session, userParams);
	}

	@RequestMapping(value = "/salesWrite.go", method = RequestMethod.GET)
	public String salesWriteForm(Model model, HttpSession session) {
		
		String page = "redirect:/home";

		if(session.getAttribute("loginId")!=null) {
			
			model.addAttribute("loginId", session.getAttribute("loginId"));
			
			logger.info("GO TO selesWriteForm page");
			
			ArrayList<BizDTO> bizList = service.getBizList();
			logger.info("bizList : "+bizList);
			model.addAttribute("bizList", bizList);
			
			page = "salesWriteForm";
			
		}

		return page;
	}
	
	@RequestMapping(value = "/goodsCall.ajax")
	@ResponseBody
	public HashMap<String, Object> goodsCall(@RequestParam String biz_id){
		
		logger.info("biz_id : "+biz_id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<goodsDTO> goodsList = service.goodsCall(biz_id);
		
		logger.info("goodsList : "+goodsList);
		
		map.put("goodsList", goodsList);
		
		return map;
	}
	
	@RequestMapping(value = "/salesWrite.do", method = RequestMethod.POST)
	public String salesWrite(MultipartFile[] photo, @RequestParam HashMap<String, String> params) {
		
		logger.info("params : "+params);
		logger.info("fileName : "+photo);
		
		return service.salesWrite(photo, params);
	}
	
	@RequestMapping(value = "/salesDetail.do", method = RequestMethod.GET)
	public String salesDetail(HttpSession session, Model model, @RequestParam String sales_no) {
		
		logger.info("deatail sales_no : "+sales_no);
		
		SalesDTO detailData = service.salesDetail(Integer.parseInt(sales_no), "detail");
		String page = "redirect:/salesList.do";
		
		if(detailData != null) {
			
			logger.info("if문 진입");
			ArrayList<String> detailPhoto = service.salesDetailPhoto(Integer.parseInt(sales_no));
			
			logger.info("detailPhoto :"+detailPhoto);
			
			page = "salesDetail";
			model.addAttribute("detailData", detailData);
			model.addAttribute("detailPhoto", detailPhoto);
			
		}
		
		String loginId = null;
		// attention이 없으면 그대로 0, 있으면 1로 변환됨
		int attentionCheck;
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				logger.info("로그인하고 판매글번호 :"+sales_no);
				attentionCheck = service.attentionCheck(loginId, sales_no);
				logger.info("로그인하고 관심여부 :"+attentionCheck);
				model.addAttribute("attentionCheck", attentionCheck);
			}
		}
		
		return page;
	}
	
	@RequestMapping(value = "/addSalesAttention.ajax")
	@ResponseBody
	public void addAttention(HttpSession session, @RequestParam String sales_no){
		
		logger.info("sales_no : "+sales_no);
		String loginId = (String) session.getAttribute("loginId");
		
		service.addAttention(loginId, sales_no);
	}
	
	@RequestMapping(value = "/removeSalesAttention.ajax")
	@ResponseBody
	public void removeAttention(HttpSession session, @RequestParam String sales_no){
		
		logger.info("sales_no : "+sales_no);
		String loginId = (String) session.getAttribute("loginId");
		
		service.removeAttention(loginId, sales_no);
	}
	
	@RequestMapping(value = "/salesDelete.do", method = RequestMethod.GET)
	public String salesDelete(Model model, HttpSession session, @RequestParam HashMap<String, String> params) {
		
		String page = "redirect:/home";
		// 삭제 글 작성자 아이디
		String user_id = params.get("user_id");
		
		if(session.getAttribute("loginId")!=null) {//로그인 상태에서
			if(session.getAttribute("loginId").equals(user_id)) {// 작성자와 세션 아이디가 일치할 때
				logger.info("같대요");
				String sales_no = params.get("sales_no");
				service.salesDelete(sales_no);
				page = "redirect:/salesList.do";
			}else {// 작성자와 세션 아이디가 다를때
				logger.info("틀려요");
			}
		}
		return page;
	}

	@RequestMapping(value = "/salesUpdate.go", method = RequestMethod.GET)
	public String salesUpdateForm(@RequestParam String sales_no, @RequestParam String user_id,
			HttpSession session, Model model) {
		
		String page = "redirect:/salesList.do";
		String loginId = null;

		if(session.getAttribute("loginId")!=null) {//로그인 상태이고 글 작성자와 동일하면
			loginId = (String) session.getAttribute("loginId");
			if(loginId.equals(user_id)) {
				
				logger.info("작성자와 세션아이디 일치함");
				SalesDTO detailData = service.salesDetail(Integer.parseInt(sales_no), "update");
				
				if(detailData != null) {
					ArrayList<String> detailPhoto = service.salesDetailPhoto(Integer.parseInt(sales_no));
					
					model.addAttribute("detailData", detailData);
					model.addAttribute("detailPhoto", detailPhoto);
					page = "salesUpdateForm";
				}
			}
		}	
		
		return page;
	}
	
	@RequestMapping(value = "/bizCall.ajax")
	@ResponseBody
	public HashMap<String, Object> bizCall(){
		
		logger.info("bizCall !");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<BizDTO> bizList = service.bizCall();
		
		logger.info("bizList : "+bizList);
		
		map.put("bizList", bizList);
		
		return map;
	}
	
	@RequestMapping(value = "/salesUpdate.do")
	public String salesUpdate(MultipartFile[] photo, @RequestParam HashMap<String, String> params, 
			@RequestParam(value="removeFileName",required=true) ArrayList<String> removeFileName,
			HttpSession session, Model model) {
		
		String page = "redirect:/salesList.do";
		String loginId = null;
		int idx;

		if(session.getAttribute("loginId")!=null) {//로그인 상태이고 글 작성자와 동일하면
			loginId = (String) session.getAttribute("loginId");
			if(loginId.equals(params.get("user_id"))) {
				logger.info("params : "+params);
				logger.info("fileName : "+photo);
				logger.info("removeFileName : "+removeFileName);
				idx = service.salesUpdate(photo, params, removeFileName);
				page = "redirect:/salesDetail.do?sales_no="+idx;
			}
		}
		
		return page;
	}
}
