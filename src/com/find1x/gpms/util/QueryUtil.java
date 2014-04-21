package com.find1x.gpms.util;

import java.text.SimpleDateFormat;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class QueryUtil {
	public static List<DBObject> getList(String username, String password) {
		DBCollection users = MongoDBUtil.getCollection("user");
		BasicDBObject query = new BasicDBObject();
		query.put("username", username);
		query.put("password", password);
		DBCursor cursor = users.find(query);
		return cursor.toArray();
	}

	public static List<DBObject> getList(String username) {
		DBCollection users = MongoDBUtil.getCollection("user");
		BasicDBObject query = new BasicDBObject();
		query.put("username", username);
		DBCursor cursor = users.find(query);
		return cursor.toArray();
	}

	public static List<DBObject> getList() {
		DBCollection users = MongoDBUtil.getCollection("user");
		DBCursor cursor = users.find();
		return cursor.toArray();
	}

	public static List<DBObject> getMenu() {
		DBCollection menu = MongoDBUtil.getCollection("menu");
		DBCursor cursor = menu.find();
		return cursor.toArray();
	}
	
	public static List<DBObject> getOrderList() {
		DBCollection order = MongoDBUtil.getCollection("order");
		DBCursor cursor = order.find();
		return cursor.toArray();
	}

	public static List<DBObject> getOrderList(String username) {
		DBCollection order = MongoDBUtil.getCollection("order");
		BasicDBObject query = new BasicDBObject();
		query.put("username", username);
		DBCursor cursor = order.find(query);
		return cursor.toArray();
	}

	public static String getFormatTime(Object object) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(object);
	}
	public static void finishOrder(Object object){
		DBCollection order = MongoDBUtil.getCollection("order");
		DBObject queryObject=new BasicDBObject();
		queryObject.put("id", object);
		DBObject updateObject=order.findOne(queryObject);
		updateObject.put("finished", true);
		order.findAndModify(queryObject, updateObject);
	}
	
}
