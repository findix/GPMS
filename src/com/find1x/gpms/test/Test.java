package com.find1x.gpms.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import com.find1x.gpms.pojos.User;
import com.find1x.gpms.util.MongoDBUtil;

public class Test {

	@org.junit.Test
	public void test() {
		List<User> list = MongoDBUtil.getInstance().getDatastore()
				.find(User.class).filter("username", "20113092")
				.filter("password", "123456").asList();
		System.out.println(list.size());
	}
}
