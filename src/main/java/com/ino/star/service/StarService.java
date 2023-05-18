package com.ino.star.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.sales.dto.SalesDTO;
import com.ino.star.dao.StarDAO;
import com.ino.star.dto.CategoryDTO;
import com.ino.star.dto.StarDTO;

@Service
public class StarService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired StarDAO dao;

	public ArrayList<CategoryDTO> getStarList() {
		
		return dao.getStarList();
	}

	public SalesDTO salesDetail(int sales_no, String string) {
		
		return dao.salesDetail(sales_no);
	}

	public String areYouBuyer(String sales_no, String user_id) {
		
		return dao.areYouBuyer(sales_no, user_id);
	}

	public int insertStar(HashMap<String, String> params) {
		
		StarDTO dto = new StarDTO();
		
		String star_div_no = params.get("star_div_no");
		String user_id = params.get("user_id");
		
		dto.setStar_div_no(Integer.parseInt(star_div_no));
		dto.setStar_div("판매");
		dto.setStar_to_id(user_id);
		
		logger.info("params : "+params);
		int row = dao.insertStar(dto);
		
		if(row==1) {
			int star_no = dto.getStar_no();
			
			dao.insertStarTest("star001", star_no, params.get("star001"));
			dao.insertStarTest("star002", star_no, params.get("star002"));
			dao.insertStarTest("star003", star_no, params.get("star003"));
		}
		
		return row;
	}
	
}
