package com.corona.main;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corona.mainBean.KoreaTotalBean;
import com.corona.mainBean.LocationBean;
import com.corona.mainBean.NewsBean;
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
		System.out.println(youtubeList.get(0).getVedioId());

		List<NewsBean> newsList = mainService.newsApiList();
		
		mv.addObject("newsList", newsList); 
	    mv.addObject("youtubeList", youtubeList); 
		mv.addObject("newCase", newCase);
		mv.addObject("TotalMap", coronaTotalList);
		mv.addObject("locationsMap", coronaMapList);
		mv.addObject("chartList", coronaChartList); // 차트
		mv.addObject("locationList", sortedLocations ); // 지역별 현황판

		return mv;
		
	}
		
}
