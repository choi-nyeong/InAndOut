package com.ino.chat.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ino.chat.dao.ChatDAO;
import com.ino.chat.dto.ChatDTO;
import com.ino.chat.dto.MsgDTO;
import com.ino.delivery.dto.RiderDTO;
import com.ino.member.dto.MemberDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dao.*;

@Service
public class ChatService {
	
	@Autowired ChatDAO dao;
	@Autowired SalesDAO dao2;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public ArrayList<ChatDTO> list(String loginId) {
		
		return dao.list(loginId);
	}

	public ArrayList<MsgDTO> msglist(int id) {
		// TODO Auto-generated method stub
		return dao.msglist(id);
	}

	public ArrayList<String> userlist(int roomid) {
		// TODO Auto-generated method stub
		return dao.userlist(roomid);
	}

	public void msgsend(HashMap<String, String> params) {
		logger.info("service msgsend: " + params);
		dao.msgsend(params);
	}

	public void recentmsg(HashMap<String, String> params) {
		dao.recentmsg(params);
	}
	
	public void recentmsgno(HashMap<String, String> params) {
		dao.recentmsgno(params);
	}
	
	public void recentmsgtime(HashMap<String, String> params) {
		dao.recentmsgtime(params);
	}

	public int newroom(String saleno, String loginId, String username) {
		// TODO Auto-generated method stub
		logger.info("newchat service");
		dao.newchat(saleno, username);
		int roomid = dao.lastroom();
		dao.roomjoin(roomid,loginId);
		dao.roomjoin(roomid,username);
		
		return roomid;
	}
	
	public int newroom2(String offers_no, String loginId, String username) {
		logger.info("newchat2 service");
		dao.newchat2(offers_no, username);
		int roomid = dao.lastroom();
		dao.roomjoin(roomid,loginId);
		dao.roomjoin(roomid,username);
		
		return roomid;
	}

	public String salephoto(String msg_div_no) {
		// TODO Auto-generated method stub
		return dao.salephoto(msg_div_no);
	}
	
	public String salephoto2(String msg_div_no) {
		// TODO Auto-generated method stub
		return dao.salephoto2(msg_div_no);
	}

	public String userphoto(String roomusername) {
		// TODO Auto-generated method stub
		return dao.userphoto(roomusername);
	}

	public String issale(int id) {
		// TODO Auto-generated method stub
		return dao.issale(id);
	}

	public int salenum(int id) {
		// TODO Auto-generated method stub
		return dao.salenum(id);
	}
	
	public int salenum2(int id) {
		// TODO Auto-generated method stub
		return dao.salenum2(id);
	}

	public SalesDTO msgsale(int salenum) {
		// TODO Auto-generated method stub
		return dao.msgsale(salenum);
	}

	public String msguser(int id, String loginId) {
		// TODO Auto-generated method stub
		return dao.msguser(id, loginId);
	}

	public MemberDTO username(String msguser) {
		// TODO Auto-generated method stub
		return dao.username(msguser);
	}

	public void chatsaledone(String modalsaleid) {
		dao.chatsaledone(modalsaleid);
	}

	public String findroomuser(String user_id, String sales_no) {
		// TODO Auto-generated method stub
		return dao.findroomuser(user_id, sales_no);
	}
	
	public String findroomuser2(String user_id, String offers_no) {
		// TODO Auto-generated method stub
		return dao.findroomuser2(user_id, offers_no);
	}

	public void imgmsgsend(HashMap<String, String> params, MultipartFile[] uploadFile) {
		MsgDTO dto = new MsgDTO();
		dto.setFrom_id(params.get("id"));
		dto.setRoomid(Integer.parseInt(params.get("roomid")));
		dto.setMsg_content(params.get("msg"));
		
		dao.chatmsgsend(dto);
		dao.recentmsg(params);
		dao.recentmsgno(params);
		dao.recentmsgtime(params);
		
		int idx = dto.getMsg_no();
		
		for (MultipartFile photo : uploadFile) {
			logger.info("photo 여부 :"+photo.isEmpty());
			if(photo.isEmpty()==false) {
				
				chatFileSave(idx, photo);
				
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
			}
		}
	}
	
	private void chatFileSave(int idx, MultipartFile photo) {
		// TODO Auto-generated method stub
		String ori_photo_name = photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String cate_no = "p004";
		String new_photo_name = System.currentTimeMillis() + ext;
		logger.info(ori_photo_name+"=>"+new_photo_name);
		
		try {
			byte[] bytes = photo.getBytes();
			
			Path path = Paths.get("C:/img/upload/"+new_photo_name);
			Files.write(path, bytes);
			logger.info(new_photo_name+" save OK");
			
			dao2.fileWrite(ori_photo_name, new_photo_name, idx, cate_no);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> riderlist(String loginId) {
		// TODO Auto-generated method stub
		return dao.riderlist(loginId);
	}

	public String offergetuserid(String offers_no) {
		// TODO Auto-generated method stub
		return dao.offergetuserid(offers_no);
	}

	public String getsalephotobydelivery(String msg_div_no) {
		// TODO Auto-generated method stub
		return dao.getsalephotobydelivery(msg_div_no);
	}

	public RiderDTO getdelivery(int id) {
		// TODO Auto-generated method stub
		return dao.getdelivery(id);
	}
}
