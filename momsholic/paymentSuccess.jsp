<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script language="javascript" src="js/login.js" charset="UTF-8"></script>
<title>buyOK</title>
</head>
<body>
<%
	int tp_id = Integer.parseInt(request.getParameter("tp_id"));


	String DB_URL="jdbc:mysql://localhost:3306/momsholic";  
	String DB_ID="multi";  
	String DB_PASSWORD="abcd"; 
	 
	Class.forName("org.gjt.mm.mysql.Driver");  
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	request.setCharacterEncoding("UTF-8");
	String jsqlseller = "select m_id from tradepost where tp_id = ?";
	PreparedStatement pstmtseller = con.prepareStatement(jsqlseller);
	pstmtseller.setInt(1, tp_id);
	ResultSet rsseller = pstmtseller.executeQuery();
	rsseller.next();
	String sellerid = rsseller.getString("m_id");
	

	Calendar c = Calendar.getInstance();
	int cyear=c.get(Calendar.YEAR);
	String cmonth=String.format("%02d", c.get(Calendar.MONTH)+1);
	String cdate=String.format("%02d", c.get(Calendar.DATE));
	String chour=String.format("%02d", c.get(Calendar.HOUR_OF_DAY));
	String cminute=String.format("%02d", c.get(Calendar.MINUTE));
	String csecond=String.format("%02d", c.get(Calendar.SECOND));
	String datetime=cyear+"-"+cmonth+"-"+cdate+" "+chour+":"+cminute+":"+csecond;
	
	String alarmjsql = "insert into alarmmsg values (null, ?, ?, ?, 0, ?)";
	PreparedStatement pstmtalarm = con.prepareStatement(alarmjsql);
	pstmtalarm.setString(1, sellerid);
	pstmtalarm.setString(2, "구매요청");
	pstmtalarm.setString(3, "구매자가 고객님께 거래를 요청하였습니다.");
	pstmtalarm.setString(4, datetime);
	pstmtalarm.executeUpdate();

%>
<script>
alert("구매신청을 완료하였습니다.");
location.href = "productDetail.jsp?tp_id=<%=tp_id%>";
</script>
</body>
</html>