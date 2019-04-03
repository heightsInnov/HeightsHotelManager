/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.heights.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author aojinadu
 */
public class DBConnection {

	static private String user = null;
	static private String driver = null;
	static private String url = null;
	static private String pass = null;
//	static private String key;

	private static void setConnDetails() {
//		key = getPropertiesValue("KEY");
		user = "aojinadu";
		pass = "";
		driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		url = "jdbc:sqlserver://localhost\\DEVOPS-LP-025\\SQLSERVER12:1443;databaseName=HeightsHotellier;integratedSecurity=true";
	}

	public static Connection getConn() {
		setConnDetails();
		Connection connection = null;
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(url, user, pass);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void closeConnections(Connection con, PreparedStatement pst, ResultSet rs) {
		try {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
					Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException ex) {
					Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
		} catch (Exception e) {
		}
	}

	public static void closeConnections(Connection con, PreparedStatement pst) {
		try {
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException ex) {
					Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
		} catch (Exception e) {
		}
	}
}
