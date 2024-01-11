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
		
		//JsonArray jarr = JsonParser.parseString(text).getAsJsonArray();
		
		
		System.out.println("JSON 데이터: " + text);
		//System.out.println("JSON jarr 데이터: " + jarr);
		
		/*
		 * Gson gson = new Gson(); RecyclingInfo recyclingInfo = gson.fromJson(text,
		 * RecyclingInfo.class);
		 * 
		 * String wsteQty = recyclingInfo.getWsteQty(); String totRecyQty =
		 * recyclingInfo.getTotRecyQty();
		 */
		
		
//		System.out.println("연도발생량" + wsteQty);
//		System.out.println("연도재활용" + totRecyQty);

		
		/*
		 * JsonParser jsonParser = new JsonParser(); JsonReader jsonReader = new
		 * JsonReader(new StringReader(text)); jsonReader.setLenient(true);
		 * 
		 * JsonObject total = jsonParser.parse(jsonReader).getAsJsonObject();
		 */

		
		//JsonObject total = JsonParser.parseString(text).getAsJsonObject();
		//JsonObject total = jsonParser.parse(text).getAsJsonObject();
		JsonObject total = JsonParser.parseString(text).getAsJsonObject();
		JsonArray items = total.getAsJsonArray("data");
		
		ArrayList<RecyclingInfo> list = new ArrayList<> ();
		
		
		System.out.println("items : "+ items);


//		for(int i = 0; i < items.size(); i++) {
//			
//			RecyclingInfo info = new RecyclingInfo();
//
//			JsonObject item = items.get(i).getAsJsonObject();
//			
//			info.setWsteQty(item.get("wsteQty").getAsString());
//			info.setTotRecyQty(item.get("totRecyQty").getAsString());
//			
//			list.add(info);
//			
//			
//		}
		
		for(int i = 0; i < items.size(); i++) {
			
			JsonObject item = items.get(i).getAsJsonObject();
			
			String wsteQty = item.get("WSTE_QTY").getAsString();
			
			System.out.println(wsteQty);
			String totRecyQty = item.get("TOT_RECY_QTY").getAsString();
			
			System.out.println(wsteQty);
			System.out.println(totRecyQty);
			//RecyclingInfo info = new Gson().fromJson(items.get(i).getAsJsonObject(), RecyclingInfo.class);
		
			
			//list.add(info);
		}
		

//		for(RecyclingInfo info:list) {
//			
//			System.out.println("wsteQty: " + info.getWsteQty());
//		    System.out.println("totRecyQty: " + info.getTotRecyQty());
//
//		}
		
		br.close();
		urlCon.disconnect();
		
		
		
		return list;
		
	}
	
	
	
}
