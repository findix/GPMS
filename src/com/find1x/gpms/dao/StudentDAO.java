package com.find1x.gpms.dao;

import java.util.List;

import com.find1x.gpms.pojos.Student;
import com.find1x.gpms.util.MongoDBUtil;

public class StudentDAO {
	public static List<Student> getList() {
		List<Student> list = MongoDBUtil.getDatastore()
				.find(Student.class).asList();
		return list;
	}
}
