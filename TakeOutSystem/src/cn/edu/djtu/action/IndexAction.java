package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.BaseHibernateDAO;
import cn.edu.djtu.pojo.SystemMsg;
import cn.edu.djtu.pojo.SystemMsgDAO;
import cn.edu.djtu.pojo.Takeout;

public class IndexAction extends ActionSupport{
	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String msg = null;
		
		String sql = "select * from system_msg order by id desc limit(1);";
		BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO();
		Session session = baseHibernateDAO.getSession();
		Query query = session.createSQLQuery(sql).addEntity(SystemMsg.class);
		List<SystemMsg> systemMsgs = query.list();
		
		Query query1 = session.createSQLQuery("select * from public.takeout order by sellnum desc limit 3").addEntity(Takeout.class);
		List<Takeout> takeout = query1.list();
		request.getSession().setAttribute("takeout", takeout);
		request.getSession().setAttribute("msg", systemMsgs);
		session.close();
		return SUCCESS;
	}
}
