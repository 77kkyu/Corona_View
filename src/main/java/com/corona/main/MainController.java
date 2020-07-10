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
		
		JSONObject seoul = (JSONObject) jsonResult1.get("seoul");
		String seoulTotalCase = (String) seoul.get("totalCase");
		String seoulNewCase = (String) seoul.get("newCase");
		
		JSONObject gyeonggi = (JSONObject) jsonResult1.get("gyeonggi");
		String gyeonggiTotalCase = (String) gyeonggi.get("totalCase");
		String gyeonggiNewCase = (String) gyeonggi.get("newCase");
		
		JSONObject daegu = (JSONObject) jsonResult1.get("daegu");
		String daeguTotalCase = (String) daegu.get("totalCase");
		String daeguNewCase = (String) daegu.get("newCase");
		
		JSONObject gyeongbuk = (JSONObject) jsonResult1.get("gyeongbuk");
		String gyeongbukTotalCase = (String) gyeongbuk.get("totalCase");
		String gyeongbukNewCase = (String) gyeongbuk.get("newCase");
		
		JSONObject busan = (JSONObject) jsonResult1.get("busan");
		String busanTotalCase = (String) busan.get("totalCase");
		String busanNewCase = (String) busan.get("newCase");
		

		mv.addObject("newCase", newCase); // 새로운 확진자
		mv.addObject("TotalCase", TotalCase); // 전체 확진자
		mv.addObject("TotalDeath", TotalDeath); // 전체 사망자
		mv.addObject("TodayDeath", TodayDeath); // 금일 사망자
		mv.addObject("deathPercentage", deathPercentage); // 치사율
		mv.addObject("TotalRecovered", TotalRecovered); //격리해제 수 
		mv.addObject("TodayRecovered", TodayRecovered); // 금일 격리해제
		mv.addObject("checkingCounter", checkingCounter); // 검사중
		
		mv.addObject("seoulTotalCase", seoulTotalCase);
		mv.addObject("seoulNewCase", seoulNewCase);
		
		mv.addObject("gyeonggiTotalCase", gyeonggiTotalCase);
		mv.addObject("gyeonggiNewCase", gyeonggiNewCase);
		
		mv.addObject("daeguTotalCase", daeguTotalCase);
		mv.addObject("daeguNewCase", daeguNewCase);
		
		mv.addObject("gyeongbukTotalCase", gyeongbukTotalCase);
		mv.addObject("gyeongbukNewCase", gyeongbukNewCase);
		
		mv.addObject("busanTotalCase", busanTotalCase);
		mv.addObject("busanNewCase", busanNewCase);
		return mv;
	
	}
}
