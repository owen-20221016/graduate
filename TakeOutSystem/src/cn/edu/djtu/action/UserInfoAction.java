package cn.edu.djtu.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.djtu.pojo.UserInfo;
import cn.edu.djtu.pojo.UserInfoDAO;

public class UserInfoAction extends ActionSupport {
	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();

		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");

		if (name.equals("") || name == null || telephone.equals("") || telephone == null || address.equals("")
				|| address == null) {
			request.getSession().setAttribute("userMsg", "can not be null");
			return ERROR;
		}

		UserInfo userInfoNew = new UserInfo();

		if (request.getSession().getAttribute("userinfo") == null) {
			userInfoNew.setUserId((Integer) request.getSession().getAttribute("userid"));
			userInfoNew.setName(name);
			userInfoNew.setAddress(address);
			userInfoNew.setSex(Short.parseShort(sex));
			userInfoNew.setTelephone(telephone);
			UserInfoDAO userInfoDAO = new UserInfoDAO();
			userInfoDAO.save(userInfoNew);
			request.getSession().setAttribute("userinfo", userInfoNew);
			request.getSession().setAttribute("userMsg", "success");
			return SUCCESS;
		} else {
			UserInfo userInfoOld = (UserInfo) request.getSession().getAttribute("userinfo");
			userInfoNew.setId(userInfoOld.getId());
			userInfoNew.setUserId(userInfoOld.getUserId());
			userInfoNew.setName(name);
			userInfoNew.setAddress(address);
			userInfoNew.setSex(Short.parseShort(sex));
			userInfoNew.setTelephone(telephone);
			UserInfoDAO userInfoDAO = new UserInfoDAO();
			userInfoDAO.updateIntity(userInfoNew);
			request.getSession().removeAttribute("userinfo");
			request.getSession().setAttribute("userinfo", userInfoNew);
			request.getSession().setAttribute("userMsg", "success");
			return SUCCESS;
		}
	}
}
