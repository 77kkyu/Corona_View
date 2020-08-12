package com.common.apiUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.corona.mainBean.LocationBean;

public class JsonParsing {
	
	public Map<String, List<Map<String, Map<String, Map<String, Map<String, Object>>>>>> getStringMapFromJsonObject( JSONObject jsonResult ) {// Json -> Object로 변환
		Map<String, List<Map<String, Map<String, Map<String, Map<String, Object>>>>>> map = null;
        
        try {
            
            map = new ObjectMapper().readValue(jsonResult.toString(), Map.class);
            
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        return map;
    }
	
	public Map<String, List<Map<String, Object>>> getMapFromNewsJsonObject( JSONObject jsonObj ) {// News Json -> Object로 변환
		Map<String, List<Map<String, Object>>> map = null;
        
        try {
            
            map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class);
            System.out.println(map);
            
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
	
	public ArrayList<LocationBean> sortedLocations(ArrayList<LocationBean> locations) { // 제이슨데이터 재정렬
		
		ArrayList<LocationBean> result = new ArrayList<LocationBean>();
		
		HashMap<String, ArrayList<LocationBean>> locationMap = makeHashMap(locations); // 호출시 들어오는 데이터의 키값을 재정렬한다 
		
		ArrayList<String> keys = makeSortedKeys(locationMap); // value 안에 데이터들을 비교해서 재정렬하는 메소드
		
		for (int i = 0; i < keys.size(); i++) {
			ArrayList<LocationBean> locationArray = locationMap.get(keys.get(i)); //키를 하나씩 꺼냄 
			locationArray.sort(LocationBean.totalCaseComparator); // TotalCase 재정렬
			
			for (int j = 0; j < locationArray.size(); j++) {
				result.add(locationArray.get(j));
			}
		}
		
		return result;		
	}
	
	
	public HashMap<String, ArrayList<LocationBean>> makeHashMap(ArrayList<LocationBean> locations) { // 해쉬맵에 newCase 정렬
		
		HashMap<String, ArrayList<LocationBean>> locationMap = new HashMap<String, ArrayList<LocationBean>>(); // 해쉬맵 선언

		for (int i=0; i<locations.size(); i++) {
			LocationBean location = locations.get(i);
			ArrayList<LocationBean> value = locationMap.get(location.getNewCase());
			if (value != null) {
				value.add(location);	
			} else {
				ArrayList<LocationBean> newArray = new ArrayList<LocationBean>();
				newArray.add(location);
				locationMap.put(location.getNewCase(), newArray);
			}
			
		}
		return locationMap;
	}
	
	
	public ArrayList<String> makeSortedKeys(HashMap<String, ArrayList<LocationBean>> locationMap) { // 정렬 비교 
		
		ArrayList<String> keys = new ArrayList<String>();
		
		for(Entry<String, ArrayList<LocationBean>> entry : locationMap.entrySet()) {
			keys.add(entry.getKey());
		}
		
		Comparator<String> comp = new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				int n1 = LocationBean.stringToInt(o1);
				int n2 = LocationBean.stringToInt(o2);			
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

	public static Object getJsonStringFromMap(Map<String, Object> map) {
		
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

}
