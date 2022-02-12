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
	function registeralert(){
		alert("프로필을 수정하였습니다.");
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
	request.setCharacterEncoding("UTF-8");
	
	// 로그인 세션 받기
	String loginID = null;
	if(session.getAttribute("loginSession")!=null) {
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("password2");
		String m_nick = request.getParameter("nickname");
		String m_name = request.getParameter("name");
		String m_birth = request.getParameter("birth");
		String m_phone = request.getParameter("Phone");
		String m_email1 = request.getParameter("email1");
		String m_email2 = request.getParameter("email2");
		String m_addresscode = request.getParameter("addressCode");
		String m_address1 = request.getParameter("address1");
		String m_address2 = request.getParameter("address2");
		String m_introduce = request.getParameter("introduce").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		System.out.println(m_introduce);
		
		String jsql3 = "update member set m_nickname = ?, m_pw = ?, m_name = ?, m_addresscode = ?,";
		jsql3 += "m_address1 = ?, m_address2 = ?, m_email1 = ?, m_email2 = ?, m_phone = ?,";
		jsql3 += "m_birth = ?, m_introduce = ? where m_id = ?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1,m_nick);
		pstmt3.setString(2,m_pw);
		pstmt3.setString(3,m_name);
		pstmt3.setString(4,m_addresscode);
		pstmt3.setString(5,m_address1);
		pstmt3.setString(6,m_address2);
		pstmt3.setString(7,m_email1);
		pstmt3.setString(8,m_email2);
		pstmt3.setString(9,m_phone);
		pstmt3.setString(10,m_birth);
		pstmt3.setString(11,m_introduce);
		pstmt3.setString(12,m_id);
		
		pstmt3.executeUpdate();
		%>
			<script>registeralert();</script>
		<%
		response.sendRedirect("mypage.jsp?m_id=" + m_id);
	} else {
		%>
		<script>loginalert();</script>
		<%	
	}
		%>
</body>
</html>