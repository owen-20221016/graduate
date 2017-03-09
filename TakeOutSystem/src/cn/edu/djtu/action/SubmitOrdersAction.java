package cn.edu.djtu.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.djtu.pojo.Orders;
import cn.edu.djtu.pojo.OrdersDAO;
import cn.edu.djtu.pojo.OrdersId;
import cn.edu.djtu.pojo.ShopCar;
import cn.edu.djtu.pojo.ShopCarDAO;
import cn.edu.djtu.pojo.Takeout;
import cn.edu.djtu.pojo.TakeoutDAO;

import com.opensymphony.xwork2.ActionSupport;

public class SubmitOrdersAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request.getSession().getAttribute("userid") == null) {
			return ERROR;
		}
			int userid = (Integer) request.getSession().getAttribute("userid");

			ShopCarDAO shopCarDAO = new ShopCarDAO();
			TakeoutDAO takeoutDAO = new TakeoutDAO();
			OrdersDAO ordersDAO = new OrdersDAO();
			List<ShopCar> list = shopCarDAO.findByUserId(userid);
			DateFormat format = new SimpleDateFormat("MMyysshhddmm");
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String ordernumber = format.format(new Date()).toString();
			String starttime = format1.format(new Date()).toString();

			for (int i = 0; i < list.size(); i++) {
				Orders orders = new Orders();
				orders.setNumber(list.get(i).getNum());
				OrdersId ordersId = new OrdersId();
				ordersId.setOrdernumber(ordernumber);
				ordersId.setTakeoutId(list.get(i).getTakeoutId());
				ordersId.setUserId(userid);
				orders.setId(ordersId);
				Takeout takeout = takeoutDAO.findById(list.get(i)
						.getTakeoutId());
				orders.setSumPrise(takeout.getPrise() * list.get(i).getNum());
				orders.setFinishmark("3");
				orders.setFinishtime(null);
				orders.setStarttime(starttime);
				ordersDAO.save(orders);
				shopCarDAO.delete(list.get(i));
				int temp = takeout.getSellnum();
				takeout.setSellnum(temp + list.get(i).getNum());
				takeoutDAO.update(takeout);
			}
		return SUCCESS;
	}
}
