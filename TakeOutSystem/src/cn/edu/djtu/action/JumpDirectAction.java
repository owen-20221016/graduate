package cn.edu.djtu.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class JumpDirectAction extends ActionSupport {

	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		String location = request.getParameter("location");
		if (location.equals("register")) {
			return "register";
		}
		if (request.getSession().getAttribute("userid") != null) {

			if (location.equals("userinfo")) {
				return "userinfo";
			}
			if (location.equals("message")) {
				return "message";
			}
			if (location.equals("addtakeout")) {
				return "addtakeout";
			}
			if (location.equals("backuserpass")) {
				return "backuserpass";
			}
		}
		return ERROR;
	}
}
