package com.corona.mainBean;

import java.util.Comparator;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class LocationBean implements Comparable<LocationBean> {

	private String locationName;
	private String countryName;
	private String newCase;
	private String totalCase;
	private String recovered;
	private String death;
	private String percentage;
	private String newFcase;
	private String newCcase;
	
	public LocationBean(String newCase, String totalCase, String recovered, String death, String percentage,
			String newFcase, String newCcase, String locationName, String countryName) {
		super();
		this.newCase = newCase;
		this.totalCase = totalCase;
		this.recovered = recovered;
		this.death = death;
		this.percentage = percentage;
		this.newFcase = newFcase;
		this.newCcase = newCcase;
		this.locationName = locationName;
		this.countryName = countryName;
	}
	
	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getNewCase() {
		return newCase;
	}

	public void setNewCase(String newCase) {
		this.newCase = newCase;
	}

	public String getTotalCase() {
		return totalCase;
	}

	public void setTotalCase(String totalCase) {
		this.totalCase = totalCase;
	}

	public String getRecovered() {
		return recovered;
	}

	public void setRecovered(String recovered) {
		this.recovered = recovered;
	}

	public String getDeath() {
		return death;
	}

	public void setDeath(String death) {
		this.death = death;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public String getNewFcase() {
		return newFcase;
	}

	public void setNewFcase(String newFcase) {
		this.newFcase = newFcase;
	}

	public String getNewCcase() {
		return newCcase;
	}

	public void setNewCcase(String newCcase) {
		this.newCcase = newCcase;
	}
	
    public static LocationBean jsonToLocation(Map<String, String> map, String locationName) { // 받은 json데이터를 꺼내와서 생성자에 반환함
		
		String newCase = map.get("newCase");
		String totalCase = map.get("totalCase");
		String recovered = map.get("recovered");
		String percentage = map.get("percentage");
		String death = map.get("death");
		String newFcase = map.get("newFcase");
		String newCcase = map.get("newCcase");
		String countryName = map.get("countryName");
		
		LocationBean location = new LocationBean(newCase, totalCase, recovered, death, percentage, newFcase, newCcase, locationName, countryName);
		
		return location;
	}

	@Override
	public int compareTo(LocationBean o) { // NewCase 재정렬
		return stringToInt(o.newCase) - stringToInt(newCase);
	}
	
	public static int stringToInt(String string) { // 형변환
		return Integer.parseInt(string.replace(",", ""));
		
	}
	
	public static Comparator<LocationBean> totalCaseComparator = new Comparator<LocationBean>() { // TotalCase 재정렬
		
		@Override
		public int compare(LocationBean o1, LocationBean o2) {
			
			return stringToInt(o2.getTotalCase()) - stringToInt(o1.getTotalCase());
		}
	};
	

}
