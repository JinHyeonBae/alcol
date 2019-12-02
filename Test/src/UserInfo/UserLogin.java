package UserInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import DataBase.DataBaseConnection;

public class UserLogin {
	private HttpSession session;
	
	public UserLogin(HttpServletRequest request)
	{
		this.session = request.getSession(true);
	}
	
	public int Login(String SignId, String SignPw) 
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = "Select * from userinfo";
			
			rs = stmt.executeQuery(sql);
			
			if(SignId == "" || SignPw == "")
				return -1;
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				
				if(id.equals(SignId) && pw.equals(SignPw)) {
					session.setAttribute("id", SignId);
					session.setAttribute("pw", SignPw);
					
					if(rs != null) try{rs.close();} catch(SQLException e) {}
					if(stmt != null) try{stmt.close();} catch(SQLException e) {}
					if(conn != null) try{conn.close();} catch(SQLException e) {}
					
					return 1;
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(stmt != null) try{stmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return 0;
	}
	
	public boolean isLogin() {
		String sessionId = (String)session.getAttribute("id");
		
		if(sessionId != null)
			return true;
		
		return false;
	}
	
	public boolean Logout()
	{
		if(isLogin())
		{
			session.invalidate();
			return true;
		}
		return false;
	}
	
	public int SignUp(String SignId, String SignPw, String email, String phone)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = DataBaseConnection.getConnection();
			
			String sql = "INSERT INTO userinfo VALUES(?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, SignId);
			pstmt.setString(2, SignPw);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			
			count = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return count;
	}
}
