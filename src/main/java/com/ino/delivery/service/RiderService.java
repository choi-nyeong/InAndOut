package com.ino.delivery.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.delivery.dao.RiderDAO;
import com.ino.delivery.dto.RiderDTO;

@Service
public class RiderService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RiderDAO dao;
	
	//public ArrayList<RiderDTO> listRO() {
	//	logger.info("listRO 서비스 이동");
	//	return dao.listRO();
	//}

	public RiderDTO dtoROD(String delivery_offer_no) {
		logger.info("dtoROD 서비스 이동");
		return dao.dtoROD(delivery_offer_no);
		//,sales_no
	}

	public ArrayList<RiderDTO> listDH() {
		logger.info("listDH 서비스 이동");
		return dao.listDH();
	}

	//public ArrayList<RiderDTO> listDS() {
	//	return dao.listDS();
	//}

	public RiderDTO dtoUO(String rider_id) {
		logger.info("dtoUO 서비스 도착 : "+ rider_id);
		return dao.dtoUO(rider_id);
	}
	
	public RiderDTO dtoUOS(String msg_div_no) {
		logger.info("dtoUOS msg_div_no" + msg_div_no);
		
		return dao.dtoUOS(msg_div_no);
	}

	/*
	 * public ArrayList<RiderDTO> listRL() { return dao.listRL(); }
	 */

	/*
	 * public String uoWrite(HashMap<String, String> params) {
	 * 
	 * RiderDTO dto = new RiderDTO();
	 * 
	 * logger.info("params :" + params); dto.setFrom_addr(params.get("from_addr"));
	 * dto.setTo_addr(params.get("to_addr"));
	 * 
	 * int row = dao.uoWrite(dto); logger.info("update row :" + row);
	 * 
	 * return "riderOffer"; }
	 */

	



	public void deliveryInsert(String idx) {
		
		int row = dao.deliveryInsert(idx);
		logger.info("insert 횟수(1 정상)"+row);
		
	}

	public void deliveryUpdate(String idx) {
		
		int row =dao.deliveryUpdate(idx);
		logger.info("update 횟수(1 정상)"+row);
	}

	public void deliveryNone(String idx) {

		int row = dao.deliveryNone(idx);
		logger.info("update 횟수(1 정상)"+row);
		
	}

	/*
	  public ArrayList<RiderDTO> select(String delivery_state, String delivery_offer_no) {
	  
	  logger.info(delivery_state,delivery_offer_no);
	  
	  return dao.selectBySC(delivery_state,delivery_offer_no); 
	  }
	 */

	public HashMap<String, Object> selectAjax(HashMap<String, String> params) {
	
		logger.info("params 값" + params);
		
		RiderDTO dto = new RiderDTO();
		dto.setDelivery_accept_no(Integer.parseInt(params.get("delivery_offer_no")));
		dto.setDelivery_state(params.get("delivery_state"));
		
		logger.info("dto delivery_accept_no : "+dto.getDelivery_accept_no());
		logger.info("dto Delivery_state : "+dto.getDelivery_state());
		
		return dao.selectAjax(dto);
	}

	public String writeDo(HashMap<String, String> params, String user_div) {
		
		logger.info("params 값 : " + params);
		
		
		String page = "redirect:/riderList";
		
		RiderDTO dto = new RiderDTO();
		dto.setUser_id(params.get("user_id"));
		dto.setSales_no(Integer.parseInt(params.get("sales_no")));
		dto.setFrom_addr(params.get("from_addr"));
		dto.setTo_addr(params.get("to_addr"));
		dto.setRider_id(params.get("rider_id"));
		dto.setUser_div(params.get("user_div"));
		
		logger.info("user_div : " + dto.getUser_div());
		logger.info("user_id : " + dto.getUser_id());
		logger.info("sales_no : " + dto.getSales_no());
		logger.info("From_addr : " + dto.getFrom_addr());
		logger.info("To_addr : " + dto.getTo_addr());
		logger.info("rider_id : " + dto.getRider_id());
		
		int row = dao.writeUO(dto);
		logger.info("insert 횟수"+row);
		
		if(user_div.equals("c")) {
			page = "redirect:/riderOffer.go";
		} else {
			page = "redirect:/";
		}
		return page;
	}

	public HashMap<String, Object> riderListAjax(int page, int cnt) {
		logger.info(page+"페이지 보여줘");
		logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : ?
		// 3page = offset : ?
		
		int offset = cnt*(page-1);
		
		// 만들 수 있는 총 페이지 수
		// 전체 게시물 / 페이지당 보여줄 수
		int total = dao.totalCountRL();
		int range = total%cnt == 0?total/cnt : (total/cnt)+1;
		logger.info("전체 페이지 수 :" +total);
		logger.info("총 페이지 수:" +range);
		
		page = page > range ? range : page; 
		
		map.put("currPage", page);
		map.put("pages", range);
		map.put("total", total);
		
		ArrayList<RiderDTO> list = dao.listRL(cnt,offset);
		map.put("list", list);
		
		return map;
	}

	
	public HashMap<String, Object> riderOfferAjax(int page, int cnt) {
		logger.info(page+"페이지 보여줘");
		logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : ?
		// 3page = offset : ?
		
		int offset = cnt*(page-1);
		
		// 만들 수 있는 총 페이지 수
		// 전체 게시물 / 페이지당 보여줄 수
		int total = dao.totalCountRO();
		int range = total%cnt == 0?total/cnt : (total/cnt)+1;
		logger.info("전체 페이지 수 : " +total);
		logger.info("총 페이지 수: " +range);
		
		page = page > range ? range : page; 
		
		map.put("currPage", page);
		map.put("pages", range);
		map.put("total", total);
		
		ArrayList<RiderDTO> list1 = dao.listRO(cnt,offset);
		map.put("list", list1);
		
		return map;
	}

	public HashMap<String, Object> deliveryStateAjax(int page, int cnt, String loginId) {
		
		logger.info(page+"페이지 보여줘");
		logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : ?
		// 3page = offset : ?
		
		int offset = cnt*(page-1);
		
		// 만들 수 있는 총 페이지 수
		// 전체 게시물 / 페이지당 보여줄 수
		int total = dao.totalCountDS(loginId);
				
		int range = total%cnt == 0?total/cnt : (total/cnt)+1;
		logger.info("전체 페이지 수 : " +total);
		logger.info("총 페이지 수: " +range);
		
		page = page > range ? range : page; 
		
		map.put("currPage", page);
		map.put("pages", range);
		map.put("total", total);
		
		ArrayList<RiderDTO> list1 = dao.listDS(cnt,offset,loginId);
		map.put("list", list1);
		
		return map;
	}

	public String userC(String user_id) {

		return dao.userC(user_id);
	}

	/*public HashMap<String, Object> deliveryHistroyAjax(int page, int cnt) {
		
		logger.info(page+"페이지 보여줘");
		logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : ?
		// 3page = offset : ?
		
		int offset = cnt*(page-1);
		
		// 만들 수 있는 총 페이지 수
		// 전체 게시물 / 페이지당 보여줄 수
		int total = dao.totalCountDH();
		
		int range = total%cnt == 0?total/cnt : (total/cnt)+1;
		logger.info("전체 페이지 수 :" +total);
		logger.info("총 페이지 수:" +range);
		
		page = page > range ? range : page; 
		
		map.put("currPage", page);
		map.put("pages", range);
		
		ArrayList<RiderDTO> list1 = dao.listDH(cnt,offset);
		map.put("list", list1);
		
		return map;
	}
	*/

	public ArrayList<RiderDTO> filtering(String state, String loginId) {
	    logger.info("params 값 : " + state);
	    
	    return dao.filtering(state,loginId);
	}

	public int totalCountDH(String state, String loginId) {

		return dao.totalCountDH(state, loginId);
	}

	public int mystar(String starid) {
		
		return dao.mystar(starid);
	}

	public String getPhotoName(String userId, String string) {
		
		return dao.getPhotoName(userId,string);
	}

	public int rideroffer(String user_id) {
		
		return dao.rideroffer(user_id);
	}

	public int riderdelivery(String user_id, String string) {
		
		return dao.riderdelivery(user_id,string);
	}

	public RiderDTO mypage(String id) {
		logger.info("db에 있는 값 가져오는중");
		return dao.mypage(id);
	}
	

	/*
	public String selectDo(HashMap<String, String> params) {
		return dao.seletDo(params);
	}	
	*/


}
