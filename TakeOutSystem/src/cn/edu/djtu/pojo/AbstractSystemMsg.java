package cn.edu.djtu.pojo;

/**
 * AbstractSystemMsg entity provides the base persistence definition of the
 * SystemMsg entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSystemMsg implements java.io.Serializable {

	// Fields

	private Integer id;
	private String message;

	// Constructors

	/** default constructor */
	public AbstractSystemMsg() {
	}

	/** full constructor */
	public AbstractSystemMsg(Integer id, String message) {
		this.id = id;
		this.message = message;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}