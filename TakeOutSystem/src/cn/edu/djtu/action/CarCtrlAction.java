package cn.edu.djtu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.ShopCar;
import cn.edu.djtu.pojo.ShopCarDAO;

public class CarCtrlAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		if (request.getSession().getAttribute("userid") == null) {
			return ERROR;
		}
		request.getSession().removeAttribute("carlist");
		request.getSession().removeAttribute("sumPrise");

		String action = request.getParameter("action");
		String takeoutId = request.getParameter("id");

		if (action.equals("") || action == null || takeoutId.equals("") || takeoutId == null) {
			return ERROR;
		}

		ShopCarDAO shopCarDAO = new ShopCarDAO();
		int c = (int) request.getSession().getAttribute("userid");
		List<ShopCar> shopCars = shopCarDAO.findByUserId(c);
		int id = Integer.parseInt(takeoutId);
		int id2 = -1;
		if (action.equals("add")) {
			if (shopCars.size() == 0) {
				ShopCar shopCar2 = new ShopCar();
				shopCar2.setNum(1);
				shopCar2.setTakeoutId(id);
				shopCar2.setUserId(c);
				shopCarDAO.save(shopCar2);
				return SUCCESS;
			}
			for (ShopCar shopCar : shopCars) {
				id2 = shopCar.getTakeoutId();
				if (id == id2) {
					int a = shopCar.getNum() + 1;
					ShopCar shopCar1 = shopCar;
					shopCar1.setNum(a);
					shopCarDAO.updateIntity(shopCar1);
					return SUCCESS;
				}
			}
			
			ShopCar shopCar2 = new ShopCar();
			shopCar2.setNum(1);
			shopCar2.setTakeoutId(Integer.parseInt(takeoutId));
			shopCar2.setUserId(c);
			shopCarDAO.save(shopCar2);
			return SUCCESS;
			
		} 
		return SUCCESS;
	}
}
