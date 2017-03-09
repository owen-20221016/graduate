package cn.edu.djtu.test;

import org.junit.Test;

import cn.edu.djtu.pojo.UserInfo;
import cn.edu.djtu.pojo.UserInfoDAO;

public class TestUpdate {
	@Test
	public void testUpdate () {
		UserInfo userInfo = new UserInfo();
		userInfo.setAddress("hahaha");
		userInfo.setName("haa");
		short a = 1;
		userInfo.setId(1);
		userInfo.setSex(a);
		userInfo.setTelephone("13130002121");
		userInfo.setUserId(1);
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		userInfoDAO.updateIntity(userInfo);
	}
}
