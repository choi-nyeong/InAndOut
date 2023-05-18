package com.ino.sales.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.AdminGalleryDTO;
import com.ino.sales.dto.BizDTO;
import com.ino.sales.dto.SalesDTO;
import com.ino.sales.dto.goodsDTO;

public interface SalesDAO {

	String getUserSido(String loginId);

	String getUserSigungu(String loginId);

	ArrayList<SalesDTO> salesList(HashMap<String, String> userParams);
	
	String getBiz_name(String biz_id);

	ArrayList<BizDTO> getBizList();
	
	int salesWrite(SalesDTO dto);

	void fileWrite(String ori_photo_name, String new_photo_name, int idx, String cate_no);

	ArrayList<goodsDTO> goodsCall(String biz_id);

	SalesDTO salesDetail(int sales_no);

	void upHit(int sales_no);

	ArrayList<String> salesDetailPhoto(int sales_no);

	void salesDelete(String sales_no);

	int attentionCheck(String loginId, String sales_no);

	void addAttention(String loginId, String sales_no);

	void addSalesAttention(String sales_no);
	
	void removeAttention(String loginId, String sales_no);

	void removeSalesAttention(String sales_no);

	int salesUpdate(HashMap<String, String> params);

	void removeFileName(String fileName);

	int salesTotalCount(HashMap<String, String> userParams);








}
