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
	
		List<LocationBean> coronaChartList = mainService.coronaChartList(mainService.coronaLocationList());
		
		
		mv.addObject("locationsMap", coronaMapList);
		mv.addObject("chartList", coronaChartList); // 차트
		mv.addObject("locationList", sortedLocations ); // 지역별 현황판
		//mv.addObject("newCase", newCase); // 새로운 확진자

		//mv.addObject("deathPercentage", deathPercentage); // 치사율

		
		return mv;
		
	}
	
	
	
	
}
