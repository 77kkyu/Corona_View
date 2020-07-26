package com.corona.mainBean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

public class NewsBean {
	
	private String title;
	private String link;
	private String description;
	private String pubDate;
	
	public NewsBean(String title, String link, String description, String pubDate) {
		super();
		this.title = title;
		this.link = link;
		this.description = description;
		this.pubDate = pubDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	
	public static NewsBean jsonToNews(Map<String, Object> map) throws ParseException {
		
		String title = map.get("title").toString();
		String link = map.get("link").toString();
		String description = map.get("description").toString();
		//String pubDate = map.get("pubDate").toString();
		String dateChange = (String) map.get("pubDate");
        SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.US);
        Date date = format.parse(dateChange);
        dateChange = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
        map.put("pubDate", dateChange );
        String pubDate = map.get("pubDate").toString();
        
		
		NewsBean newsData = new NewsBean(title, link, description, pubDate);
		
		return newsData;
	}

}
