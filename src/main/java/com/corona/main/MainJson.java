package com.corona.main;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class MainJson {
	String jsonString = "";
	String jsonString1 = "";
	String jsonString2 = "";
	StringBuffer response = null;
	MainJson() throws Exception {
		String address ="http://api.corona-19.kr/korea/?serviceKey=2f3458c475483f2337f8f4ff7a5af3c66";
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";
		
		url = new URL(address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    
		String json = "";
		while ((json = br.readLine()) != null) {
			jsonString += json;
		}
		
		
		
		String address1 = "http://api.corona-19.kr/korea/country/new/?serviceKey=2f3458c475483f2337f8f4ff7a5af3c66";
		BufferedReader br1;
		URL url1;
		HttpURLConnection conn1;
		String protocol1 = "GET";
		
		url1 = new URL(address1);
		conn1 = (HttpURLConnection)url1.openConnection();
		conn1.setRequestMethod(protocol1);
		br1 = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
		
		String json1 = "";
		while ((json1 = br1.readLine()) != null) {
			jsonString1 += json1;
		}
		
		
		String address2 = "https://api.covid19api.com/summary";
		BufferedReader br2;
		URL url2;
		HttpURLConnection conn2;
		String protocol2 = "GET";
		
		url2 = new URL(address2);
		conn2 = (HttpURLConnection)url2.openConnection();
		conn2.setRequestMethod(protocol2);
		br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
		
		String json2 = "";
		while ((json2 = br2.readLine()) != null) {
			jsonString2 += json2;
			
		}

		
		
		// 네이버 뉴스 API
		System.out.println("==== 검색 API 호출====");
		String clientId = "v1vx3MIovnD2bp342z4k";
		String clientSecret = "B4fiYq1N2R";
		try {
		String text = URLEncoder.encode("코로나 확진", "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text +"&start=1&display=6&sort=sim";
		URL url3 = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url3.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		// response 수신
		int responseCode = con.getResponseCode();
		System.out.println("responseCode="+ responseCode);
		if(responseCode==200) {
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
		response.append(inputLine);
		//System.out.println(inputLine);
		}
		in.close();
		//System.out.println(response.toString());
		} else {
		System.out.println("API 호출 에러 발생 : 에러코드=" + responseCode);
		}
		} catch (Exception e) {
		System.out.println(e);
		}

	}
	
}

