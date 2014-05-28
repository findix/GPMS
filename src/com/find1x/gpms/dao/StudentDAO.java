package com.find1x.gpms.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.find1x.gpms.pojos.Student;
import com.find1x.gpms.pojos.User;
import com.find1x.gpms.util.MongoDBUtil;

public class StudentDAO {
	public static List<Student> getList() {
		List<Student> list = MongoDBUtil.getDatastore()
				.find(Student.class).asList();
		return list;
	}

	public static Student getStudentInfo(String no) {
		Student student= MongoDBUtil.getDatastore()
				.find(Student.class).filter("no", no).get();
		return student;
	}
	
	public static ObjectId addStudent(String no, String name,
			String sex, String classno, String department,
			String specialty,String telephone,String email) {
		try {
			Student student=new Student();
			student.setNo(no);
			student.setName(name);
			student.setSex(sex);
			student.setClassno(classno);
			student.setDepartment(department);
			student.setSpecialty(specialty);
			student.setTelephone(telephone);
			student.setEmail(email);
			MongoDBUtil.getDatastore().save(student);
			return MongoDBUtil.getDatastore().find(Student.class)
					.filter("no", no).get().get_id();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean createUser(ObjectId _id,String username){
		try {
			User user=new User();
			user.setRefId(_id);
			user.setUsername(username);
			user.setType(0);
			user.setPassword("123456");
			MongoDBUtil.getDatastore().save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean  existStudent(String no){
		if(MongoDBUtil.getDatastore()
				.find(Student.class).filter("no", no).get()==null)
			return false;
		else
			return true;
	}
}
