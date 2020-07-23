package com.corona.main;

import java.util.List;

import com.corona.mainBean.KoreaTotalBean;
import com.corona.mainBean.LocationBean;

public interface MainService {
	
	public List<LocationBean> coronaLocationApiSortList() throws Exception;
	
	public List<LocationBean> coronaLocationList() throws Exception;
	
	public List<LocationBean> coronaChartList(List<LocationBean> locations) throws Exception;
	
	public List<KoreaTotalBean> coronaTotalList() throws Exception;

}
