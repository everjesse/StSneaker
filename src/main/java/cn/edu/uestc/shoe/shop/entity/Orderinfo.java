package cn.edu.uestc.shoe.shop.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the orderinfo database table.
 * 
 */
@Entity
@NamedQuery(name="Orderinfo.findAll", query="SELECT o FROM Orderinfo o")
public class Orderinfo implements Serializable {
	private static final long serialVersionUID = 1L;
	private int orderId;
	private String addressName;
	private String deliveryAddress;
	private String feedbackRemarks;
	private Date orderCreateTime;
	private String orderPayWay;
	private int orderStatus;
	private double orderTotalMoney;
	private String phone;
	private List<Orderdetail> orderdetails;
	private User user;

	public Orderinfo() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_id")
	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	@Column(name="address_name")
	public String getAddressName() {
		return this.addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}


	@Column(name="delivery_address")
	public String getDeliveryAddress() {
		return this.deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}


	@Column(name="feedback_remarks")
	public String getFeedbackRemarks() {
		return this.feedbackRemarks;
	}

	public void setFeedbackRemarks(String feedbackRemarks) {
		this.feedbackRemarks = feedbackRemarks;
	}


	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="order_create_time")
	public Date getOrderCreateTime() {
		return this.orderCreateTime;
	}

	public void setOrderCreateTime(Date orderCreateTime) {
		this.orderCreateTime = orderCreateTime;
	}


	@Column(name="order_pay_way")
	public String getOrderPayWay() {
		return this.orderPayWay;
	}

	public void setOrderPayWay(String orderPayWay) {
		this.orderPayWay = orderPayWay;
	}


	@Column(name="order_status")
	public int getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}


	@Column(name="order_total_money")
	public double getOrderTotalMoney() {
		return this.orderTotalMoney;
	}

	public void setOrderTotalMoney(double orderTotalMoney) {
		this.orderTotalMoney = orderTotalMoney;
	}


	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	//bi-directional many-to-one association to Orderdetail
	@OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL},mappedBy="orderinfo")
	public List<Orderdetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(List<Orderdetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Orderdetail addOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().add(orderdetail);
		orderdetail.setOrderinfo(this);

		return orderdetail;
	}

	public Orderdetail removeOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().remove(orderdetail);
		orderdetail.setOrderinfo(null);

		return orderdetail;
	}


	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="use_user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}