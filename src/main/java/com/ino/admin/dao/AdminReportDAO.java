package com.ino.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.ino.admin.dto.AdminReportDTO;

public interface AdminReportDAO {

	ArrayList<AdminReportDTO> ureportlist();

	AdminReportDTO ureportdetail(String report_no);

	int utotalCount();

	ArrayList<AdminReportDTO> ulist(int offset);

	int stotalCount();

	ArrayList<AdminReportDTO> slist(int offset);

	AdminReportDTO sreportdetail(String report_no);

	AdminReportDTO greportdetail(String report_no);


	void gblindchange(String report_no);

	void blindnochange(String report_no);

	ArrayList<AdminReportDTO> glist(int offset);

	int gtotalCount();

	int blind_history(@Param("report_no")String report_no, @Param("report_id")String report_id, @Param("report_content")String report_content);

	void ublindchange(String report_no);


}
