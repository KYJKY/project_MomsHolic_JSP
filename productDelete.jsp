<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<html>
   <head><title>게시물삭제</title></head>      
   <body>
 <%
   String DB_URL="jdbc:mysql://localhost:3306/momsholic";  
   String DB_ID="multi";  
   String DB_PASSWORD="abcd"; 
 	 
   Class.forName("org.gjt.mm.mysql.Driver");  
   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("UTF-8");
	
    String tp_id = request.getParameter("tp_id");
        
   
	String jsql = "delete from tradepost where tp_id = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setInt(1, Integer.parseInt(tp_id));
	pstmt.executeUpdate();
	
	String jsql2 = "delete from tradehistory where tp_id = ?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setInt(1, Integer.parseInt(tp_id));
	pstmt2.executeUpdate();
	
    response.sendRedirect("category.jsp?ctg=all");   
   %>
  </body>
</html>