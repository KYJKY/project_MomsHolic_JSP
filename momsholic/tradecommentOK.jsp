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
	
	String tc_content = request.getParameter("in_content");              
    String tc_m_id = request.getParameter("m_id");
    String tp_id = request.getParameter("tp_id");
    String tc_nickname = request.getParameter("tc_nickname");
    
    Calendar c = Calendar.getInstance();
	int cyear=c.get(Calendar.YEAR);
	int cmonth=c.get(Calendar.MONTH)+1;
	int cdate=c.get(Calendar.DATE);
	int chour=c.get(Calendar.HOUR);
	int cminute=c.get(Calendar.MINUTE);
	int csecond=c.get(Calendar.SECOND);
	String datetime=cyear+"-"+cmonth+"-"+cdate+" "+chour+":"+cminute+":"+csecond;       
   
	String jsql = "select MAX(tc_id) from tradecomment";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	ResultSet rs = pstmt.executeQuery();

	int tc_id;
    if (rs == null) {  
        tc_id = 1;
    }  else {    	  
       	rs.next();
       	tc_id = rs.getInt(1) + 1;
    }
	int tc_no;
	String jsql2 = "select MAX(tc_no) from tradecomment where tp_id=?";
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, tp_id);
	ResultSet rs2 = pstmt2.executeQuery();
    if (rs2 == null) {  
        tc_no = 1;
    }  else {    	  
       	rs2.next();
       	tc_no = rs2.getInt(1) + 1;
    }
   	rs2.close();
    rs.close();    


	String jsql3 = "insert into tradecomment (tc_id, tp_id, m_id, tc_no, tc_nickname, tc_content, tc_date, tc_masterid, tc_replyno, tc_step) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
   	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setInt(1, tc_id);
	pstmt3.setInt(2, Integer.parseInt(tp_id));
    pstmt3.setString(3, tc_m_id);
    pstmt3.setInt(4, tc_no);
    pstmt3.setString(5, tc_nickname);
    pstmt3.setString(6, tc_content);
    pstmt3.setString(7, datetime);
    pstmt3.setInt(8, tc_id);
    pstmt3.setInt(9, 0);
    pstmt3.setInt(10, 0);
    	  
	pstmt3.executeUpdate();
    response.sendRedirect("productDetail.jsp?tp_id="+tp_id);   
   %>
  </body>
</html>