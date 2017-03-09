package cn.edu.djtu.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.bean.CarListBean;
import cn.edu.djtu.pojo.ShopCar;
import cn.edu.djtu.pojo.ShopCarDAO;
import cn.edu.djtu.pojo.Takeout;
import cn.edu.djtu.pojo.TakeoutDAO;

public class CarAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		if (request.getSession().getAttribute("userid") == null) {
			return ERROR;
		}
		request.getSession().removeAttribute("sumPrise");
		request.getSession().removeAttribute("carlist");
		
		ShopCarDAO shopCarDAO = new ShopCarDAO();
		TakeoutDAO takeoutDAO = new TakeoutDAO();
		List<CarListBean> carlist = new ArrayList<CarListBean>();
		double sumPrise = 0;
		int id = (int)request.getSession().getAttribute("userid");
		List<ShopCar> shopcars = (List<ShopCar>)shopCarDAO.findByUserId(id);
		for (ShopCar shopCar : shopcars) {
			Takeout takeout = takeoutDAO.findById(shopCar.getTakeoutId());
			if (takeout != null) {
			CarListBean carListBean = new CarListBean();
			carListBean.setImg(takeout.getImg());
			carListBean.setName(takeout.getName());
			carListBean.setNum(shopCar.getNum());
			carListBean.setTakeoutId(shopCar.getTakeoutId());
			carListBean.setUserId(shopCar.getUserId());
			carListBean.setPrise(takeout.getPrise());
			carlist.add(carListBean);
			sumPrise += takeout.getPrise()*shopCar.getNum();
			}
		}
		request.setAttribute("sumPrise", sumPrise);
		request.setAttribute("carlist", carlist);
		return SUCCESS;
	}
}
