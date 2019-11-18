package DataBase;

import java.sql.*;

import javax.naming.NamingException;

public class DataBase {
	
	public Connection Connect() throws SQLException, NamingException, ClassNotFoundException
	{   
	    String driverName="oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@127.0.0.1:1521";
	    String DBid = "test";
	    String DBpw = "1234";
		
	    Class.forName(driverName);
	    
		return DriverManager.getConnection(url, DBid, DBpw);
	}
	
	public StringBuffer GetFindContent(String FindId, String FindKindId)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuffer sb = new StringBuffer();

		try {
			String query = "select * from alcol WHERE name LIKE '%"+FindId+"%' and kind LIKE '%"+FindKindId+"%'";
			conn = Connect();
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
				sb.append("<tr>");
				sb.append("<td>" + rs.getString("name") + "</td>");
				sb.append("<td>" + rs.getString("kind") + "</td>");
				sb.append("<td>" + rs.getString("alcohol") + "</td>");
				sb.append("</tr>");
			}
			
			conn.commit();
			
		} catch (Exception sqle) {
			try {
				conn.rollback();
			} catch(SQLException e) {
				e.printStackTrace();
			} //throw new RuntimeException(sqle.getMessage());
		}  finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
				if(conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}

		return sb;
	}
}