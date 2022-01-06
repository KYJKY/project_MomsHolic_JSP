<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>MOM's Holic</title>
		<link href="css/sub_recipe.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="css/jquery.bxslider.min.css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script>
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
		</script>
		<%
		// DB접속
				String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
				String DB_ID = "multi";
				String DB_PASSWORD = "abcd";
				Class.forName("org.gjt.mm.mysql.Driver"); 
		 		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
				request.setCharacterEncoding("UTF-8");
				
				String ctgType = request.getParameter("ctg");
				String pagingTemp = request.getParameter("paging");
				int paging;
				
		if (pagingTemp != null)
			paging = Integer.parseInt(pagingTemp);
		else
			paging = 0;
		
		if(ctgType == null) {
			ctgType= "initial";
		}
		
		String ctgnow [] = new String [6];
		String ctg_name = "";
		String ctg_name2 = "";
		if (ctgType.equals("initial")) {
			ctg_name = "초기 이유식";
			ctg_name2 = "생후 4~6개월";
			ctgnow[0] = "id='nowpage'";
			ctgnow[1] = "class='otherpage'";
			ctgnow[2] = "class='otherpage'";
			ctgnow[3] = "class='otherpage'";
			ctgnow[4] = "class='otherpage'";
			ctgnow[5] = "class='otherpage'";
		}
		else if (ctgType.equals("mid")) {
			ctg_name = "중기 이유식";
			ctg_name2 = "생후 6~8개월";
			ctgnow[0] = "class='otherpage'";
			ctgnow[1] = "id='nowpage'";
			ctgnow[2] = "class='otherpage'";
			ctgnow[3] = "class='otherpage'";
			ctgnow[4] = "class='otherpage'";
			ctgnow[5] = "class='otherpage'";
		}
		else if (ctgType.equals("late")) { 
			ctg_name = "후기 이유식"; 
			ctg_name2 = "생후 8~10개월";
			ctgnow[0] = "class='otherpage'";
			ctgnow[1] = "class='otherpage'";
			ctgnow[2] = "id='nowpage'";
			ctgnow[3] = "class='otherpage'";
			ctgnow[4] = "class='otherpage'";
			ctgnow[5] = "class='otherpage'";
		}
		else if (ctgType.equals("finish")) { 
			ctg_name = "완료기 이유식"; 
			ctgnow[0] = "class='otherpage'";
			ctgnow[1] = "class='otherpage'";
			ctgnow[2] = "class='otherpage'";
			ctgnow[3] = "id='nowpage'";
			ctgnow[4] = "class='otherpage'";
			ctgnow[5] = "class='otherpage'";
		}
		else if (ctgType.equals("infant")) { 
			ctg_name = "유아식"; 
			ctgnow[0] = "class='otherpage'";
			ctgnow[1] = "class='otherpage'";
			ctgnow[2] = "class='otherpage'";
			ctgnow[3] = "class='otherpage'";
			ctgnow[4] = "id='nowpage'";
			ctgnow[5] = "class='otherpage'";
		}
		else if (ctgType.equals("snack")) { 
			ctg_name = "아이간식";
			ctgnow[0] = "class='otherpage'";
			ctgnow[1] = "class='otherpage'";
			ctgnow[2] = "class='otherpage'";
			ctgnow[3] = "class='otherpage'";
			ctgnow[4] = "class='otherpage'";
			ctgnow[5] = "id='nowpage'";
		}
		else { 
			ctg_name = "초기 이유식";
			ctgnow[0] = "id='nowpage'";
			ctgnow[1] = "class='otherpage'";
			ctgnow[2] = "class='otherpage'";
			ctgnow[3] = "class='otherpage'";
			ctgnow[4] = "class='otherpage'";
			ctgnow[5] = "class='otherpage'";
		}
		%>
	</head>

	<body>
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
		
		<!-- 반응형 헤더 -->
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
		
            <!--서브 키이미지, 사이트 경로-->
            <div id="subKeyimage">
				<img src="images/subpage/recipe/recipe_subimage.jpg">
                <h1>MOM's 레시피</h1>
                <h2>우리 아이를 위한 균형잡힌 레시피</h2>
                <h3>메인 > MOM's 레시피 > <%=ctg_name %></h3>
            </div>

            <!-- 기부/응모 전환탭 -->
            <div id="manuTab">
				<ul>
					<li <%=ctgnow[0] %>><a href="sub_recipe.jsp?ctg=initial">초기 이유식</a></li>
					<li <%=ctgnow[1] %>><a href="sub_recipe.jsp?ctg=mid">중기 이유식</a></li>
					<li <%=ctgnow[2] %>><a href="sub_recipe.jsp?ctg=late">후기 이유식</a></li>
					<li <%=ctgnow[3] %>><a href="sub_recipe.jsp?ctg=finish">완료기 이유식</a></li>
					<li <%=ctgnow[4] %>><a href="sub_recipe.jsp?ctg=infant">유아식</a></li>
					<li <%=ctgnow[5] %>><a href="sub_recipe.jsp?ctg=snack">아이간식</a></li>
				</ul>
            </div>

            <section>
				<div id="topList">
					<h1 class="title"><%=ctg_name %> <span id="month"><%=ctg_name2 %></span></h1>
				</div>

				<!-- 레시피 그룹 -->
				<div id="recipeGroup">
				<%
				String jsqlCount = "select count(*) from recipe where re_ctg = ?";
				PreparedStatement pstmtCount = con.prepareStatement(jsqlCount);
				pstmtCount.setString(1,ctgType);
				ResultSet rsCount = pstmtCount.executeQuery();
				
				rsCount.next();
				int cnt = rsCount.getInt(1);
				
				int cntList = cnt/8; // 페이지 수 계산
				int remainder = cnt%8; // 나머지
				int cntListAll; // 총페이지 수
				int startpage = 0;
				int maxpage = 0;
				int endpage = 0;
				int prevpage = 0;
				int nextpage = 0;
				if(cntList != 0) {
					if (remainder == 0) { cntListAll = cntList; }
					else { cntListAll = cntList + 1; }
				}
				else {
					cntListAll = cntList + 1;
				}
				
				startpage = 1;
				maxpage = cntListAll;
				endpage = startpage + maxpage -1;
				prevpage = paging-1;
				nextpage = paging+1;
				if (paging == 0) { 
					prevpage = 0;
					if (endpage == 1) {
						nextpage = 0;
					}
					if (prevpage == -1) {
						prevpage = 0;
					}
				}
				else if (paging == endpage-1) {
					nextpage = endpage-1;
					if (endpage == 1) {
						nextpage = 0;
					}
					if (prevpage == -1) {
						prevpage = 0;
					}
				}
				rsCount.close();

				DecimalFormat df = new DecimalFormat("###,###");
				
				String jsql = "select * from recipe where re_ctg = ? order by re_id desc";
				PreparedStatement pstmt = con.prepareStatement(jsql);
				pstmt.setString(1,ctgType);
				ResultSet rs = pstmt.executeQuery();
				
				
				
				if(!rs.wasNull()) {
					for(int i = 0; i < paging * 8; i++) { rs.next(); }
					int cursor = 0;
					while(rs.next()) {
						String re_id = rs.getString("re_id");
						String re_titleTemp = rs.getString("re_title");
						String re_title = "";
						String re_img = rs.getString("re_img");
						String re_meterial = rs.getString("re_meterial");
						String re_contentTemp = rs.getString("re_content");
						String re_content = "";
						if (re_titleTemp.length() <= 20) {
							re_title = re_titleTemp;
						} else if (re_titleTemp.length() > 20) {
							re_title = re_titleTemp.substring(0, 20);
							re_title += "...";
						}
						if (re_contentTemp.length() <= 50) {
							re_content = re_contentTemp;
						} else if (re_contentTemp.length() > 20) {
							re_content = re_contentTemp.substring(0, 20);
							re_content += "...";
						}
						
						
				%>
				<!-- 레시피1 -->
					<div class="recipeCard" style="cursor:pointer;" onclick="location.href='sub_recipe_detail.jsp?re_id=<%=re_id%>'">
						<a href="#"><img src="<%=re_img%>"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle"><%=re_title %></h1></a>
							<a href="#"><p class="preview"><%=re_content %></p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] <%=re_meterial %></div>
							</div>
						</div>
					</div>
				<%
					cursor ++;
					if (cursor >= 8) { break; }
					}
				}
			
			%>
					
					
			
			</section>

			<!-----------------페이징 영역----------------->
			<div id="paging">
				<ol class="paging">
					<li class="first"><a href="sub_recipe.jsp?ctg=<%=ctgType%>&paging=0">첫페이지</a></li>
					<li class="prev"><a href="sub_recipe.jsp?ctg=<%=ctgType%>&paging=<%=prevpage%>">이전페이지</a></li>
					<% 
					for (int j=startpage ; j<= endpage ; j++) {
						if (j == paging + 1) {
							%>
								<li class="on"><a style="font-weight:bold;text-decoration:none;color:gray"><%=j %></a></li>
							<%
						} else {
							%>
							<li class="on"><a href="sub_recipe.jsp?ctg=<%=ctgType%>&paging=<%=j - 1%>"><%=j %></a></li>
							<%
						}
					}
					%>
					<li class="next"><a href="sub_recipe.jsp?ctg=<%=ctgType%>&paging=<%=nextpage%>">다음페이지</a></li>
					<li class="last"><a href="sub_recipe.jsp?ctg=<%=ctgType%>&paging=<%=endpage-1%>">마지막페이지</a></li>
				</ol>
				<a href="sub_recipe_write.jsp" id="writeButton">레시피 작성하기</a>
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
	</body>
</html>
