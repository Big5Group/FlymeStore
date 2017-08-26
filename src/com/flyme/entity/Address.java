package com.flyme.entity;

public class Address {
	private int AddressID;
	private int CustomerID;
	private String Province;
	private String City;
	private String Country;
	private String DetailAddress;
	private String CustomerName;
	private int PhoneNum;
	private int PostCode;

	public Address() {
		super();
	}

	public int getAddressID() {
		return AddressID;
	}

	public void setAddressID(int addressID) {
		AddressID = addressID;
	}

	public int getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}

	public String getProvince() {
		return Province;
	}

	public void setProvince(String province) {
		Province = province;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getDetailAddress() {
		return DetailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		DetailAddress = detailAddress;
	}

	public String getCustomerName() {
		return CustomerName;
	}

	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}

	public int getPhoneNum() {
		return PhoneNum;
	}

	public void setPhoneNum(int phoneNum) {
		PhoneNum = phoneNum;
	}

	public int getPostCode() {
		return PostCode;
	}

	public void setPostCode(int postCode) {
		PostCode = postCode;
	}

}
