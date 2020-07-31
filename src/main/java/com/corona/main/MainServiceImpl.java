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
import com.corona.mainBean.NewsBean;
import com.corona.mainBean.YoutubeBean;

@Service("mainService")
public class MainServiceImpl implements MainService {

	JsonParsing jsonParsing = new JsonParsing();

	OpenApiCall openApiCall = new OpenApiCall();

	final static String countryUrl = "http://api.corona-19.kr/korea/country/new/?serviceKey=2f3458c475483f2337f8f4ff7a5af3c66";
	final static String KoreaTotalUrl = "http://api.corona-19.kr/korea/?serviceKey=2f3458c475483f2337f8f4ff7a5af3c66";

	@Override
	public List<LocationBean> coronaLocationApiSortList() throws Exception {

		JSONParser parser = new JSONParser();
		JSONObject jsonResult = (JSONObject) parser.parse(openApiCall.coronaApi(countryUrl));
		Map<String, Object> locationMap = jsonParsing.getMapFromJsonObject(jsonResult);
		ArrayList<LocationBean> locations = new ArrayList<LocationBean>();

		for (Map.Entry<String, Object> entry : locationMap.entrySet()) { // entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용

			if (!entry.getKey().equals("resultCode") && !entry.getKey().equals("resultMessage")
					&& !entry.getKey().equals("quarantine")) { // 필요없는 데이터를 빼는 조건

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
		JSONObject jsonResult = (JSONObject) parser.parse(openApiCall.coronaApi(countryUrl));

		Map<String, Object> locationMap = jsonParsing.getMapFromJsonObject(jsonResult);
		ArrayList<LocationBean> locations = new ArrayList<LocationBean>();

		for (Map.Entry<String, Object> entry : locationMap.entrySet()) { // entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용

			if (!entry.getKey().equals("resultCode") && !entry.getKey().equals("resultMessage")
					&& !entry.getKey().equals("korea") && !entry.getKey().equals("quarantine")) { // 필요없는 데이터를 빼는 조건

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

		for (int i = 0; i < locations.size(); i++) {
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
	public KoreaTotalBean coronaTotalList() throws Exception {
		JSONParser parser = new JSONParser();
		JSONObject jsonResult = (JSONObject) parser.parse(openApiCall.coronaApi(KoreaTotalUrl));

		return KoreaTotalBean.jsonToKoreaTotal(jsonResult);
	}

	@Override
	public List<YoutubeBean> youtubeApiList() throws Exception {

		JSONParser parser = new JSONParser();
		JSONObject jsonResult = (JSONObject) parser.parse(openApiCall.youtubeApiSearch("코로나"));
		Map<String, List<Map<String, Map<String, Map<String, Map<String, Object>>>>>> youtubeDataMap = jsonParsing
				.getStringMapFromJsonObject(jsonResult);
		System.out.println(youtubeDataMap);
		ArrayList<YoutubeBean> list = new ArrayList<YoutubeBean>();
		List<Map<String, Object>> youtubeList = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < youtubeDataMap.get("items").size(); i++) {
			Map<String, Object> youtubeMap = new HashMap<String, Object>();
			youtubeMap.put("vedioId", youtubeDataMap.get("items").get(i).get("id").get("videoId"));
			youtubeMap.put("title", youtubeDataMap.get("items").get(i).get("snippet").get("title"));
			youtubeMap.put("content", youtubeDataMap.get("items").get(i).get("snippet").get("description"));
			youtubeMap.put("imgUrl",
					youtubeDataMap.get("items").get(i).get("snippet").get("thumbnails").get("medium").get("url"));
			youtubeMap.put("channelTitle", youtubeDataMap.get("items").get(i).get("snippet").get("channelTitle"));
			youtubeMap.put("publishTime", youtubeDataMap.get("items").get(i).get("snippet").get("publishTime"));
			youtubeList.add(youtubeMap);
			YoutubeBean data = YoutubeBean.jsonToYoutube(youtubeMap);
			list.add(data);
		}

		return list;
	}

	@Override
	public List<NewsBean> newsApiList() throws Exception {

		JSONParser parser = new JSONParser();
		JSONObject jsonResult = (JSONObject) parser.parse(openApiCall.naverNewsApi("코로나 확진"));
		Map<String, List<Map<String, Object>>> newsDataMap = jsonParsing.getMapFromNewsJsonObject(jsonResult);
		ArrayList<NewsBean> list = new ArrayList<NewsBean>();
		List<Map<String, Object>> newsList = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < newsDataMap.get("items").size(); i++) {
			Map<String, Object> newsMap = new HashMap<String, Object>();
			newsMap.put("title", newsDataMap.get("items").get(i).get("title"));
			newsMap.put("link", newsDataMap.get("items").get(i).get("link"));
			newsMap.put("description", newsDataMap.get("items").get(i).get("description"));
			newsMap.put("pubDate", newsDataMap.get("items").get(i).get("pubDate"));
			newsList.add(newsMap);
			NewsBean data = NewsBean.jsonToNews(newsMap);
			list.add(data);
		}

		return list;
	}

}
