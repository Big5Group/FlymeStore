package com.flyme.entity;

public class Customer {
	private Integer CustomerID;

	private String CallName;

	private String CustomPass;

	private String Email;

	private Integer CustomSex; // TODO: 这是干哈呢?

	private String FoundDate;
	// 状态
	private Integer State;

	public Customer() {
		super();
	}

	public Customer(String callName, String customPass) {
		super();
		CallName = callName;
		CustomPass = customPass;
	}
	
	public Customer(String callName, String email, Integer customSex, String customPass) {
		super();
		CallName = callName;
		Email = email;
		CustomSex = customSex;
		CustomPass = customPass;
	}

	public Customer(String callName, String customPass, String email, Integer customSex, String foundDate,
			Integer state) {
		super();
		CallName = callName;
		CustomPass = customPass;
		Email = email;
		CustomSex = customSex;
		FoundDate = foundDate;
		State = state;
	}

	public Integer getCustomerID() {
		return CustomerID;
	}

	public void setCustomerID(Integer customerID) {
		CustomerID = customerID;
	}

	public String getCallName() {
		return CallName;
	}

	public void setCallName(String callName) {
		CallName = callName;
	}

	public String getCustomPass() {
		return CustomPass;
	}

	public void setCustomPass(String customPass) {
		CustomPass = customPass;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public Integer getCustomSex() {
		return CustomSex;
	}

	public void setCustomSex(Integer customSex) {
		CustomSex = customSex;
	}

	public String getFoundDate() {
		return FoundDate;
	}

	public void setFoundDate(String foundDate) {
		FoundDate = foundDate;
	}

	public Integer getState() {
		return State;
	}

	public void setState(Integer state) {
		State = state;
	}

	@Override
	public String toString() {
		return "Customer [CustomerID=" + CustomerID + ", CallName=" + CallName + ", CustomPass=" + CustomPass
				+ ", Email=" + Email + ", CustomSex=" + CustomSex + ", FoundDate=" + FoundDate + ", State=" + State
				+ "]";
	}

}
