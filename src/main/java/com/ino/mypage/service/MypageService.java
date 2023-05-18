package com.ino.mypage.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ino.mypage.DAO.MypageDAO;
import com.ino.mypage.dto.MypageDTO;


@Service
public class MypageService {
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MypageDAO dao;

	public MypageDTO mypage(String id) {
		logger.info("db에 있는 값 가져오는중");
		return dao.mypage(id);
	}

	public int mystar(String starid) {
		
		return dao.mystar(starid);
		
	}

	public MypageDTO myrider(String riderid) {
		// TODO Auto-generated method stub
		return dao.myrider(riderid);
	}

	public ArrayList<MypageDTO> saleslist(String writerid) {
		// TODO Auto-generated method stub
		return dao.saleslist(writerid);
	}

	public ArrayList<MypageDTO> galleryList(String writerid) {
		// TODO Auto-generated method stub
		return dao.galleryList(writerid);
	}

	public int countsales(String writerid) {
		// TODO Auto-generated method stub
		return dao.countsales(writerid);
	}

	public int countgallery(String writerid) {
		// TODO Auto-generated method stub
		return dao.countgallery(writerid);
	}
	
	public int rideroffer(String user_id) {
		// TODO Auto-generated method stub
		return dao.rideroffer(user_id);
	}

	public int riderdelivery(String user_id, String string) {
		// TODO Auto-generated method stub
		return dao.riderdelivery(user_id,string);
	}

	public int star001(String riderstarid) {
		// TODO Auto-generated method stub
		return dao.star001(riderstarid);
	}

	public int star002(String riderstarid) {
		// TODO Auto-generated method stub
		return dao.star002(riderstarid);
	}

	public int star003(String riderstarid) {
		// TODO Auto-generated method stub
		return dao.star003(riderstarid);
	}

	public MypageDTO riderdetail(String user_id) {
		// TODO Auto-generated method stub
		return dao.riderdetail(user_id);
	}

	public String riderUpdatedo(HashMap<String, String> params) {
		String page = "redirect:/riderPage";
		String user_id = params.get("user_id");
		int row = dao.riderUpdatedo(params);
		logger.info("업데이트한 갯수 :"+ row);
		logger.info("업데이트한 유저 아이디 : "+user_id);
		if(row>0) {
			page="redirect:/riderPage?user_id="+user_id;
		}
		
		return page;
	}

	public MypageDTO riderSetting(String rider_id) {
		// TODO Auto-generated method stub
		return dao.riderSetting(rider_id);
	}

	public HashMap<String, String> riderSettingdo(MultipartFile photo,HashMap<String, String> params, HttpSession session) {
		
		String user_id = (String) session.getAttribute("loginId");
		logger.info("이메일까지 추가한 params : "+params);
		int row = dao.riderSettingdo(params);
		logger.info("업데이트한 갯수 :"+ row);
		logger.info("업데이트한 유저 아이디 : "+user_id);
		String page = "redirect:/riderPage?user_id="+user_id;
		
			logger.info("photo 여부 :"+photo.isEmpty());
			HashMap<String, String> map = new HashMap<String, String>();
			if(photo.isEmpty()==false) {
				String userdiv = dao.userdiv(user_id);
				if(userdiv.equals("a") || userdiv.equals("b")) {
					map = fileSave(user_id, photo, session);
					page = "redirect:/myPage.go?user_id="+user_id;
				}
				map = fileSave(user_id, photo, session);
				
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
		}
	
			
			String new_photo_name = map.get("new_photo_name");
			logger.info("서비스 바뀐이름 : "+ new_photo_name);
			map.put("page", page);
			map.put("new_photo_name", new_photo_name);
			return map;
	}
		

	public HashMap<String, String> fileSave(String user_id, MultipartFile photo, HttpSession session) {
		
		String ori_photo_name = photo.getOriginalFilename();
		String cate_no = "p001";
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		logger.info("예전 이름 : "+ori_photo_name);
		
		String new_photo_name = System.currentTimeMillis()+ext;
		logger.info("바뀐이름 : "+new_photo_name);
		
		try {
			byte[] bytes = photo.getBytes();
			//1-5 추출한 바이트 저장
			Path path = Paths.get("C:/img/upload/"+new_photo_name); 
			Files.write(path, bytes);
			logger.info(new_photo_name+" save OK");
			//2. 저장 정보를 DB에 저장
			//2-1 가져온 idx, oriFileName, newFileName 인서트하기
			dao.fileWrited(ori_photo_name,new_photo_name,user_id, cate_no);
			dao.fileWrite(ori_photo_name,new_photo_name,user_id, cate_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String page = "redirect:/riderPage?user_id="+user_id;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", page);
		map.put("new_photo_name", new_photo_name);
		return map;
	}

	public HashMap<String, Object> overlay3(String nickname) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			// 같은 닉네임이 있는가? 있으면 1 없으면 0
			map.put("overlay3", dao.overlay3(nickname));		
			return map;
		}

	public String getPhotoName(String userId, String string) {
		// TODO Auto-generated method stub
		return dao.getPhotoName(userId,string);
	}

	public void userSetting(HashMap<String, String> params) {
		dao.userSetting(params);
		
	}

	public int countinterest(String writerid) {
		return dao.countinterest(writerid);
	}

//	public HashMap<String, Object> pwcheck(String oripassword) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		String page = "useSetting";
//		map.put("oripassword", oripassword);
//		map.put("page", page);
//		return map;
//	}

	
	public void userBizdo(MultipartFile photo, HashMap<String, String> params, String user_id, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map = fileSaveBiz(user_id, photo, session);
		
		try {
			Thread.sleep(1);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	
	String new_biz_photo = map.get("new_biz_photo");
	logger.info("서비스 바뀐이름 : "+ new_biz_photo);
	map.put("new_biz_photo", new_biz_photo);
	dao.userBizdo(params);
}

		public HashMap<String, String> fileSaveBiz(String user_id, MultipartFile photo, HttpSession session) {
		
		String ori_biz_photo = photo.getOriginalFilename();
		String cate_no = "p002";
		String ext = ori_biz_photo.substring(ori_biz_photo.lastIndexOf("."));
		logger.info("예전 이름 : "+ori_biz_photo);
		
		String new_biz_photo = System.currentTimeMillis()+ext;
		logger.info("바뀐이름 : "+new_biz_photo);
		
		try {
			byte[] bytes = photo.getBytes();
			//1-5 추출한 바이트 저장
			Path path = Paths.get("C:/img/upload/"+new_biz_photo); 
			Files.write(path, bytes);
			logger.info(new_biz_photo+" save OK");
			//2. 저장 정보를 DB에 저장
			//2-1 가져온 idx, oriFileName, newFileName 인서트하기
			dao.fileWrited(ori_biz_photo,new_biz_photo,user_id, cate_no);
			dao.fileWrite(ori_biz_photo,new_biz_photo,user_id, cate_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String page = "redirect:/myPage?user_id="+user_id;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", page);
		map.put("new_biz_photo", new_biz_photo);
		return map;
	}

	public String userBiz(String user_id) {
		
		return dao.userBiz(user_id);
	}

	public ArrayList<MypageDTO> interestSaleList(String user_id, String attention_div) {
		return dao.interestSaleList(user_id,attention_div);
	}

	public ArrayList<MypageDTO> interestglList(String user_id, String attention_div) {
		// TODO Auto-generated method stub
		return dao.interestglList(user_id,attention_div);
	}

	public void userdiv_update(String string) {
		dao.userdiv_update(string);
		
	}




	
	
	/*
	 * public MypageDTO riderdetail(String user_id, String string) { // TODO
	 * Auto-generated method stub return dao.riderdetail(user_id); }
	 * 
	 * public String riderUpdatedo(MultipartFile photo, HashMap<String, String>
	 * params) { String page = "redirect:/riderPage"; String id =
	 * params.get("user_id"); int row = dao.update(params);
	 * if(!photo.getOriginalFilename().equals("")) { fileSave(id, photo); }
	 * if(row>0) { page="redirect:/riderUpdate.go?user_id="+id; } return page; }
	 * 
	 * private void fileSave(String id, MultipartFile photo) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 */
	
	
}
