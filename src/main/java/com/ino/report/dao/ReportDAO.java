package com.ino.report.dao;

import java.util.HashMap;

public interface ReportDAO {

	int salesReportWrite(HashMap<String, String> params);

	int galleryReportWrite(HashMap<String, String> params);

}
