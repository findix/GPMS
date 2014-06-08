package com.find1x.gpms.dao;

import java.util.List;

import com.find1x.gpms.pojos.Notice;
import com.find1x.gpms.util.MongoDBUtil;

public class NoticeDAO {
	public static boolean addNotice(String context, String type) {
		try {
			Notice notice = new Notice();
			notice.setContext(context);
			notice.setType(type);
			MongoDBUtil.getDatastore().save(notice);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static List<Notice> getNotice(String type) {
		List<Notice> list = MongoDBUtil.getDatastore().find(Notice.class)
				.filter("type", type).asList();
		return list;
	}
}
