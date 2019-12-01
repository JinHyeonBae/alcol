package Drink;

import DataBase.DataBaseConnection;

import java.sql.*;

public class DrinkPaging {
	private int count;
	private int maxContent;
	private String table = null;
	private String query = null;
	private StringBuffer sb = null;
	
	public DrinkPaging(String table, String query, int maxContent) {
		this.maxContent = maxContent;
		this.table = table;
		this.query = query;
	}
	
	public String getPagingQuery(int number)
	{
		String temp = null;
		if(query != "") {
			temp = "SELECT * "
					+ "FROM( "
					+ "SELECT ROWNUM AS RNUM, A.* "
						+ "FROM " + table + " A "
						+ query + "and ROWNUM <= " + number * maxContent + " "
					+ ") "
				+ "WHERE RNUM > " + ((number * maxContent) - maxContent);
		}
		else {
			temp = "SELECT * "
					+ "FROM( "
					+ "SELECT ROWNUM AS RNUM, A.* "
						+ "FROM " + table + " A "
						+ "WHERE ROWNUM <= " + number * maxContent + " "
					+ ") "
				+ "WHERE RNUM > " + ((number * maxContent) - maxContent);
		}
		return temp;
	}
	
	public int getCount() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		count = 0;
		
		try {
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			String temp = "Select COUNT(*) from " + table + " " + query;

			rs = stmt.executeQuery(temp);
			
			while(rs.next()) {
				count = rs.getInt("COUNT(*)");
			}
			
			if(count == 0)
				return 0;
			
			count /= maxContent;
			
			if((count % maxContent) != 0)
				count++;
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(stmt != null) try{stmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return count;
	}

	public StringBuffer getSb() {
		return sb;
	}

	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
}
