package com.kh.littleEco.about.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import com.kh.littleEco.about.model.vo.RecyclingInfo;

import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;

@Controller
public class aboutOpenData {
	//about 페이지 중반에 들어가는 공공데이터
	
	public static final String serviceKey = "WRXVTC0YCOV53RBSRWYOT2EQSQMCZ9JB9SYWYW8VSWL8K";
	
	@RequestMapping(value="recycling.api", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<RecyclingInfo> recyclingInfo() throws  UnsupportedEncodingException, IOException, JsonSyntaxException {
		
		String url = "https://www.recycling-info.or.kr/sds/JsonApi.do?";
		
		url += "PID=NTN004";
				
		url += "&YEAR=2021";	
				
		url += "&USRID=hawon727";
	
		url += "&KEY="+serviceKey;
		
		URL requestUrl = new URL(url);
		
		HttpURLConnection urlCon = (HttpURLConnection)requestUrl.openConnection();
		
		urlCon.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
		
		String text = "";
		
		String line;
	
		while((line = br.readLine()) != null) {
			
			text += line;
			
		}
		
		
		JsonObject total = JsonParser.parseString(text).getAsJsonObject();
		JsonArray items = total.getAsJsonArray("data");
		
		ArrayList<RecyclingInfo> list = new ArrayList<> ();
		
		for(int i = 0; i < items.size(); i++) {
			
			JsonObject item = items.get(i).getAsJsonObject();
			
			String wsteQty = item.get("WSTE_QTY").getAsString();

			String totRecyQty = item.get("TOT_RECY_QTY").getAsString();
			
		}
			
		br.close();
		urlCon.disconnect();
		
		
		
		return list;
		
	}
	
	
	
}
