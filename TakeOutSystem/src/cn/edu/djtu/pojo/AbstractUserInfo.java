package cn.edu.djtu.pojo;

/**
 * AbstractUserInfo entity provides the base persistence definition of the
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String telephone;
	private Short sex;
	private String address;
	private String name;

	// Constructors

	/** default constructor */
	public AbstractUserInfo() {
	}

	/** minimal constructor */
	public AbstractUserInfo(Integer id, Integer userId) {
		this.id = id;
		this.userId = userId;
	}

	/** full constructor */
	public AbstractUserInfo(Integer id, Integer userId, String telephone,
			Short sex, String address, String name) {
		this.id = id;
		this.userId = userId;
		this.telephone = telephone;
		this.sex = sex;
		this.address = address;
		this.name = name;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Short getSex() {
		return this.sex;
	}

	public void setSex(Short sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}