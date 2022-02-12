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
		alert("일기가 성공적으로 등록되었습니다.");
		location.href="sub_diary.jsp";
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
	if(session.getAttribute("loginSession")!=null) {
		
		String uploadPath = application.getRealPath("/upload");
		int size = 10*1024*1024;
		System.out.println(uploadPath);
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		
		String file4 = (String)files.nextElement();
		String filename4 = multi.getFilesystemName(file4);
		String file3 = (String)files.nextElement();
		String filename3 = multi.getFilesystemName(file3);
		String file2 = (String)files.nextElement();
		String filename2 = multi.getFilesystemName(file2);
		String file1 = (String)files.nextElement();
		String filename1 = multi.getFilesystemName(file1);
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		
		Calendar c = Calendar.getInstance();
		int cyear=c.get(Calendar.YEAR);
		String cmonth=String.format("%02d", c.get(Calendar.MONTH)+1);
		String cdate=String.format("%02d", c.get(Calendar.DATE));
		String chour=String.format("%02d", c.get(Calendar.HOUR_OF_DAY));
		String cminute=String.format("%02d", c.get(Calendar.MINUTE));
		String csecond=String.format("%02d", c.get(Calendar.SECOND));
		String datetime=cyear+"-"+cmonth+"-"+cdate+" "+chour+":"+cminute+":"+csecond;
		
		
		loginID = (String)session.getAttribute("loginSession");

		String jsql1 = "select m_nickname from member where m_id = ?";
		PreparedStatement pstmt1 = con.prepareStatement(jsql1);
		pstmt1.setString(1, loginID);
		ResultSet rs1 = pstmt1.executeQuery();
		rs1.next();
		String nickname = rs1.getString("m_nickname");
		
		String jsql2 = "select MAX(di_id) from diary";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		ResultSet rs2 = pstmt2.executeQuery();
		
		int di_id;
		if ( rs2 == null ) {
			di_id = 1;
		} else {
			rs2.next();
			di_id = rs2.getInt(1) + 1;
		}
		rs2.close();
		String realimg="";
		while(true) {
			if (filename1 != null) {
				realimg="upload/"+filename1;
				break;
			} else if (filename2 != null) {
				realimg="upload/"+filename2;
				break;
			} else if (filename3 != null) {
				realimg="upload/"+filename3;
				break;
			} else if (filename4 != null) {
				realimg="upload/"+filename4;
				break;
			}
			realimg="images/noimage.png";
			break;
		}
		String jsql3 = "insert into diary values (null, ?, ?, ?, ?, ?, 0, 0, ?)";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1,loginID);
		pstmt3.setString(2,nickname);
		pstmt3.setString(3,title);
		pstmt3.setString(4,content);
		pstmt3.setString(5,datetime);
		pstmt3.setString(6,realimg);
		
		pstmt3.executeUpdate();
		
		String jsql4 = "insert into diaryimg values (?, ?, ?, ?, ?)";
		PreparedStatement pstmt4 = con.prepareStatement(jsql4);
		pstmt4.setInt(1,di_id);
		pstmt4.setString(2,filename1);
		pstmt4.setString(3,filename2);
		pstmt4.setString(4,filename3);
		pstmt4.setString(5,filename4);
		
		pstmt4.executeUpdate();
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