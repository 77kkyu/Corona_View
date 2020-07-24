package com.corona.mainBean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class YoutubeBean {
	
	private String vedioId;
	private String title;
	private String description;
	private String imgUrl;
	private String channelTitle;
	private String publishTime;


	public YoutubeBean(String vedioId, String title, String description, String imgUrl, String channelTitle,
			String publishTime) {
		super();
		this.vedioId = vedioId;
		this.title = title;
		this.description = description;
		this.imgUrl = imgUrl;
		this.channelTitle = channelTitle;
		this.publishTime = publishTime;
	}


	public String getVedioId() {
		return vedioId;
	}

	public void setVedioId(String vedioId) {
		this.vedioId = vedioId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getChannelTitle() {
		return channelTitle;
	}

	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}

	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	
	public static YoutubeBean jsonToYoutube(Map<String, Object> map) throws ParseException { // 받은 json데이터를 꺼내와서 생성자에 반환함
		

		String vedioId = map.get("vedioId").toString();
		String title = map.get("title").toString();
		String description = map.get("content").toString();
		String imgUrl = map.get("imgUrl").toString();
		String channelTitle = map.get("channelTitle").toString();
	
		String reqDateStr = (String)map.get("publishTime");
		Date curDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmm");
		Date reqDate = dateFormat.parse(reqDateStr);
	    long reqDateTime = reqDate.getTime();
	    curDate = dateFormat.parse(dateFormat.format(curDate));
	    long curDateTime = curDate.getTime();
	    long minute = (curDateTime - reqDateTime) / 60000;
	    long hour = minute / 60;
	    map.put("publishTime", hour-9+"시간 전");
	    String publishTime = map.get("publishTime").toString();
	   
	    
		YoutubeBean yotubedata = new YoutubeBean(vedioId, title, description, imgUrl, channelTitle, publishTime);
	
		return yotubedata;
	}
	
//	//요청시간 String
//    String reqDateStr = (String)youtubeMap.get("publishTime");
//    //현재시간 Date
//    Date curDate = new Date();
//    SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmm");
//    //요청시간을 Date로 parsing 후 time가져오기
//    Date reqDate = dateFormat.parse(reqDateStr);
//    long reqDateTime = reqDate.getTime();
//    //현재시간을 요청시간의 형태로 format 후 time 가져오기
//    curDate = dateFormat.parse(dateFormat.format(curDate));
//    long curDateTime = curDate.getTime();
//    //분으로 표현
//    long minute = (curDateTime - reqDateTime) / 60000;
//    long hour = minute / 60;
//    
//    youtubeMap.put("publishTime", hour-9+"시간 전");
//    
//    youtubeList.add(youtubeMap);    

}
