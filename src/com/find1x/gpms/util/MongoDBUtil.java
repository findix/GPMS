package com.find1x.gpms.util;

import java.net.UnknownHostException;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

public class MongoDBUtil {
	private final static String DATABASE = "GPMS";

	private static volatile MongoDBUtil INSTANCE;

	private static Mongo mongo;
	private static Morphia morphia;
	private static Datastore ds;
	private static DB db;
	private static DBCollection dbCollection;

	private MongoDBUtil() {
		try {
			mongo = new Mongo("localhost", 27017);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		morphia = new Morphia();
		morphia.mapPackage("com.find1x.gpms.pojos");
		ds = morphia.createDatastore(mongo, DATABASE);
	}

	private static MongoDBUtil getInstance() {
		if (INSTANCE == null) {
			synchronized (MongoDBUtil.class) {
				// when more than two threads run into the first null check same
				// time, to avoid instanced more than one time, it needs to be
				// checked again.
				if (INSTANCE == null) {
					INSTANCE = new MongoDBUtil();
				}
			}
		}
		return INSTANCE;
	}

	public static Datastore getDatastore() {
		MongoDBUtil.getInstance();
		return MongoDBUtil.ds;
	}

	public static DBCollection getCollection(String collection) {
		MongoDBUtil.getInstance();
		db = mongo.getDB(DATABASE);
		dbCollection = db.getCollection(collection);		
		return MongoDBUtil.dbCollection;
	}
}
