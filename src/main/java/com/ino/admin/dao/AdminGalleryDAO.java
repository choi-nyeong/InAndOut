package com.ino.admin.dao;

import java.util.ArrayList;

import com.ino.admin.dto.AdminGalleryDTO;

public interface AdminGalleryDAO {


	int totalCount();

	ArrayList<AdminGalleryDTO> list(int offset);

	int gblind(String id); 

}
