package com.find1x.gpms.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import com.find1x.gpms.util.MongoDBUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class UserDAO {
	public static List<DBObject> getList(String username, String password) {
		DBCollection users = MongoDBUtil.getCollection("users");
		BasicDBObject query = new BasicDBObject();
		query.put("username", username);
		query.put("password", password);
		DBCursor cursor = users.find(query);
		return cursor.toArray();
	}

	public static List<DBObject> getList(String username) {
		DBCollection users = MongoDBUtil.getCollection("users");
		BasicDBObject query = new BasicDBObject();
		query.put("username", username);
		DBCursor cursor = users.find(query);
		return cursor.toArray();
	}

	public static List<DBObject> getList() {
		DBCollection users = MongoDBUtil.getCollection("users");
		DBCursor cursor = users.find();
		return cursor.toArray();
	}

	public static String getFormatTime(Object object) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(object);
	}
}
