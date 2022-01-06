<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>MOM's Holic</title>
		<link href="css/productDetail.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="css/jquery.bxslider.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="js/jquery.bxslider.min.js"></script>	
		<script type="text/javascript">
		function searchSubmit(){
			if (document.getElementById("searchText").value == "") {
				alert("검색어를 입력해주세요.");
				return false;
			}
			document.getElementById("searchForm").submit();
			
		}
		var windowopener = null;
		function momstalkPopup(momstalkform){
			var frm = momstalkform;
			var popurl = 'momstalklist.jsp';
			var popoption = 'width=400, height=670, resizable=no, scrollbars=no, status=no';
			if (windowopener == null) {
				windowopener = window.open('','momstalklist',popoption);
				frm.action = 'momstalklist.jsp';
				frm.method = "post";
				frm.target = 'momstalklist';
				frm.submit();
			} else if (windowopener.closed){
				windowopener = window.open('','momstalklist',popoption);
				frm.action = 'momstalklist.jsp';
				frm.method = "post";
				frm.target = 'momstalklist';
				frm.submit();
			}
			windowopener.focus();
		}
		function momstalkPopup2(momstalkform){
			var frm = momstalkform;
			var popurl = 'momstalklist.jsp';
			var popoption = 'width=400, height=670, resizable=no, scrollbars=no, status=no';
			if (windowopener == null) {
				windowopener = window.open('','momstalklist',popoption);
				frm.action = 'momstalklist.jsp';
				frm.method = "post";
				frm.target = 'momstalklist';
				frm.submit();
			} else if (windowopener.closed){
				windowopener = window.open('','momstalklist',popoption);
				frm.action = 'momstalklist.jsp';
				frm.method = "post";
				frm.target = 'momstalklist';
				frm.submit();
			}
			windowopener.focus();
		}
		function toggleScript(){
            $( "#alertDiv" ).toggleClass("show");
            $( "#alertDiv2" ).toggleClass("show");
         }

		//박스슬라이더
		$(document).ready(function(){
			$('.slider').bxSlider({
				auto:true, //자동
				speed:500, //속도
				pause:5000, //멈추는시간
				mode:'horizontal', //가로
				autoControls:false, 
				pager:true,
				caption:true,
			});
			<%
			// DB접속
			String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
			String DB_ID = "multi";
			String DB_PASSWORD = "abcd";
			Class.forName("org.gjt.mm.mysql.Driver"); 
	 		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	 		request.setCharacterEncoding("UTF-8");
	 		
	 		String tp_id = request.getParameter("tp_id");
	 		
			// 로그인 세션 받기
			String loginIDdibs = null;
			if(session.getAttribute("loginSession")!=null){
				loginIDdibs = (String)session.getAttribute("loginSession");
			}
			
			// 게시물 정보 불러오기
			String jsql1 = "select * from tradepost where tp_id = ?";
			PreparedStatement pstmt1 = con.prepareStatement(jsql1);
			pstmt1.setString(1,tp_id);
			ResultSet rs1 = pstmt1.executeQuery();
			rs1.next();
			String title = rs1.getString("tp_title");
			String ctg = rs1.getString("tp_goodsctg");
			String img = rs1.getString("tp_goodsimg");
			String content = rs1.getString("tp_content").trim();
			String date = rs1.getString("tp_date");
			String m_id = rs1.getString("m_id");
			String nickname = rs1.getString("tp_nickname");
			int hits = rs1.getInt("tp_hits");
			hits++;
			DecimalFormat df = new DecimalFormat("###,###");
			int priceTemp = rs1.getInt("tp_goodsprice");
			String price = df.format(priceTemp);	
			String conditionTemp = rs1.getString("tp_goodscondition");
			String dealingTemp = rs1.getString("tp_dealing");
			String deliveryfeeTemp = rs1.getString("tp_deliveryfee");
			String condition = "";
			String dealing = "";
			String deliveryfee = "";	
			if (conditionTemp.equals("new")) { condition="새 상품"; }
			else if (conditionTemp.equals("almost")) { condition="거의 새 것"; }
			else if (conditionTemp.equals("used")) { condition="중고"; }

			if (dealingTemp.equals("directDealing")) { dealing="직거래"; }
			else if (dealingTemp.equals("deliveryDealing")) { dealing="택배거래"; }
			else if (dealingTemp.equals("bothDealing")) { dealing="상관없음"; }
						
			if (deliveryfeeTemp.equals("FeeInclusion")) { deliveryfee="배송비 포함"; }
			else if (deliveryfeeTemp.equals("collectible")) { deliveryfee="착불"; }
			
			// 조회수 증가
			String jsqlhits = "update tradepost set tp_hits = ? where tp_id = ?";
			PreparedStatement pstmthits = con.prepareStatement(jsqlhits);
			pstmthits.setInt(1, hits);
			pstmthits.setInt(2, Integer.parseInt(tp_id));
			pstmthits.executeUpdate();
			
			// 이미지불러오기
			String jsqlimgload = "select * from tradeimg where tp_id = ?";
			PreparedStatement pstmtimgload = con.prepareStatement(jsqlimgload);
			pstmtimgload.setInt(1, Integer.parseInt(tp_id));
			ResultSet rsimgload = pstmtimgload.executeQuery();
			rsimgload.next();
			String img1 = rsimgload.getString("ti_img1");
			String img2 = rsimgload.getString("ti_img2");
			String img3 = rsimgload.getString("ti_img3");
			String img4 = rsimgload.getString("ti_img4");
			
					
			// 찜 여부 불러오기, 색 변경 
			if (loginIDdibs!=null) {
				if (!loginIDdibs.equals(m_id)) {
					String jsqldibsload = "select count(*) from wish where tp_id = ? and m_id = ?";
					PreparedStatement pstmtdibsload = con.prepareStatement(jsqldibsload);
					pstmtdibsload.setInt(1,Integer.parseInt(tp_id));
					pstmtdibsload.setString(2,loginIDdibs);
					ResultSet rsdibsload = pstmtdibsload.executeQuery();
					rsdibsload.next();
					int isdibsload = rsdibsload.getInt(1);
					if(isdibsload == 0) {%>
						$("#dibsButton").css({"background-color":"#aaaaaa"});
					<% } else { %>
						$("#dibsButton").css({"background-color":"#F93F31"});
				<% }
					
					String jsqlpayload = "select count(*) from tradehistory where tp_id = ? and th_buyerid = ?";
					PreparedStatement pstmtpayload = con.prepareStatement(jsqlpayload);
					pstmtpayload.setInt(1,Integer.parseInt(tp_id));
					pstmtpayload.setString(2,loginIDdibs);
					ResultSet rspayload = pstmtpayload.executeQuery();
					rspayload.next();
					int ispayload = rspayload.getInt(1);
					if (ispayload > 0) { %>
						$("#dealButton").css({"background-color":"#aaaaaa"});
						$("#dealButton").html("신청완료");
					<% }
					
					jsqlpayload = "select count(*) from tradehistory where tp_id = ? and th_isaccepted = 1 and th_isend = 0";
					PreparedStatement pstmtpayload2 = con.prepareStatement(jsqlpayload);
					pstmtpayload2.setInt(1,Integer.parseInt(tp_id));
					ResultSet rspayload2 = pstmtpayload2.executeQuery();
					rspayload2.next();
					ispayload = rspayload2.getInt(1);
					if (ispayload > 0) { %>
						$("#dealButton").css({"background-color":"#aaaaaa"});
						$("#dealButton").html("거래 중");
					<% }
					
					jsqlpayload = "select count(*) from tradehistory where tp_id = ? and th_isaccepted = 1 and th_issended = 1 and th_isend = 1";
					PreparedStatement pstmtpayload3 = con.prepareStatement(jsqlpayload);
					pstmtpayload3.setInt(1,Integer.parseInt(tp_id));
					ResultSet rspayload3 = pstmtpayload3.executeQuery();
					rspayload3.next();
					ispayload = rspayload3.getInt(1);
					if (ispayload > 0) { %>
						$("#dealButton").css({"background-color":"#aaaaaa"});
						$("#dealButton").html("거래완료");
					<% }
				}
			} else {
				String jsqlpayload = "select count(*) from tradehistory where tp_id = ? and th_isaccepted = 1 and th_isend = 0";
				PreparedStatement pstmtpayload = con.prepareStatement(jsqlpayload);
				pstmtpayload.setInt(1,Integer.parseInt(tp_id));
				ResultSet rspayload = pstmtpayload.executeQuery();
				rspayload.next();
				int ispayload = rspayload.getInt(1);
				if (ispayload > 0) { %>
					$("#dealButton").css({"background-color":"#aaaaaa"});
					$("#dealButton").html("거래 중");
				<% }
				
				jsqlpayload = "select count(*) from tradehistory where tp_id = ? and th_isaccepted = 1 and th_issended = 1 and th_isend = 1";
				PreparedStatement pstmtpayload2 = con.prepareStatement(jsqlpayload);
				pstmtpayload2.setInt(1,Integer.parseInt(tp_id));
				ResultSet rspayload2 = pstmtpayload2.executeQuery();
				rspayload2.next();
				ispayload = rspayload2.getInt(1);
				if (ispayload > 0) { %>
					$("#dealButton").css({"background-color":"#aaaaaa"});
					$("#dealButton").html("거래완료");
				<% }
			}
			%>
		});
		
		
		function paymentlink() {
			<%
			if (loginIDdibs!=null) {
			String jsqlpaylink = "select count(*) from tradehistory where tp_id = ? and th_buyerid = ?";
			PreparedStatement pstmtpaylink = con.prepareStatement(jsqlpaylink);
			pstmtpaylink.setInt(1,Integer.parseInt(tp_id));
			pstmtpaylink.setString(2,loginIDdibs);
			ResultSet rspaylink = pstmtpaylink.executeQuery();
			rspaylink.next();
			int ispaied = rspaylink.getInt(1);
			if (ispaied > 0) { %>
				alert("이미 거래신청을 완료하였습니다.");
				return;
			<% }
			jsqlpaylink = "select count(*) from tradehistory where tp_id = ? and th_isaccepted = 1 and th_isend = 0";
			PreparedStatement pstmtpaylink2 = con.prepareStatement(jsqlpaylink);
			pstmtpaylink2.setInt(1,Integer.parseInt(tp_id));
			ResultSet rspaylink2 = pstmtpaylink2.executeQuery();
			rspaylink2.next();
			ispaied = rspaylink2.getInt(1);
			if (ispaied > 0) { %>
				alert("이미 거래 중인 물품입니다.");
				return;
			<% }
			jsqlpaylink = "select count(*) from tradehistory where tp_id = ? and th_isend = 1";
			PreparedStatement pstmtpaylink3 = con.prepareStatement(jsqlpaylink);
			pstmtpaylink3.setInt(1,Integer.parseInt(tp_id));
			ResultSet rspaylink3 = pstmtpaylink3.executeQuery();
			rspaylink3.next();
			ispaied = rspaylink3.getInt(1);
			if (ispaied > 0) { %>
				alert("이미 거래가 완료된 물품입니다.");
				return;
			<% } %>
			location.href = "payment.jsp?tp_id=<%=tp_id%>";
			<% } else { %>
				alert("로그인이 필요한 서비스입니다.");
				location.href = "login.jsp";
			<% } %>
		}
		
		function dibschange() {
			<%
			if (loginIDdibs!=null) {
			%>
			$.ajax({
				type: 'POST',
				url: './DibsCheckServlet',
				data: {tp_id:<%=tp_id%>, loginID:"<%=loginIDdibs%>"},
				success: function(result) {
					if(result == 2) {
						$("#dibsButton").css({"background-color":"#aaaaaa"});
						alert("해당 상품을 찜 목록에서 제거하였습니다.");
					} else if (result == 1) {
						$("#dibsButton").css({"background-color":"#F93F31"});
						alert("해당 상품을 찜하였습니다.");
					} else {
						//실패
						alert("오류가 발생했습니다.");
					}
				}
			})
			<% } else { %>
				alert("로그인이 필요한 서비스입니다.");
			<% } %>
		}
		
		function productdelete() {
			<%
			String jsqlprddelete = "select count(*) from tradehistory where tp_id = ? and th_isend = 0";
			PreparedStatement pstmtprddelete = con.prepareStatement(jsqlprddelete);
			pstmtprddelete.setInt(1,Integer.parseInt(tp_id));
			ResultSet rsprddelete = pstmtprddelete.executeQuery();
			rsprddelete.next();
			int prdprocess = rsprddelete.getInt(1);
			if (prdprocess == 0) { %>
				var confirmflag = confirm("게시물을 삭제하시겠습니까?");
				if(confirmflag) {
					location.href="productDelete.jsp?tp_id=<%=tp_id%>";
				} else { }
			<% } else { %>
				alert("거래 신청 승인이 대기 중이거나 거래가 진행중인 게시물을 삭제할 수 없습니다.");
				return;
			<%} %>
		}
		
		function productmodify() {
			<%
			String jsqlprdmodify = "select count(*) from tradehistory where tp_id = ? and th_isend = 0";
			PreparedStatement pstmtprdmodify = con.prepareStatement(jsqlprdmodify);
			pstmtprdmodify.setInt(1,Integer.parseInt(tp_id));
			ResultSet rsprdmodify = pstmtprdmodify.executeQuery();
			rsprdmodify.next();
			int prdprocess2 = rsprdmodify.getInt(1);
			if (prdprocess2 == 0) { %>
			location.href="sellmodify.jsp?tp_id=<%=tp_id%>";
			<% } else { %>
				alert("거래 신청 승인이 대기 중이거나 거래가 진행중인 게시물을 수정할 수 없습니다.");
				return;
			<%} %>
		}
		
		//----------------댓글입력 스크립트----------------
		function in_check() {
			if(document.input.in_content.value == "") {
				alert("내용을 입력하세요.");
				return;
			}
			
			document.input.submit();
		}
		</script>
	</head>

	<body>
	<%
		String jsql2 = "select m_introduce from member where m_id = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1,m_id);
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		String introduce = rs2.getString("m_introduce");
		
	%>
		<div id="wrap">
			<!--헤더-->
		<header id="header">
			<!--윗 네비게이션-->
			<div id="topNav">
				<ul>
					<li id="logo"><a href="index.jsp"><img
							src="images/logo.png"></a></li>
					<li>
						<form method="POST" action="searchProduct.jsp" id="searchForm">
							<input type="text" name="searchText" id="searchText" placeholder="검색어를 입력해 주세요.">
							<div id="searchButton">
								<a href="javascript:searchSubmit();"><img src="images/button/search.png"></a>
							</div>
						</form>
					</li>
					<li id="log_register_customer">
						<div id="loginBar">
							<%
								// 로그인 세션 받기
								String loginID = null;
								if (session.getAttribute("loginSession") != null) {
									loginID = (String) session.getAttribute("loginSession");
								}
								// 로그인이 안 됐을 경우 메뉴 표시
								if (loginID == null) {
							%>
							<a href="login.jsp">로그인</a>&nbsp;&nbsp;|&nbsp; <a
								href="register.jsp">회원가입</a>&nbsp;&nbsp;|&nbsp;
							<%
								}
								// 로그인이 됐을 경우 메뉴 표시
								else {
							%>
							<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;|&nbsp; <a
								href="mypage.jsp?m_id=<%=loginID%>">마이페이지</a>&nbsp;&nbsp;|&nbsp;
							<%
								}
							%>
							<a href="serviceCenter.jsp">고객센터</a>
						</div>
						<form name="momstalkform" action="/" method="post">
							<div id="profileBar">
								<%
									if (loginID != null) {
										String jsqlunreadmsg = "select count(mc_id) from msgcontent where mc_receiveid = ? and mc_read = 0";
										PreparedStatement pstmtunreadmsg = con.prepareStatement(jsqlunreadmsg);
										pstmtunreadmsg.setString(1, loginID);
										ResultSet rsunreadmsg = pstmtunreadmsg.executeQuery();
										int unreadmsgcnt = 0;
										if (rsunreadmsg.next()) {
											unreadmsgcnt = rsunreadmsg.getInt(1);
										}

										String jsqlunreadalarm = "select count(al_id) from alarmmsg where m_id = ? and al_read = 0";
										PreparedStatement pstmtunreadalarm = con.prepareStatement(jsqlunreadalarm);
										pstmtunreadalarm.setString(1, loginID);
										ResultSet rsunreadalarm = pstmtunreadalarm.executeQuery();
										int unreadalarmcnt = 0;
										if (rsunreadalarm.next()) {
											unreadalarmcnt = rsunreadalarm.getInt(1);
										}
								%>
								<div id="profileDiv">
									<p><%=loginID%>님
									</p>
								</div>
								<input type="hidden" name="userID" value="<%=loginID%>">
								<div id="messengerIcon">
									<a href="javascript:momstalkPopup(this.momstalkform);"> <%
 	if (unreadmsgcnt != 0) {
 %> <img src="images/icon/messenger2.png">
										<%
											} else {
										%> <img src="images/icon/messenger.png">
										<%
											}
										%>
										<p>&nbsp;맘스톡</p></a>
								</div>
								<div id="bellIcon">
									<a href="javascript:toggleScript()" id="talkToggle"> <%
 	if (unreadalarmcnt != 0) {
 %> <img src="images/icon/bell2.png"> <%
 	} else {
 %> <img src="images/icon/bell.png"> <%
 	}
 %>
										<p>알림</p></a>
								</div>
								<!-- 알림창 -->
								<div id="alertDiv">
									<%
										DecimalFormat df2 = new DecimalFormat("###,###");
											SimpleDateFormat dfdate2 = new SimpleDateFormat("yyyyMMddHHmmss");
											Calendar c2 = Calendar.getInstance();

											int yyyy2 = c2.get(Calendar.YEAR);
											int MM2 = c2.get(Calendar.MONTH);
											int dd2 = c2.get(Calendar.DATE);
											int hh2 = c2.get(Calendar.HOUR_OF_DAY);
											int mm2 = c2.get(Calendar.MINUTE);
											int ss2 = c2.get(Calendar.SECOND);
											c2.set(yyyy2, MM2, dd2, hh2, mm2, ss2);

											int alarmlistcnt = 0;
											String jsqlalarmlist = "select * from alarmmsg where m_id = ?";
											PreparedStatement pstmtalarmlist = con.prepareStatement(jsqlalarmlist);
											pstmtalarmlist.setString(1, loginID);
											ResultSet rsalarmlist = pstmtalarmlist.executeQuery();
											while (rsalarmlist.next()) {
												alarmlistcnt = 1;
												int al_id = rsalarmlist.getInt("al_id");
												String al_title = rsalarmlist.getString("al_title");
												String al_msg = rsalarmlist.getString("al_msg");
												String al_date = rsalarmlist.getString("al_date");

												// 날짜계산
												String resyy2 = al_date.substring(0, 4);
												String resMM2 = al_date.substring(5, 7);
												String resdd2 = al_date.substring(8, 10);
												String reshh2 = al_date.substring(11, 13);
												String resmm2 = al_date.substring(14, 16);
												String resss2 = al_date.substring(17, 19);
												String resdate2 = resyy2 + resMM2 + resdd2 + reshh2 + resmm2 + resss2;
												String today2 = dfdate2.format(c2.getTime());

												java.util.Date beginDate2 = null;
												java.util.Date endDate2 = null;

												long diff2 = 0;
												long diffYears2 = 0;
												long diffMonths2 = 0;
												long diffDays2 = 0;
												long diffTime2 = 0;
												long diffMinute2 = 0;
												long diffSecond2 = 0;

												beginDate2 = dfdate2.parse(resdate2);
												endDate2 = dfdate2.parse(today2);
												diff2 = (endDate2.getTime() - beginDate2.getTime()) / 1000;
												diffYears2 = diff2 / (365 * 24 * 60 * 60);
												diffMonths2 = diff2 / (31 * 24 * 60 * 60);
												diffDays2 = diff2 / (24 * 60 * 60);
												diffTime2 = diff2 / (60 * 60);
												diffMinute2 = diff2 / 60;
												diffSecond2 = diff2;
												String datecal2 = "";
												if (diffYears2 >= 1) {
													datecal2 = diffYears2 + "년 전";
												} else if (diffMonths2 >= 1) {
													datecal2 = diffMonths2 + "개월 전";
												} else if (diffDays2 >= 1) {
													datecal2 = diffDays2 + "일 전";
												} else if (diffTime2 >= 1) {
													datecal2 = diffTime2 + "시간 전";
												} else if (diffMinute2 >= 1) {
													datecal2 = diffMinute2 + "분 전";
												} else if (diffSecond2 >= 1) {
													datecal2 = diffSecond2 + "초 전";
												} else {
													datecal2 = "방금 전";
												}
									%>
									<div class="alertInfo"
										onclick="location.href='mypage_manage.jsp?m_id=<%=loginID%>&al_id=<%=al_id%>'"
										style="cursor: pointer;">
										<p style="display: inline; padding-left: 5px;">
											<font style="font-weight: bold; color: #3a8b5a;"><%=al_title%></font>
										</p>
										<p
											style="display: inline; float: right; padding-right: 5px; color: #999999; font-size: 12px;"><%=datecal2%></p>
										<br>
										<p style="padding-left: 5px; font-size: 12px;">
											<%=al_msg%>
										</p>
									</div>
									<%
										}
											if (alarmlistcnt == 0) {
									%>
									<div class="alertInfo">
										<p
											style="display: inline; padding-left: 80px; line-height: 40px;">
											<font style="color: #686868;">알람이 없습니다.</font>
										</p>
									</div>
									<%
										}
									%>

								</div>
								<!--------------->
								<%
									}
								%>
							</div>
						</form>
					</li>
				</ul>
			</div>


			<div id="topline"></div>

			<!--아래 네비게이션-->
			<div id="bottomNav">
				<ul id="mainmenu">
					<li id="mainlist1"><a href="#"> <img
							src="images/categorySymbol.PNG" id="category1">
							<p id="category2">MOM's 마켓</p> <img
							src="images/categorySymbol2.png" id="category3">
					</a>
						<ul id="submenu">
							<li><a href="category.jsp?ctg=all"><img
									src="images/icon/shopping-cart.png">
								<p>전체</p></a></li>
							<li><a href="category.jsp?ctg=clothes"><img
									src="images/icon/baby-clothing.png">
								<p>의류</p></a></li>
							<li><a href="category.jsp?ctg=shoes"><img
									src="images/icon/baby-shoes.png">
								<p>신발</p></a></li>
							<li><a href="category.jsp?ctg=book"><img
									src="images/icon/book.png">
								<p>도서</p></a></li>
							<li><a href="category.jsp?ctg=toy"><img
									src="images/icon/rubber-duck.png">
								<p>장난감/완구</p></a></li>
							<li><a href="category.jsp?ctg=etc"><img
									src="images/icon/menu.png">
								<p>기타</p></a></li>
						</ul></li>
					<li id="mainlist2"><a href="sub_donate.jsp">MOM's 나눔터</a></li>
					<li id="mainlist3"><a href="sub_column.jsp">MOM's 칼럼</a></li>
					<li id="mainlist4"><a href="sub_recipe.jsp">MOM's 레시피</a></li>
					<li id="mainlist5"><a href="sub_diary.jsp">MOM's 일기</a></li>
					<li id="mainlist6"><a href="sell.jsp"> 물건 판매하기 </a></li>
				</ul>
			</div>
			<div id="topline"></div>
		</header>
		
<header id="responsive">
			<div id="R_top">
				<div class="leftmenu">
					<label for="toggle1" onclick> <img
						src="images/button/headerleft.png">
					</label>

				</div>
				<div class="middle">
					<a href="index.jsp"><img src="images/logo.png"></a>
				</div>
				<div class="rightmenu"></div>
			</div>
			<input type="checkbox" id="toggle1" />

			<!-- 반응형 드롭다운 메뉴 -->
			<div id="R_dropdown">
				<div id="R_left">
					<a class="R_left_ctg ctgtop">MOM's 마켓</a> <a
						href="category.jsp?ctg=all" class="R_left_ctg"><img
						src="images/icon/shopping-cart.png">
					<p>전체</p></a> <a href="category.jsp?ctg=clothes" class="R_left_ctg"><img
						src="images/icon/clothes-hanger.png">
					<p>의류</p></a> <a href="category.jsp?ctg=shoes" class="R_left_ctg"><img
						src="images/icon/baby-shoes.png">
					<p>신발</p></a> <a href="category.jsp?ctg=book" class="R_left_ctg"><img
						src="images/icon/book.png">
					<p>도서</p></a> <a href="category.jsp?ctg=toy" class="R_left_ctg"><img
						src="images/icon/rubber-duck.png">
					<p>장난감/완구</p></a> <a href="category.jsp?ctg=etc"
						class="R_left_ctg_last"><img src="images/icon/menu.png">
					<p>기타</p></a>
				</div>
				<div id="R_right">
					<div class="R_right_block1">
						<%
						if (loginID == null) {
							%>
							
						<a href="login.jsp">로그인</a>
						<a href="register.jsp" id="block1middle">회원가입</a>
							<%
								}
								// 로그인이 됐을 경우 메뉴 표시
								else {
							%>
						<a href="logout.jsp">로그아웃</a>
						<a href="mypage.jsp?m_id=<%=loginID%>" id="block1middle">마이페이지</a>
							<%
								}
							%>
						
						<a href="serviceCenter.jsp">고객센터</a>
					</div>
					<div class="R_right_block2">
					<%
							String jsqlunreadmsg2 = "select count(mc_id) from msgcontent where mc_receiveid = ? and mc_read = 0";
										PreparedStatement pstmtunreadmsg2 = con.prepareStatement(jsqlunreadmsg2);
										pstmtunreadmsg2.setString(1, loginID);
										ResultSet rsunreadmsg2 = pstmtunreadmsg2.executeQuery();
										int unreadmsgcnt2 = 0;
										if (rsunreadmsg2.next()) {
											unreadmsgcnt2 = rsunreadmsg2.getInt(1);
										}

										String jsqlunreadalarm2 = "select count(al_id) from alarmmsg where m_id = ? and al_read = 0";
										PreparedStatement pstmtunreadalarm2 = con.prepareStatement(jsqlunreadalarm2);
										pstmtunreadalarm2.setString(1, loginID);
										ResultSet rsunreadalarm2 = pstmtunreadalarm2.executeQuery();
										int unreadalarmcnt2 = 0;
										if (rsunreadalarm2.next()) {
											unreadalarmcnt2 = rsunreadalarm2.getInt(1);
										}
							%>
						<%
						if (loginID != null) {
							%>
							
							<form method="POST" action="/" name="momstalkform2">
							<input type="hidden" name="userID" value="<%=loginID%>">
						<div class="block2button">
							<a href=""><%=loginID %>님</a>
						</div>
						<div class="block2button">
							<a href="javascript:momstalkPopup2(this.momstalkform2);"><% if (unreadmsgcnt2 != 0) {
 %> <img src="images/icon/messenger2.png"> <%
 	} else {
 %> <img src="images/icon/messenger.png"> <%
 	}
 %> 맘스톡
							</a>
						</div>
						<div class="block2button">
							<a href="javascript:toggleScript();">
							
							<% if (unreadalarmcnt2 != 0) {
 %> <img src="images/icon/bell2.png"> <%
 	} else {
 %> <img src="images/icon/bell.png"> <%
 	}
 %> 알림
							</a>
						</div>
						
							</form>
							
							<%
								}
						%>
							
					</div>
					
					<div class="R_right_block3">
						<a href="sell.jsp" class="R_right_sub_sell">물건 판매하기</a> <a href="sub_donate.jsp"
							class="R_right_sub">MOM's 나눔터</a> <a href="sub_column.jsp" class="R_right_sub">MOM's
							칼럼</a> <a href="sub_recipe.jsp" class="R_right_sub">MOM's 레시피</a> <a href="sub_diary.jsp"
							class="R_right_sub_last">MOM's 일기</a>
					</div>
				</div>
			</div>
			<div id="alertDiv2">
			<%
										DecimalFormat df3 = new DecimalFormat("###,###");
											SimpleDateFormat dfdate3 = new SimpleDateFormat("yyyyMMddHHmmss");
											Calendar c3 = Calendar.getInstance();

											int yyyy3 = c3.get(Calendar.YEAR);
											int MM3 = c3.get(Calendar.MONTH);
											int dd3 = c3.get(Calendar.DATE);
											int hh3 = c3.get(Calendar.HOUR_OF_DAY);
											int mm3 = c3.get(Calendar.MINUTE);
											int ss3 = c3.get(Calendar.SECOND);
											c3.set(yyyy3, MM3, dd3, hh3, mm3, ss3);

											int alarmlistcnt2 = 0;
											String jsqlalarmlist2 = "select * from alarmmsg where m_id = ?";
											PreparedStatement pstmtalarmlist2 = con.prepareStatement(jsqlalarmlist2);
											pstmtalarmlist2.setString(1, loginID);
											ResultSet rsalarmlist2 = pstmtalarmlist2.executeQuery();
											while (rsalarmlist2.next()) {
												alarmlistcnt2 = 1;
												int al_id2 = rsalarmlist2.getInt("al_id");
												String al_title2 = rsalarmlist2.getString("al_title");
												String al_msg2 = rsalarmlist2.getString("al_msg");
												String al_date2 = rsalarmlist2.getString("al_date");

												// 날짜계산
												String resyy3 = al_date2.substring(0, 4);
												String resMM3 = al_date2.substring(5, 7);
												String resdd3 = al_date2.substring(8, 10);
												String reshh3 = al_date2.substring(11, 13);
												String resmm3 = al_date2.substring(14, 16);
												String resss3 = al_date2.substring(17, 19);
												String resdate3 = resyy3 + resMM3 + resdd3 + reshh3 + resmm3 + resss3;
												String today3 = dfdate3.format(c3.getTime());

												java.util.Date beginDate3 = null;
												java.util.Date endDate3 = null;

												long diff3 = 0;
												long diffYears3 = 0;
												long diffMonths3 = 0;
												long diffDays3 = 0;
												long diffTime3 = 0;
												long diffMinute3 = 0;
												long diffSecond3 = 0;

												beginDate3 = dfdate3.parse(resdate3);
												endDate3 = dfdate3.parse(today3);
												diff3 = (endDate3.getTime() - beginDate3.getTime()) / 1000;
												diffYears3 = diff3 / (365 * 24 * 60 * 60);
												diffMonths3 = diff3 / (31 * 24 * 60 * 60);
												diffDays3 = diff3 / (24 * 60 * 60);
												diffTime3 = diff3 / (60 * 60);
												diffMinute3 = diff3 / 60;
												diffSecond3 = diff3;
												String datecal3 = "";
												if (diffYears3 >= 1) {
													datecal3 = diffYears3 + "년 전";
												} else if (diffMonths3 >= 1) {
													datecal3 = diffMonths3 + "개월 전";
												} else if (diffDays3 >= 1) {
													datecal3 = diffDays3 + "일 전";
												} else if (diffTime3 >= 1) {
													datecal3 = diffTime3 + "시간 전";
												} else if (diffMinute3 >= 1) {
													datecal3 = diffMinute3 + "분 전";
												} else if (diffSecond3 >= 1) {
													datecal3 = diffSecond3 + "초 전";
												} else {
													datecal3 = "방금 전";
												}
												
												
												%>
												<div class="alertInfo2" onclick="location.href='mypage_manage.jsp?m_id=<%=loginID%>&al_id=<%=al_id2%>'"
													style="cursor: pointer;">
													<p style="display: inline; padding-left: 5px;">
														<font style="font-weight: bold; color: #3a8b5a;"><%=al_title2%></font>
													</p>
													<p
														style="display: inline; float: right; padding-right: 5px; color: #999999; font-size: 12px;"><%=datecal3%></p>
													<br>
													<p style="padding-left: 5px; font-size: 12px;">
														<%=al_msg2%>
													</p>
												</div>
												<%
													}
														if (alarmlistcnt2 == 0) {
												%>
												<div class="alertInfo2">
													<p
														style="display: inline; padding-left: 80px; line-height: 40px;">
														<font style="color: #686868;">알람이 없습니다.</font>
													</p>
												</div>
												<%
													}
												%>

											</div>
				
		</header>						
			<!-- 사이트 경로 -->
			<div id="webnav">
				<p>메인 > 상품정보</p>
			</div>

			<!------------------상세보기 영역----------------->
			<section id="line1">
				<div id="productImg">
					<ul class="slider">
						<% if (img.equals("images/noimage.png")) { %>
						<li><a href="#"><img src="<%=img%>"></a></li>
						<% } else { if (img1!=null) { %>
						<li><a href="#"><img src="upload/<%=img1%>"></a></li>
						<% } if (img2!=null) { %>
						<li><a href="#"><img src="upload/<%=img2%>"></a></li>
						<% } if (img3!=null) { %>
						<li><a href="#"><img src="upload/<%=img3%>"></a></li>
						<% } if (img4!=null) { %>
						<li><a href="#"><img src="upload/<%=img4%>"></a></li>
						<% }} %>
					</ul>
				</div>

				<div id="productInfo">
					<h1><%=title %></h1>
					<h2><%=price %>원</h2>
					<table>
						<tr>
							<td class="col1">판매일</td>
							<td class="col2"><%=date %></td>
						</tr>
						<tr>
							<td class="col1">상품상태</td>
							<td class="col2"><%=condition %></td> <!--새상품/거의새것/중고-->
						</tr>
						<tr>
							<td class="col1">거래방법</td>
							<td class="col2"><%=dealing %></td> <!--택배거래/직거래/직거래, 택배거래-->
						</tr>
						<tr>
							<td class="col1">배송비</td>
							<td class="col2"><%=deliveryfee %></td> <!--또는 착불-->
						</tr>
					</table>
					<div id="buttons">
					<%
					
					// 여기 
					
					if (loginID==null) { %>
						<a href="javascript:dibschange();"><div id="dibsButton">찜하기♥</div></a>
						<a href="javascript:paymentlink();"><div id="dealButton">거래하기</div></a>
					<% } else if (loginID.equals(m_id)){ %>
						<a href="javascript:productmodify();"><div id="modifyButton">수정하기</div></a>
						<a href="javascript:productdelete();"><div id="deleteButton">삭제하기</div></a>
					<% } else { %>
						<a href="javascript:dibschange();"><div id="dibsButton">찜하기♥</div></a>
						<a href="javascript:paymentlink();"><div id="dealButton">거래하기</div></a>
					<% } %>
					</div>
				</div>
			</section>

			<section id="line2">
				<h1>판매자의 다른 상품</h1>
				<div id="otherProduct">
				<%
				
				String jsqlothercnt = "select count(*) from tradepost where m_id = ? and tp_id != ?";
				PreparedStatement pstmtothercnt = con.prepareStatement(jsqlothercnt);
				pstmtothercnt.setString(1,m_id);
				pstmtothercnt.setString(2,tp_id);
				ResultSet rsothercnt = pstmtothercnt.executeQuery();
				rsothercnt.next();
				int othercnt = rsothercnt.getInt(1);
				rsothercnt.close();
				
				String jsqlother = "select * from tradepost where m_id = ? and tp_id != ? order by tp_id desc";
				PreparedStatement pstmtother = con.prepareStatement(jsqlother);
				pstmtother.setString(1,m_id);
				pstmtother.setString(2,tp_id);
				ResultSet rsother = pstmtother.executeQuery();
				
				String imgsrc = "";
				String otherpost = "";
				int otherid;
				
				if(othercnt > 0) {
				rsother.next();
					for(int i = 0 ; i < 5 ; i++) {
		           	       imgsrc = rsother.getString("tp_goodsimg");
		          	       otherpost = rsother.getString("tp_title");
		          	       otherid = rsother.getInt("tp_id");
		           		       %>
								<div class="otherCard">
									<a href="productDetail.jsp?tp_id=<%=otherid%>">
									<img src="<%=imgsrc%>">
									<h2><%=otherpost %></h2>
									</a>
								</div>
								<%
						if (!rsother.next()) { break; }
					}
				}
				%>
				</div>
			</section>

			<section id="line3">
				<div id="detailInfo">
					<h1>상품 정보</h1>
					<p>
					<%=content %>
					</p>
				</div>
				<div id="sellerInfo"> <!--마이페이지 프로필이 만들어지면 추가/수정 예정-->
               <h1>판매자 정보</h1>
               <div class="sellerInfo2">
                  <div class="sellerInfoText">
                     <a href="mypage.jsp?m_id=<%=m_id%>"><%=nickname %>(<%=m_id %>)</a>
                     <p>인삿말 <br><%=introduce %></p>               
                  </div>
               	  <a href="javascript:momstalkProdPopup();" class="sellerTalk">맘스톡 <img src="images/icon/messenger_white.png"></a>
               	 
               </div>
            </div>
			</section>
			
			
			<% 

			String pagingGroup = request.getParameter("paging");
			int paging;
			if (pagingGroup != null) { paging = Integer.parseInt(pagingGroup); }
			else { paging = 0; }
			
			String jsql3 = "select count(*) from tradecomment where tp_id = ?";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, tp_id);
			ResultSet rs3 = pstmt3.executeQuery();
			rs3.next();
			int cnt = rs3.getInt(1);
			
			int cntList = cnt/10;
			int remainder = cnt%10;
			int cntListAll;
			
			if (cntList != 0) {
				if (remainder == 0) { cntListAll = cntList; }
				else { cntListAll = cntList+1; }
			} else { cntListAll = cntList + 1; }
			
			%>
			<section id="comment">
				<h1>댓글 <%=cnt%></h1> <!--n=댓글 수-->
				<%

				// 로그인 세션 받기
				String tc_loginID = null;
				if(session.getAttribute("loginSession")!=null){
					tc_loginID = (String)session.getAttribute("loginSession");
				}
				
				// 로그인이 됐을 경우 댓글입력 표시
				if(tc_loginID!=null){
					String jsqlnick = "select m_nickname from member where m_id = ?";
					PreparedStatement pstmtnick = con.prepareStatement(jsqlnick);
					pstmtnick.setString(1, tc_loginID);
					ResultSet rsnick = pstmtnick.executeQuery();
					rsnick.next();
					String tc_m_nickname = rsnick.getString("m_nickname");
					%>
				<form method="post" name="input" action="tradecommentOK.jsp">
				<input type="hidden" value="<%=tc_loginID%>" name="m_id">
				<input type="hidden" value="<%=tp_id%>" name="tp_id">
				<input type="hidden" value="<%=tc_m_nickname%>" name="tc_nickname">
				<div id="commentInput">
					<textarea placeholder="댓글을 입력해주세요." name="in_content"></textarea>
					<a href="javascript:in_check()"><div id="commentButton">입력하기</div></a>
				</div>
				</form>
				<%
				}
				%> 
				
				<div id="commentGroup">
				<%
				String jsql4 = "select * from tradecomment where tp_id = ? order by tc_id, tc_no";
				PreparedStatement pstmt4 = con.prepareStatement(jsql4);
				pstmt4.setString(1, tp_id);
				ResultSet rs4 = pstmt4.executeQuery();
				if(!rs4.wasNull()) {
					for (int i=0 ; i<paging*10; i++) { rs4.next(); }
					int cursor = 0;
					while (rs4.next()) {
						int tc_id = rs4.getInt("tc_id");
						int tc_no = rs4.getInt("tc_no");
						String tc_m_id = rs4.getString("m_id");
						String tc_nickname = rs4.getString("tc_nickname");
						String tc_content = rs4.getString("tc_content");
						String tc_date = rs4.getString("tc_date");
						int tc_masterid = rs4.getInt("tc_masterid");
						int tc_replyno = rs4.getInt("tc_replyno");
						int tc_step = rs4.getInt("tc_step");
						
						%>
						
						<!--댓글1  -->
						<div class="commentInfo">
						<% 
						// 답글일 경우
						if(tc_step > 0) {
							%> <img src="images/reply.png">
							<h1><%=tc_nickname %>(<%=tc_m_id %>)</h1>
							<h2><%=tc_date %></h2>
							</div>
							<p class="tradecommentReply"><%=tc_content %></p>
							<% 
						 } else {
						 // 답글이 아닐 경우
						 %>
						 	<h1><%=tc_nickname %>(<%=tc_m_id %>)</h1>
							<h2><%=tc_date %></h2>
							</div>
							<p><%=tc_content %></p>
						 <%
						 }
						cursor++;
						if (cursor >= 10) { break; }
					}
				}
				%>
				</div>
			</section>
		</div>
			<!--푸터영역-->
			<footer>
				<div id="footerimg">
					<img src="images/logo.png" id="footerLogo">
					<img src="images/sns.png" id="footerSNS">
				</div>
				<div id="footerInfo">
					<p>
						(주)맘스홀릭 대표이사: 이마마 | 주소: 서울특별시 강남구 강남	대로 234길 맘스타워 8층<br>
						사업자등록번호 : 100-01-54123     통신판매업신고번호 : 제2021-서울강남-0520호 사업자정보확인<br>
						맘스홀릭 고객센터 문의 : 02-550-9988(평일 10시~16시) | 팩스 : 02-560-5050<br>
						호스팅서비스 제공자: MOMS Web Services (MWS)<br><br><br>
					</p>
					<p>
						(주)맘스홀릭은 통신판매중개자로서 거래당사자가 아니며,  맘스홀릭 판매자가 등록한 상품정보 및 거래에 대해 (주)맘스홀릭은 책임이 없습니다.<br>
						(주)맘스홀릭. All rights reserved.
					</p>
				</div>
			</footer>
		</div>
		<script>
		var windowopener2 = null;
		function momstalkProdPopup(momstalkform2){
			var loginID = "<%=loginID%>";
			if (loginID == "null") {
				alert("로그인 후 이용하실 수 있는 서비스입니다.");
				return;
			}
			var frm = momstalkform2;
			var popurl = 'momstalk.jsp?userID=<%=loginID%>&toID=<%=m_id%>&tp_id=<%=tp_id%>';
			var popoption = 'width=500, height=830, resizable=no, scrollbars=no, status=no';
			var userID1 = "<%=loginID%>";
			var userID2 = "<%=m_id%>";
			if (userID1 == userID2) {
				alert("자기 자신에게 메세지를 보낼 수 없습니다.");
				return;
			}
			if (windowopener2 == null) {
				windowopener2 = window.open(popurl,'momstalk',popoption);
			} else if (windowopener2.closed){
				windowopener2 = window.open(popurl,'momstalk',popoption);
			}
			windowopener2.focus();
		}
		</script>
	</body>
</html>

