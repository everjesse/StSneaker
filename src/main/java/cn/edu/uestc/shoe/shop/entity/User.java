package cn.edu.uestc.shoe.shop.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int userId;
	private String mailbox;
	private String password;
	private List<Address> addresses;
	private List<Orderinfo> orderinfos;
	private List<Shoppingcart> shoppingcarts;

	public User() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id")
	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getMailbox() {
		return this.mailbox;
	}

	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}


	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	//bi-directional many-to-one association to Address
	@OneToMany(mappedBy="user")
	public List<Address> getAddresses() {
		return this.addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public Address addAddress(Address address) {
		getAddresses().add(address);
		address.setUser(this);

		return address;
	}

	public Address removeAddress(Address address) {
		getAddresses().remove(address);
		address.setUser(null);

		return address;
	}


	//bi-directional many-to-one association to Orderinfo
	@OneToMany(mappedBy="user")
	public List<Orderinfo> getOrderinfos() {
		return this.orderinfos;
	}

	public void setOrderinfos(List<Orderinfo> orderinfos) {
		this.orderinfos = orderinfos;
	}

	public Orderinfo addOrderinfo(Orderinfo orderinfo) {
		getOrderinfos().add(orderinfo);
		orderinfo.setUser(this);

		return orderinfo;
	}

	public Orderinfo removeOrderinfo(Orderinfo orderinfo) {
		getOrderinfos().remove(orderinfo);
		orderinfo.setUser(null);

		return orderinfo;
	}


	//bi-directional many-to-one association to Shoppingcart
	@OneToMany(mappedBy="user")
	public List<Shoppingcart> getShoppingcarts() {
		return this.shoppingcarts;
	}

	public void setShoppingcarts(List<Shoppingcart> shoppingcarts) {
		this.shoppingcarts = shoppingcarts;
	}

	public Shoppingcart addShoppingcart(Shoppingcart shoppingcart) {
		getShoppingcarts().add(shoppingcart);
		shoppingcart.setUser(this);

		return shoppingcart;
	}

	public Shoppingcart removeShoppingcart(Shoppingcart shoppingcart) {
		getShoppingcarts().remove(shoppingcart);
		shoppingcart.setUser(null);

		return shoppingcart;
	}

}