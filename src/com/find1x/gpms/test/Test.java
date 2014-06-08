package com.find1x.gpms.test;

import com.find1x.gpms.dao.SysControlDAO;
import com.find1x.gpms.pojos.SysControl;

public class Test {

	@org.junit.Test
	public void myTest() {
		// List<User> list = MongoDBUtil.getDatastore().find(User.class)
		// .filter("username", "20113092").filter("password", "123456")
		// .asList();
		// System.out.println(list.size());

		// Student stu = new Student();
		// stu.setName("凤翔");
		// MongoDBUtil.getDatastore().save(stu);

		// User user = new User();
		// user.setRefId(MongoDBUtil.getDatastore().find(Student.class).filter("name",
		// "凤翔").get().get_id());
		// MongoDBUtil.getDatastore().save(user);
		// ObjectId refId = MongoDBUtil.getDatastore().find(User.class)
		// .filter("username", "20113092").get().getRefId();
		// System.out.println(refId);
		// System.out.println(UserDAO.getUserName("20113092", 0));
		// List<Issue> list = IssueDAO.getList();
		// for(Issue i:list){
		// System.out.println(i.getTitle());
		// }
		SysControlDAO.saveSysControl(new SysControl());
	}
}
