package cn.edu.djtu.pojo;

/**
 * AbstractTakeout entity provides the base persistence definition of the
 * Takeout entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTakeout implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String description;
	private Integer sellnum;
	private Integer num;
	private String img;
	private Double prise;

	// Constructors

	/** default constructor */
	public AbstractTakeout() {
	}

	/** minimal constructor */
	public AbstractTakeout(Integer id, String name, Integer sellnum,
			Integer num, String img) {
		this.id = id;
		this.name = name;
		this.sellnum = sellnum;
		this.num = num;
		this.img = img;
	}

	/** full constructor */
	public AbstractTakeout(Integer id, String name, String description,
			Integer sellnum, Integer num, String img, Double prise) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.sellnum = sellnum;
		this.num = num;
		this.img = img;
		this.prise = prise;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getSellnum() {
		return this.sellnum;
	}

	public void setSellnum(Integer sellnum) {
		this.sellnum = sellnum;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Double getPrise() {
		return this.prise;
	}

	public void setPrise(Double prise) {
		this.prise = prise;
	}

}