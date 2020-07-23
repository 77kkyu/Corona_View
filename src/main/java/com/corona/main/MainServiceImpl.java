package com.corona.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.common.apiUtil.JsonParsing;
import com.common.apiUtil.OpenApiCall;
import com.corona.mainBean.KoreaTotalBean;
import com.corona.mainBean.LocationBean;


@Service("mainService")
public class MainServiceImpl implements MainService {
		
	JsonParsing jsonParsing = new JsonParsing();
	
	OpenApiCall openApiCall = new OpenApiCall();
	
	final static String countryUrl = "http://api.corona-19.kr/korea/country/new/?serviceKey=2f3458c475483f2337f8f4ff7a5af3c66";
	final static String KoreaTotalUrl = "http://api.corona-19.kr/korea/?serviceKey=2f3458c475483f2337f8f4ff7a5af3c66";

	@Override
	public List<LocationBean> coronaLocationApiSortList() throws Exception {
		
		JSONParser parser = new JSONParser();
		JSONObject jsonResult  = (JSONObject) parser.parse(openApiCall.coronaApi(countryUrl));
		Map<String, Object> locationMap = jsonParsing.getMapFromJsonObject(jsonResult);
		ArrayList<LocationBean> locations = new ArrayList<LocationBean>();
		
		for(Map.Entry<String, Object> entry : locationMap.entrySet()) { // entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용
			
			if(!entry.getKey().equals("resultCode") && !entry.getKey().equals("resultMessage") 
					 && !entry.getKey().equals("quarantine") ) { // 필요없는 데이터를 빼는 조건
				
				Map<String, String> map = (Map<String, String>) entry.getValue(); // 맵에 json으로 받은 데이터의 value값을 담아줌  
				LocationBean location = LocationBean.jsonToLocation(map, entry.getKey()); // Location Bean에 저장하는 메소드
				locations.add(location); // value값을 리스트에 담아줌 
				
			}
		}
		
		ArrayList<LocationBean> sortedLocations = jsonParsing.sortedLocations(locations);
		
		return sortedLocations;
	}

	@Override
	public List<LocationBean> coronaLocationList() throws Exception {
		
		JSONParser parser = new JSONParser();
		JSONObject jsonResult  = (JSONObject) parser.parse(openApiCall.coronaApi(countryUrl));
		
		Map<String, Object> locationMap = jsonParsing.getMapFromJsonObject(jsonResult);
		ArrayList<LocationBean> locations = new ArrayList<LocationBean>();
		
		for(Map.Entry<String, Object> entry : locationMap.entrySet()) { // entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용
			
			if(!entry.getKey().equals("resultCode") && !entry.getKey().equals("resultMessage") 
					&& !entry.getKey().equals("korea") && !entry.getKey().equals("quarantine") ) { // 필요없는 데이터를 빼는 조건
				
				Map<String, String> map = (Map<String, String>) entry.getValue(); // 맵에 json으로 받은 데이터의 value값을 담아줌  
				LocationBean location = LocationBean.jsonToLocation(map, entry.getKey()); // Location Bean에 저장하는 메소드
				locations.add(location); // value값을 리스트에 담아줌 
				
			}
		}
		
		return locations;
	}

	@Override
	public List<LocationBean> coronaChartList(List<LocationBean> locations) throws Exception {
		
		List<Map<String, Object>> chartsList = new ArrayList<Map<String, Object>>(); 
		Map<String, Object> chartMaps = null;
		JSONArray list = null;
		
		for(int i=0; i<locations.size(); i++) {
			chartMaps = new HashMap<String, Object>();
			chartMaps.put("countryName", locations.get(i).getCountryName());
			chartMaps.put("totalCase", Integer.parseInt(locations.get(i).getTotalCase().replace(",", "")));
			chartMaps.put("death", Integer.parseInt(locations.get(i).getDeath().replace(",", "")));
			chartMaps.put("label", locations.get(i).getCountryName());
			chartMaps.put("value", Integer.parseInt(locations.get(i).getTotalCase().replace(",", "")));
			chartsList.add(chartMaps);
			// Dount 차트 label , value 넣어서 수정
		}
		
		list = jsonParsing.getJsonArrayFromList(chartsList);
		
		return list;
	}

	@Override
	public KoreaTotalBean coronaTotalList() throws Exception { // 조건문 바꿔야함
	
		JSONParser parser = new JSONParser();
		JSONObject jsonResult  = (JSONObject) parser.parse(openApiCall.coronaApi(KoreaTotalUrl));
		//Map<String, Object> locationMap = jsonParsing.getMapFromJsonObject(jsonResult);
		//System.out.println("locationMap="+locationMap);
		//ArrayList<KoreaTotalBean> locations = new ArrayList<KoreaTotalBean>();
		//KoreaTotalBean.jsonToKoreaTotal(jsonResult);
		
		return KoreaTotalBean.jsonToKoreaTotal(jsonResult);
	}

	

}
