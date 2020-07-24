package com.corona.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.corona.mainBean.KoreaTotalBean;
import com.corona.mainBean.LocationBean;
import com.corona.mainBean.NewsBean;
import com.corona.mainBean.YoutubeBean;


public interface MainService {
	
	public List<LocationBean> coronaLocationApiSortList() throws Exception;
	
	public List<LocationBean> coronaLocationList() throws Exception;
	
	public List<LocationBean> coronaChartList(List<LocationBean> locations) throws Exception;
	
	public KoreaTotalBean coronaTotalList() throws Exception;
	
	public List<YoutubeBean> youtubeApiList() throws Exception;
	
	public List<NewsBean> newsApiList() throws Exception;

}
