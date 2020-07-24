package com.corona.main;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corona.mainBean.KoreaTotalBean;
import com.corona.mainBean.LocationBean;
import com.corona.mainBean.YoutubeBean;




@Controller
public class MainController {
	
	@Resource(name="mainService") 
	private MainService mainService;
	
	@RequestMapping(value = "main")
	public ModelAndView openMain() throws Exception {
		ModelAndView mv = new ModelAndView("main");
		
		List<LocationBean> sortedLocations = mainService.coronaLocationApiSortList();
		String newCase = sortedLocations.get(0).getNewCase();
		sortedLocations.remove(0);
		List<LocationBean> coronaMapList = mainService.coronaLocationList();
		
		List<LocationBean> coronaChartList = mainService.coronaChartList(mainService.coronaLocationList());
		
		KoreaTotalBean coronaTotalList = mainService.coronaTotalList();
		
		List<YoutubeBean> youtubeList = mainService.youtubeApiList();
		System.out.println(youtubeList.get(0).getPublishTime().toString());
		System.out.println(youtubeList.get(1).getDescription().toString());
		System.out.println(youtubeList.get(2).getTitle().toString());
		System.out.println(youtubeList.get(3).getTitle().toString());
	     
	      
	      
//	      //              NEWS
//	      Map<String, List< Map<String, Object>>> locationMap3 = getMapFromJsonObject3(CoronaJsonResult.response.toString());      
//	      List<Map<String, Object>> newsList = new ArrayList<Map<String, Object>>();
//	      
//	      for(int i=0; i<locationMap3.get("items").size(); i++)
//	      {
//	         Map<String, Object> map = new HashMap<String, Object>();
//	         
//	         map.put("title", locationMap3.get("items").get(i).get("title") );  //제목
//	         map.put("link", locationMap3.get("items").get(i).get("link") );    //링크
//	         map.put("description", locationMap3.get("items").get(i).get("description") );  //내용
//	      
//	         String pubDate = (String) (locationMap3.get("items").get(i).get("pubDate"));
//	         SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.US);
//	         try{
//	            Date date = format.parse(pubDate);
//	            pubDate = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
//	         }catch (Exception e){
//	            e.printStackTrace();
//	         }
//	         map.put("pubDate", pubDate );   // 날짜
//	         
//	         newsList.add(map);
//	      }      
		
	    mv.addObject("youtubeList", youtubeList); 
		mv.addObject("newCase", newCase);
		mv.addObject("TotalMap", coronaTotalList);
		mv.addObject("locationsMap", coronaMapList);
		mv.addObject("chartList", coronaChartList); // 차트
		mv.addObject("locationList", sortedLocations ); // 지역별 현황판

		return mv;
		
	}
		
}
