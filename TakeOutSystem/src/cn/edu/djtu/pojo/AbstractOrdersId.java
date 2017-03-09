package cn.edu.djtu.pojo;

/**
 * AbstractOrdersId entity provides the base persistence definition of the
 * OrdersId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrdersId implements java.io.Serializable {

	// Fields

	private String ordernumber;
	private Integer takeoutId;
	private Integer userId;

	// Constructors

	/** default constructor */
	public AbstractOrdersId() {
	}

	/** full constructor */
	public AbstractOrdersId(String ordernumber, Integer takeoutId,
			Integer userId) {
		this.ordernumber = ordernumber;
		this.takeoutId = takeoutId;
		this.userId = userId;
	}

	// Property accessors

	public String getOrdernumber() {
		return this.ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	public Integer getTakeoutId() {
		return this.takeoutId;
	}

	public void setTakeoutId(Integer takeoutId) {
		this.takeoutId = takeoutId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractOrdersId))
			return false;
		AbstractOrdersId castOther = (AbstractOrdersId) other;

		return ((this.getOrdernumber() == castOther.getOrdernumber()) || (this
				.getOrdernumber() != null && castOther.getOrdernumber() != null && this
				.getOrdernumber().equals(castOther.getOrdernumber())))
				&& ((this.getTakeoutId() == castOther.getTakeoutId()) || (this
						.getTakeoutId() != null
						&& castOther.getTakeoutId() != null && this
						.getTakeoutId().equals(castOther.getTakeoutId())))
				&& ((this.getUserId() == castOther.getUserId()) || (this
						.getUserId() != null && castOther.getUserId() != null && this
						.getUserId().equals(castOther.getUserId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getOrdernumber() == null ? 0 : this.getOrdernumber()
						.hashCode());
		result = 37 * result
				+ (getTakeoutId() == null ? 0 : this.getTakeoutId().hashCode());
		result = 37 * result
				+ (getUserId() == null ? 0 : this.getUserId().hashCode());
		return result;
	}

}