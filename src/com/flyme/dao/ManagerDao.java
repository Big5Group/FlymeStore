package com.flyme.dao;

import java.util.List;

import com.flyme.entity.Manager;

public class ManagerDao extends BaseDao<Manager>{

	public boolean checkUser(Manager man) {
		List<Manager> list = executeQuery("select * from fm_manager where ManagerName = ? and ManagerPass = ?;",
				new Object[] {man.getManagerName(),man.getManagerPass()});
		return list.size() > 0 ? true : false;
	}

}
