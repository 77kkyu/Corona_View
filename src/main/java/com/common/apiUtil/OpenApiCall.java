package com.common.apiUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class OpenApiCall {
	
	public String coronaApi(String url) throws IOException { // 코로나 현황 API
		
		String apiurl = url;
		
		URL url1 = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection) url1.openConnection();
		con.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		
		return response.toString();
		
	}
	
	public String youtubeApiSearch(String search) throws IOException { // 유튜브 API 
		
		String apiurl = "https://www.googleapis.com/youtube/v3/search";
		apiurl += "?key=AIzaSyAex1RODP2dYCE-2ARw7gojCT0RS0-rsvg";
		apiurl += "&part=snippet";
		apiurl += "&q="+URLEncoder.encode(search,"UTF-8");
		
		URL url1 = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection) url1.openConnection();
		con.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		
		return response.toString();
	}
	
	public String naverNewsApi(String search) throws IOException { // 네이버 뉴스 API
		
		String clientId = "v1vx3MIovnD2bp342z4k";
		String clientSecret = "B4fiYq1N2R";
		try {
		String text = URLEncoder.encode(search, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text +"&start=1&display=6&sort=sim";
		URL url3 = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url3.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		// response 수신
		int responseCode = con.getResponseCode();
		System.out.println("responseCode="+ responseCode);
		StringBuffer response = new StringBuffer();
		if(responseCode==200) {
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		while ((inputLine = in.readLine()) != null) {
		response.append(inputLine);
		}
		in.close();
		return response.toString();
		} else {
		System.out.println("API 호출 에러 발생 : 에러코드=" + responseCode);
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		
		return null;
	}

	
	
	
}
