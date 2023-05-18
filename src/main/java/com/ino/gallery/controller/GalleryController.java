package com.ino.gallery.controller;

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

import com.ino.gallery.dto.GalleryDTO;
import com.ino.gallery.service.GalleryService;

@Controller
public class GalleryController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired GalleryService service;
	
	@RequestMapping(value = "/galleryList.do", method = RequestMethod.GET)
	public String galleryList(Model model) {
		
		return "galleryList";
	}
	
	@RequestMapping(value = "/galleryWrite.go", method = RequestMethod.GET)
	public String galleryWriteForm(Model model, HttpSession session) {
		
		String page = "redirect:/home";

		if(session.getAttribute("loginId")!=null) {
			
			model.addAttribute("loginId", session.getAttribute("loginId"));
			page = "galleryWriteForm";
			
		}else {
			
			model.addAttribute("msg", "로그인이 필요한 기능입니다.");
			
		}
		
		return page;
	}
	
	@RequestMapping(value = "/galleryWrite.do", method = RequestMethod.POST)
	public String galleryWrite(MultipartFile[] photo, @RequestParam HashMap<String, String> params) {
		
		logger.info("params : "+params);
		logger.info("fileName : "+photo);
		
		return service.galleryWrite(photo, params);
	}
	
	@RequestMapping(value = "/galleryDetail.do", method = RequestMethod.GET)
	public String galleryDetail(HttpSession session, Model model, @RequestParam String gallery_no) {
		
		logger.info("deatail gallery_no : "+gallery_no);
		
		GalleryDTO detailData = service.galleryDetail(Integer.parseInt(gallery_no), "detail");
		String page = "redirect:/galleryList.do";
		
		if(detailData != null) {
			
			logger.info("if문 진입");
			ArrayList<String> detailPhoto = service.galleryDetailPhoto(Integer.parseInt(gallery_no));
			
			logger.info("detailPhoto :"+detailPhoto);
			
			page = "galleryDetail";
			model.addAttribute("detailData", detailData);
			model.addAttribute("detailPhoto", detailPhoto);
			
		}
		
		String loginId = null;
		// attention이 없으면 그대로 0, 있으면 1로 변환됨
		int attentionCheck;
		if(session.getAttribute("loginId")!=null) {
			loginId = (String) session.getAttribute("loginId");
			if(loginId.length()>0) {
				logger.info("로그인하고 갤러리번호 :"+gallery_no);
				attentionCheck = service.attentionCheck(loginId, gallery_no);
				logger.info("로그인하고 관심여부 :"+attentionCheck);
				model.addAttribute("attentionCheck", attentionCheck);
			}
		}
		
		return page;
	}
	
	@RequestMapping(value = "/addGalleryAttention.ajax")
	@ResponseBody
	public void addAttention(HttpSession session, @RequestParam String gallery_no){
		
		logger.info("gallery_no : "+gallery_no);
		String loginId = (String) session.getAttribute("loginId");
		
		service.addAttention(loginId, gallery_no);
	}
	
	@RequestMapping(value = "/removeGalleryAttention.ajax")
	@ResponseBody
	public void removeAttention(HttpSession session, @RequestParam String gallery_no){
		
		logger.info("gallery_no : "+gallery_no);
		String loginId = (String) session.getAttribute("loginId");
		
		service.removeAttention(loginId, gallery_no);
	}
	
	@RequestMapping(value = "/galleryDelete.do")
	public String galleryDelete(Model model, HttpSession session, @RequestParam HashMap<String, String> params) {
		
		String page = "redirect:/home";
		// 삭제 글 작성자 아이디
		String user_id = params.get("user_id");
		
		if(session.getAttribute("loginId")!=null) {//로그인 상태에서
			if(session.getAttribute("loginId").equals(user_id)) {// 작성자와 세션 아이디가 일치할 때
				logger.info("같대요");
				String gallery_no = params.get("gallery_no");
				service.galleryDelete(gallery_no);
				page = "redirect:/galleryList.do";
			}else {// 작성자와 세션 아이디가 다를때
				logger.info("틀려요");
			}
		}
		return page;
	}
	
	@RequestMapping(value = "/galleryFiltering.ajax", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> filtering(Model model, @RequestParam HashMap<String, String> userParams) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String filterName = userParams.get("filterName");
		logger.info("filterName :"+filterName);
		ArrayList<GalleryDTO> filteredList = service.filtering(filterName);
		
		logger.info("filteredList :"+filteredList);
		
		map.put("filteredList", filteredList);

		return map;
	}
	
	@RequestMapping(value = "/galleryList.ajax")
	@ResponseBody
	public HashMap<String, Object> list(Model model, @RequestParam HashMap<String, String> userParams) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String filterName = userParams.get("filterName");
		logger.info("filterName :"+filterName);
//		ArrayList<GalleryDTO> filteredList = service.filtered(userParams);
		
//		logger.info("filteredList :"+filteredList);
		
//		map.put("filteredList", filteredList);

		return service.filtered(userParams);
	}
	
	@RequestMapping(value = "/galleryUpdate.go")
	public String galleryUpdateForm(@RequestParam String gallery_no, @RequestParam String user_id,
			HttpSession session, Model model) {
		
		String page = "redirect:/galleryList.do";
		String loginId = null;
		
		if(session.getAttribute("loginId")!=null) {//로그인 상태이고 글 작성자와 동일하면
			loginId = (String) session.getAttribute("loginId");
			if(loginId.equals(user_id)) {
				
				logger.info("작성자와 세션아이디 일치함");
				GalleryDTO detailData = service.galleryDetail(Integer.parseInt(gallery_no), "detail");
				
				if(detailData != null) {
					ArrayList<String> detailPhoto = service.galleryDetailPhoto(Integer.parseInt(gallery_no));
					
					model.addAttribute("detailData", detailData);
					model.addAttribute("detailPhoto", detailPhoto);
					page = "galleryUpdateForm";
				}
			}
		}
		
		return page;
	}
	
	@RequestMapping(value = "/galleryUpdate.do")
	public String galleryUpdate(MultipartFile[] photo, @RequestParam HashMap<String, String> params, 
			@RequestParam(value="removeFileName",required=true) ArrayList<String> removeFileName,
			HttpSession session, Model model) {
		
		String page = "redirect:/galleryList.do";
		String loginId = null;
		int idx;

		if(session.getAttribute("loginId")!=null) {//로그인 상태이고 글 작성자와 동일하면
			loginId = (String) session.getAttribute("loginId");
			if(loginId.equals(params.get("user_id"))) {
				logger.info("params : "+params);
				logger.info("fileName : "+photo);
				logger.info("removeFileName : "+removeFileName);
				idx = service.galleryUpdate(photo, params, removeFileName);
				page = "redirect:/galleryDetail.do?gallery_no="+idx;
			}
		}
		
		return page;
	}
}
