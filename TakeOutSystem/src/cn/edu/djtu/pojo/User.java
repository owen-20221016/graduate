package cn.edu.djtu.pojo;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(Integer id, String username, String password, Short iscmd) {
		super(id, username, password, iscmd);
	}

}
