package com.ino.chat.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ino.chat.dto.ChatDTO;
import com.ino.chat.dto.ImgChatDTO;
import com.ino.chat.dto.MsgDTO;
import com.ino.chat.service.ChatService;
import com.ino.delivery.dto.RiderDTO;
import com.ino.member.dto.MemberDTO;
import com.ino.sales.dto.SalesDTO;

@Controller
public class ChatController {
	@Autowired ChatService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/chat.go")
	public String chat(Model model, HttpSession session) {
		logger.info("controller chat.go called.");
		
		model.addAttribute("loginId", session.getAttribute("loginId"));
		model.addAttribute("user_div_name", session.getAttribute("user_div_name"));
		model.addAttribute("selectedRoom", session.getAttribute("selectedRoom"));
		
		return "chatList";
	}
	
	@RequestMapping(value = "chatList.ajax")
	@ResponseBody
	public HashMap<String, Object> chatList(HttpSession session) {
		logger.info("chatList 실행.");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			String loginId = (String) session.getAttribute("loginId");
			logger.info("loginId = " + loginId);
			ArrayList<ChatDTO> chatlist = service.list(loginId);
			ArrayList<MemberDTO> userlist = new ArrayList<MemberDTO>();
			ArrayList<String> salephotolist = new ArrayList<String>();
			ArrayList<String> userphotolist = new ArrayList<String>();
			for (ChatDTO args: chatlist) {
				logger.info(args.getMsg_div());
				if(args.getMsg_div().equals("판매")) {
					String salephoto = service.salephoto(args.getMsg_div_no());
					salephotolist.add(salephoto);
				} else {
					String salephoto = service.getsalephotobydelivery(args.getMsg_div_no());
					salephotolist.add(salephoto);
				}
				int roomid = args.getRoomid();
				ArrayList<String> roomuserlist = service.userlist(roomid);
				logger.info("roomuserlist: "+roomuserlist);
				logger.info("salephotolist: "+salephotolist);
				for (String roomusername: roomuserlist) {
					if(!roomusername.equals(loginId)) {
						userlist.add(service.username(roomusername));
						userphotolist.add(service.userphoto(roomusername));
					}
				}
			}
			logger.info("userlist: "+userlist);
			logger.info("userphoto: "+userphotolist);
			map.put("list", chatlist);
			map.put("userlist", userlist);
			map.put("salephotolist", salephotolist);
			map.put("userphotolist", userphotolist);
		}
		
		map.put("login", login);
		
		return map;
	}
	
	@RequestMapping(value = "msgList.ajax")
	@ResponseBody
	public HashMap<String, Object> msgList(
			@RequestParam("id") int id, HttpSession session) {
		logger.info("msgList 실행.");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		RiderDTO msgrider = new RiderDTO();
		
		if(session.getAttribute("loginId") != null) {
			session.setAttribute("selectedRoom", id);
			
			String issale = service.issale(id);
			logger.info("issale: " + issale);
			int salenum = 0;
			if(issale.equals("판매")) {
				salenum = service.salenum(id);
			} else {
				logger.info("delivery offer no: " + id);
				salenum = service.salenum2(id);
				int deliveryno = service.salenum(id);
				logger.info("salenum: " + salenum);
				msgrider = service.getdelivery(deliveryno);
			}
			SalesDTO msgsale = new SalesDTO();
			msgsale = service.msgsale(salenum);
			logger.info("msgsale: " + msgsale);
			map.put("sale", msgsale);
			String salephoto = service.salephoto(Integer.toString(salenum));
			map.put("salephoto", salephoto);
			login = true;
			logger.info("id = " + id);
			ArrayList<MsgDTO> msglist = service.msglist(id);
			map.put("delivery", msgrider);
			map.put("list", msglist);
			
			String msguser = service.msguser(id, (String)session.getAttribute("loginId"));
			MemberDTO username = service.username(msguser);
			String userphoto = service.userphoto(msguser);
			map.put("user", username);
			map.put("userphoto", userphoto);
		}
		
		map.put("login", login);
		
		return map;
	}
	
	@RequestMapping(value = "msgSend.ajax")
	@ResponseBody
	public void msgSend(
			@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("msgSend 실행.");
		boolean login = false;
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			logger.info("params: " + params);
			service.msgsend(params);
			service.recentmsg(params);
			service.recentmsgno(params);
			service.recentmsgtime(params);
		}
		
	}
	
	@RequestMapping(value = "saleChatOpen.do")
	public String newchat(@RequestParam String sales_no, @RequestParam String user_id, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if(session.getAttribute("loginId") != null) {
			String roomuserno = service.findroomuser(loginId, sales_no);
			logger.info("findroomuser: " + roomuserno);
			if(roomuserno == null) {
				logger.info("속한 채팅방이 없다");
				int newroom = service.newroom(sales_no,loginId,user_id);
				session.setAttribute("selectedRoom", newroom);
			}else {
				session.setAttribute("selectedRoom", roomuserno);
			}
		}
		
		return "redirect:/chat.go";
	}
	
	@RequestMapping(value = "riderChatOpen.do")
	public String newchat2(@RequestParam String offers_no, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		// loginId -> 라이더
		// user_id -> 요청자
		String user_id = service.offergetuserid(offers_no);
		if(session.getAttribute("loginId") != null) {
			String roomuserno = service.findroomuser2(user_id, offers_no);
			logger.info("findroomuser: " + roomuserno);
			if(roomuserno == null) {
				logger.info("속한 채팅방이 없다");
				logger.info("loginId: {}/user_id: {}", loginId, user_id);
				int newroom = service.newroom2(offers_no,loginId,user_id);
				session.setAttribute("selectedRoom", newroom);
			}else {
				session.setAttribute("selectedRoom", roomuserno);
			}
		}
		
		return "redirect:/chat.go";
	}
	
	@RequestMapping(value = "imgSend.ajax", method = RequestMethod.POST)
	@ResponseBody
	public void imgSend(ImgChatDTO imgDTO, HttpSession session) throws Exception {
		logger.info("getid: " + imgDTO.getId());
		logger.info("getroomid: " + imgDTO.getRoomid());
		logger.info("getuploadfile: " + imgDTO.getUploadFile());
		logger.info("--------------------------------------------");
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id", imgDTO.getId());
		params.put("roomid", imgDTO.getRoomid());
		params.put("msg", "이미지 전송");
		
		service.imgmsgsend(params, imgDTO.getUploadFile());
	}
	
	@RequestMapping(value = "chatsaledone.do")
	public String chatsaledone(@RequestParam String modalsaleid, @RequestParam String modalroomid, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("sales_no: {}, roomid: {}", modalsaleid, modalroomid);
		service.chatsaledone(modalsaleid);
		
		//return "redirect:/salesDetail.do?sales_no=" + modalsaleid;
		return "redirect:/chat.go";
	}
	
	@RequestMapping(value = "chatriderList.ajax")
	@ResponseBody
	public HashMap<String, Object> chatriderList(HttpSession session){
		logger.info("chatList 실행.");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			String loginId = (String) session.getAttribute("loginId");
			logger.info("loginId = " + loginId);
			ArrayList<MemberDTO> chatriderlist = service.riderlist(loginId);
			
			for (MemberDTO args : chatriderlist) {
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
				logger.info("ridername: " + args.getNickname());
			}
			
			map.put("chatriderlist", chatriderlist);
		}
		
		return map;
		
	}
}
