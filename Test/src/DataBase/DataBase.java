package DataBase;

import java.sql.*;
import java.util.Enumeration;
import java.util.*;
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
				if(rs !=null) {
					rs.close();
					rs = null;
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
		int count =0, rsnumber =0;
		
		try {
			String query = "select * from userinfo";
			
			conn = Connect();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			int i=0;
			
			if(SignInId == "" || SignInPw == "")
				return -2;			// 정보입력이 없을 경우..
			
			while(rs.next()){
				i++;
				String id = rs.getString("id"); 
				String pw = rs.getString("pw");
				
				if(id.equals(SignInId) && pw.equals(SignInPw)){
					session.setAttribute("id", SignInId);
					session.setAttribute("pw", SignInPw);
					// 로그인 성공 했을 경우..
				}
				else
					count++;
				rsnumber = rs.getRow();
			}
			conn.commit(); //commit() : 트랜잭션(Transaction)의 commit 을 수행한다.
			
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
				if(rs !=null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		if(count == rsnumber) return -1;
		else return 1;		// 로그인 성공 했을 경우..
	}
	
	public StringBuffer ShowRecipe(int number) //레시피 보여주기
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuffer str = new StringBuffer();
		
		 //레시피 데이터를 담을 list
		try {
			
			String query ="SELECT * FROM RECIPE";
			conn = Connect();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
		
			if(number == 1) {
				while(rs.next()) {
					str.append("<tr>");
					str.append("<th>"+"<img src ="+rs.getString("Link")+">" +"</th>");
					str.append("<td>"+ rs.getString("combineName")+"</td>");
					str.append("<td>"+"설명  "+"<br>" +rs.getString("Decs") + "<br><br>" + "조합  "+ "<br>"+ rs.getString("combineAlcol")+"</td>");
					str.append("<td>"+ "<input type=\"button\"" + "onclick=\"addHeart()\""+">"+"<br>");
					str.append("좋아요 " +rs.getString("Love")+" 회 </td>");
					str.append("</tr>");
				if(rs.getRow() == 10) 
					break;
				}
			}
			conn.commit();
		}
			catch (Exception sqle){
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
				if(rs !=null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return str;
	}
	
	public int SignUp(String id, String pw, String email, String phone) //회원가입 함수
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int count =0; //executeUpdate문 결과값 받을 변수 
		
		try {
			
			String query ="INSERT INTO userinfo VALUES(?,?,?,?)"; //회원가입 시 db 연결
			conn = Connect();
		
			PreparedStatement pstmt =null;
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2,pw);
			pstmt.setString(3,email);
			pstmt.setString(4,phone);
			
			count = pstmt.executeUpdate();
			
			conn.commit();
		
		}	catch (Exception sqle){
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
				if(rs !=null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return count;
	}
	
	public int HeartIncrease(int n) //좋아요 증가하는 함수
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int count =0; //executeUpdate문 결과값 받을 변수 
		
		try {
			
			String query ="INSERT INTO Recipe(love) VALUES(?)";
			conn = Connect();
		
			PreparedStatement pstmt =null;
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, n);
			
			count = pstmt.executeUpdate();
			
			conn.commit();
		
		}	catch (Exception sqle){
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
				if(rs !=null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return 1;
	}
}