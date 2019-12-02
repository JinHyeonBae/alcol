package DataBase;

import java.sql.*;

import javax.naming.NamingException;

public class DataBaseConnection {
	private static final String driverName="oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	private static final String DBid = "test";
	private static final String DBpw = "1234";
	
	public static Connection getConnection() 
	{ 
		Connection conn = null; 
		 
		try 
		{ 
			Class.forName(driverName);
			
			conn = DriverManager.getConnection(url, DBid, DBpw); 
		} catch (ClassNotFoundException e) { 
			System.out.println("DB ����̹� �ε� ���� : " + e.toString()); 
		} catch (SQLException e) { 
			System.out.println("DB ���� ���� : " + e.toString()); 
		} catch (Exception e) { 
			System.out.println("Unknown Error : " + e.toString()); 
			e.printStackTrace(); 
		} 	 
		return conn; 
	} 
}
