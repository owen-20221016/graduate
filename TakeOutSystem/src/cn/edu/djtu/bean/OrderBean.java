package cn.edu.djtu.bean;

public class OrderBean {
	String email;
	String telephone;
	String address;
	String name;
	String takeout;
	Double sumPrise;
	String orderNumber;
	String starttime;
	String finishmark;
	String finishtime;
	int userid;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getFinishmark() {
		return finishmark;
	}
	public void setFinishmark(String finishmark) {
		this.finishmark = finishmark;
	}
	public String getFinishtime() {
		return finishtime;
	}
	public void setFinishtime(String finishtime) {
		this.finishtime = finishtime;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTakeout() {
		return takeout;
	}
	public void setTakeout(String takeout) {
		this.takeout = takeout;
	}
	public Double getSumPrise() {
		return sumPrise;
	}
	public void setSumPrise(Double sumPrise) {
		this.sumPrise = sumPrise;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	
}
