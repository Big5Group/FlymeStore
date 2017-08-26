package com.flyme.entity;

public class Manager {
	private int ManagerID;
	private String ManagerName;
	private String ManagerPass;
	
	
	public Manager() {
		super();
	}
	public Manager(String managerName, String managerPass) {
		super();
		ManagerName = managerName;
		ManagerPass = managerPass;
	}
	public int getManagerID() {
		return ManagerID;
	}
	public void setManagerID(int managerID) {
		ManagerID = managerID;
	}
	public String getManagerName() {
		return ManagerName;
	}
	public void setManagerName(String managerName) {
		ManagerName = managerName;
	}
	public String getManagerPass() {
		return ManagerPass;
	}
	public void setManagerPass(String managerPass) {
		ManagerPass = managerPass;
	}
	

}
