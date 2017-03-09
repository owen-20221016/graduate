package cn.edu.djtu.test;

import org.junit.Test;

import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;

public class TestSave {
	@Test
	public void testSave() {
		short a = 0;
		UserDAO userDAO = new UserDAO();
		User user = new User();
		
		user.setUsername("username");
		user.setPassword("password");
		user.setIscmd(a);
		userDAO.save(user);
		
	}
}
