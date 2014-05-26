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
			Teacher teacher = MongoDBUtil.getDatastore().find(Teacher.class)
					.filter("_id", refId).get();
			return (teacher == null ? username : teacher.getName());
		case 2:
			Administrator administrator = MongoDBUtil.getDatastore().find(Administrator.class)
					.filter("_id", refId).get();
			return (administrator == null ? username : administrator.getName());
		case 3:
			DepartmentHead departmentHead = MongoDBUtil.getDatastore().find(DepartmentHead.class)
					.filter("_id", refId).get();
			return (departmentHead == null ? username : departmentHead.getName());
		}
		return null;
	}
}
