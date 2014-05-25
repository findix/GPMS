package com.find1x.gpms.dao;

import java.util.List;

import com.find1x.gpms.pojos.Teacher;
import com.find1x.gpms.util.MongoDBUtil;

public class TeacherDAO {
	public static List<Teacher> getList() {
		List<Teacher> list = MongoDBUtil.getDatastore()
				.find(Teacher.class).asList();
		return list;
	}
	
	public static List<Teacher> getStudents(String teacher) {
		List<Teacher> list = MongoDBUtil.getDatastore()
				.find(Teacher.class).filter("teacher", teacher).asList();
		return list;
	}
}
