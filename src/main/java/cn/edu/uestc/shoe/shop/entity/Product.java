package cn.edu.uestc.shoe.shop.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;


/**
 * The persistent class for the product database table.
 * 
 */
@Entity
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;
	private int productId;
	private String brandName;
	private int firstPageModule;
	private Boolean isOnSale;
	private String productBriefInfo;
	private double productMarketPrice;
	private String productName;
	private String productPhoto;
	private int productStock;
	private double productTradePrice;
	private String size;
	private String type;
	private List<Shoppingcart> shoppingcarts;

	public Product() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id")
	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}


	@Column(name="brand_name")
	public String getBrandName() {
		return this.brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}


	@Column(name="first_page_module")
	public int getFirstPageModule() {
		return this.firstPageModule;
	}

	public void setFirstPageModule(int firstPageModule) {
		this.firstPageModule = firstPageModule;
	}


	@Column(name="is_on_sale")
	public Boolean getIsOnSale() {
		return this.isOnSale;
	}

	public void setIsOnSale(Boolean isOnSale) {
		this.isOnSale = isOnSale;
	}


	@Column(name="product_brief_info")
	public String getProductBriefInfo() {
		return this.productBriefInfo;
	}

	public void setProductBriefInfo(String productBriefInfo) {
		this.productBriefInfo = productBriefInfo;
	}


	@Column(name="product_market_price")
	public double getProductMarketPrice() {
		return this.productMarketPrice;
	}

	public void setProductMarketPrice(double productMarketPrice) {
		this.productMarketPrice = productMarketPrice;
	}


	@Column(name="product_name")
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}


	@Column(name="product_photo")
	public String getProductPhoto() {
		return this.productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}


	@Column(name="product_stock")
	public int getProductStock() {
		return this.productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}


	@Column(name="product_trade_price")
	public double getProductTradePrice() {
		return this.productTradePrice;
	}

	public void setProductTradePrice(double productTradePrice) {
		this.productTradePrice = productTradePrice;
	}


	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}


	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}


	//bi-directional many-to-one association to Shoppingcart
	@OneToMany(mappedBy="product")
	@JsonIgnore
	public List<Shoppingcart> getShoppingcarts() {
		return this.shoppingcarts;
	}

	public void setShoppingcarts(List<Shoppingcart> shoppingcarts) {
		this.shoppingcarts = shoppingcarts;
	}

	public Shoppingcart addShoppingcart(Shoppingcart shoppingcart) {
		getShoppingcarts().add(shoppingcart);
		shoppingcart.setProduct(this);

		return shoppingcart;
	}

	public Shoppingcart removeShoppingcart(Shoppingcart shoppingcart) {
		getShoppingcarts().remove(shoppingcart);
		shoppingcart.setProduct(null);

		return shoppingcart;
	}

}