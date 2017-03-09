package cn.edu.djtu.pojo;

/**
 * ShopCar entity. @author MyEclipse Persistence Tools
 */
public class ShopCar extends AbstractShopCar implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public ShopCar() {
	}

	/** full constructor */
	public ShopCar(Integer id, Integer userId, Integer takeoutId, Integer num) {
		super(id, userId, takeoutId, num);
	}

}
