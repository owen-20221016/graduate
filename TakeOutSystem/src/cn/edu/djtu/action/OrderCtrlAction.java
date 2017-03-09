package cn.edu.djtu.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.djtu.pojo.Orders;
import cn.edu.djtu.pojo.OrdersDAO;

import com.opensymphony.xwork2.ActionSupport;

public class OrderCtrlAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("userid"));
		String orderNumber = request.getParameter("orderNumber");
		String mark = request.getParameter("mark");
		String location = request.getParameter("location");
		OrdersDAO ordersDAO = new OrdersDAO();
		List<Orders> orders = ordersDAO.findAll();

		for (int a = 0; a < orders.size(); a++) {
			if (orders.get(a).getId().getOrdernumber().equals(orderNumber) && orders.get(a).getId().getUserId() == id) {
				orders.get(a).setFinishmark(mark);
				if (mark.equals("1")) {
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					String ordernumber = format.format(new Date()).toString();
					orders.get(a).setFinishtime(orderNumber.toString());

				}
				ordersDAO.update(orders.get(a));
			}
		}
		if (location.equals("back")) {
			return "back";
		} else if (location.equals("front")) {
			return "front";
		}
		return ERROR;
	}
}
