package com.flyme.entity;

public class Product {
	private int ProductID;
	private String ProductName;
	private String ProductCate;
	private double ProductPrice;
	private String ProductColor;
	private int ProductNum;// 库存

	public Product() {
		super();
	}

	public Product(int productID, String productName, String productCate, double productPrice, String productColor,
			int productNum) {
		super();
		ProductID = productID;
		ProductName = productName;
		ProductCate = productCate;
		ProductPrice = productPrice;
		ProductColor = productColor;
		ProductNum = productNum;
	}

	public int getProductID() {
		return ProductID;
	}

	public void setProductID(int productID) {
		ProductID = productID;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public String getProductCate() {
		return ProductCate;
	}

	public void setProductCate(String productCate) {
		ProductCate = productCate;
	}

	public double getProductPrice() {
		return ProductPrice;
	}

	public void setProductPrice(double productPrice) {
		ProductPrice = productPrice;
	}

	public String getProductColor() {
		return ProductColor;
	}

	public void setProductColor(String productColor) {
		ProductColor = productColor;
	}

	public int getProductNum() {
		return ProductNum;
	}

	public void setProductNum(int productNum) {
		ProductNum = productNum;
	}

}
