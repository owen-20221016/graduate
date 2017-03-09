package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;
import cn.edu.djtu.pojo.UserInfo;
import cn.edu.djtu.pojo.UserInfoDAO;

public class LoginAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username == null || username.equals("") && password == null || username.equals("")) {
			return ERROR;
		}
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		UserDAO userDAO = new UserDAO();
		int userId = 0;
		int isCMD = 0;
		List<User> list = (List<User>)userDAO.findByExample(user);
		if (list.size() == 1) {
			for (User user1 : list) {
				userId = user1.getId();
				isCMD = user1.getIscmd();
				request.getSession().setAttribute("iscmd", isCMD);
				UserInfoDAO userInfoDAO = new UserInfoDAO();
				List<UserInfo> userInfo = userInfoDAO.findByUserId(userId);
				if (userInfo.size() == 0) {
					request.getSession().setAttribute("userinfo", null);
				} else {
					request.getSession().setAttribute("userinfo", userInfo.get(0));
				}
				request.getSession().setAttribute("userid", userId);
				return SUCCESS;
			}
		} else {
			request.getSession().setAttribute("loginerr", "login filed");
			return ERROR;
		}
		return ERROR;
	}
}
