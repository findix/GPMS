package com.find1x.gpms.dao;

import java.util.List;

import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import com.find1x.gpms.pojos.Issue;
import com.find1x.gpms.util.MongoDBUtil;


public class IssueDAO {
	public static List<Issue> getList(String specialty) {
		List<Issue> list = MongoDBUtil.getDatastore()
				.find(Issue.class).filter("specialty", specialty).asList();
		return list;
	}

	public static List<Issue> getList() {
		List<Issue> list = MongoDBUtil.getDatastore()
				.find(Issue.class).asList();
		return list;
	}
	
	public static Issue getIssue(String _id){
		List<Issue> list = MongoDBUtil.getDatastore()
				.find(Issue.class).filter("_id", new ObjectId(_id)).asList();
		return list.get(0);
	}
	
	public static Issue getIssue(ObjectId _id){
		List<Issue> list = MongoDBUtil.getDatastore()
				.find(Issue.class).filter("_id", _id).asList();
		return list.get(0);
	}
	
	public static boolean addIssue(String title, String info,
			String requirement, String specialty, String total) {
		try {
			Issue issue=new Issue();
			issue.setTitle(title);
			issue.setInfo(info);
			issue.setRequirement(requirement);
			issue.setSpecialty(specialty);
			issue.setTotal(total);
			Datastore ds = MongoDBUtil.getDatastore();
			ds.save(issue);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean changeIssue(String _id,String title, String info,
			String requirement, String specialty, String total) {
		try {
			Datastore ds = MongoDBUtil.getDatastore();
			ds.update(ds.find(Issue.class).filter("_id", new ObjectId(_id)),
					ds.createUpdateOperations(Issue.class)
					.set("title", title).set("info", info).set("requirement", requirement)
					.set("specialty", specialty).set("total", total));
					
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean deleteIssue(String _id) {
		try {
			Datastore ds = MongoDBUtil.getDatastore();
			ds.delete(ds.find(Issue.class).filter("_id", new ObjectId(_id)));				
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
