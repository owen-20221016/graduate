package cn.edu.djtu.pojo;

/**
 * OrdersId entity. @author MyEclipse Persistence Tools
 */
public class OrdersId extends AbstractOrdersId implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public OrdersId() {
	}

	/** full constructor */
	public OrdersId(String ordernumber, Integer takeoutId, Integer userId) {
		super(ordernumber, takeoutId, userId);
	}

}
