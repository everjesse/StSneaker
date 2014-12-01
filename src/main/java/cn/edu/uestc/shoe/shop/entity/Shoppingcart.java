package cn.edu.uestc.shoe.shop.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the shoppingcart database table.
 * 
 */
@Entity
@NamedQuery(name="Shoppingcart.findAll", query="SELECT s FROM Shoppingcart s")
public class Shoppingcart implements Serializable {
	private static final long serialVersionUID = 1L;
	private int shoppingcartId;
	private int productAmount;
	private Product product;
	private User user;

	public Shoppingcart() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="shoppingcart_id")
	public int getShoppingcartId() {
		return this.shoppingcartId;
	}

	public void setShoppingcartId(int shoppingcartId) {
		this.shoppingcartId = shoppingcartId;
	}


	@Column(name="product_amount")
	public int getProductAmount() {
		return this.productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}


	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="pro_product_id")
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
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