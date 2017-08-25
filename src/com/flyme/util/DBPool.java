package com.flyme.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBPool {
	// 单例对象
	private static DBPool db = null;
	// 数据源
	private DataSource ds = new ComboPooledDataSource("mysqlConnection");

	public static DBPool getInstance() {
		if (null == db) {
			db = new DBPool();
		}
		return db;
	}

	public Connection getConn() {
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
