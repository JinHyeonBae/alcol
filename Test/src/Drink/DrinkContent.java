package Drink;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DataBase.DataBaseConnection;

public class DrinkContent {	
	public DrinkPaging getDrinkContent(String content, String kind, String page, int maxContent)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int pageNum = 1;
		if(page != null) pageNum = Integer.parseInt(page);
		
		DrinkPaging dp = new DrinkPaging("alcol", "WHERE name LIKE '%"+content+"%' and kind LIKE '%"+kind+"%'", maxContent);
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = dp.getPagingQuery(pageNum);
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				sb.append("<tr>");
	               sb.append("<td><Image src=\"" + rs.getString("url") + "\" width = \"150\" height=\"150\"></td>");
	               sb.append("<td>" + rs.getString("kind") + "</td>");
	               sb.append("<td>" + rs.getString("name") + "</td>");
	               sb.append("<td>" + rs.getString("volume") + "</td>");
	               sb.append("<td>" + rs.getString("price") + "</td>");
	               sb.append("<td>" + rs.getString("alcohol") + "</td>");
	               sb.append("<td>" + rs.getString("sweet") + "</td>");
	               sb.append("<td>" + rs.getString("tansan") + "</td>");
	               sb.append("<td>" + rs.getString("calories") + "</td>");
	               sb.append("<td>" + rs.getString("love") + "</td>");
	            sb.append("</tr>");
			}
			
			dp.setSb(sb);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(stmt != null) try{stmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return dp;
	}
	
	public DrinkPaging getRecipeContent(String content, String page, int maxContent)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int pageNum = 1;
		if(page != null) pageNum = Integer.parseInt(page);
		
		DrinkPaging dp = new DrinkPaging("recipe", "WHERE combinename LIKE '%"+content+"%' and combinealcol LIKE '%"+content+"%'", maxContent);
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = dp.getPagingQuery(pageNum);
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				sb.append("<tr>");
	               sb.append("<td>" + rs.getString("combinename") + "</td>");
	               sb.append("<td>" + rs.getString("Decs") + "</td>");
	               sb.append("<td>" + rs.getString("combinealcol") + "</td>");
	               sb.append("<td>"
	               		+ "<form action=\"likeOn.jsp\">"
	               			+ "<input type=\"submit\" value=\"" + (rs.getRow() + ((pageNum - 1) * maxContent)) + "\">"
	               		+ "</form>"
	               		+ "</td>");
	               sb.append("<td>" + rs.getInt("love") + "</td>");
	               sb.append("<td>" + rs.getString("kind") + "</td>");
	            sb.append("</tr>");
			}
			
			dp.setSb(sb);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(stmt != null) try{stmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return dp;
	}
	
	public StringBuffer getRanking(String kind)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = "select * from "+kind+" WHERE ROWNUM <= 5 ORDER BY love DESC";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				sb.append("<tr>");
				if(kind == "recipe")
					sb.append("<td>"+ rs.getString("Combinename")+ "</td>");
				else
					sb.append("<td>"+ rs.getString("name")+ "</td>");
				sb.append("<td>"+ rs.getInt("love")+ "</td>");
				sb.append("</tr>");
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(stmt != null) try{stmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return sb;
	}
	
	public void LikeUpdate(String table, String number)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String name = null;
			
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			conn.setAutoCommit(false);
			String sql = "Select * from " + table + " WHERE ROWNUM = " + number;
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
				name = rs.getString("Combinename");
			
			
			sql = "Update " + table + " SET LOVE = LOVE + 1 WHERE Combinename = '" + name + "'";
			
			stmt.executeUpdate(sql);
			
			conn.commit();
			
		} catch(Exception e) {
			if(conn != null) try {conn.rollback();} catch(SQLException sqle) {}
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(stmt != null) try{stmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.setAutoCommit(true); conn.close();} catch(SQLException e) {}
		}
	}
}
