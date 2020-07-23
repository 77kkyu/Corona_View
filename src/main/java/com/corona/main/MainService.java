package com.corona.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.corona.mainBean.KoreaTotalBean;
import com.corona.mainBean.LocationBean;

public interface MainService {
	
	public List<LocationBean> coronaLocationApiSortList() throws Exception;
	
	public List<LocationBean> coronaLocationList() throws Exception;
	
	public List<LocationBean> coronaChartList(List<LocationBean> locations) throws Exception;
	
	public KoreaTotalBean coronaTotalList() throws Exception;

}
