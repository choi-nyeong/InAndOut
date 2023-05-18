// API 등 기능 테스트에 쓰이는 컨트롤러

package com.ino.test.controller;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.ObjectMapper;
import com.mashape.unirest.http.Unirest;

@Controller
public class TestController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/testjoin", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("msg", "msg test");
		
		return "test/joinForm";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(Locale locale, Model model, @RequestParam HashMap<String, String> param) {
		logger.info("param: " + param);
		
		model.addAttribute("param", param);
		
		String apiKey = "f8e2fd8b0dc1e2d4a8d9510fd40014f2";
		String address = param.get("address");
		
	    String jsonString = null;
	    
	    try {
	    	String apiURL = "https://dapi.kakao.com/v2/local/search/address.json?query=" 
	                + URLEncoder.encode(address, "UTF-8");
	    	HttpResponse<JsonNode> response = Unirest.get(apiURL)
	                .header("Authorization", "KakaoAK "+ apiKey)
	                .asJson();
	    	
	    	logger.info("result: " + response.getHeaders());
	    	logger.info("result: " + response.getBody());
	    	
	    	JSONObject jsonObject = new JSONObject(response.getBody());
	    	logger.info("result: " + jsonObject.toString());
//	    	JSONArray jsonMap = jsonObject.getJSONArray("array");
//	    	logger.info("result: " + jsonMap.toString());
	    	JSONObject jsonBody = (JSONObject) jsonObject.getJSONObject("object");
	    	logger.info("result: " + jsonBody.toString());
	    	JSONArray jsonDocuments = jsonBody.getJSONArray("documents");
	    	logger.info("result: " + jsonDocuments.toString());
	    	JSONObject jsonAddress = (JSONObject) jsonDocuments.opt(0);
	    	
	    	
	    	String x = jsonAddress.getString("x");
	    	String y = jsonAddress.getString("y");
	    	
	    	logger.info("x: {} / y: {}",x,y);
	    	model.addAttribute("username", param.get("name"));
	    	model.addAttribute("address", param.get("address") + " " + param.get("addressDetail"));
	    	model.addAttribute("posX", x);
	    	model.addAttribute("posY", y);
	    	
	    } catch (Exception e) {e.printStackTrace();}
		
		return "test/map";
	}
	
	
	
}
