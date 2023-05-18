package com.ino.mypage.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.ino.mypage.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO mypage(String id);

	Integer mystar(String starid);

	MypageDTO myrider(String riderid);

	ArrayList<MypageDTO> saleslist(String writerid);

	ArrayList<MypageDTO> galleryList(String writerid);

	int countsales(String writerid);

	int countgallery(String writerid);

	int countinterest(String writerid);

	int star001(String star001);

	int star002(String star002);

	int star003(String star003);

	MypageDTO riderdetail(String user_id);

	int riderUpdatedo(HashMap<String, String> params);

	MypageDTO riderSetting(String rider_id);

	int riderSettingdo(HashMap<String, String> params);

	Object overlay3(String nickname);

	int riderprofilept(HashMap<String, String> params);

	void fileWrite(String ori_photo_name, String new_photo_name, String user_id, String cate_no);

	int join(HashMap<String, String> params);

	void fileWrited(String ori_photo_name, String new_photo_name, String user_id, String cate_no);

	String getPhotoName(String userId, String string);

	String userdiv(String user_id);

	void userSetting(HashMap<String, String> params);

	void userBizdo(HashMap<String, String> params);

	String userBiz(String user_id);

	ArrayList<MypageDTO> interestSaleList(String user_id, String attention_div);

	ArrayList<MypageDTO> interestglList(String user_id, String attention_div);

	int rideroffer(String user_id);

	int riderdelivery(String user_id, String string);

	void userdiv_update(String string);



	


	/*
	 * MypageDTO riderdetail(String user_id);
	 * 
	 * int update(HashMap<String, String> params);
	 */
	
	

}
