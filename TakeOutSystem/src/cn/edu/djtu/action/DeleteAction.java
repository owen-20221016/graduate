package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.BaseHibernateDAO;
import cn.edu.djtu.pojo.Orders;
import cn.edu.djtu.pojo.OrdersDAO;
import cn.edu.djtu.pojo.ShopCar;
import cn.edu.djtu.pojo.ShopCarDAO;
import cn.edu.djtu.pojo.Takeout;
import cn.edu.djtu.pojo.TakeoutDAO;
import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;

public class DeleteAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		String action = request.getParameter("action");
		String id = request.getParameter("id");
		String mark = request.getParameter("location");

		if (action == null || action.equals("") || request.getSession().getAttribute("iscmd") == null) {
			return ERROR;
		}

		if (action.equals("car")) {
			ShopCarDAO shopCarDAO = new ShopCarDAO();
			int c = (int) request.getSession().getAttribute("userid");
			List<ShopCar> shopCars = shopCarDAO.findByUserId(c);
			for (ShopCar shopCar : shopCars) {
				if (shopCar.getTakeoutId().equals(id))
					;
				shopCarDAO.delete(shopCar);
				return "car";
			}
		}
		if (action.equals("takeoutlist")) {
			TakeoutDAO takeoutDAO = new TakeoutDAO();
			takeoutDAO.delete(takeoutDAO.findById(Integer.parseInt(id)));
			return "takeoutlist";
		}
		if (action.equals("orders")) {
			String ordernum = request.getParameter("orderid");
			if (ordernum == null) {
				return "orders";
			}
			BaseHibernateDAO baseHibernateDAO = new BaseHibernateDAO();
			Session session = baseHibernateDAO.getSession();
			Transaction transaction = session.beginTransaction();
			Query query = session.createSQLQuery("delete from public.orders where ordernumber='"+ ordernum +"' and user_id="+ request.getSession().getAttribute("userid")+";");
			query.executeUpdate();
			transaction.commit();
			session.close();
			if (mark.equals("front")) {
				return "ordersfront";
			} else {
				return "ordersback";
			}
		}
		return ERROR;
	}
}
