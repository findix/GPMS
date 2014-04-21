package com.find1x.gpms.util;

import java.net.UnknownHostException;

import com.find1x.gpms.pojos.User;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

public class MongoDBUtil{
	public static DBCollection getCollection(String collection){
		Mongo mongo = null;
		try {
			mongo = new Mongo("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB db=mongo.getDB("GPMS");
		DBCollection users=db.getCollection(collection);
		return users;
	}
	public static User convertDBObject2User(DBObject dBObject){
		User user=new User();
		user.setUsername(dBObject.get("username").toString());
		user.setPassword(dBObject.get("password").toString());
		return user;
	}
	public static DBObject convertUser2DBObject(User user){
		DBObject dBObject =new BasicDBObject();
		dBObject.put("username", user.getUsername());
		dBObject.put("password", user.getPassword());
		return dBObject;
	}
}
