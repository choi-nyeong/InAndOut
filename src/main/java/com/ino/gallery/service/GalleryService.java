package com.ino.gallery.service;

import java.io.File;
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

import com.ino.gallery.dao.GalleryDAO;
import com.ino.gallery.dto.GalleryDTO;

@Service
public class GalleryService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GalleryDAO dao;
	
	public String galleryWrite(MultipartFile[] photos, HashMap<String, String> params) {


		String page = "redirect:/galleryList.do";
		
		GalleryDTO dto = new GalleryDTO();
		
		logger.info("params :"+params);
		dto.setUser_id(params.get("user_id"));
		dto.setStore_name(params.get("store_name"));
		dto.setGallery_subject(params.get("gallery_subject"));
		dto.setGallery_content(params.get("gallery_content"));
		
		int row = dao.galleryWrite(dto);
		logger.info("updated row : "+row);
		
		int idx = dto.getGallery_no();
		logger.info("방금 insert한 idx : "+idx);
		
		for (MultipartFile photo : photos) {
			logger.info("photo 있으면 false, 없으면 true :"+photo.isEmpty());
			if(photo.isEmpty()==false) {
				
				fileSave(idx, photo);
				
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
			}
		}

		page = "redirect:/galleryDetail.do?gallery_no="+idx;

		return page;
	}

	private void fileSave(int idx, MultipartFile photo) {

		String ori_photo_name = photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String cate_no = "p006";
		String new_photo_name = System.currentTimeMillis() + ext;
		logger.info(ori_photo_name+"=>"+new_photo_name);
		
		try {
			byte[] bytes = photo.getBytes();
			
			Path path = Paths.get("C:/img/upload/"+new_photo_name);
			Files.write(path, bytes);
			logger.info(new_photo_name+" save OK");
			
			dao.fileWrite(ori_photo_name, new_photo_name, idx, cate_no);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public GalleryDTO galleryDetail(int gallery_no, String flag) {
		
		if(flag.equals("detail")) {
			logger.info("if문 진입");
			dao.upHit(gallery_no);
		}
		
		return dao.galleryDetail(gallery_no);
	}

	public ArrayList<String> galleryDetailPhoto(int gallery_no) {

		return dao.galleryDetailPhoto(gallery_no);
	}

	public int attentionCheck(String loginId, String gallery_no) {

		return dao.attentionCheck(loginId, gallery_no);
	}

	public void addAttention(String loginId, String gallery_no) {
		dao.addAttention(loginId, gallery_no);
		dao.addGalleryAttention(gallery_no);
	}

	public void removeAttention(String loginId, String gallery_no) {
		dao.removeAttention(loginId, gallery_no);
		dao.removeGalleryAttention(gallery_no);
	}

	public void galleryDelete(String gallery_no) {
		logger.info("gallery_no :"+gallery_no);

		ArrayList<String> newFileName = dao.galleryHasFile(gallery_no);//DB photo테이블에 관련 파일명이 몇개 있는지 찾고

		if(newFileName.size()>0) {// photo 테이블에 파일명이 있다면 일단 담는다. 
			int row = dao.galleryDelete(gallery_no);// gallery 테이블에서 데이터를 지움
			  
			if(row>0) {//지운 행이 1 이상이면
				fileDelete(newFileName);
			}
		}	
		
	}

	private void fileDelete(ArrayList<String> newFileName) {
		// 실제 파일도 제거해주고, DB photo 테이블 row도 제거해드립니다.
		for (String FileName : newFileName) {// for 문으로 하나씩 담아서 
			logger.info(FileName);
			File file = new File("C:/img/upload/"+FileName);// file 객체 생성 후 
			if(file.exists()) {// 파일이 존재하면 
				file.delete();// 파일을 삭제함
			}
			dao.removeFileName(FileName);
		}
		
	}

	public ArrayList<GalleryDTO> filtering(String filterName) {

		ArrayList<GalleryDTO> list = new ArrayList<GalleryDTO>();
		
		logger.info("filterName :"+filterName);
		
		list = dao.galleryFilteringList(filterName);
		
		return list;
	}

	public int galleryUpdate(MultipartFile[] photos, HashMap<String, String> params, ArrayList<String> removeFileName) {
		
		logger.info("params :"+params);

		int row = dao.galleryUpdate(params);
		int gallery_no = 0;
		logger.info("updated row : "+row);
		
		if(row>0) {//갤러리 글을 업데이트 시켰다면

			if(removeFileName.size()>1) {//삭제할 파일 리스트의 길이가 0보다 크다면
				fileDelete(removeFileName); //파일 삭제하고 photo 테이블의 파일도 삭제함.
			}
			
			gallery_no = Integer.parseInt(params.get("gallery_no"));
			
			for (MultipartFile photo : photos) {
				logger.info("photo 있으면 false, 없으면 true :"+photo.isEmpty());
				if(photo.isEmpty()==false) {
					
					fileSave(gallery_no, photo);
					
					try {
						Thread.sleep(1);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					
				}
			}
		}
		
		return gallery_no;
	}

	public HashMap<String, Object> filtered(HashMap<String, String> userParams) {
		
		int page = Integer.parseInt(userParams.get("page"));
		int cnt = Integer.parseInt(userParams.get("cnt"));
		String filterName = userParams.get("filterName");
		
		logger.info(page+" 페이지 보여줘");
		logger.info("한 페이지에 "+cnt+"개씩 보여줄거야");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//1 page = offset : 0
		//2 page = offset : 5
		//3 page = offset : 10
		// cnt 5개씩 page 1페이지
		
		int offset = cnt*(page-1);
		
		// paginatin plugin totalpages에 총 페이지 수를 계산해서 넘겨줘야 한다.
		// 만들 수 있는 총 페이지 수 = 전체 게시물 / 페이지당 보여줄 수
		int total = dao.GalleryTotalCount();
		int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
		logger.info("전체 게시물 수 :"+total);
		logger.info("총 페이지 수 :"+range);
		
		// 게시물 갯수를 변경했을 때 현재 페이지 상태에서 바뀐 게시물 갯수를 반영하지 못할 수 있음.
		// 조건문을 걸어서 range 보다 page가 크면 그 값을 range로 바꾼다.
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);
		
		ArrayList<GalleryDTO> list = dao.list(cnt, offset, filterName);	
		map.put("filteredList", list);
		
		return map;
	}



}
