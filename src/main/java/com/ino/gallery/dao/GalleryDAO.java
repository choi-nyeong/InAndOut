package com.ino.gallery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.gallery.dto.GalleryDTO;

public interface GalleryDAO {

	int galleryWrite(GalleryDTO dto);

	int GalleryTotalCount();

	ArrayList<GalleryDTO> list(int cnt, int offset, String filterName);

	void fileWrite(String ori_photo_name, String new_photo_name, int idx, String cate_no);

	GalleryDTO galleryDetail(int gallery_no);

	void upHit(int gallery_no);

	ArrayList<String> galleryDetailPhoto(int gallery_no);

	int attentionCheck(String loginId, String gallery_no);

	void addAttention(String loginId, String gallery_no);

	void addGalleryAttention(String gallery_no);

	void removeAttention(String loginId, String gallery_no);

	void removeGalleryAttention(String gallery_no);

	int galleryDelete(String gallery_no);

	ArrayList<GalleryDTO> galleryFilteringList(String filterName);

	ArrayList<String> hasFile(String gallery_no);

	ArrayList<String> galleryHasFile(String gallery_no);

	void removeFileName(String fileName);

	int galleryUpdate(HashMap<String, String> params);



}
