package com.find1x.gpms.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.find1x.gpms.pojos.Administrator;
import com.find1x.gpms.pojos.DepartmentHead;
import com.find1x.gpms.pojos.Student;
import com.find1x.gpms.pojos.Teacher;
import com.find1x.gpms.pojos.User;
import com.find1x.gpms.util.MongoDBUtil;

public class UserDAO {
	public static List<User> findUserList(String username, String Password) {
		List<User> list = MongoDBUtil.getDatastore().find(User.class)
				.filter("username", username).filter("password", Password)
				.asList();
		return list;
	}

	public static String getUserName(String username, int type) {
		ObjectId refId = MongoDBUtil.getDatastore().find(User.class)
				.filter("username", username).get().getRefId();
		switch (type) {
		case 0:
			Student student = MongoDBUtil.getDatastore().find(Student.class)
					.filter("_id", refId).get();
			return (student == null ? username : student.getName());
		case 1:
		case 2:
		case 3:
			Teacher teacher = MongoDBUtil.getDatastore().find(Teacher.class)
					.filter("_id", refId).get();
			return (teacher == null ? username : teacher.getName());
		}
		return null;
	}
	
	public static int getType(String username){
		return MongoDBUtil.getDatastore()
		.find(User.class).filter("username", username).get().getType();
	}
}
