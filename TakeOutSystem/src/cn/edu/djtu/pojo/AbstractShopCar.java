package cn.edu.djtu.pojo;

/**
 * AbstractShopCar entity provides the base persistence definition of the
 * ShopCar entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShopCar implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer takeoutId;
	private Integer num;

	// Constructors

	/** default constructor */
	public AbstractShopCar() {
	}

	/** full constructor */
	public AbstractShopCar(Integer id, Integer userId, Integer takeoutId,
			Integer num) {
		this.id = id;
		this.userId = userId;
		this.takeoutId = takeoutId;
		this.num = num;
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

	public Integer getTakeoutId() {
		return this.takeoutId;
	}

	public void setTakeoutId(Integer takeoutId) {
		this.takeoutId = takeoutId;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}