<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script language="javascript" src="js/login.js" charset="UTF-8"></script>
<title>sellOK</title>
<script>
	function loginalert(){
		alert("로그인이 필요한 서비스입니다.");
		location.href="login.jsp";
	}
	function registeralert() {
		alert("응모글이 성공적으로 등록되었습니다.");
		location.href="sub_donate2.jsp";
	}
</script>
</head>
<body>
<%
	// DB접속
	String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
	String DB_ID = "multi";
	String DB_PASSWORD = "abcd";
	Class.forName("org.gjt.mm.mysql.Driver"); 
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	//request.setCharacterEncoding("euc-kr");
	
	// 로그인 세션 받기
	String loginID = null;
	if(session.getAttribute("loginSession").equals("admin")) {
		
		String uploadPath = application.getRealPath("/upload");
		int size = 10*1024*1024;
		System.out.println(uploadPath);
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		
		String file1 = (String)files.nextElement();
		String filename1 = multi.getFilesystemName(file1);
		
		String title = multi.getParameter("title");
		String price = multi.getParameter("price");
		
		
		
		Calendar c = Calendar.getInstance();
		int cyear=c.get(Calendar.YEAR);
		String cmonth=String.format("%02d", c.get(Calendar.MONTH)+1);
		String cdate=String.format("%02d", c.get(Calendar.DATE)+7);
		String chour=String.format("%02d", c.get(Calendar.HOUR_OF_DAY));
		String cminute=String.format("%02d", c.get(Calendar.MINUTE));
		String csecond=String.format("%02d", c.get(Calendar.SECOND));
		String datetime=cyear+"-"+cmonth+"-"+cdate+" "+chour+":"+cminute+":"+csecond;
		
		String jsql2 = "select MAX(do_id) from donate";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		ResultSet rs2 = pstmt2.executeQuery();
		
		int do_id;
		if ( rs2 == null ) {
			do_id = 1;
		} else {
			rs2.next();
			do_id = rs2.getInt(1) + 1;
		}
		rs2.close();
		String realimg="";
		while(true) {
			if (filename1 != null) {
				realimg="upload/"+filename1;
				break;
			} 
			realimg="images/noimage.png";
			break;
		}
		String jsql3 = "insert into donate values (?, ?, ?, ?, ?)";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setInt(1,do_id);
		pstmt3.setString(2,realimg);
		pstmt3.setString(3,title);
		pstmt3.setString(4,price);
		pstmt3.setString(5,datetime);
		
		pstmt3.executeUpdate();
		
		
		%>
		<script>registeralert();</script>
		<%
	} else {
		%>
		<script>loginalert();</script>
		<%
	}
%>
</body>
</html>