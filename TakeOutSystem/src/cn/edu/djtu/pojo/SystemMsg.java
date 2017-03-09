package cn.edu.djtu.pojo;

/**
 * SystemMsg entity. @author MyEclipse Persistence Tools
 */
public class SystemMsg extends AbstractSystemMsg implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public SystemMsg() {
	}

	/** full constructor */
	public SystemMsg(Integer id, String message) {
		super(id, message);
	}

}
