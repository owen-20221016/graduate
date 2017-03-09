package cn.edu.djtu.bean;

import cn.edu.djtu.pojo.AbstractShopCar;

public class CarBean extends AbstractShopCar{
	private Integer id;
	private Integer userId;
	private Integer takeoutId;
	private Integer num;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getTakeoutId() {
		return takeoutId;
	}

	public void setTakeoutId(Integer takeoutId) {
		this.takeoutId = takeoutId;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}
