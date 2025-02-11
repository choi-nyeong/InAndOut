package com.ino.main.controller;

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

import com.ino.main.dto.HomeDTO;
import com.ino.main.service.HomeService;
import com.ino.member.dto.MemberDTO;









@Controller
public class HomeController {
	
@Autowired HomeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value={"/","/home"})
	public String home(Model model, HttpSession session) {
		logger.info("홈페이지로 이동");
		
		
		//가장 높은 판ㅁ
		ArrayList<HomeDTO> list = service.normalTopList();
		logger.info("topList:" + list.size());
		model.addAttribute("list", list);
		HomeDTO dto = new HomeDTO();
		logger.info(dto.getUser_id());
		
		//조회수 높은 판매글
		
		ArrayList<HomeDTO> attentionTopList = service.attentionTopList();
		model.addAttribute("attentionTopList",attentionTopList);
		
		
		
		//조회수 순으로 갤러리(4개) 호출
				ArrayList<HomeDTO> hitGallery = service.hitGallery();
				logger.info("갤러리 호출 요청");
				model.addAttribute("hitGallery",hitGallery);
				
	
				
		if(session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			
		
		
				String page = "home";
				String user_id = (String) session.getAttribute("loginId");
				
				
				// service -> dao ->service -> controller 로 온 값이 정확 한가?
				//logger.info("list : "+list.size());
				
				String user_div = service.userCategory(user_id);
				String new_photo_name  = service.afterList(user_id);
				session.setAttribute("new_photo_name", new_photo_name);
				page = "home";

				
				if(user_div.equals("a")) {
								if(new_photo_name != null) {
									
									session.setAttribute("new_photo_name", new_photo_name);
									
								}
								if(new_photo_name == null) {
									//session.setAttribute("user_id", user_id);
									
								}
				

				}
				if(user_div.equals("b")) {
					if(new_photo_name != null) {
						
						session.setAttribute("new_photo_name", new_photo_name);
						
					}
					if(new_photo_name == null) {
						//session.setAttribute("user_id", user_id);
						
					}
	

				}
				if(user_div.equals("c")) {
					if(new_photo_name != null) {
						
						session.setAttribute("new_photo_name", new_photo_name);
						//dto.setNew_photo_name(new_photo_name);
						String new_photo_name2 =  (String) session.getAttribute("new_photo_name");
						
						
					}
					if(new_photo_name == null) {
						//session.setAttribute("user_id", user_id);
						//dto.setUser_id(user_id);
						
					}
					
				}
				if(user_div.equals("d")) {
					if(new_photo_name != null) {
						
						session.setAttribute("new_photo_name", new_photo_name);
						//dto.setNew_photo_name(new_photo_name);
						String new_photo_name2 =  (String) session.getAttribute("new_photo_name");

					}
					if(new_photo_name == null) {
						//session.setAttribute("user_id", user_id);
						//dto.setUser_id(user_id);
						
					}
					
				}
				
				//dto.setUser_div_name(user_div_name);
				session.setAttribute("user_div", user_div);
				

				model.addAttribute("dto",dto);
			
			 

				
				
				
				//여기는 사용자ㅣ 관심업종에 따라서 조회수 높은순으로 뽑는거 + 관심업종 세션에 넣는거
				String interest_biz_id  = service.interest_biz_id(user_id);
				session.setAttribute("interest_biz_id", interest_biz_id);
				
				logger.info("interest_biz_id : "+interest_biz_id);
				ArrayList<HomeDTO> memberAttentionTopList = service.memberAttentionTopList(interest_biz_id);
				model.addAttribute("memberAttentionTopList",memberAttentionTopList);
				
				
				
				//사용자 주변 판매글 많은 사람 프로필 뽑아주기
				if(session.getAttribute("sigungu").equals("")) {
					
					String sigungu  = service.sigungu(user_id);
					session.setAttribute("sigungu", sigungu);
					ArrayList<HomeDTO> sigunguTopList = service.sigunguTopList(sigungu);
					model.addAttribute("sigunguTopList",sigunguTopList);
					
					
					try {
						for(HomeDTO arg : sigunguTopList) {
							logger.info("user_id: " + arg.getUser_id());
							logger.info("hit: " + arg.getHit());
							logger.info("sigungu: " + arg.getSigungu());
						}
					} catch (Exception e) {

						model.addAttribute("sigunguTopList", new ArrayList<MemberDTO>());
					}
					
					
				}else {
					String sigungu = (String) session.getAttribute("sigungu");
					ArrayList<HomeDTO> sigunguTopList = service.sigunguTopList(sigungu);
					model.addAttribute("sigunguTopList",sigunguTopList);
					
					try {
						for(HomeDTO arg : sigunguTopList) {
							logger.info("user_id: " + arg.getUser_id());
							logger.info("hit: " + arg.getHit());
							logger.info("sigungu: " + arg.getSigungu());
						}
					} catch (Exception e) {

						model.addAttribute("sigunguTopList", new ArrayList<MemberDTO>());
					}
					
				}
				
				
				/*
				try {
					for(HomeDTO arg : sigunguTopList) {
						logger.info("user_id: " + arg.getUser_id());
						logger.info("hit: " + arg.getHit());
						logger.info("sigungu: " + arg.getSigungu());
					}
				} catch (Exception e) {

					model.addAttribute("sigunguTopList", new ArrayList<MemberDTO>());
				}
				
				

				*/

		}
			
		
		return "home";
	}
	//homeGnbBeforeLogin

	@RequestMapping(value="/login.go")
	public String login() {
		return "login";
	}
	
	
	
	@RequestMapping(value="/join.go")
	public String joinButton() {
		return "joinButton";
	}
	@RequestMapping(value="/userJoin.go")
	public String userJoin() {
		return "joinForm";
	}
	@RequestMapping(value="/riderJoin.go")
	public String riderJoin() {
		return "riderForm";
	}	
	@RequestMapping(value="/profile.go")
	public String profile() {
		return "profile";
	}
	
	

	


}
