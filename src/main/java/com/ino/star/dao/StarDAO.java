package com.ino.star.dao;

import java.util.ArrayList;
import com.ino.sales.dto.SalesDTO;
import com.ino.star.dto.CategoryDTO;
import com.ino.star.dto.StarDTO;

public interface StarDAO {

	ArrayList<CategoryDTO> getStarList();

	SalesDTO salesDetail(int sales_no);

	String areYouBuyer(String sales_no, String user_id);

	int insertStar(StarDTO dto);

	void insertStarTest(String star_category_no, int star_no, String star_score);

}
