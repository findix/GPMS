package com.find1x.gpms.dao;

import java.util.List;

import com.find1x.gpms.pojos.User;
import com.find1x.gpms.util.MongoDBUtil;

public class UserDAO {
	public static List<User> findUserList(String username, String Password) {
		List<User> list = MongoDBUtil.getDatastore()
				.find(User.class).filter("username", username)
				.filter("password", Password).asList();
		return list;
	}
}
