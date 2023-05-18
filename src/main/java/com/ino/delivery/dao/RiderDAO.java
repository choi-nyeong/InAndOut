package com.ino.delivery.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.delivery.dto.RiderDTO;

public interface RiderDAO {

	ArrayList<RiderDTO> listRO();

	RiderDTO dtoROD(String delivery_offer_no);

	ArrayList<RiderDTO> listDH();

	// ArrayList<RiderDTO> listDS();

	RiderDTO dtoUO(String rider_id);

	// ArrayList<RiderDTO> listRL();

	//int uoWrite(RiderDTO dto);

	RiderDTO dtoUOS(String msg_div_no);

	int deliveryUpdate(String idx);

	int deliveryInsert(String idx);

	int deliveryNone(String idx);

	//ArrayList<RiderDTO> selectBySC(String delivery_state, String delivery_offer_no);

	HashMap<String, Object> selectAjax(RiderDTO dto);

	int writeUO(RiderDTO dto);

	int totalCountRL();

	ArrayList<RiderDTO> listRL(int cnt, int offset);

	ArrayList<RiderDTO> listRO(int cnt, int offset);

	int totalCountRO();

	int totalCountDS(String loginId);

	ArrayList<RiderDTO> listDS(int cnt, int offset, String loginId);

	int totalCountDH(String state, String loginId);

	// ArrayList<RiderDTO> listDH(int cnt, int offset);

	ArrayList<RiderDTO> filtering(String state, String loginId);

	String userC(String user_id);

	Integer mystar(String starid);

	String getPhotoName(String userId, String string);

	int rideroffer(String user_id);

	int riderdelivery(String user_id, String string);

	RiderDTO mypage(String id);

	//ArrayList<RiderDTO> filtering(HashMap<String, String> params);


}
