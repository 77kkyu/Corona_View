package com.corona.main;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corona.mainBean.LocationBean;

import Modified.YoutubeBean;

@Controller
public class MainController {
	
	@Resource(name="mainService") 
	private MainService mainService;
	
	@RequestMapping(value = "main")
	public ModelAndView openMain() throws Exception {
		ModelAndView mv = new ModelAndView("main");
			

		List<LocationBean> sortedLocations = mainService.coronaLocationApiSortList();
		
		List<LocationBean> coronaMapList = mainService.coronaLocationList();
	
//		List<Map<String, Object>> chartsList = new ArrayList<Map<String, Object>>(); 
//		Map<String, Object> chartMaps = null;
//		JSONArray list = null;
//		
//		for(int i=0; i<locations.size(); i++) {
//			chartMaps = new HashMap<String, Object>();
//			chartMaps.put("countryName", locations.get(i).getCountryName());
//			chartMaps.put("totalCase", Integer.parseInt(locations.get(i).getTotalCase().replace(",", "")));
//			chartMaps.put("death", Integer.parseInt(locations.get(i).getDeath().replace(",", "")));
//			chartMaps.put("label", locations.get(i).getCountryName());
//			chartMaps.put("value", Integer.parseInt(locations.get(i).getTotalCase().replace(",", "")));
//			chartsList.add(chartMaps);
//			// Dount 차트 label , value 넣어서 수정
//		}
//
//		list =  getJsonArrayFromList(chartsList); // 차트 데이터
		
		List<LocationBean> coronaChartList = mainService.coronaChartList(coronaMapList);
		
		
		//System.out.println("뉴스API="+CoronaJsonResult.response.toString());
		
		YoutubeBean youtubeApi = new YoutubeBean(); // 유튜브 객체선언
		
		//System.out.println("유튜브API="+youtubeAPI.search("코로나"));
		String youtubeApiResult = youtubeApi.search("코로나"); // 유튜브 api 함수호출 
		System.out.println("유튜브API="+youtubeApiResult);
		
//		Map<String, List<Map<String, Map<String, Map<String, Map<String, Object>>>>>> youtubeJsonResult = getStringMapFromJsonObject(youtubeApiResult);
//		
//		System.out.println("items="+youtubeJsonResult.get("items").get(0).get("snippet").get("thumbnails").get("medium"));
//		System.out.println(youtubeJsonResult.get("items").get(0));
//		System.out.println(youtubeJsonResult.get("items").get(1));
//		
//		List<Map<String, Object>> youtubeList = new ArrayList<Map<String, Object>>();
//		
//		
//		for(int i=0; i<youtubeJsonResult.get("items").size(); i++)
//		{
//			Map<String, Object> youtubeMap = new HashMap<String, Object>();
//			youtubeMap.put("vedioId", youtubeJsonResult.get("items").get(i).get("id").get("videoId"));
//			youtubeMap.put("title", youtubeJsonResult.get("items").get(i).get("snippet").get("title"));
//			youtubeMap.put("content", youtubeJsonResult.get("items").get(i).get("snippet").get("description"));
//			youtubeMap.put("imgUrl", youtubeJsonResult.get("items").get(i).get("snippet").get("thumbnails").get("medium").get("url"));
//			youtubeMap.put("channelTitle", youtubeJsonResult.get("items").get(i).get("snippet").get("channelTitle"));
//			youtubeMap.put("publishTime", youtubeJsonResult.get("items").get(i).get("snippet").get("publishTime"));
//			
//			youtubeList.add(youtubeMap);		
//		}
	
//		mv.addObject("youtubeList", youtubeList);
		mv.addObject("locationsMap", coronaMapList);
		mv.addObject("chartList", coronaChartList); // 차트
		mv.addObject("locationList", sortedLocations ); // 지역별 현황판
		//mv.addObject("newCase", newCase); // 새로운 확진자whw

		//mv.addObject("deathPercentage", deathPercentage); // 치사율

		
		return mv;
		
	}
	
	
	
	
}
