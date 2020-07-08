package com.corona.main;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class MainJson {
	String jsonString = "";
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
	
	}
	
}
