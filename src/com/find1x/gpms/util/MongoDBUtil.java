package com.find1x.gpms.util;

import java.net.UnknownHostException;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.find1x.gpms.pojos.User;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

public class MongoDBUtil {
	private static volatile MongoDBUtil INSTANCE;

	private static Mongo mongo;
	private static Morphia morphia;
	private static Datastore ds;
	private static DBCollection users;

	private MongoDBUtil() {
		try {
			mongo = new Mongo("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		morphia = new Morphia();
		morphia.mapPackage("com.find1x.gpms.pojos");
		ds = morphia.createDatastore(mongo, "GPMS");
	}

	public static MongoDBUtil getInstance() {
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

	public Datastore getDatastore() {
		return ds;
	}
}
