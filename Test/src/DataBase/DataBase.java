package DataBase;

import Drink.*;


import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;

import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

public class DataBase {
   
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
         query = GetPageingQurey("alcol", "WHERE name LIKE '%"+FindId+"%' and kind LIKE '%"+FindKindId+"%'", pageNum, maxContent);
         
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
   
   public StringBuffer GetFindRecipe(String FindId, String FindKindId, String page, int maxContent)
   {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      int pageNum = 1;
      
      if(page != null) pageNum = Integer.parseInt(page);
      
      StringBuffer sb = new StringBuffer();

      try {
         String query = GetPageingQurey("recipe", "WHERE combinename LIKE '%"+FindId+"%' and combinealcol LIKE '%"+FindKindId+"%' and", pageNum, maxContent);
         
         conn = Connect();
         
         stmt = conn.createStatement();
         rs = stmt.executeQuery(query);
         
         while(rs.next())
         {
            sb.append("<tr>");
               sb.append("<td>" + rs.getString("combinename") + "</td>");
               sb.append("<td>" + rs.getString("Decs") + "</td>");
               sb.append("<td>" + rs.getString("combinealcol") + "</td>");
               sb.append("<td>" + rs.getString("love") + "</td>");
               sb.append("<td>" + rs.getString("kind") + "</td>");
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
            sb.append("<tr>");
               sb.append("<td>" + di.get(i).getName() + "</td>");
                  sb.append("<td>" + di.get(i).getSweet() + "</td>");
                  sb.append("<td>" + di.get(i).getTansan() + "</td>");
                  sb.append("<td>" + di.get(i).getAlcohol() + "</td>");
                  sb.append("<td>" + di.get(i).getSize() + "</td>");
               sb.append("</tr>");
               if(di.get(i).getSize() != di.get(i + 1).getSize())
               break;
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

   public StringBuffer ShowRecipe(String pageNum) //������ �����ֱ�
   {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      StringBuffer str = new StringBuffer();
      int Page_num = Integer.parseInt(pageNum);
      String query = GetPageingQurey("recipe", "WHERE",Page_num,5);
       //������ �����͸� ���� list
      try {
         conn = Connect();
         
         stmt = conn.createStatement();
         rs = stmt.executeQuery(query);
      
            while(rs.next()) {
               str.append("<tr>");
               str.append("<th>"+"<img src ="+rs.getString("Link")+">" +"</th>");
               str.append("<td>"+ rs.getString("combineName")+"</td>");
               str.append("<td>"+"����  "+"<br>" +rs.getString("Decs") + "<br><br>" + "����  "+ "<br>"+ rs.getString("combineAlcol")+"</td>");
               str.append("<td>"+ "<input type=\"button\""+"onclick=\"addHeart()\""+"id="+rs.getRow()+"<br>"); //��ġ �ľ��� ����
               //str.append("<td>"+ "<img src="+ rs.getString("Love_img")+">"+"<br>"); -> �̹��� ����
               str.append("���ƿ� " +rs.getString("Love")+" ȸ </td>");
               str.append("</tr>");
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

   public int LoginCompare(String SignInId, String SignInPw, HttpSession session) //�α��� ����
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
         int i = 0;
         
         if(SignInId == "" || SignInPw == "")
            return -2;         // �����Է��� ���� ���..
         
         while(rs.next()){
            i++;
            String id = rs.getString("id"); 
            String pw = rs.getString("pw");
            
            if(id.equals(SignInId) && pw.equals(SignInPw)){
               session.setAttribute("id", SignInId);
               session.setAttribute("pw", SignInPw);
               // �α��� ���� ���� ���..
            }
            else
               count++;
            rsnumber = rs.getRow();
         }
         conn.commit(); //commit() : Ʈ�����(Transaction)�� commit �� �����Ѵ�.
         
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
      else return 1;      // �α��� ���� ���� ���..
   }
   
   public int InsertRecipe_user(String combName, String content, String id)
   {
      Connection conn = null;
      PreparedStatement pstmt =null;
      ResultSet rs = null;
      int result=0;
      String query="INSERT INTO myrecipe VALUES(?,?,?,?)";
      
      try {
         conn = Connect();
         
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1,id);
         pstmt.setString(2,combName);
         pstmt.setInt(3,0); //���ƿ� �ʱⰪ 0 ����
         pstmt.setString(4,content);
         
         result = pstmt.executeUpdate();
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
            if (pstmt != null) {
               pstmt.close();
               pstmt = null;
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
   
   public StringBuffer UserRecipe(String pageNum) //������ �����ֱ�
   {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      StringBuffer str = new StringBuffer();
      int Page_num = Integer.parseInt(pageNum);
      String query = GetPageingQurey("myrecipe","WHERE",Page_num,5);
       //������ �����͸� ���� list
      try {
         conn = Connect();
         
         stmt = conn.createStatement();
         rs = stmt.executeQuery(query);
      
            while(rs.next()) {
               str.append("<tr>");
               str.append("<th>"+rs.getString("ID") +"</th>");
               str.append("<td>"+ rs.getString("combine")+"</td>");
               str.append("<td>"+ rs.getString("UserDecs") + "<br><br>");
               str.append("<td>"+ "<input type=\"button\"" + "onclick=\"addHeart(this)\""+">"+"id="+rs.getRow()+"<br>");
               str.append("���ƿ� " +rs.getString("Love")+" ȸ </td>");
               str.append("</tr>");
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
   public int SignUp(String id, String pw, String email, String phone) //ȸ������ �Լ�
   {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      int count =0; //executeUpdate�� ����� ���� ���� 
      
      try {
         
         String query ="INSERT INTO userinfo VALUES(?,?,?,?)"; //ȸ������ �� �����ͺ��̽��� ����
         conn = Connect();
      
         PreparedStatement pstmt =null;
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, id);
         pstmt.setString(2,pw);
         pstmt.setString(3,email);
         pstmt.setString(4,phone);
         
         count = pstmt.executeUpdate();
         
         conn.commit();
      
      }   catch (Exception sqle){
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
   public StringBuffer Dictionary(String page, int maxContent)
      {
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         
         int pageNum = 1;
         
         if(page != null) pageNum = Integer.parseInt(page);
         
         StringBuffer sb = new StringBuffer();

         try {
            String query = null;
            query = GetPageingQurey("alcol", "where", pageNum, 5);
            
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

   
}