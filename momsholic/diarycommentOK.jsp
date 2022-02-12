<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>     
<html>
   <head><title>댓글추가</title></head>      
   <body>
 <%
   String DB_URL="jdbc:mysql://localhost:3306/momsholic";  
   String DB_ID="multi";  
   String DB_PASSWORD="abcd"; 
 	 
   Class.forName("org.gjt.mm.mysql.Driver");  
   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("UTF-8");
	
	String dc_content = request.getParameter("in_content");              
    String dc_m_id = request.getParameter("m_id");
    String di_id = request.getParameter("di_id");
    String dc_nickname = request.getParameter("di_nickname");
    
    Calendar c = Calendar.getInstance();
	int cyear=c.get(Calendar.YEAR);
	int cmonth=c.get(Calendar.MONTH)+1;
	int cdate=c.get(Calendar.DATE);
	int chour=c.get(Calendar.HOUR);
	int cminute=c.get(Calendar.MINUTE);
	int csecond=c.get(Calendar.SECOND);
	String datetime=cyear+"-"+cmonth+"-"+cdate+" "+chour+":"+cminute+":"+csecond;       
   
	String jsql = "select MAX(dc_id) from diarycomment";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	ResultSet rs = pstmt.executeQuery();

	int dc_id;
    if (rs == null) {  
        dc_id = 1;
    }  else {    	  
       	rs.next();
       	dc_id = rs.getInt(1) + 1;
    }
	int dc_no;
	String jsql2 = "select MAX(dc_no) from diarycomment where di_id=?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, di_id);
	ResultSet rs2 = pstmt2.executeQuery();
    if (rs2 == null) {  
        dc_no = 1;
    }  else {    	  
       	rs2.next();
       	dc_no = rs2.getInt(1) + 1;
    }
   	rs2.close();
    rs.close();    


	String jsql3 = "insert into diarycomment values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
   	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setInt(1, dc_id);
	pstmt3.setInt(2, Integer.parseInt(di_id));
    pstmt3.setString(3, dc_m_id);
    pstmt3.setInt(4, dc_no);
    pstmt3.setString(5, dc_nickname);
    pstmt3.setString(6, dc_content);
    pstmt3.setString(7, datetime);
    pstmt3.setInt(8, dc_id);
    pstmt3.setInt(9, 0);
    pstmt3.setInt(10, 0);
    	  
	pstmt3.executeUpdate();
    response.sendRedirect("sub_diary_detail.jsp?di_id="+di_id);   
   %>
  </body>
</html>