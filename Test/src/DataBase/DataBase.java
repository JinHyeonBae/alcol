package DataBase;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

import javafx.collections.transformation.SortedList;

class DrinkInfo {
	private String URL;
	private String Kind;
	private String Name;
	private int Volume;
	private float Alcohol;
	private int Sweet;
	private int Tansan;
	private int Calories;
	private String LinkImage;
	private int Love;
	
	private float Size;
	
	public String getURL() {
		return URL;
	}
	public void setURL(String url) {
		URL = url;
	}
	public String getKind() {
		return Kind;
	}
	public void setKind(String kind) {
		Kind = kind;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getVolume() {
		return Volume;
	}
	public void setVolume(int volume) {
		Volume = volume;
	}
	public float getAlcohol() {
		return Alcohol;
	}
	public void setAlcohol(float alcohol) {
		Alcohol = alcohol;
	}
	public int getSweet() {
		return Sweet;
	}
	public void setSweet(int sweet) {
		Sweet = sweet;
	}
	public int getTansan() {
		return Tansan;
	}
	public void setTansan(int tansan) {
		Tansan = tansan;
	}
	public int getCalories() {
		return Calories;
	}
	public void setCalories(int calories) {
		Calories = calories;
	}
	public String getLinkImage() {
		return LinkImage;
	}
	public void setLinkImage(String linkImage) {
		LinkImage = linkImage;
	}
	public int getLove() {
		return Love;
	}
	public void setLove(int love) {
		Love = love;
	}
	public float getSize() {
		return Size;
	}
	public void setSize(float size) {
		Size = size;
	}
}

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
	
	public int GetMaxContent(String FindId, String FindKindId)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			String query = "select COUNT(*) from alcol WHERE name LIKE '%"+FindId+"%' and kind LIKE '%"+FindKindId+"%'";
			
			conn = Connect();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next())
				count = rs.getInt("COUNT(*)");
			
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
				if(rs != null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return count;
	}
	
	public StringBuffer GetFindContent(String FindId, String FindKindId, String page, int maxContent)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int pageNum = 1;
		
		if(page != null) pageNum = Integer.parseInt(page);
		
		StringBuffer sb = new StringBuffer();

		try {
			String query = null;
			if(FindKindId != "recipe")
				query = "SELECT * "
						+ "FROM( "
							+ "SELECT ROWNUM AS RNUM, A.* "
									+ "FROM alcol A "
								+ "WHERE name LIKE '%"+FindId+"%' and kind LIKE '%"+FindKindId+"%' and ROWNUM <= " + pageNum * maxContent + " "
							+ ") "
						+ "WHERE RNUM > " + ((pageNum * maxContent) - maxContent);
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
				if(rs != null) {
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
				if(rs != null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return 1;		// 로그인 성공 했을 경우..
	}
	
	public StringBuffer GetFindRanking(String FindKindId)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuffer sb = new StringBuffer();
		
		try {
			String query = "select * from "+FindKindId+" WHERE ROWNUM <= 5 ORDER BY love DESC";
			
			conn = Connect();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
				sb.append("<tr>");
				if(FindKindId == "recipe")
					sb.append("<td>"+ rs.getString("Combinename")+ "</td>");
				else
					sb.append("<td>"+ rs.getString("name")+ "</td>");
				sb.append("<td>"+ rs.getString("love")+ "</td>");
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
				if(rs != null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return sb;
	}
	
	public StringBuffer GetRecommend(float sweet, float tansan, float alcohol)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuffer sb = new StringBuffer();
		ArrayList<DrinkInfo> di = new ArrayList<DrinkInfo>();
		
		try {
			String query = "select * from alcol";
			
			conn = Connect();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
				DrinkInfo temp = new DrinkInfo();
				
				temp.setURL(rs.getString("url"));
				temp.setKind(rs.getString("Kind"));
				temp.setName(rs.getString("Name"));
				temp.setVolume(rs.getInt("Volume"));
				temp.setAlcohol(rs.getFloat("Alcohol"));
				temp.setSweet(rs.getInt("Sweet"));
				temp.setTansan(rs.getInt("Tansan"));
				temp.setCalories(rs.getInt("Calories"));
				temp.setLinkImage(rs.getString("likeImage"));
				temp.setLove(rs.getInt("Love"));
				
				temp.setSize((float)Math.sqrt(Math.pow(temp.getSweet() - sweet, 2.0f) + Math.pow(temp.getTansan() - tansan, 2.0f) + Math.pow(temp.getAlcohol() - alcohol, 2.0f)));
				
				di.add(temp);
			}
			
			for(int i = 0; i < di.size(); i++) {
				sb.append("<tr>");
					sb.append("<td>" + di.get(i).getName() + "</td>");
	            	sb.append("<td>" + di.get(i).getSweet() + "</td>");
	            	sb.append("<td>" + di.get(i).getTansan() + "</td>");
	            	sb.append("<td>" + di.get(i).getAlcohol() + "</td>");
	            	sb.append("<td>" + di.get(i).getSize() + "</td>");
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
				if(di != null) {
					di.clear();
					di = null;
				}
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
				if(conn != null) {
					conn.close();
					conn = null;
				}
				if(rs != null) {
					rs.close();
					rs = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return sb; 
	}
	
}