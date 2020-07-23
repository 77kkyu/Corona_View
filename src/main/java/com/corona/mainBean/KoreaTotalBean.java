package com.corona.mainBean;

import java.util.Map;

public class KoreaTotalBean {
	
	private String caseCount; // 국내 검사 결과 양성
	private String newCase; // 새로운 확진자
	private String updateTime; // 업데이트 시간
	private String notCaseCount; // 국내 검사결과 음성
	private String totalChecking; // 총검사자 완료수
	private String nowCase; // 격리수
	private String totalCase; // 확진자
	private String totalRecovered; // 전체 치료자 수
	private String totalDeath; // 사망자
	private String todayRecovered; // 오늘 하루 완치자 수
	private String todayDeath; // 오늘 하루 사망자 수
	private String checkingCounter; // 국내 검사중
	private String deathPercentage; // 치사율
	
	public KoreaTotalBean(String caseCount, String updateTime, String notCaseCount, String totalChecking,
			String nowCase, String totalCase, String totalRecovered, String totalDeath, String todayRecovered,
			String todayDeath, String checkingCounter, String deathPercentage, String newCase) {
		super();
		this.caseCount = caseCount;
		this.updateTime = updateTime;
		this.notCaseCount = notCaseCount;
		this.totalChecking = totalChecking;
		this.nowCase = nowCase;
		this.totalCase = totalCase;
		this.totalRecovered = totalRecovered;
		this.totalDeath = totalDeath;
		this.todayRecovered = todayRecovered;
		this.todayDeath = todayDeath;
		this.checkingCounter = checkingCounter;
		this.deathPercentage = deathPercentage;
		this.newCase = newCase;
	}

	public String getNewCase() {
		return newCase;
	}

	public void setNewCase(String newCase) {
		this.newCase = newCase;
	}

	public String getCaseCount() {
		return caseCount;
	}

	public void setCaseCount(String caseCount) {
		this.caseCount = caseCount;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getNotCaseCount() {
		return notCaseCount;
	}

	public void setNotCaseCount(String notCaseCount) {
		this.notCaseCount = notCaseCount;
	}

	public String getTotalChecking() {
		return totalChecking;
	}

	public void setTotalChecking(String totalChecking) {
		this.totalChecking = totalChecking;
	}

	public String getNowCase() {
		return nowCase;
	}

	public void setNowCase(String nowCase) {
		this.nowCase = nowCase;
	}

	public String getTotalCase() {
		return totalCase;
	}

	public void setTotalCase(String totalCase) {
		this.totalCase = totalCase;
	}

	public String getTotalRecovered() {
		return totalRecovered;
	}

	public void setTotalRecovered(String totalRecovered) {
		this.totalRecovered = totalRecovered;
	}

	public String getTotalDeath() {
		return totalDeath;
	}

	public void setTotalDeath(String totalDeath) {
		this.totalDeath = totalDeath;
	}

	public String getTodayRecovered() {
		return todayRecovered;
	}

	public void setTodayRecovered(String todayRecovered) {
		this.todayRecovered = todayRecovered;
	}

	public String getTodayDeath() {
		return todayDeath;
	}

	public void setTodayDeath(String todayDeath) {
		this.todayDeath = todayDeath;
	}

	public String getCheckingCounter() {
		return checkingCounter;
	}

	public void setCheckingCounter(String checkingCounter) {
		this.checkingCounter = checkingCounter;
	}
	
	public String getDeathPercentage() {
		return deathPercentage;
	}

	public void setDeathPercentage(String deathPercentage) {
		this.deathPercentage = deathPercentage;
	}


	public static KoreaTotalBean jsonToKoreaTotal(Map<String, Object> locationMap) {
		
		String caseCount = (String) locationMap.get("caseCount");
		String updateTime = (String) locationMap.get("updateTime");
		String notCaseCount = (String) locationMap.get("notcaseCount");
		String totalChecking = (String) locationMap.get("TotalChecking");
		String nowCase = (String) locationMap.get("NowCase");
		String totalCase = (String) locationMap.get("TotalCase").toString().replaceAll(",","");
		String totalRecovered = (String) locationMap.get("TotalRecovered").toString().replaceAll(",","");
		String totalDeath = (String) locationMap.get("TotalDeath");
		String todayRecovered = (String) locationMap.get("TodayRecovered");
		String todayDeath = (String) locationMap.get("TodayDeath");
		String checkingCounter = (String) locationMap.get("checkingCounter").toString().replaceAll(",","");
		String newCase = (String) locationMap.get("newCase");
		String TotalDeath = (String) locationMap.get("TotalDeath").toString().replaceAll(",","");
		double Case = Integer.parseInt(locationMap.get("TotalCase").toString().replaceAll(",",""));
		double Death = Integer.parseInt(TotalDeath);
		String deathPercentage = String.format("%.2f", (Death/Case)*100);
		
		KoreaTotalBean KoreaTotal = new KoreaTotalBean(caseCount, updateTime, notCaseCount, totalChecking, nowCase, totalCase, totalRecovered, totalDeath, 
				todayRecovered, todayDeath, checkingCounter, deathPercentage, newCase);
		
		return KoreaTotal;
		
	}
	
//	double Case = Integer.parseInt(jsonResult.get("TotalCase").toString().replaceAll(",","")); // 형변환 콤마 제거
//    double Death = Integer.parseInt(TotalDeath); // 형변환
//    String deathPercentage = String.format("%.2f", (Death/Case)*100); // 치사율 

}
