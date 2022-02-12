<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="css/loginOK.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!--1.	로그인/네비게이션	-->
		<div id="head2">
			<div id="topline">
			<p>
				<a href="login.html">로그인</a>&nbsp;&nbsp;|&nbsp;
				<a href="register.html">회원가입</a>
			</p>
			</div>	
			<nav>
				<ul>
					<li><a href="index.html"><img src="images/logo.jpg"  style="width:135px; height:45px; margin-top: 15px;"></a></li>
					<li id="navsearch">
						<form>
							<input type="text">
							<input type="button" id="searchButton" value="검색" style="width: 60px; height: 25px;">
						</form>
					</li>
					<li><a href="#">판매하기</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">마이 페이지</a></li>
					<li><a href="#">알림</a></li>
				</ul>
			</nav>
		</div>
		
		<div id="result">
			<h1>로그인 실패</h1>
			<div id="failReason">
		
<%
	String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
	String DB_ID = "multi";
	String DB_PASSWORD = "abcd";
	Class.forName("org.gjt.mm.mysql.Driver"); 
	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	request.setCharacterEncoding("euc-kr"); 

    String id = request.getParameter("id");            
    String pass = request.getParameter("password"); 

   
    String jsql = "select  *  from member where memId = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   //  (1) 입력한 ID를 가지는 레코드가 member테이블에 존재하는 경우
    {
        if (pass.equals(rs.getString("memPasswd")))  
    	//  (1.1) 입력한 ID를 가지는 레코드가 존재하면서, 
	    //	        입력한 비밀번호가 member테이블상의 비밀번호와도 일치하는 경우
        {
             session.setAttribute("sid", id);
 	      // 로그인 성공시, 접속한 사용자의 ID를 "sid" 속성의 속성값으로 설정함.
          // 추후 로그인 된 상태에서 접속 ID와 관련된 정보를 필요로 할때,
	      // (String)session.getAttribute("sid")를 이용하여 접속 ID 정보를 가져올 수 있다.
     	  // 단순히, 로그인 여부 판별은 이 속성값이 null인지 아닌지로 로그인 여부를 확인함. 
	      //  (로그인이 안된 경우, 이 값은 null값을 가짐)

             response.sendRedirect("index.jsp");   	//  <jsp:forward page="index.jsp"/> 와 동일함

		 } else {   // (1.2) 입력한 ID를 가지는 레코드가 member테이블에 존재하지만, 비밀번호가 불일치한 경우
%>
				<p>비밀번호가 잘못 되었습니다.</p>
				<p>다시 확인해 주세요.</p>
<%       
        }   //  두번째 if-else문의 끝      
    } else {    //  (2)  입력한 ID를 가지는 레코드가 member테이블에 존재하지 않는 경우
 %>   
				<p>아이디가 존재하지 않습니다.</p>
				<p>다시 확인해 주세요.</p>
<%
   }  // 첫번째 if-else문의 끝
%>
		<div id="button">
				<a href="login.html"><img src="images/login.jpg"></a>
				<a href="register.html"><img src="images/register.jpg"></a>
				</div>
			</div>
		</div>
</body>
</html>