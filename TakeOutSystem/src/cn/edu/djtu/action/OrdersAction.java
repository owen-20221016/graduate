package cn.edu.djtu.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.djtu.bean.OrderBean;
import cn.edu.djtu.pojo.Orders;
import cn.edu.djtu.pojo.OrdersDAO;
import cn.edu.djtu.pojo.OrdersId;
import cn.edu.djtu.pojo.Takeout;
import cn.edu.djtu.pojo.TakeoutDAO;
import cn.edu.djtu.pojo.User;
import cn.edu.djtu.pojo.UserDAO;
import cn.edu.djtu.pojo.UserInfo;
import cn.edu.djtu.pojo.UserInfoDAO;

import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport {

	OrdersDAO ordersDAO = new OrdersDAO();
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	TakeoutDAO takeoutDAO = new TakeoutDAO();
	UserDAO userDAO = new UserDAO();
	List<OrderBean> orderBeans = new ArrayList();

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		if (request.getSession().getAttribute("userid") == null) {
			return ERROR;
		}

		int userid = (int) request.getSession().getAttribute("userid");
		String mark = request.getParameter("mark");

		if (mark.equals("back")) {
			findALl();
			if(orderBeans.size() >= 2) {
				sumPrise();
			}
			
			request.setAttribute("ordersList", orderBeans);
			return "back";
		} else if (mark.equals("front")) {
			findById(userid);
			if(orderBeans.size() >= 2) {
				sumPrise();
			}
			request.setAttribute("ordersListF", orderBeans);
			return "front";
		}
		return ERROR;
	}

	public void sumPrise() {
		List<OrderBean> orderBeans = new ArrayList<OrderBean>();
			orderBeans.add(0, this.orderBeans.get(0));
			int b = 0;
			for (int a = 1; a < this.orderBeans.size(); a++) {
				if (orderBeans.get(b).getOrderNumber().equals(this.orderBeans.get(a).getOrderNumber())) {
					orderBeans.get(b).setSumPrise(this.orderBeans.get(a).getSumPrise() + orderBeans.get(b).getSumPrise());
				} else {
					orderBeans.add(++b, this.orderBeans.get(a));
				}
			}
		this.orderBeans = orderBeans;
	}

	public void findById(int userid) {
		List<Orders> orders = ordersDAO.findAll();
		for (Orders orders2 : orders) {
			if (orders2.getId().getUserId() == userid) {
				OrderBean orderBean = new OrderBean();
				List<UserInfo> userInfo = userInfoDAO.findByUserId(orders2.getId().getUserId());
				orderBean.setName(userInfo.get(0).getName());
				orderBean.setTelephone(userInfo.get(0).getTelephone());
				orderBean.setAddress(userInfo.get(0).getAddress());
				User user = userDAO.findById(orders2.getId().getUserId());
				orderBean.setEmail(user.getUsername());
				Takeout takeout = takeoutDAO.findById(orders2.getId().getTakeoutId());
				orderBean.setTakeout(takeout.getName());
				orderBean.setSumPrise(orders2.getSumPrise());
				orderBean.setOrderNumber(orders2.getId().getOrdernumber());
				orderBean.setStarttime(orders2.getStarttime());
				orderBean.setFinishtime(orders2.getFinishtime());
				orderBean.setFinishmark(orders2.getFinishmark());
				orderBeans.add(orderBean);
			}
		}
	}

	public void findALl() {
		List<Orders> orders = ordersDAO.findAll();
		for (Orders orders2 : orders) {
			OrderBean orderBean = new OrderBean();
			List<UserInfo> userInfo = userInfoDAO.findByUserId(orders2.getId().getUserId());
			orderBean.setUserid(orders2.getId().getUserId());
			orderBean.setName(userInfo.get(0).getName());
			orderBean.setTelephone(userInfo.get(0).getTelephone());
			orderBean.setAddress(userInfo.get(0).getAddress());
			User user = userDAO.findById(orders2.getId().getUserId());
			orderBean.setEmail(user.getUsername());
			Takeout takeout = takeoutDAO.findById(orders2.getId().getTakeoutId());
			orderBean.setTakeout(takeout.getName());
			orderBean.setSumPrise(orders2.getSumPrise());
			orderBean.setOrderNumber(orders2.getId().getOrdernumber());
			orderBean.setStarttime(orders2.getStarttime());
			orderBean.setFinishtime(orders2.getFinishtime());
			orderBean.setFinishmark(orders2.getFinishmark());
			orderBeans.add(orderBean);
		}
	}
}
