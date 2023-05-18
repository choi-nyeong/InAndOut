package com.ino.report.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ino.report.dao.ReportDAO;

@Service
public class ReportService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReportDAO dao;
	
	public int salesReportWrite(HashMap<String, String> params) {
		
		return dao.salesReportWrite(params);
	}

	public int galleryReportWrite(HashMap<String, String> params) {

		return dao.galleryReportWrite(params);
	}
	
}
