package cn.edu.uestc.shoe.shop.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the orderdetail database table.
 * 
 */
@Entity
@NamedQuery(name="Orderdetail.findAll", query="SELECT o FROM Orderdetail o")
public class Orderdetail implements Serializable {
	private static final long serialVersionUID = 1L;
	private int orderDetailId;
	private int productAmount;
	private int productId;
	private String productPhoto;
	private double productTradePrice;
	private Orderinfo orderinfo;

	public Orderdetail() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_detail_id")
	public int getOrderDetailId() {
		return this.orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}


	@Column(name="product_amount")
	public int getProductAmount() {
		return this.productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}


	@Column(name="product_id")
	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}


	@Column(name="product_photo")
	public String getProductPhoto() {
		return this.productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}


	@Column(name="product_trade_price")
	public double getProductTradePrice() {
		return this.productTradePrice;
	}

	public void setProductTradePrice(double productTradePrice) {
		this.productTradePrice = productTradePrice;
	}


	//bi-directional many-to-one association to Orderinfo
	@ManyToOne
	@JoinColumn(name="ord_order_id")
	public Orderinfo getOrderinfo() {
		return this.orderinfo;
	}

	public void setOrderinfo(Orderinfo orderinfo) {
		this.orderinfo = orderinfo;
	}

}