package com.corona.main;

public class KoreaTotalBean {
	
	private String caseCount; // 국내 검사 결과 양성
	private String updateTime; // 업데이트 시간
	private String notcaseCount; // 국내 검사결과 음성
	private String TotalChecking; // 총검사자 완료수
	private String NowCase; // 격리수
	private String TotalCase; // 확진자
	private String TotalRecovered; // 전체 치료자 수
	private String TotalDeath; // 사망자
	private String TodayRecovered; // 오늘 하루 완치자 수
	private String TodayDeath; // 오늘 하루 사망자 수
	private String checkingCounter; // 국내 검사중
	
	public KoreaTotalBean(String caseCount, String updateTime, String notcaseCount, String totalChecking,
			String nowCase, String totalCase, String totalRecovered, String totalDeath, String todayRecovered,
			String todayDeath, String checkingCounter) {
		super();
		this.caseCount = caseCount;
		this.updateTime = updateTime;
		this.notcaseCount = notcaseCount;
		this.TotalChecking = totalChecking;
		this.NowCase = nowCase;
		this.TotalCase = totalCase;
		this.TotalRecovered = totalRecovered;
		this.TotalDeath = totalDeath;
		this.TodayRecovered = todayRecovered;
		this.TodayDeath = todayDeath;
		this.checkingCounter = checkingCounter;
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
	public String getNotcaseCount() {
		return notcaseCount;
	}
	public void setNotcaseCount(String notcaseCount) {
		this.notcaseCount = notcaseCount;
	}
	public String getTotalChecking() {
		return TotalChecking;
	}
	public void setTotalChecking(String totalChecking) {
		TotalChecking = totalChecking;
	}
	public String getNowCase() {
		return NowCase;
	}
	public void setNowCase(String nowCase) {
		NowCase = nowCase;
	}
	public String getTotalCase() {
		return TotalCase;
	}
	public void setTotalCase(String totalCase) {
		TotalCase = totalCase;
	}
	public String getTotalRecovered() {
		return TotalRecovered;
	}
	public void setTotalRecovered(String totalRecovered) {
		TotalRecovered = totalRecovered;
	}
	public String getTotalDeath() {
		return TotalDeath;
	}
	public void setTotalDeath(String totalDeath) {
		TotalDeath = totalDeath;
	}
	public String getTodayRecovered() {
		return TodayRecovered;
	}
	public void setTodayRecovered(String todayRecovered) {
		TodayRecovered = todayRecovered;
	}
	public String getTodayDeath() {
		return TodayDeath;
	}
	public void setTodayDeath(String todayDeath) {
		TodayDeath = todayDeath;
	}
	public String getCheckingCounter() {
		return checkingCounter;
	}
	public void setCheckingCounter(String checkingCounter) {
		this.checkingCounter = checkingCounter;
	}
	
	
	
	
	

}
