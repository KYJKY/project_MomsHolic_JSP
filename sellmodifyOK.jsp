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
		alert("거래글이 성공적으로 수정되었습니다.");
		location.href="category.jsp?ctg=all";
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
		
		String tp_id = request.getParameter("tp_id");
		
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
		String category = multi.getParameter("category");
		int price = Integer.parseInt(multi.getParameter("price"));
		String condition = multi.getParameter("condition");
		String dealing = multi.getParameter("dealing");
		String deliveryFee = multi.getParameter("deliveryFee");
		String content = multi.getParameter("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		
		String jsql1 = "select * from tradeimg where tp_id = ?";
		PreparedStatement pstmt1 = con.prepareStatement(jsql1);
		pstmt1.setString(1,tp_id);
		ResultSet rs1 = pstmt1.executeQuery();
		rs1.next();
		String origimg1 = rs1.getString("ti_img1");
		String origimg2 = rs1.getString("ti_img2");
		String origimg3 = rs1.getString("ti_img3");
		String origimg4 = rs1.getString("ti_img4");
		
		String finalfilename1 = null;
		String finalfilename2 = null;
		String finalfilename3 = null;
		String finalfilename4 = null;

		
		
		if (filename1!=null) {
			finalfilename1 = filename1;
		} else if (filename2!=null) {
			finalfilename2 = filename2;
		} else if (filename3!=null) {
			finalfilename3 = filename3;
		} else if (filename4!=null) {
			finalfilename4 = filename4;
		}
		if (origimg1!=null&&filename1==null) {
			finalfilename1 = origimg1;
		} else if (origimg2!=null&&filename2==null) {
			finalfilename2 = origimg2;
		} else if (origimg3!=null&&filename3==null) {
			finalfilename3 = origimg3;
		} else if (origimg4!=null&&filename4==null) {
			finalfilename4 = origimg4;
		}
		
		String realimg="";
		while(true) {
			if (finalfilename1 != null) {
				realimg="upload/"+finalfilename1;
				break;
			} else if (finalfilename2 != null) {
				realimg="upload/"+finalfilename2;
				break;
			} else if (finalfilename3 != null) {
				realimg="upload/"+finalfilename3;
				break;
			} else if (finalfilename4 != null) {
				realimg="upload/"+finalfilename4;
				break;
			}
			realimg="images/noimage.png";
			break;
		}
		
		
		String jsql3 = "update tradepost set tp_title = ?, tp_goodsctg = ?, tp_goodsimg = ?,";
		jsql3 += "tp_content = ?, tp_goodsprice = ?, tp_goodscondition = ?, tp_dealing = ?,";
		jsql3 += "tp_deliveryfee = ? where tp_id = ?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1,title);
		pstmt3.setString(2,category);
		pstmt3.setString(3,realimg);
		pstmt3.setString(4,content);
		pstmt3.setInt(5,price);
		pstmt3.setString(6,condition);
		pstmt3.setString(7,dealing);
		pstmt3.setString(8,deliveryFee);
		pstmt3.setInt(9,Integer.parseInt(tp_id));
		
		pstmt3.executeUpdate();

		String jsqlimg = "";
		if (filename1 != null) {
			jsqlimg = "update tradeimg set ti_img1 = ? where tp_id = ?";
			PreparedStatement pstmtimg1 = con.prepareStatement(jsqlimg);
			pstmtimg1.setString(1,filename1);
			pstmtimg1.setInt(2,Integer.parseInt(tp_id));
			pstmtimg1.executeUpdate();
		}
		if (filename2 != null) {
			jsqlimg = "update tradeimg set ti_img2 = ? where tp_id = ?";
			PreparedStatement pstmtimg2 = con.prepareStatement(jsqlimg);
			pstmtimg2.setString(1,filename1);
			pstmtimg2.setInt(2,Integer.parseInt(tp_id));
			pstmtimg2.executeUpdate();
		}
		if (filename3 != null) {
			jsqlimg = "update tradeimg set ti_img3 = ? where tp_id = ?";
			PreparedStatement pstmtimg3 = con.prepareStatement(jsqlimg);
			pstmtimg3.setString(1,filename3);
			pstmtimg3.setInt(2,Integer.parseInt(tp_id));
			pstmtimg3.executeUpdate();
		}
		if (filename4 != null) {
			jsqlimg = "update tradeimg set ti_img4 = ? where tp_id = ?";
			PreparedStatement pstmtimg4 = con.prepareStatement(jsqlimg);
			pstmtimg4.setString(1,filename1);
			pstmtimg4.setInt(2,Integer.parseInt(tp_id));
			pstmtimg4.executeUpdate();
		}
		
		
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