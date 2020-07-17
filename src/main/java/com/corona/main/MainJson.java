package com.corona.main;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MainJson {
	String jsonString = "";
	String jsonString1 = "";
	String jsonString2 = "";
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
		
		
		System.out.println(jsonString2);

	}
	
}
