package com.corona.main;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.ognl.ParseException;
import org.aspectj.org.eclipse.jdt.internal.core.util.Util.Comparable;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.util.PrimitiveArrayBuilder;

@Controller
public class MainController {
	
	@RequestMapping(value = "main")
	public ModelAndView openMain() throws Exception {
		ModelAndView mv = new ModelAndView("main");
			
		MainJson CoronaJsonResult = new MainJson();
		
		//            국내 현황 
		JSONParser parser = new JSONParser();
		System.out.println(CoronaJsonResult.jsonString);
	    JSONObject jsonResult = (JSONObject) parser.parse(CoronaJsonResult.jsonString);
	    System.out.println("데이터:"+jsonResult);
	    
	    
	    String caseCount = (String)jsonResult.get("caseCount"); // 국내 검사 결과 양성
	    String updateTime = (String)jsonResult.get("updateTime"); //업데이트 시간
	    String notcaseCount = (String)jsonResult.get("notcaseCount"); // 국내 검사결과 음성
	    String TotalChecking = (String)jsonResult.get("TotalChecking"); // 총검사자 완료수
	    String NowCase = (String)jsonResult.get("NowCase"); // 격리수
	    
	    String TotalCase = (String)jsonResult.get("TotalCase"); // 확진자
	    String TotalRecovered = (String)jsonResult.get("TotalRecovered"); // 전체 치료 수
	    String TotalDeath = (String)jsonResult.get("TotalDeath"); // 사망자
	    //String deathPercentage = (String)jsonResult.get("deathPercentage"); // 사망률 데이터 안넘겨줌 (NULL)
	    String TodayRecovered = (String)jsonResult.get("TodayRecovered"); // 오늘 하루 완치자 수
	    String TodayDeath = (String)jsonResult.get("TodayDeath"); // 오늘 하루 사망자 수
	    String checkingCounter = (String)jsonResult.get("checkingCounter"); // 국내 검사중
	    
		double Case = Integer.parseInt(jsonResult.get("TotalCase").toString().replaceAll(",","")); // 형변환 콤마 제거
		double Death = Integer.parseInt(TotalDeath); // 형변환
		String deathPercentage = String.format("%.2f", (Death/Case)*100); // 치사율 
		
		JSONParser parser1 = new JSONParser();
		System.out.println(CoronaJsonResult.jsonString1);
	    JSONObject jsonResult1 = (JSONObject) parser1.parse(CoronaJsonResult.jsonString1);
		
	    JSONObject korea = (JSONObject) jsonResult1.get("korea");
		String newCase = (String) korea.get("newCase"); // 신규확진자 수
			
		Map<String, Object> locationMap = getMapFromJsonObject(jsonResult1); // 제이슨을 객체로 변환
		ArrayList<Location> locations = new ArrayList<Location>(); // 자바빈 리스트 선언 
		
		for(Map.Entry<String, Object> entry : locationMap.entrySet()) { // entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용
			
			if(!entry.getKey().equals("resultCode") && !entry.getKey().equals("resultMessage") 
					&& !entry.getKey().equals("korea") && !entry.getKey().equals("quarantine") ) { // 필요없는 데이터를 빼는 조건
				
				Map<String, String> map = (Map<String, String>) entry.getValue(); // 맵에 json으로 받은 데이터의 value값을 담아줌  
				Location location = Location.JsonToLocation(map, entry.getKey()); // Location Bean에 저장하는 메소드
				locations.add(location); // value값을 리스트에 담아줌 
				
			}
		}
		
		
		ArrayList<Location> sortedLocations = sortedLocations(locations); // API 데이터 재정렬
	
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

		list =  getJsonArrayFromList(chartsList); // 차트 데이터

//		List<Map<String, Object>> dChartsList = new ArrayList<Map<String, Object>>(); 
//		Map<String, Object> dChartMaps = null;
//		JSONArray dountChartList = null;
//		for(int i=0; i<locations.size(); i++) {
//			dChartMaps = new HashMap<String, Object>();
//			dChartMaps.put("label", locations.get(i).getCountryName());
//			dChartMaps.put("value", Integer.parseInt(locations.get(i).getTotalCase().replace(",", "")));
//			dChartsList.add(dChartMaps);
//		}
		
		//dountChartList = getJsonArrayFromList(dChartsList); // dount 차트 데이터
	
		
		
		//                유튜브
		YoutubeBean youtubeApi = new YoutubeBean(); // 유튜브 객체선언
		
		String youtubeApiResult = youtubeApi.search("코로나"); // 유튜브 api 함수호출 
		System.out.println("유튜브API="+youtubeApiResult);
		
		Map<String, List<Map<String, Map<String, Map<String, Map<String, Object>>>>>> youtubeJsonResult = getStringMapFromJsonObject(youtubeApiResult);
		List<Map<String, Object>> youtubeList = new ArrayList<Map<String, Object>>();
		
		for(int i=0; i<youtubeJsonResult.get("items").size(); i++)
		{
			Map<String, Object> youtubeMap = new HashMap<String, Object>();
			youtubeMap.put("vedioId", youtubeJsonResult.get("items").get(i).get("id").get("videoId"));
			youtubeMap.put("title", youtubeJsonResult.get("items").get(i).get("snippet").get("title"));
			youtubeMap.put("content", youtubeJsonResult.get("items").get(i).get("snippet").get("description"));
			youtubeMap.put("imgUrl", youtubeJsonResult.get("items").get(i).get("snippet").get("thumbnails").get("medium").get("url"));
			youtubeMap.put("channelTitle", youtubeJsonResult.get("items").get(i).get("snippet").get("channelTitle"));
			
			youtubeMap.put("publishTime", youtubeJsonResult.get("items").get(i).get("snippet").get("publishTime"));
			
			//요청시간 String
			String reqDateStr = (String)youtubeMap.get("publishTime");
			//현재시간 Date
			Date curDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmm");
			//요청시간을 Date로 parsing 후 time가져오기
			Date reqDate = dateFormat.parse(reqDateStr);
			long reqDateTime = reqDate.getTime();
			//현재시간을 요청시간의 형태로 format 후 time 가져오기
			curDate = dateFormat.parse(dateFormat.format(curDate));
			long curDateTime = curDate.getTime();
			//분으로 표현
			long minute = (curDateTime - reqDateTime) / 60000;
			long hour = minute / 60;
			
			youtubeMap.put("publishTime", hour-9+"시간 전");
			
			youtubeList.add(youtubeMap);		
		}
		
		
		
		//              NEWS
		Map<String, List< Map<String, Object>>> locationMap3 = getMapFromJsonObject3(CoronaJsonResult.response.toString());		
		List<Map<String, Object>> newsList = new ArrayList<Map<String, Object>>();
		
		for(int i=0; i<locationMap3.get("items").size(); i++)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("title", locationMap3.get("items").get(i).get("title") );  //제목
			map.put("link", locationMap3.get("items").get(i).get("link") );    //링크
			map.put("description", locationMap3.get("items").get(i).get("description") );  //내용
		
			String pubDate = (String) (locationMap3.get("items").get(i).get("pubDate"));
			SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.US);
			try{
				Date date = format.parse(pubDate);
				pubDate = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
			}catch (Exception e){
				e.printStackTrace();
			}
			map.put("pubDate", pubDate );   // 날짜
			
			newsList.add(map);
		}		
		
		
		
		mv.addObject("youtubeList", youtubeList);  // 유튜브
		mv.addObject("newsList", newsList); // 네이버뉴스
		mv.addObject("locationsMap", locations);
		mv.addObject("chartList", list); // 차트
		mv.addObject("locationList", sortedLocations ); // 지역별 현황판
		mv.addObject("newCase", newCase); // 새로운 확진자
		mv.addObject("TotalCase", TotalCase); // 전체 확진자
		mv.addObject("TotalDeath", TotalDeath); // 전체 사망자
		mv.addObject("TodayDeath", TodayDeath); // 금일 사망자
		mv.addObject("deathPercentage", deathPercentage); // 치사율
		mv.addObject("TotalRecovered", TotalRecovered); //격리해제 수 
		mv.addObject("TodayRecovered", TodayRecovered); // 금일 격리해제
		mv.addObject("checkingCounter", checkingCounter); // 검사중
		
		return mv;
		
	}
	
	public Map<String, List<Map<String, Map<String, Map<String, Map<String, Object>>>>>> getStringMapFromJsonObject( String youtubeApiResult ) {// Json -> Object로 변환
		Map<String, List<Map<String, Map<String, Map<String, Map<String, Object>>>>>> map = null;
        
        try {
            
            map = new ObjectMapper().readValue(youtubeApiResult.toString(), Map.class);
            
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        return map;
    }
	
	public Map<String, Object> getMapFromJsonObject( JSONObject jsonObj ) {// Json -> Object로 변환
        Map<String, Object> map = null;
        
        try {
            
            map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class);
            
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        return map;
    }
	
	
	private ArrayList<Location> sortedLocations(ArrayList<Location> locations) { // 제이슨데이터 재정렬
		
		ArrayList<Location> result = new ArrayList<Location>();
		
		HashMap<String, ArrayList<Location>> locationMap = makeHashMap(locations); // 호출시 들어오는 데이터의 키값을 재정렬한다 
		
		ArrayList<String> keys = makeSortedKeys(locationMap); // value 안에 데이터들을 비교해서 재정렬하는 메소드
		
		for (int i = 0; i < keys.size(); i++) {
			ArrayList<Location> locationArray = locationMap.get(keys.get(i)); //키를 하나씩 꺼냄 
			locationArray.sort(Location.totalCaseComparator); // TotalCase 재정렬
			
			for (int j = 0; j < locationArray.size(); j++) {
				result.add(locationArray.get(j));
			}
		}
		
		return result;		
	}
	
	
	private HashMap<String, ArrayList<Location>> makeHashMap(ArrayList<Location> locations) { // 해쉬맵에 newCase 정렬
		
		HashMap<String, ArrayList<Location>> locationMap = new HashMap<String, ArrayList<Location>>(); // 해쉬맵 선언

		for (int i=0; i<locations.size(); i++) {
			Location location = locations.get(i);
			ArrayList<Location> value = locationMap.get(location.getNewCase());
			if (value != null) {
				value.add(location);	
			} else {
				ArrayList<Location> newArray = new ArrayList<Location>();
				newArray.add(location);
				locationMap.put(location.getNewCase(), newArray);
			}
			
		}
		return locationMap;
	}
	
	
	private ArrayList<String> makeSortedKeys(HashMap<String, ArrayList<Location>> locationMap) { // 정렬 비교 
		
		ArrayList<String> keys = new ArrayList<String>();
		
		for(Entry<String, ArrayList<Location>> entry : locationMap.entrySet()) {
			keys.add(entry.getKey());
		}
		
		Comparator<String> comp = new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				int n1 = Location.stringToInt(o1);
				int n2 = Location.stringToInt(o2);			
				return n2 - n1;
			}
			
		};
		
		keys.sort(comp);
		return keys;
	}
	
	
	
	public static JSONArray getJsonArrayFromList(List<Map<String, Object>> list) {
		
		JSONArray jsonArray = new JSONArray();
		for( Map<String, Object> map : list ) {
			//System.out.println("list="+list);
			jsonArray.add(getJsonStringFromMap(map));
			//System.out.println("map="+map);
		}
		
		return jsonArray;
		
	}

	private static Object getJsonStringFromMap(Map<String, Object> map) {
		
		JSONObject jsonObject = new JSONObject();
		for( Map.Entry<String, Object> entry : map.entrySet() ) {
			String key = entry.getKey();
			Object value = entry.getValue();
			//System.out.println("key="+ key);
			jsonObject.put(key, value);
			//System.out.println("제이슨 스트링:"+jsonObject.toJSONString());
		}
		
		return jsonObject;
		
	}
	
	
    public static Map<String, List<Map<String, Object>>> getMapFromJsonObject3( String jsonObj )
    {
    	Map<String, List<Map<String, Object>>> map = null;
        
        try {
            
            map = new ObjectMapper().readValue(jsonObj.toString(), Map.class) ;
            
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        return map;
    }
	
}
