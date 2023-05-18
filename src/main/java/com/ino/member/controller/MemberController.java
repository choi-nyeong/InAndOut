package com.ino.member.controller;

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
import com.ino.member.dto.MemberDTO;

import com.ino.member.service.MemberService;







@Controller
public class MemberController {
	
@Autowired MemberService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

	
	@RequestMapping(value="/login.ajax" ,method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(
			@RequestParam String id,@RequestParam String pw, 
			HttpSession session){
		
		//*****왜 로거에 안뜨지??
		logger.info("로그인 요청온거 로거좀 찍어주세요.,,");
		logger.info(id+"/"+pw);
		int success = service.login(id,pw);
		logger.info("login success : "+success);
		
		if(success == 1) {
			session.setAttribute("loginId", id);
			session.setAttribute("loginPw", pw);
			
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		
		return map;
	}
	
	@RequestMapping(value="/sigungu.ajax" ,method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> sigungu(
			@RequestParam String sigungu , HttpSession session){
		
		
		logger.info("sigungu 요청온거 로그..,,");
		logger.info("sigungu : "+ sigungu);
		
		session.setAttribute("sigungu", sigungu);
		
		String user_id = (String) session.getAttribute("loginId");
		int success = service.updateSigungu(user_id,sigungu);
		if(success == 1) {
			session.setAttribute("sigungu", sigungu);
			
			
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		
		return map;
	}
	
	
	
	
	
	
	@RequestMapping(value={"/afterLogin.go"})
	public String afterhome(HttpSession session, Model model) {
		
		String page = "redirect:/afterLogin.do";
		
		logger.info("로그인 후 홈페이지로 이동");
		if(session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "redirect:/afterLogin.do";
		}
		
	
		return page;
	}
	
	@RequestMapping(value="/afterLogin.do")
	public String afterLogin(Model model , HttpSession session) {		
		logger.info("afterList call!!"); // 컨트롤러가 도착 했는지? (파라메터는 제대로 들어 왔는지?)
		
		String page = "home";
		String user_id = (String) session.getAttribute("loginId");
		logger.info("세션!!!아이디값 : "+user_id);
		
		
		// service -> dao ->service -> controller 로 온 값이 정확 한가?
		//logger.info("list : "+list.size());
		MemberDTO dto = new MemberDTO();
		String user_div = service.userCategory(user_id);
		String new_photo_name  = service.afterList(user_id);
		page = "home";
		logger.info("유저 구분 뭔지 좀 보자!!!!!  : "+user_div );
		
		
		

		
		if(user_div.equals("a")) {
						if(new_photo_name != null) {
							
							session.setAttribute("new_photo_name", new_photo_name);
							logger.info("일반dto사진!! 나온거!!! :  " +new_photo_name);
							
							
						}
						if(new_photo_name == null) {
							//session.setAttribute("user_id", user_id);
							//logger.info("제발dto 유저 아이디좀 해줘 : "+dto.getUser_id());
							
						}
		

		}
		if(user_div.equals("b")) {
			if(new_photo_name != null) {
				
				session.setAttribute("new_photo_name", new_photo_name);
				logger.info("판매자dto사진!! 나온거!!! :  " +new_photo_name);
				
				
			}
			if(new_photo_name == null) {
				//session.setAttribute("user_id", user_id);
				//logger.info("제발dto 유저 아이디좀 해줘 : "+dto.getUser_id());
				
			}


		}
		if(user_div.equals("c")) {
			if(new_photo_name != null) {
				
				session.setAttribute("new_photo_name", new_photo_name);
				//dto.setNew_photo_name(new_photo_name);
				String new_photo_name2 =  (String) session.getAttribute("new_photo_name");
				logger.info("(세션에저장된)라이더!!dtot사진!! 나온거!!! :  " +new_photo_name2);
				
				
			}
			if(new_photo_name == null) {
				//session.setAttribute("user_id", user_id);
				//dto.setUser_id(user_id);
				logger.info("제발dto 유저 아이디좀 해줘 : "+user_id);
				
			}
			
		}
		if(user_div.equals("d")) {
			if(new_photo_name != null) {
				
				session.setAttribute("new_photo_name", new_photo_name);
				//dto.setNew_photo_name(new_photo_name);
				String new_photo_name2 =  (String) session.getAttribute("new_photo_name");
				logger.info("(세션에저장된)라이더!!dtot사진!! 나온거!!! :  " +new_photo_name2);
				
				
			}
			if(new_photo_name == null) {
				//session.setAttribute("user_id", user_id);
				//dto.setUser_id(user_id);
				logger.info("제발dto 유저 아이디좀 해줘 : "+user_id);
				
			}
			
		}
		logger.info("여기 까지는 오너ㅏ?");
		
		//dto.setUser_div_name(user_div_name);
		session.setAttribute("user_div", user_div);
		

		model.addAttribute("dto",dto);
	
	 

		
		
		
		//여기는 사용자ㅣ 관심업종에 따라서 조회수 높은순으로 뽑는거 + 관심업종 세션에 넣는거
		logger.info("유져 아이디가 안오나? : "+user_id);
		String interest_biz_id  = service.interest_biz_id(user_id);
		session.setAttribute("interest_biz_id", interest_biz_id);
		
		logger.info("interest_biz_id : "+interest_biz_id);
		ArrayList<MemberDTO> memberAttentionTopList = service.memberAttentionTopList(interest_biz_id);
		model.addAttribute("memberAttentionTopList",memberAttentionTopList);
		logger.info("멤버 탑 리스트에는 그럼 뭐가 들어가 잇는건가..? : " +memberAttentionTopList.size() );
		
		for (MemberDTO dto4 : memberAttentionTopList) {
		    logger.info("memberAttentionTopList: " + dto4.getNew_photo_name() + "사진이름 " + dto.getUser_id());
		}
		
		
		//사용자 주변 판매글 많은 사람 프로필 뽑아주기
		String sigungu  = service.sigungu(user_id);
		session.setAttribute("sigungu", sigungu);
		ArrayList<MemberDTO> sigunguTopList = service.sigunguTopList(sigungu);
		sigunguTopList = service.sigunguTopList(sigungu);

		model.addAttribute("sigunguTopList",sigunguTopList);
		try {
			for(MemberDTO arg : sigunguTopList) {
				logger.info("user_id: " + arg.getUser_id());
				logger.info("hit: " + arg.getHit());
				logger.info("sigungu: " + arg.getSigungu());
			}
		} catch (Exception e) {

			model.addAttribute("sigunguTopList", new ArrayList<MemberDTO>());
		}
		
		
		
		logger.info("지금 시군구이거에 정보 있는건가? : " +sigunguTopList.size() );

		
		
		/*
		 * for (MemberDTO dto4 : sigunguTopList) { logger.info("user_id: " +
		 * dto4.getNew_photo_name() + "사진이름 " + dto.getUser_id()); }
		 */

		//logger.info("지금 아이티오에 사진이 들어 있는거임? :"+sigunguTopList.get(1) );
		
		
		
		//조회수 순으로 갤러리(4개) 호출
		ArrayList<MemberDTO> hitGallery = service.hitGallery();
		model.addAttribute("hitGallery",hitGallery);
		

		return page;
	
	}
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	   public String logout( HttpSession session ,Model model ) {
		   session.removeAttribute("loginId");
		   session.removeAttribute("new_photo_name");
		   session.removeAttribute("user_div_name");
		   session.removeAttribute("interest_biz_id");
		   session.removeAttribute("sigungu");
		   
		   logger.info("로그아웃 요청");
		   logger.info((String) session.getAttribute("loginId"));
		   logger.info((String) session.getAttribute("new_photo_name"));
		   logger.info((String) session.getAttribute("user_div_name"));
	     
		   
		   //판매 많이 하는 사장님
		   
		   ArrayList<MemberDTO> list = service.normalTopList();
			logger.info("topList:" + list.size());
			model.addAttribute("list", list);
			MemberDTO dto3 = new MemberDTO();
			logger.info(dto3.getUser_id());
			
			//조회수 높은 판매글

			
			ArrayList<MemberDTO> attentionTopList = service.attentionTopList();
			model.addAttribute("attentionTopList",attentionTopList);
			
			
			
			
			//조회수 순으로 갤러리(4개) 호출
					ArrayList<MemberDTO> hitGallery = service.hitGallery();
					model.addAttribute("hitGallery",hitGallery);
			
		   
		   
	      return "home";
	   }   
	
	
	/*
	//아작스 로그인 연습
	
	@RequestMapping(value="/join.ajax")
	@ResponseBody
	public HashMap<String, Object> join(
	 @RequestParam("file1") MultipartFile file1,
	    @RequestParam("file2") MultipartFile file2,
		@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		 logger.info("file1 name : {}", file1.getOriginalFilename());
		    logger.info("file2 name : {}", file2.getOriginalFilename());
		// 파일 처리 로직
		
		
		logger.info(" 파람 왓따! params : "+params);
		MemberDTO dto = new MemberDTO();
		logger.info("profile도 왔음 !! ㄷㄷ; : "+file1);
		// logger.info("bizprofile도 도착 : "+bizprofile); 
		return  service.ajaxUserRegist(file1, params, file2);
	
	
	}
	*/

	
	@RequestMapping(value="/userRegist.do",method = RequestMethod.POST)
		public String write(MultipartFile profile,  MultipartFile bizprofile,
				@RequestParam HashMap<String, String> params, Model model) {
	
		logger.info(" 파람 왓따! params : "+params);
		MemberDTO dto = new MemberDTO();
		logger.info("profile도 왔음 !! ㄷㄷ; : "+profile);
		logger.info("bizprofile도 도착 : "+bizprofile);
		
		
		//폰 번호 병합
		String phone_num = params.get("phone_num");
		String phone_num2 = params.get("phone_num2");
		String phone_num3 = params.get("phone_num3");
		params.put("phone_num", phone_num+phone_num2+phone_num3);
		String phone_num4 = params.get("phone_num");
		logger.info(phone_num4);
		
		//이메일 병합
		String email = params.get("email");
		String url = params.get("url");
		params.put("email", email +"@"+url );
		String page = "joinForm";
		
		if(service.userRegist(profile, params,bizprofile)==1) {
			 model.addAttribute("msg", "회원가입이 완료되었습니다. 홈으로 가서 로그인을 시도해주세요");
			page = "joinForm";
			
		}else {
	         model.addAttribute("msg", "회원가입에 실패 했습니다!");
	      }
		
		
		
		return page;
	}
	
	
	@RequestMapping(value="/riderRegist.do",method = RequestMethod.POST)
	public String riderwrite(MultipartFile profile,  MultipartFile bizprofile,
			@RequestParam HashMap<String, String> params , Model model) {

	logger.info(" 파람 왓따! params : "+params);
	MemberDTO dto = new MemberDTO();
	logger.info("riderprofile도 왔음 !! ㄷㄷ; : "+profile);
	logger.info("riderbizprofile도 도착 : "+bizprofile);
	
	// 폰 번호 병합
	String phone_num = params.get("phone_num");
	String phone_num2 = params.get("phone_num2");
	String phone_num3 = params.get("phone_num3");
	params.put("phone_num", phone_num+phone_num2+phone_num3);
	String phone_num4 = params.get("phone_num");
	logger.info(phone_num4);
	
	
	//이메일 병합
	String email = params.get("email");
	String url = params.get("url");
	params.put("email", email +"@"+url );
	
	
	//영업시간 병합
	String store_time = params.get("store_time");
	String store_time2 = params.get("store_time2");
	
	params.put("store_time", store_time+"~"+store_time2);
	
	
	String page = "riderForm";
	
	
	if(service.riderRegist(profile, params,bizprofile)==1) {
		 model.addAttribute("msg", "라이더회원가입이 완료되었습니다. 라이더 자격은 심사 후 승인, 반려 될 수 있으며 빠른 시일 내에 처리 될 예정입니다. 감사합니다.");
		 
		page = "riderForm";
		
	}else {
        model.addAttribute("msg", "회원가입에 실패 했습니다!");
     }
	
	
	
	return page;
}
	
	
	
	
	@RequestMapping(value="/overlay.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String user_id){
		logger.info("overlay : "+user_id);
		return service.overlay(user_id);
	}
	@RequestMapping(value="/overlay2.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay2(@RequestParam String nickname){
		logger.info("overlay2 : "+nickname);
		return service.overlay2(nickname);
	}
	

	
	
	

}