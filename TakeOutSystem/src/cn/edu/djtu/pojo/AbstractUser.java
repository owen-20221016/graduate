package cn.edu.djtu.pojo;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private Short iscmd;

	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** full constructor */
	public AbstractUser(Integer id, String username, String password, Short iscmd) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.iscmd = iscmd;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Short getIscmd() {
		return this.iscmd;
	}

	public void setIscmd(Short iscmd) {
		this.iscmd = iscmd;
	}

}