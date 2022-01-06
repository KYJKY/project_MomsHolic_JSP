<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script language="javascript" src="js/login.js" charset="UTF-8"></script>
<title>confirmOK</title>
</head>
<body>
<% 
	// DB접속
	String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
	String DB_ID = "multi";
	String DB_PASSWORD = "abcd";
	Class.forName("org.gjt.mm.mysql.Driver"); 
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	int th_no = Integer.parseInt(request.getParameter("th_no"));
	int req = Integer.parseInt(request.getParameter("req"));
	String m_id = request.getParameter("m_id");
    String jsql = "";
	String jsqlsel = "select * from tradehistory where th_no = ?";
	PreparedStatement pstmtsel = con.prepareStatement(jsqlsel);
	pstmtsel.setInt(1,th_no);
	ResultSet rssel = pstmtsel.executeQuery();
	rssel.next();
	int tp_id = rssel.getInt("tp_id");
	int isaccepted = rssel.getInt("th_isaccepted");
	int issended = rssel.getInt("th_issended");
	String sellerid = rssel.getString("th_sellerid");
	String buyerid = rssel.getString("th_buyerid");
	Calendar c = Calendar.getInstance();
	int cyear=c.get(Calendar.YEAR);
	String cmonth=String.format("%02d", c.get(Calendar.MONTH)+1);
	String cdate=String.format("%02d", c.get(Calendar.DATE));
	String chour=String.format("%02d", c.get(Calendar.HOUR_OF_DAY));
	String cminute=String.format("%02d", c.get(Calendar.MINUTE));
	String csecond=String.format("%02d", c.get(Calendar.SECOND));
	String datetime=cyear+"-"+cmonth+"-"+cdate+" "+chour+":"+cminute+":"+csecond;
	
    if (req == 1) {
    	jsql = "update tradehistory set th_isaccepted = 1 where th_no = ?";
    	PreparedStatement pstmt = con.prepareStatement(jsql);
    	pstmt.setInt(1,th_no);
    	pstmt.executeUpdate();
    	
    	String jsql2 = "delete from tradehistory where tp_id = ? and th_no != ?";
    	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
    	pstmt2.setInt(1,tp_id);
    	pstmt2.setInt(2,th_no);
    	pstmt2.executeUpdate();
    	
    	String alarmjsql = "insert into alarmmsg values (null, ?, ?, ?, 0, ?)";
    	PreparedStatement pstmtalarm = con.prepareStatement(alarmjsql);
    	pstmtalarm.setString(1, buyerid);
    	pstmtalarm.setString(2, "구매요청수락");
    	pstmtalarm.setString(3, "판매자가 고객님의 구매 요청을 수락하셨습니다.");
    	pstmtalarm.setString(4, datetime);
    	pstmtalarm.executeUpdate();
    	
    } else if (req == 2 || req == 4 || req == 7) {
    	jsql = "update tradehistory set th_isend = 1 where th_no = ?";
    	PreparedStatement pstmt = con.prepareStatement(jsql);
    	pstmt.setInt(1,th_no);
    	pstmt.executeUpdate();

    	String alarmtitle = "";
    	String alarmmsg = "";
    	String alarmjsql = "insert into alarmmsg values (null, ?, ?, ?, 0, ?)";
    	String alarmtarget = "";
    	if (req==2) {
    		alarmtitle = "구매요청거절";
    		alarmmsg = "판매자가 고객님의 구매 요청을 거절하셨습니다.";
    		alarmtarget = buyerid;
    	} else if (req==4) {
    		alarmtitle = "배송취소";
    		alarmmsg = "판매자가 배송을 취소하였습니다.";
    		alarmtarget = buyerid;
    	} else if (req==7) {
    		alarmtitle = "거래완료";
    		alarmmsg = "거래가 완료되었습니다.";
    		alarmtarget = sellerid;
    	}
    	PreparedStatement pstmtalarm = con.prepareStatement(alarmjsql);
    	pstmtalarm.setString(1, alarmtarget);
    	pstmtalarm.setString(2, "구매요청수락");
    	pstmtalarm.setString(3, "판매자가 고객님의 구매 요청을 수락하셨습니다.");
    	pstmtalarm.setString(4, datetime);
    	pstmtalarm.executeUpdate();
    	
    } else if (req == 3) {
    	String deliverynum = request.getParameter("deliverynum");
    	String bank = request.getParameter("bank");
    	String banknum = request.getParameter("banknum");
    	jsql = "update tradehistory set th_issended = 1, th_deliverynum = ?, th_sellerbank = ?, th_sellerbanknum = ? where th_no = ?";
    	PreparedStatement pstmt = con.prepareStatement(jsql);
    	pstmt.setString(1,deliverynum);
    	pstmt.setString(2,bank);
    	pstmt.setString(3,banknum);
    	pstmt.setInt(4,th_no);
    	pstmt.executeUpdate();

    	String alarmjsql = "insert into alarmmsg values (null, ?, ?, ?, 0, ?)";
    	PreparedStatement pstmtalarm = con.prepareStatement(alarmjsql);
    	pstmtalarm.setString(1, buyerid);
    	pstmtalarm.setString(2, "배송시작");
    	pstmtalarm.setString(3, "판매자가 고객님께 상품을 배송하였습니다.");
    	pstmtalarm.setString(4, datetime);
    	pstmtalarm.executeUpdate();
    } else if (req == 5 || req == 6) {
    	if (isaccepted == 1 || issended == 1) { response.sendRedirect("mypage_manage.jsp?m_id="+m_id); }
    	jsql = "delete from tradehistory where th_no = ?";
    	PreparedStatement pstmt = con.prepareStatement(jsql);
    	pstmt.setInt(1,th_no);
    	pstmt.executeUpdate();
    }
	
%>
<script>
location.href = "mypage_manage.jsp?m_id=<%=m_id%>";
</script>
</body>
</html>