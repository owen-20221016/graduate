package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.bean.UserViewBean;
import cn.edu.djtu.pojo.HibernateSessionFactory;

public class UserListAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		if (request.getSession().getAttribute("iscmd") == null || request.getSession().getAttribute("iscmd").equals(0)) {
			return ERROR;
		}
		
		if (request.getSession().getAttribute("backusermsg") != null) {
			request.getSession().setAttribute("backusermsg", null);
		}
		StringBuffer queryString = new StringBuffer();
		queryString.append("SELECT ");
		queryString.append("user_.id, ");
		queryString.append("user_.id as user_id,");
		queryString.append("user_info.telephone, ");
		queryString.append("user_info.sex, ");
		queryString.append("user_info.address, ");
		queryString.append("user_info.name, ");
		queryString.append("user_.iscmd, ");
		queryString.append("user_.username ");
		queryString.append("FROM ");
		queryString.append("public.user_ left join public.user_info ");
		queryString.append("ON ");
		queryString.append("user_info.user_id = user_.id;");
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createSQLQuery(queryString.toString()).addEntity(UserViewBean.class);
		List<UserViewBean> list = (List<UserViewBean>)query.list();
		request.getSession().setAttribute("userlist", list);
		return SUCCESS;
	}
}
