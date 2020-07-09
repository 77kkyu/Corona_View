package com.corona.main;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping(value = "main")
	public ModelAndView openMain() throws Exception {
		ModelAndView mv = new ModelAndView("main");
			
		MainJson CoronaJsonResult = new MainJson();
		
		JSONParser parser = new JSONParser();
		System.out.println(CoronaJsonResult.jsonString);
	    JSONObject jsonResult = (JSONObject) parser.parse(CoronaJsonResult.jsonString);
	
		String 대구1 = (String)jsonResult.get("city1n");
		String 경기1 = (String)jsonResult.get("city5n");
		String 서울1 = (String)jsonResult.get("city4n");
		
		System.out.println(대구1+ 경기1 + 서울1);

		return mv;
	
	}
}
