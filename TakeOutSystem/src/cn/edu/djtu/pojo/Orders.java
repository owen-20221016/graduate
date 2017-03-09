package cn.edu.djtu.pojo;

import java.util.Date;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */
public class Orders extends AbstractOrders implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Orders() {
	}

	/** minimal constructor */
	public Orders(OrdersId id, Double sumPrise, Integer number) {
		super(id, sumPrise, number);
	}

	/** full constructor */
	public Orders(OrdersId id, Double sumPrise, Integer number, String starttime,
			String finishtime, String finishmark) {
		super(id, sumPrise, number, starttime, finishtime, finishmark);
	}

}
