package cn.edu.djtu.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.SystemMsg;
import cn.edu.djtu.pojo.SystemMsgDAO;

public class MessageeditAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String message = request.getParameter("message");
		SystemMsgDAO systemMsgDAO = new SystemMsgDAO();
		SystemMsg systemMsg = new SystemMsg();
		systemMsg.setMessage(message);
		systemMsgDAO.save(systemMsg);
		return SUCCESS;
	}
}
