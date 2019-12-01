package DataBase;

import java.sql.*;

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
			System.out.println("DB 드라이버 로딩 실패 : " + e.toString());
		} catch (SQLException e) {
			System.out.println("DB 접속 실패 : " + e.toString());
		} catch (Exception e) {
			System.out.println("Unknown Error : " + e.toString());
			e.printStackTrace();
		}
		
		return conn;
	}
}
