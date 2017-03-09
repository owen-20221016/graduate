package cn.edu.djtu.bean;

public class CarListBean {
	private Integer userId;
	private Integer takeoutId;
	private Integer num;
	private String name;
	private String img;
	private Double prise;
	
	public Double getPrise() {
		return prise;
	}
	public void setPrise(Double prise) {
		this.prise = prise;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

}
