package Drink;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Comparator;

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
				sb.append("<div class=\"head\">");
					sb.append("<span class=\"cell col1\"><Image src=\"" + rs.getString("url") + "\" width = \"100\" height=\"100\"></span>");
					sb.append("<span class=\"cell col2\">" + rs.getString("kind") + "</span>");
					sb.append("<span class=\"cell col3\">" + rs.getString("name") + "</span>");
					sb.append("<span class=\"cell col4\">" + rs.getString("volume") + "</span>");
					sb.append("<span class=\"cell col5\">" + rs.getString("price") + "</span>");
					sb.append("<span class=\"cell col6\">" + rs.getString("alcohol") + "</span>");
					sb.append("<span class=\"cell col7\">" + rs.getString("sweet") + "</span>");
	            	sb.append("<span class=\"cell col8\">" + rs.getString("tansan") + "</span>");
	            	sb.append("<span class=\"cell col9\">" + rs.getString("calories") + "</span>");
	            	sb.append("<span class=\"cell col10\">"
		               		+ "<form action=\"likeOn.jsp\">"
		               			+ "<input type=\"hidden\" name=\"site\" value=\"search\">"
		               			+ "<input type=\"hidden\" name=\"tableName\" value=\"alcol\">"
		               			+ "<input type=\"hidden\" name=\"id\" value=\"" + rs.getInt("id") + "\">"
		               			+ "<input type=\"submit\" class=\"asd\" value=\"\">"
		               		+ "</form>"
		               		+ "</span>");
	            	sb.append("<span class=\"cell col1\">" + rs.getString("love") + "</span>");
	            sb.append("</div>");
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
	
	public DrinkPaging getRecipeContent(String table, String content, String page, int maxContent)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int pageNum = 1;
		if(page != null) pageNum = Integer.parseInt(page);
		
		DrinkPaging dp = new DrinkPaging(table, "WHERE combinename LIKE '%"+content+"%' and combinealcol LIKE '%"+content+"%'", maxContent);
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = dp.getPagingQuery(pageNum);
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				sb.append("<div class=\"head\">");
				
				
				//sb.append("<span class=\"cell col1\"><img src=\"" + rs.getString("Link") + "\" width = \"100\" height=\"100\"></span>");
				sb.append("<span class=\"cell col2\">" + rs.getString("combineName") + "</span>");
                 sb.append("<span class=\"cell col3\">" + rs.getString("Decs") + "</span>");
                 sb.append("<span class=\"cell col4\">" + rs.getString("combineAlcol")+"</span>");
                 //sb.append("<span class=\"cell col5\"><img src=\"" + rs.getString("LOVE_IMG") + "\" width = \"10\" height=\"10\"></span>");
                 sb.append("<span class=\"cell col5\">좋아요 " +rs.getString("Love")+" 회 </span>");
                 
	               //sb.append("<td>" + rs.getString("combinename") + "</td>");
	               //sb.append("<td>" + rs.getString("Decs") + "</td>");
	               //sb.append("<td>" + rs.getString("combinealcol") + "</td>");
	               sb.append("<span class=\"cell col6\">"
	               		+ "<form action=\"../likeOn.jsp\">"
	               			+ "<input type=\"hidden\" name=\"site\" value=\"recipes/recipe\">"
	               			+ "<input type=\"hidden\" name=\"tableName\" value=\"" + table + "\">"
	               			+ "<input type=\"hidden\" name=\"id\" value=\"" + rs.getInt("id") + "\">"
	               			+ "<input type=\"submit\" class=\"testasd\" value=\"\">"
	               		+ "</form>"
	               		+ "</span>");
	               sb.append("<span class=\"cell col7\">" +rs.getString("userid")+"</span>");
	               sb.append("<span class=\"cell col8\">"
		               		+ "<form action=\"../deleteRecipe.jsp\">"
		               			+ "<input type=\"hidden\" name=\"tableName\" value=\"" + table + "\">"
		               			+ "<input type=\"hidden\" name=\"id\" value=\"" + rs.getInt("id") + "\">"
		               			+ "<input type=\"submit\" value=\"삭제\">"
		               		+ "</form>"
		               		+ "</span>");
	               //sb.append("<td>" + rs.getInt("love") + "</td>");
	            sb.append("</div>");
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
	
	public StringBuffer getRecommend(float sweet, float tansan, float alcohol)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = "Select * from alcol";
			ArrayList<DrinkInfo> di = new ArrayList<DrinkInfo>();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
	         {
	            DrinkInfo temp = new DrinkInfo();
	            
	            temp.setURL(rs.getString("url"));
	            temp.setKind(rs.getString("Kind"));
	            temp.setName(rs.getString("Name"));
	            temp.setVolume(rs.getInt("Volume"));
	            temp.setSweet(rs.getInt("Sweet"));
	            temp.setTansan(rs.getInt("Tansan"));
	            temp.setCalories(rs.getInt("Calories"));
	            temp.setLinkImage(rs.getString("likeImage"));
	            temp.setLove(rs.getInt("Love"));
	            
	            if(rs.getFloat("alcohol")<=5.0)
	               temp.setAlcohol(0);
	            else if(rs.getFloat("alcohol")<=10.0)
	               temp.setAlcohol(1);
	            else if(rs.getFloat("alcohol")<=15.0)
	               temp.setAlcohol(2);
	            else if(rs.getFloat("alcohol")<=20.0)
	                  temp.setAlcohol(3);
	            else if(rs.getFloat("alcohol")<=25.0)
	               temp.setAlcohol(4);
	            else if(rs.getFloat("alcohol")<=30.0)
	               temp.setAlcohol(5);
	            else if(rs.getFloat("alcohol")<=35.0)
	               temp.setAlcohol(6);
	            else if(rs.getFloat("alcohol")<=40.0)
	               temp.setAlcohol(7);
	            
	            temp.setSize((float)Math.sqrt(Math.pow(temp.getSweet() - sweet, 2.0f) + Math.pow(temp.getTansan() - tansan, 2.0f) + Math.pow(temp.getAlcohol() - alcohol, 2.0f)));
	            
	            di.add(temp);
	         }
			
			di.sort(new Comparator<DrinkInfo>() {
	            @Override
	            public int compare(DrinkInfo o1, DrinkInfo o2) {
	               if(o1.getSize() == o2.getSize()) return 0;
	               else if(o1.getSize() > o2.getSize()) return 1;
	               else return -1;
	            }
	         });
			
			for(int i = 0; i < di.size(); i++) {
				sb.append("<div class=\"row\">");
					sb.append("<span class=\"cell co1\">" + di.get(i).getName()  + "</span>");
					sb.append("<span class=\"cell co2\">" + di.get(i).getSweet()  + "</span>");
					sb.append("<span class=\"cell co3\">" +  di.get(i).getTansan()  + "</span>");
					sb.append("<span class=\"cell co4\">" + di.get(i).getAlcohol() + "</span>");
					sb.append("<span class=\"cell co5\">" + di.get(i).getSize() + "</span>");
	            sb.append("</div>");
	            if(di.get(i).getSize() != di.get(i + 1).getSize())
	            	break;
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
	
	public int WriteRecipe(String table, String combinename, String decs, String combinealcol, int love, String userId)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		
		try {
			conn = DataBaseConnection.getConnection();
			table.toUpperCase();
			String sql = "Insert into " + table + " (COMBINENAME,DECS,COMBINEALCOL,LOVE,ID,USERID) values (?,?,?,?,"+table.toUpperCase()+"_ID.NEXTVAL,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, combinename);
			pstmt.setString(2, decs);
			pstmt.setString(3, combinealcol);
			pstmt.setInt(4, love);
			pstmt.setString(5, userId);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return result;
	}
	
	public boolean DeleteRecipe(String table, String id, String SignId) //레시피 아이디, 열의 고유값
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	   
	    //레시피 데이터를 담을 list
		try {
			conn = DataBaseConnection.getConnection();    
	        stmt = conn.createStatement();
	        
	        conn.setAutoCommit(false);
	        String sql = "Select * from " + table + " WHERE ID = " + id;
	         
	        rs = stmt.executeQuery(sql);
	         
	        if(rs.next()) {
	        	if(!SignId.equals(rs.getString("userid"))){
	        		if(rs != null) try{rs.close();} catch(SQLException e) {}
	        		if(stmt != null) try{stmt.close();} catch(SQLException e) {}
	        		if(conn != null) try{conn.setAutoCommit(true); conn.close();} catch(SQLException e) {}
	        		return false;
	        	}
	         }
	        
	        sql = "delete " + table + " WHERE ID = " + id;
	        
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
		return true;
	}
	
	public int LikeCompare(String table, String id, String SignId)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		
		try {
			conn = DataBaseConnection.getConnection();
			
			conn.setAutoCommit(false);
			String sql = "Insert Into Likey(ID) VALUES(?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, table + id + SignId);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			if(conn != null) try {conn.rollback();} catch(SQLException sqle) {}
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.setAutoCommit(true); conn.close();} catch(SQLException e) {}
		}
		
		return result;
	}
	
	public boolean LikeUpdate(String table, String id, String SignId)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			int contentid = 0;
			String combinename = null;
			String decs = null;
			String combinealcol = null;
			int love = 0;
			String userId = null;
			
			conn = DataBaseConnection.getConnection();
			stmt = conn.createStatement();
			
			conn.setAutoCommit(false);
			String sql = "Select * from " + table + " WHERE ID = " + id;
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				contentid = rs.getInt("id");
				if(!table.equals("alcol"))
				{
					combinename = rs.getString("combinename");
					decs = rs.getString("decs");
					combinealcol = rs.getString("combinealcol");
					userId = rs.getString("userId");
				}
				else
					combinename = rs.getString("name");
				love = rs.getInt("love");
			}
			
			if(LikeCompare(table, id, SignId) == -1) {
				if(rs != null) try{rs.close();} catch(SQLException e) {}
				if(stmt != null) try{stmt.close();} catch(SQLException e) {}
				if(conn != null) try{conn.setAutoCommit(true); conn.close();} catch(SQLException e) {}
				return false;
			}
			
			sql = "Update " + table + " SET LOVE = LOVE + 1 WHERE id = '" + contentid + "'";
			
			love++;
			
			stmt.executeUpdate(sql);
			
			conn.commit();
			
			if(table.equals("myrecipe") && love >= 10)
			{
				WriteRecipe("recipe", combinename, decs, combinealcol, love, userId);
				DeleteRecipe("myrecipe", id, userId);
			}
			
		} catch(Exception e) {
			if(conn != null) try {conn.rollback();} catch(SQLException sqle) {}
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(stmt != null) try{stmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.setAutoCommit(true); conn.close();} catch(SQLException e) {}
		}
		
		return true;
	}
}
