package cn.edu.djtu.pojo;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */
public class UserInfo extends AbstractUserInfo implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserInfo() {
	}

	/** minimal constructor */
	public UserInfo(Integer id, Integer userId) {
		super(id, userId);
	}

	/** full constructor */
	public UserInfo(Integer id, Integer userId, String telephone, Short sex,
			String address, String name) {
		super(id, userId, telephone, sex, address, name);
	}

}
