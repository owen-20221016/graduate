package cn.edu.djtu.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;
import cn.edu.djtu.pojo.UserInfo;

public class BackUserDisplayAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int editUserId = -1;
		UserDAO userDAO = new UserDAO();
		if (request.getSession().getAttribute("userid") == null) {
			return "index";
		}
		if (request.getSession().getAttribute("iscmd").equals("0")) {
			return ERROR;
		}
			if (request.getParameter("backuserid") != null ) {
				editUserId = Integer.parseInt(request.getParameter("backuserid"));
			}
			if (editUserId != -1) {
				request.getSession().setAttribute("editUserId", editUserId);
			} else {
				editUserId = (int)request.getSession().getAttribute("editUserId");
			}

			User user = userDAO.findById(editUserId);
			user.setPassword("");

			request.setAttribute("backuserinfo", user);
			return SUCCESS;
	}
}
