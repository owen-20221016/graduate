package cn.edu.djtu.pojo;

/**
 * Takeout entity. @author MyEclipse Persistence Tools
 */
public class Takeout extends AbstractTakeout implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Takeout() {
	}

	/** minimal constructor */
	public Takeout(Integer id, String name, Integer sellnum, Integer num,
			String img) {
		super(id, name, sellnum, num, img);
	}

	/** full constructor */
	public Takeout(Integer id, String name, String description,
			Integer sellnum, Integer num, String img, Double prise) {
		super(id, name, description, sellnum, num, img, prise);
	}

}
