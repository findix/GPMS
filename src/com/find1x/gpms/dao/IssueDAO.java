package com.find1x.gpms.dao;

import java.util.List;

import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import com.find1x.gpms.pojos.Issue;
import com.find1x.gpms.util.MongoDBUtil;


public class IssueDAO {
	public static List<Issue> getList(String teacher) {
		List<Issue> list = MongoDBUtil.getDatastore()
				.find(Issue.class).filter("teacher", teacher).asList();
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
			String requirement, String specialty, String total, String teacher) {
		try {
			Issue issue=new Issue();
			issue.setTitle(title);
			issue.setInfo(info);
			issue.setRequirement(requirement);
			issue.setSpecialty(specialty);
			issue.setTotal(total);
			issue.setRemain(Integer.valueOf(total));
			issue.setTeacher(teacher);
			Datastore ds = MongoDBUtil.getDatastore();
			ds.save(issue);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean changeIssue(String _id,String title, String info,
			String requirement, String specialty, String total ,String teacher) {
		try {
			Datastore ds = MongoDBUtil.getDatastore();
			ds.update(ds.find(Issue.class).filter("_id", new ObjectId(_id)),
					ds.createUpdateOperations(Issue.class)
					.set("title", title).set("info", info).set("requirement", requirement)
					.set("specialty", specialty).set("total", total).set("teacher", teacher));
					
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
	
	public static String getIssueJson(String title){
		try {
			String json;
			Issue issue=MongoDBUtil.getDatastore().find(Issue.class).filter("title", title).get();
			json="{\"title\":\""+issue.getTitle()+"\","+"\"info\":\""+issue.getInfo()+"\","+"\"requirement\":\""+issue.getRequirement()+"\","
					+"\"specialty\":\""+issue.getSpecialty()+"\","+"\"total\":\""+issue.getTotal()+"\","+"\"teacher\":\""
					+TeacherDAO.getName(issue.getTeacher())+"\"}";
			//json="{\"title\":\"adadfs\",\"info\":\"fdsdf\"}";
			return json;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String selectSubject(String title){
		Datastore ds = MongoDBUtil.getDatastore();
		Issue issue=ds.find(Issue.class).filter("title", title).get();
		if(issue.getRemain()>0){
			ds.update(issue, 
					ds.createUpdateOperations(Issue.class).set("remain", issue.getRemain()-1));
			return issue.getTeacher();
		}
		else return null;
	}
}
