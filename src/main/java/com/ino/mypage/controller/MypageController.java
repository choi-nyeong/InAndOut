package com.ino.mypage.controller;

import java.awt.Window;
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

import com.ino.mypage.dto.MypageDTO;
import com.ino.mypage.service.MypageService;

@Controller

public class MypageController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	MypageService service;

	@RequestMapping(value = "/myPage.go", method = RequestMethod.GET)
	public String mypage(@RequestParam String user_id, Model model, HttpSession session) {
		logger.info("유저의 마이페이지 호출");
		String page = "myPage";
		// ArrayList<MypageDTO> dto = service.mypage();//db에 있는 값 저장하고
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		
		// 판매글 띄우기
				ArrayList<MypageDTO> saleslist = service.saleslist(user_id);
				model.addAttribute("saleslist", saleslist);
				// 갤러리 띄우기
				ArrayList<MypageDTO> galleryList = service.galleryList(user_id);
				model.addAttribute("galleryList", galleryList);
				logger.info("galleryList: " +galleryList);
				
		//프사 가져오기		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		//평점
		int avg;
		try {
		   avg = service.mystar(user_id);
		} catch (Exception e) {
		   avg = 0;
		} 
			logger.info("평균점수 :" + avg);
			model.addAttribute("avg", avg);

		// 판매글, 갤러리 갯수 세기
		int countsales = service.countsales(user_id);
		model.addAttribute("countsales", countsales);
		int countgallery = service.countgallery(user_id);
		model.addAttribute("countgallery", countgallery);
		int countinterest = service.countinterest(user_id);
		model.addAttribute("countinterest", countinterest);
		return page;
	}

	@RequestMapping(value = "/riderPage", method = RequestMethod.GET)
	public String riderPage(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		logger.info("라이더의 마이페이지 호출");
		String user_divv= (String) session.getAttribute("user_div");
		logger.info("sessionScope.user_div : "+user_divv);
		//라이더 정보 수정
		MypageDTO riderup = service.riderdetail(user_id);
		model.addAttribute("riderup", riderup);
		String page = "riderPage";
		// ArrayList<MypageDTO> dto = service.mypage();//db에 있는 값 저장하고
		MypageDTO dto = service.mypage(user_id);
		// 괄호 안에 session에 로그인 되어있는 값 가져와야함 05-loginBox 참고
		logger.info("가져온 값 : " + dto);
		logger.info("닉네임: " + dto.getNickname());
		model.addAttribute("dto", dto);
		
		
		// 라이더 extra 불러오기
		MypageDTO extra = service.myrider(user_id);
		logger.info("라이더 extra 불러오기: " + extra);
		model.addAttribute("extra", extra);
		// 라이더 star 불러오기
		int star001;
		try {
			star001 = service.star001(user_id);
		} catch (Exception e) {
			star001=0;
		}
		model.addAttribute("star001", star001);
		//
		int star002;
		try {
			star002 = service.star002(user_id);
		} catch (Exception e) {
			star002=0;
		}
		model.addAttribute("star002", star002);
//
		int star003;
		try {
			star003 = service.star003(user_id);
		} catch (Exception e) {
			star003=0;
		}
		model.addAttribute("star003", star003);
		
		//평점
		int avg;
		try {
		   avg = service.mystar(user_id);
		} catch (Exception e) {
		   avg = 0;
		} 
			logger.info("평균점수 :" + avg);
			model.addAttribute("avg", avg);
		//프사
		String new_photo_name = service.getPhotoName(user_id, "p001");
		
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		
		//제안요청, 배송 진행 불러오기
		int rideroffer = service.rideroffer(user_id);
		model.addAttribute("rideroffer", rideroffer);
		int riderdelivery = service.riderdelivery(user_id,"배송중");
		model.addAttribute("riderdelivery", riderdelivery);
		
		return page;
	}

	@RequestMapping(value="/riderUpdate.go")
	public String riderUpdate(Model model,HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		String page = "redirect:/riderPage";
		MypageDTO extra = service.riderdetail("user003");
		//닉네임
				MypageDTO dto = service.mypage(user_id);
				model.addAttribute("dto", dto);
				//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
					//제안요청, 배송 진행 불러오기
					int rideroffer = service.rideroffer(user_id);
					model.addAttribute("rideroffer", rideroffer);
					int riderdelivery = service.riderdelivery(user_id,"배송중");
					model.addAttribute("riderdelivery", riderdelivery);
		if(extra != null) {
		page ="riderUpdate";
		model.addAttribute("extra", extra);
		}
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		return page;
		}
	 
	 @RequestMapping(value="/riderUpdate.do", method = RequestMethod.POST)
	 public String riderUpdatedo(@RequestParam HashMap<String,
	 String>params, HttpSession session, Model model) {
	String user_id = (String) session.getAttribute("loginId");
	 logger.info("가져온 값들 : " + params); 
	//닉네임
			MypageDTO dto = service.mypage(user_id);
			model.addAttribute("dto", dto);
			//평점
			int avg;
			try {
			   avg = service.mystar(user_id);
			} catch (Exception e) {
			   avg = 0;
			} 
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		//프사 가져오기		
				String new_photo_name = service.getPhotoName(user_id, "p001");
				model.addAttribute("new_photo_name",new_photo_name);
				session.setAttribute("new_photo_name", new_photo_name);
	 return service.riderUpdatedo(params);
	 
	 }
	

	@RequestMapping(value = "/riderSetting.go")
	public String riderSetting(Model model,@RequestParam HashMap<String,
			 String>params, HttpSession session) {
		
		String page = "redirect:/riderPage";
		String user_id = (String) session.getAttribute("loginId");
		MypageDTO riderSetting = service.riderSetting(user_id);
		logger.info("riderSetting : "+riderSetting);
		//닉네임
				MypageDTO dto = service.mypage(user_id);
				model.addAttribute("dto", dto);
				//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
					//제안요청, 배송 진행 불러오기
					int rideroffer = service.rideroffer(user_id);
					model.addAttribute("rideroffer", rideroffer);
					int riderdelivery = service.riderdelivery(user_id,"배송중");
					model.addAttribute("riderdelivery", riderdelivery);
		
		if(!(riderSetting==null)) {
		logger.info("riderSetting에 값있어서 if문 안으로 들어옴");
		page ="riderAuth";

		model.addAttribute("riderSetting", riderSetting);
		}
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		return page;
		}
	
	@RequestMapping(value = "/riderSetting.do")
	public String riderSettingdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session, MultipartFile photo) {
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		//닉네임
				MypageDTO dto = service.mypage(user_id);
				model.addAttribute("dto", dto);
				//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
					//제안요청, 배송 진행 불러오기
					int rideroffer = service.rideroffer(user_id);
					model.addAttribute("rideroffer", rideroffer);
					int riderdelivery = service.riderdelivery(user_id,"배송중");
					model.addAttribute("riderdelivery", riderdelivery);
		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		
		logger.info(user_id+"/"+user_pw);
		
		String page ="redirect:/riderPage";
		String newpw = params.get("newpassword");
		logger.info("새로운 비밀번호 : "+ newpw);
		
		HashMap<String, String> riderSettingdo = service.riderSettingdo(photo, params,session);
		logger.info("비밀번호가 일치합니다 회원 정보를 업데이트 했습니다");
		
		logger.info("riderSettingdo"+riderSettingdo);
		page = riderSettingdo.get("page");
		

		return page;
	}
	
	@RequestMapping(value="/riderAuth.do")
	public String riderAuth(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session, @RequestParam String oripassword) {
		
		logger.info("riderAuth에 담겨있는 params : "+params);
		String page = "riderAuth";
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		String pw = params.get("user_pw");
		//프사 가져오기		
				String new_photo_name = service.getPhotoName(user_id, "p001");
				model.addAttribute("new_photo_name",new_photo_name);
				session.setAttribute("new_photo_name", new_photo_name);
		//닉네임
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
					//제안요청, 배송 진행 불러오기
					int rideroffer = service.rideroffer(user_id);
					model.addAttribute("rideroffer", rideroffer);
					int riderdelivery = service.riderdelivery(user_id,"배송중");
					model.addAttribute("riderdelivery", riderdelivery);
		
		logger.info("예전 비밀번호 : "+ user_pw);
		if(user_pw.equals(oripassword)) {
			
			MypageDTO riderSetting = service.riderSetting(user_id);
			if(riderSetting != null) {
				model.addAttribute("msg","비밀번호가 일치합니다 회원정보 수정 페이지로 이동합니다");
			model.addAttribute("riderSetting", riderSetting);
			page = "riderSetting";
			} 
				
			}else{	
				model.addAttribute("msg","현재 비밀번호가 일치하지 않습니다");
			}
		return page;
		
	}
	
	@RequestMapping(value="/userAuth.go")
	public String userAuth(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		
		String page = "redirect:/myPage";
		String user_id = (String) session.getAttribute("loginId");
		MypageDTO riderSetting = service.riderSetting(user_id);
		
		//닉네임
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		// 판매글, 갤러리 갯수 세기
				int countsales = service.countsales(user_id);
				model.addAttribute("countsales", countsales);
				int countgallery = service.countgallery(user_id);
				model.addAttribute("countgallery", countgallery);
				int countinterest = service.countinterest(user_id);
				model.addAttribute("countinterest", countinterest);
				//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		
		if(!(riderSetting==null)) {
		logger.info("riderSetting에 값있어서 if문 안으로 들어옴");
		page ="userAuth";

		model.addAttribute("riderSetting", riderSetting);
		}
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		
		return page;
		}
	
	@RequestMapping(value = "/pwcheck.ajax", method = RequestMethod.GET)
	public String pwCheck(@RequestParam("oripassword") String oripassword, HttpSession session){
		String user_pw = (String) session.getAttribute("loginPw");
		logger.info("로그인 되어있는 비밀번호 : "+user_pw);
		return user_pw;

	}
	
	@RequestMapping(value="/userAuth.do")
	public String userAuthdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session, @RequestParam String oripassword) {
		logger.info("oripassword : "+oripassword);
		logger.info("userAuth에 담겨있는 params : "+params);
		String page = "userAuth";
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		String pw = params.get("user_pw");
		
		//닉네임
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		
		//프사 가져오기		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
			logger.info("평균점수 :" + avg);
			model.addAttribute("avg", avg);
		// 판매글, 갤러리 갯수 세기
		int countsales = service.countsales(user_id);
		model.addAttribute("countsales", countsales);
		int countgallery = service.countgallery(user_id);
		model.addAttribute("countgallery", countgallery);
		int countinterest = service.countinterest(user_id);
		model.addAttribute("countinterest", countinterest);
		
		if(user_pw.equals(oripassword)) {
		
		MypageDTO riderSetting = service.riderSetting(user_id);
		if(riderSetting != null) {
			model.addAttribute("msg","비밀번호가 일치합니다 회원정보 수정 페이지로 이동합니다");
		model.addAttribute("riderSetting", riderSetting);
		page = "userSetting";
		} 
			
		}else{	
			model.addAttribute("msg","현재 비밀번호가 일치하지 않습니다");
		}
		return page;
	}
	
	@RequestMapping(value = "/userSetting.do", method = RequestMethod.POST)
	public String userSettingdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session, MultipartFile photo) {
		String user_id = (String) session.getAttribute("loginId");
		String user_pw = (String) session.getAttribute("loginPw");
		
		//닉네임
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		
		//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
		logger.info("평균점수 :" + avg);
		model.addAttribute("avg", avg);
		//프사 저장
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		
		String page ="redirect:/myPage";
		String newpw = params.get("newpassword");
		logger.info("새로운 비밀번호 : "+ newpw);
		
		String sido = params.get("sido");
		String sigungu = params.get("sigungu");
		String left_addr = params.get("left_addr");
		
		params.put("sido", sido);
		params.put("sigungu", sigungu);
		params.put("left_addr", left_addr);
		logger.info("찐회원 정보 가져온 값들 : "+ params);
		
		//회원 정보 저장
		service.riderSettingdo(photo, params,session);
		logger.info("찐유저 정보 업데이트 완료");
		page = "redirect:/myPage.go?user_id="+user_id;

		return page;
	}
	
	@RequestMapping(value="/userBiz.go")
	public String userBiz(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//닉네임
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		//프사 가져오기		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
			logger.info("평균점수 :" + avg);
			model.addAttribute("avg", avg);
		// 판매글, 갤러리 갯수 세기
		int countsales = service.countsales(user_id);
		model.addAttribute("countsales", countsales);
		int countgallery = service.countgallery(user_id);
		model.addAttribute("countgallery", countgallery);
		int countinterest = service.countinterest(user_id);
		model.addAttribute("countinterest", countinterest);
		String page = "userBiz";
				return page;
		
	}
	
	@RequestMapping(value="/userBiz.do")
	public String userBizdo(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session, MultipartFile photo) {
		String user_id = (String) session.getAttribute("loginId");
		//닉네임
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		//프사 가져오기		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
			logger.info("평균점수 :" + avg);
			model.addAttribute("avg", avg);
		// 판매글, 갤러리 갯수 세기
		int countsales = service.countsales(user_id);
		model.addAttribute("countsales", countsales);
		int countgallery = service.countgallery(user_id);
		model.addAttribute("countgallery", countgallery);
		int countinterest = service.countinterest(user_id);
		model.addAttribute("countinterest", countinterest);
		//Auth_extra table에 인서트
		String biz = service.userBiz(user_id);
		params.put("biz", biz);
		params.put("state", "인증대기");
		params.put("user_id", user_id);
		logger.info("params : "+params);
	
		//정보 인서트하기 (상호명, 사업자등록번호, 사업자등록증 사진)
		service.userBizdo(photo, params, user_id,session);
		model.addAttribute("msg","인증사용자 신청이 완료되었습니다");
		//auth_extra에서 user_div를 update하기
		service.userdiv_update(user_id);
		
		//사업자등록증 가져오기
		String biz_photo = service.getPhotoName(user_id, "p002");
		model.addAttribute("biz_photo",biz_photo);
		String page = "redirect:/myPage.go?user_id="+user_id;
		return page;
		
	}
	@RequestMapping(value="/overlay3.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay3(@RequestParam String nickname){
		logger.info("overlay3 : "+nickname);
		return service.overlay3(nickname);
	}
	
	@RequestMapping(value = "/mySales.go")
	public String mySales(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//닉네임
		MypageDTO dto = service.mypage(user_id);
		model.addAttribute("dto", dto);
		//판매글 띄우기
		ArrayList<MypageDTO> saleslist = service.saleslist(user_id);
		model.addAttribute("saleslist", saleslist);
		// 판매글, 갤러리 갯수 세기
				int countsales = service.countsales(user_id);
				model.addAttribute("countsales", countsales);
				int countgallery = service.countgallery(user_id);
				model.addAttribute("countgallery", countgallery);
				int countinterest = service.countinterest(user_id);
				model.addAttribute("countinterest", countinterest);
		//프사 가져오기		
		String new_photo_name = service.getPhotoName(user_id, "p001");
		model.addAttribute("new_photo_name",new_photo_name);
		session.setAttribute("new_photo_name", new_photo_name);
		//평점
				int avg;
				try {
				   avg = service.mystar(user_id);
				} catch (Exception e) {
				   avg = 0;
				} 
					logger.info("평균점수 :" + avg);
					model.addAttribute("avg", avg);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
		return "mySales";
	}

	@RequestMapping(value = "/myGallery.go")
	public String myGallery(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//닉네임
				MypageDTO dto = service.mypage(user_id);
				model.addAttribute("dto", dto);
		// 판매글, 갤러리 갯수 세기
						int countsales = service.countsales(user_id);
						model.addAttribute("countsales", countsales);
						int countgallery = service.countgallery(user_id);
						model.addAttribute("countgallery", countgallery);
						int countinterest = service.countinterest(user_id);
						model.addAttribute("countinterest", countinterest);
						// 갤러리 띄우기
						ArrayList<MypageDTO> galleryList = service.galleryList(user_id);
						model.addAttribute("galleryList", galleryList);
						//평점
						int avg;
						try {
						   avg = service.mystar(user_id);
						} catch (Exception e) {
						   avg = 0;
						} 
							logger.info("평균점수 :" + avg);
							model.addAttribute("avg", avg);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
				
				//프사 가져오기		
				String new_photo_name = service.getPhotoName(user_id, "p001");
				model.addAttribute("new_photo_name",new_photo_name);
				session.setAttribute("new_photo_name", new_photo_name);
		return "myGallery";
	}

	@RequestMapping(value = "/mySalesJjim.go")
	public String mySalesJjim(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//닉네임
				MypageDTO dto = service.mypage(user_id);
				model.addAttribute("dto", dto);
		// 판매글, 갤러리 갯수 세기
						int countsales = service.countsales(user_id);
						model.addAttribute("countsales", countsales);
						int countgallery = service.countgallery(user_id);
						model.addAttribute("countgallery", countgallery);
						int countinterest = service.countinterest(user_id);
						model.addAttribute("countinterest", countinterest);
						//평점
						int avg;
						try {
						   avg = service.mystar(user_id);
						} catch (Exception e) {
						   avg = 0;
						} 
							logger.info("평균점수 :" + avg);
							model.addAttribute("avg", avg);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
				//프사 가져오기		
				String new_photo_name = service.getPhotoName(user_id, "p001");
				model.addAttribute("new_photo_name",new_photo_name);
				session.setAttribute("new_photo_name", new_photo_name);
		//관심 판매글
				String attention_div = "판매글";
				ArrayList<MypageDTO> interestSaleList = service.interestSaleList(user_id,attention_div);
				model.addAttribute("interestSaleList", interestSaleList);
		return "mySalesJjim";
	}

	@RequestMapping(value = "/myGalleryJjim.go")
	public String myGalleryJjim(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//닉네임
				MypageDTO dto = service.mypage(user_id);
				model.addAttribute("dto", dto);
				// 판매글, 갤러리 갯수 세기
						int countsales = service.countsales(user_id);
						model.addAttribute("countsales", countsales);
						int countgallery = service.countgallery(user_id);
						model.addAttribute("countgallery", countgallery);
						int countinterest = service.countinterest(user_id);
						model.addAttribute("countinterest", countinterest);
						//평점
						int avg;
						try {
						   avg = service.mystar(user_id);
						} catch (Exception e) {
						   avg = 0;
						} 
							logger.info("평균점수 :" + avg);
							model.addAttribute("avg", avg);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
				//프사 가져오기		
				String new_photo_name = service.getPhotoName(user_id, "p001");
				model.addAttribute("new_photo_name",new_photo_name);
				session.setAttribute("new_photo_name", new_photo_name);
				//관심 판매글
				String attention_div = "갤러리";
				ArrayList<MypageDTO> interestglList = service.interestglList(user_id,attention_div);
				model.addAttribute("interestglList", interestglList);
				
		return "myGalleryJjim";
	}

	@RequestMapping(value = "/mySetting.go")
	public String mySetting(Model model, @RequestParam HashMap<String,
			 String>params, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		//닉네임
				MypageDTO dto = service.mypage(user_id);
				model.addAttribute("dto", dto);
				// 판매글, 갤러리 갯수 세기
						int countsales = service.countsales(user_id);
						model.addAttribute("countsales", countsales);
						int countgallery = service.countgallery(user_id);
						model.addAttribute("countgallery", countgallery);
						int countinterest = service.countinterest(user_id);
						model.addAttribute("countinterest", countinterest);
						//평점
						int avg;
						try {
						   avg = service.mystar(user_id);
						} catch (Exception e) {
						   avg = 0;
						} 
							logger.info("평균점수 :" + avg);
							model.addAttribute("avg", avg);
				logger.info("평균점수 :" + avg);
				model.addAttribute("avg", avg);
				//프사 가져오기		
				String new_photo_name = service.getPhotoName(user_id, "p001");
				model.addAttribute("new_photo_name",new_photo_name);
				session.setAttribute("new_photo_name", new_photo_name);
		return "mySetting";
	}
}
