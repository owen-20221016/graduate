package cn.edu.djtu.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;

public class BackUserSubmitAction extends ActionSupport {
	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		UserDAO userDAO = new UserDAO();
		int editUserId = -1;

		if (request.getSession().getAttribute("userid") == null) {
			return "index";
		}

		editUserId = Integer.parseInt(request.getParameter("backuserid"));
		String iscmd = request.getParameter("iscmd");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");

		if ((password1 != null && password2 != null)) {
			if (password1.equals(password2)) {
				User userOld = userDAO.findById(editUserId);
				userOld.setIscmd((short) Integer.parseInt(iscmd));
				userOld.setPassword(password1);
				userDAO.update(userOld);
				request.getSession().setAttribute("backusermsg", "success");
				return "submit";
			} else {
				request.getSession().setAttribute("backusermsg", "password error");
				return ERROR;
			}
		} else {
			request.getSession().setAttribute("backusermsg", "password error");
			return ERROR;
		}
	}
}
