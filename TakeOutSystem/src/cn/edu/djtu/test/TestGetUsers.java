package cn.edu.djtu.test;

import java.util.List;

import org.junit.Test;

import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;

public class TestGetUsers {
	@Test
	public void testGetUsers () {
		UserDAO userDAO = new UserDAO();
		List<User> list = userDAO.findAll();
		for ( User user : list) {
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
		}
	}
}
