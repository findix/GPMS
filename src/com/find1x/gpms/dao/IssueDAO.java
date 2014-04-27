package com.find1x.gpms.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import com.find1x.gpms.util.MongoDBUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class IssueDAO {
	public static List<DBObject> getList(String specialty) {
		DBCollection users = MongoDBUtil.getCollection("issues");
		BasicDBObject query = new BasicDBObject();
		query.put("specialty", specialty);
		DBCursor cursor = users.find(query);
		return cursor.toArray();
	}

	public static List<DBObject> getList() {
		DBCollection users = MongoDBUtil.getCollection("issues");
		DBCursor cursor = users.find();
		return cursor.toArray();
	}

	public static boolean addIssue(String title, String info,
			String requirement, String specialty, String total) {
		try {
			DBCollection issues = MongoDBUtil.getCollection("issues");
			DBObject issue = new BasicDBObject();
			issue.put("title", title);
			issue.put("info", info);
			issue.put("requirement", requirement);
			issue.put("specialty", specialty);
			issue.put("total", total);
			issues.save(issue);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
