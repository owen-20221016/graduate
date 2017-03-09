package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.Takeout;
import cn.edu.djtu.pojo.TakeoutDAO;

public class TakeOutAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String mark = request.getParameter("mark");
		if (mark == null || mark.equals("")) {
			mark = "front";
		}

		if(request.getSession().getAttribute("addmsg") != null) {
			request.getSession().setAttribute("addmsg", null);
		}
		
		TakeoutDAO takeoutDAO = new TakeoutDAO();
		List<Takeout> takeouts = takeoutDAO.findAll();
		request.getSession().setAttribute("takeouts", takeouts);
		if (mark.equals("front")) {
			return "front";
		} else if (mark.equals("back")) {
			if (request.getSession().getAttribute("iscmd") == null) {
				return ERROR;

			} else if (request.getSession().getAttribute("iscmd").equals(0)) {
				return ERROR;
			} else {
				return "back";
			}
		}
		return ERROR;
	}
}
