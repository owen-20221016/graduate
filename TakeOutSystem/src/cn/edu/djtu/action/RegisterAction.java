package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;

public class RegisterAction extends ActionSupport {
	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();

		if(request.getSession().getAttribute("userid") != null ) {
			return SUCCESS;
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		
		if (!password.equals(password1)) {
			request.getSession().setAttribute("regerr", "not same");
			return ERROR;
		}

		if (username.equals("") || username == null || password.equals("") || password == null) {
			request.getSession().setAttribute("regerr", "not null");
			return ERROR;
		}
		
		UserDAO userDAO = new UserDAO();
		List<User> list = userDAO.findByUsername(username);
		
		if (list.size() >= 1) {
			request.getSession().setAttribute("regerr", "user igzist");
			return ERROR;
		} 
		
		short a = 0;
		User user = new User();
		user.setIscmd(a);
		user.setUsername(username);
		user.setPassword(password);
		
		userDAO.save(user);
		

		return SUCCESS;
	}
}
