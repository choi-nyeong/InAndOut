package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.AdminCategoryDTO;
import com.ino.admin.dto.AdminMemberDTO;
import com.ino.admin.dto.AdminStarDTO;


public interface AdminStarDAO {

	ArrayList<AdminCategoryDTO> categorylist();

	ArrayList<AdminStarDTO> starlist();

	int totalCount();

	ArrayList<AdminStarDTO> list(int offset);

	int starwrite(HashMap<String, String> params);

	int staroverlay(String cate_no);

	int starupdate(HashMap<String, String> map);

	AdminStarDTO stardetail(String cate_no);




}
