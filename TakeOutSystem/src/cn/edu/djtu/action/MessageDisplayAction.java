package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.BaseHibernateDAO;
import cn.edu.djtu.pojo.SystemMsg;
import cn.edu.djtu.pojo.SystemMsgDAO;

public class MessageDisplayAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		SystemMsgDAO systemMsgDAO = new SystemMsgDAO();
		String sql = "select * from system_msg order by id desc limit(1);";
		BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO();
		Session session = baseHibernateDAO.getSession();
		Query query = session.createSQLQuery(sql).addEntity(SystemMsg.class);
		List<SystemMsg> systemMsgs = query.list();
		request.setAttribute("systemMsgs", systemMsgs);
		return SUCCESS;
	}
}
