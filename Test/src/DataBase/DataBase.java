package DataBase;

import java.sql.*;
import java.util.Enumeration;

import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

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
			String query = null;
			if(FindKindId != "recipe")
				query = "select * from alcol WHERE name LIKE '%"+FindId+"%' and kind LIKE '%"+FindKindId+"%'";
			else
				query = "select * from "+FindKindId+" WHERE name LIKE '%"+FindId+"%'";
			
			conn = Connect();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
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
				sb.append("<td><Image src=\"" + rs.getString("likeimage") + "\" width = \"50\" height=\"50\"></td>");
				sb.append("<td>" + rs.getString("alcohol") + "</td>");
				sb.append("<td>" + rs.getString("love") + "</td>");
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
	
	public int LoginCompare(String SignInId, String SignInPw, HttpSession session)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String query = "select * from userinfo";
			
			conn = Connect();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(SignInId == "" || SignInPw == "")
				return -2;			// 정보입력이 없을 경우..
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				
				if(id.contentEquals(SignInId) && pw.equals(SignInPw)) {
					session.setAttribute("id", SignInId);
					session.setAttribute("pw", SignInPw);
					// 로그인 성공 했을 경우..
				}
				else
					return -1;		// 로그인 실패 했을 경우
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
		
		return 1;		// 로그인 성공 했을 경우..
	}
}