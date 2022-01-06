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
		alert("레시피가 성공적으로 등록되었습니다.");
		location.href="sub_recipe.jsp";
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

		String file10 = (String)files.nextElement();
		String filename10 = multi.getFilesystemName(file10);
		String file9 = (String)files.nextElement();
		String filename9 = multi.getFilesystemName(file9);
		String file8 = (String)files.nextElement();
		String filename8 = multi.getFilesystemName(file8);
		String file7 = (String)files.nextElement();
		String filename7 = multi.getFilesystemName(file7);
		String file6 = (String)files.nextElement();
		String filename6 = multi.getFilesystemName(file6);
		String file5 = (String)files.nextElement();
		String filename5 = multi.getFilesystemName(file5);
		String file4 = (String)files.nextElement();
		String filename4 = multi.getFilesystemName(file4);
		String file3 = (String)files.nextElement();
		String filename3 = multi.getFilesystemName(file3);
		String file2 = (String)files.nextElement();
		String filename2 = multi.getFilesystemName(file2);
		String file1 = (String)files.nextElement();
		String filename1 = multi.getFilesystemName(file1);
		
		String title = multi.getParameter("title");
		String category = multi.getParameter("category");
		String meterial = multi.getParameter("meterial");
		String content = multi.getParameter("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content1 = multi.getParameter("content1").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content2 = multi.getParameter("content2").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content3 = multi.getParameter("content3").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content4 = multi.getParameter("content4").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content5 = multi.getParameter("content5").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content6 = multi.getParameter("content6").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content7 = multi.getParameter("content7").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content8 = multi.getParameter("content8").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content9 = multi.getParameter("content9").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String content10 = multi.getParameter("content10").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		
		
		
		Calendar c = Calendar.getInstance();
		int cyear=c.get(Calendar.YEAR);
		String cmonth=String.format("%02d", c.get(Calendar.MONTH)+1);
		String cdate=String.format("%02d", c.get(Calendar.DATE));
		String chour=String.format("%02d", c.get(Calendar.HOUR_OF_DAY));
		String cminute=String.format("%02d", c.get(Calendar.MINUTE));
		String csecond=String.format("%02d", c.get(Calendar.SECOND));
		String datetime=cyear+"-"+cmonth+"-"+cdate+" "+chour+":"+cminute+":"+csecond;
		
		
		loginID = (String)session.getAttribute("loginSession");
		
		String jsql2 = "select MAX(re_id) from recipe";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		ResultSet rs2 = pstmt2.executeQuery();
		
		int tp_no;
		if ( rs2 == null ) {
			tp_no = 1;
		} else {
			rs2.next();
			tp_no = rs2.getInt(1) + 1;
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
			} else if (filename5 != null) {
				realimg="upload/"+filename5;
				break;
			} else if (filename6 != null) {
				realimg="upload/"+filename6;
				break;
			} else if (filename7 != null) {
				realimg="upload/"+filename7;
				break;
			} else if (filename8 != null) {
				realimg="upload/"+filename8;
				break;
			} else if (filename9 != null) {
				realimg="upload/"+filename9;
				break;
			} else if (filename10 != null) {
				realimg="upload/"+filename10;
				break;
			}
			realimg="images/noimage.png";
			break;
		}
		String jsql3 = "insert into recipe values (?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setInt(1,tp_no);
		pstmt3.setString(2,title);
		pstmt3.setString(3,category);
		pstmt3.setString(4,content);
		pstmt3.setString(5,meterial);
		pstmt3.setString(6,realimg);
		pstmt3.setString(7,content1);
		pstmt3.setString(8,content2);
		pstmt3.setString(9,content3);
		pstmt3.setString(10,content4);
		pstmt3.setString(11,content5);
		pstmt3.setString(12,content6);
		pstmt3.setString(13,content7);
		pstmt3.setString(14,content8);
		pstmt3.setString(15,content9);
		pstmt3.setString(16,content10);
		
		pstmt3.executeUpdate();
		
		String jsql4 = "insert into recipestep values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt4 = con.prepareStatement(jsql4);
		pstmt4.setInt(1,tp_no);
		pstmt4.setString(2,filename1);
		pstmt4.setString(3,filename2);
		pstmt4.setString(4,filename3);
		pstmt4.setString(5,filename4);
		pstmt4.setString(6,filename5);
		pstmt4.setString(7,filename6);
		pstmt4.setString(8,filename7);
		pstmt4.setString(9,filename8);
		pstmt4.setString(10,filename9);
		pstmt4.setString(11,filename10);
		
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