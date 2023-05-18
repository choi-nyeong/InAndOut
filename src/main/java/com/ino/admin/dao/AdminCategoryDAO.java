package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.ino.admin.dto.AdminCategoryDTO;
import com.ino.admin.dto.AdminStarDTO;


public interface AdminCategoryDAO {




	ArrayList<AdminCategoryDTO> list(int offset);

	AdminCategoryDTO goodsdetail(String goods_id);

	int goodsupdate(HashMap<String, String> params);

	ArrayList<AdminCategoryDTO> clist(HashMap<String, Object> params);

	ArrayList<AdminCategoryDTO> glist(HashMap<String, Object> params);

	int ctotalCount();

	int gtotalCount();



}
