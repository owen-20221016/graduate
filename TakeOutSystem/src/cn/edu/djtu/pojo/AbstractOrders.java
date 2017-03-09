package cn.edu.djtu.pojo;


/**
 * AbstractOrders entity provides the base persistence definition of the Orders
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrders implements java.io.Serializable {

	// Fields

	private OrdersId id;
	private Double sumPrise;
	private Integer number;
	private String starttime;
	private String finishtime;
	private String finishmark;

	// Constructors

	/** default constructor */
	public AbstractOrders() {
	}

	/** minimal constructor */
	public AbstractOrders(OrdersId id, Double sumPrise, Integer number) {
		this.id = id;
		this.sumPrise = sumPrise;
		this.number = number;
	}

	/** full constructor */
	public AbstractOrders(OrdersId id, Double sumPrise, Integer number,
			String starttime, String finishtime, String finishmark) {
		this.id = id;
		this.sumPrise = sumPrise;
		this.number = number;
		this.starttime = starttime;
		this.finishtime = finishtime;
		this.finishmark = finishmark;
	}

	// Property accessors

	public OrdersId getId() {
		return this.id;
	}

	public void setId(OrdersId id) {
		this.id = id;
	}

	public Double getSumPrise() {
		return this.sumPrise;
	}

	public void setSumPrise(Double sumPrise) {
		this.sumPrise = sumPrise;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getStarttime() {
		return this.starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getFinishtime() {
		return this.finishtime;
	}

	public void setFinishtime(String finishtime) {
		this.finishtime = finishtime;
	}

	public String getFinishmark() {
		return this.finishmark;
	}

	public void setFinishmark(String finishmark) {
		this.finishmark = finishmark;
	}

}