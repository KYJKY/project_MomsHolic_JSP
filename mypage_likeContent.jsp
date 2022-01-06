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
		<link href="css/mypage_sell.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
			var popoption = 'width=500, height=860, resizable=no, scrollbars=no, status=no';
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
    </head>

	<body>
	<%	 
		// DB접속
		String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
		String DB_ID = "multi";
		String DB_PASSWORD = "abcd";
		Class.forName("org.gjt.mm.mysql.Driver"); 
 		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
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
            <!--마이페이지-->
            <section>
                <!--반응형 웹 구현을 위한 왼쪽 블럭(경로, 프로필, 메뉴)  -->
                <div id="webnav">메인 > 마이페이지 > 좋아하는컨텐츠</div>
                <div id="leftSide">
                    
                    <!-- 프로필 -->
                    <%
                    String m_id = request.getParameter("m_id");
            		String pagingTemp = request.getParameter("paging");
            		String orderby = request.getParameter("orderby");
            		
            		String[] orderbySelected = new String[3];
            		if (orderby == null) { orderby = "column"; }
            		if (orderby.equals("recipe")) { orderbySelected[1] = "selected"; }
            		else if (orderby.equals("diary")) { orderbySelected[2] = "selected"; }
            		else { orderbySelected[0] = "selected"; }
            		
            		int paging;
                    
                    if (pagingTemp != null)
            			paging = Integer.parseInt(pagingTemp);
            		else
            			paging = 0;
                    
                    String jsql1 = "select * from member where m_id = ?";
            		PreparedStatement pstmt1 = con.prepareStatement(jsql1);
            		pstmt1.setString(1,m_id);
            		ResultSet rs1 = pstmt1.executeQuery();
            		rs1.next();
            		String nickname = rs1.getString("m_nickname");
            		String introduce = rs1.getString("m_introduce");
            		
            		String jsqlcnt = "select count(*) from wish where m_id = ?";
					PreparedStatement pstmtcnt = con.prepareStatement(jsqlcnt);
					pstmtcnt.setString(1, m_id);
					ResultSet rscnt = pstmtcnt.executeQuery();
					rscnt.next();
					int cnt = rscnt.getInt(1);
                    %>
                    <div id="profile">
                        <!-- 닉네임 -->
                        <h1><%=nickname %> (<%=m_id %>)</h1>
                        <!-- 인삿말 -->
                        <p><%=introduce %></p>
                        <!-- 등록상품 수 -->
                        <div id="uploadProduct">
                            <h1>등록상품</h1>
                            <h2><%=cnt %>개</h2>
                        </div>
                    </div>
                    <!-- 마이페이지 메뉴 -->
                    
                    <%
                    if (m_id.equals(loginID)) {
                    %>
                    <div id="mypageMenu">
                        <ul>
                            <li id="Munu1" onClick="location.href='mypage.jsp?m_id=<%=m_id%>'" style="cursor:pointer;font-size:16px;"><a href="#a">판매상품</a></li>
                            <li id="Munu2" onClick="location.href='mypage_manage.jsp?m_id=<%=m_id%>'" style="cursor:pointer;font-size:16px;"><a href="#a">거래관리</a></li>
                            <li id="Munu3" onClick="location.href='mypage_likeProduct.jsp?m_id=<%=m_id%>'" style="cursor:pointer;font-size:16px;"><a href="#a">찜한상품</a></li>
                            <li id="Munu4" class="nowPage" onClick="location.href='mypage_likeContent.jsp?m_id=<%=m_id%>'" style="cursor:pointer;font-size:16px;"><a href="#">좋아하는컨텐츠</a></li>
                            <li id="Munu5" onClick="location.href='mypage_modify.jsp'" style="cursor:pointer;font-size:16px;"><a href="mypage_modify.jsp">프로필수정</a></li>
                        </ul>
                    </div>
					<% } else { %>
                    <div id="mypageMenu">
                        <ul>
                            <li id="Munu1" onClick="location.href='mypage.jsp?m_id=<%=m_id%>'" style="cursor:pointer;font-size:16px;"><a href="#">판매상품</a></li>
                            <li id="Munu3" onClick="location.href='mypage_likeProduct.jsp?m_id=<%=m_id%>'" style="cursor:pointer;font-size:16px;"><a href="#a">찜한상품</a></li>
                            <li id="Munu4" class="nowPage" onClick="location.href='mypage_likeContent.jsp?m_id=<%=m_id%>'" style="cursor:pointer;font-size:16px;"><a href="#">좋아하는컨텐츠</a></li>
                        </ul>
                    </div>
                    <% } %>
                </div>

                <!-- 반응형 웹 구현을 위한 오른쪽 블럭(판매상품) -->
                <div id="rightSide">
                    <!-- 제목과 상품정렬 -->
                    <div id="topbar">
                        <!-- 제목 -->
                        <%
                        if(orderby.equals("recipe")) {
                       	%><div id="title"><%=nickname%>님의 좋아하는 레시피</div>
                       	<%
                        } else if (orderby.equals("diary")) {
                        %><div id="title"><%=nickname%>님의 육아일기</div>
                        <%
                        } else {
                        %><div id="title"><%=nickname%>님의 좋아하는 컬럼</div>
                        <%
                        }
                        %>
                        
                        <!-- 상품정렬 -->
                        <div id="productOrder">
                        	<form action="#" name="orderForm">
                            <select name="orderSelect" onchange="order()">
								<option value="column" <%=orderbySelected[0]%>>컬럼</option>
								<option value="recipe" <%=orderbySelected[1]%>>레시피</option>
								<option value="diary" <%=orderbySelected[2]%>>일기</option>
							</select>
							</form>
                        </div>
                    </div>

                    <!-- 판매상품 상품카드 -->
                    <div id="productGroup">
                    <%
					int cntTemp = cnt;
					
					int cntList = cnt/9;
					int remainder = cnt%9;
					int cntListAll;
					
					int startpage = 0;
					int maxpage = 0;
					int endpage = 0;
					int prevpage = 0;
					int nextpage = 0;
					
					if(cntList != 0) {
						if (remainder == 0) { cntListAll = cntList; }
						else { cntListAll = cntList + 1; }
					} else {
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
					if (orderby.equals("recipe")) { 
						String jsqlcontent = "select * from recipe where re_id in (select re_id from likerecipe where m_id = ?) order by re_id desc";
						
						PreparedStatement pstmtcontent = con.prepareStatement(jsqlcontent);
						pstmtcontent.setString(1,m_id);
						ResultSet rscontent = pstmtcontent.executeQuery();
						
						if(!rscontent.wasNull()) {
							for(int i = 0; i < paging * 9; i++) { rscontent.next(); }
							int cursor = 0;
							while(rscontent.next()) {
								String co_id = rscontent.getString("re_id");
								String co_titleTemp = rscontent.getString("re_title");
								String co_title = "";
								String co_img = rscontent.getString("re_img");
								if (co_titleTemp.length() <= 10) {
									co_title = co_titleTemp;
								} else if (co_titleTemp.length() > 10) {
									co_title = co_titleTemp.substring(0, 10);
									co_title += "...";
								}
								
						%>
						 <!-- 컨텐츠1 -->
	                        <div class="contentCard" style="cursor:pointer;" onclick="sub_recipe_detail.jsp?re_id=<%=co_id%>">
	                            <div class="imgmom">
	                                <a href="#">
	                                    <img src="<%=co_img%>">
	                                </a>
	                            </div>
	                            <div class="contentInfo">
	                                <a href="#"><%=co_title %> </a>
	                            </div>
	                        </div>
						<%
							cursor ++;
							if (cursor >= 9) { break; }
							}
						}
					} else if (orderby.equals("diary")) {
						String jsqlcontent = "select * from diary where m_id=? order by di_id desc";
						
						PreparedStatement pstmtcontent = con.prepareStatement(jsqlcontent);
						pstmtcontent.setString(1,m_id);
						ResultSet rscontent = pstmtcontent.executeQuery();
						
						if(!rscontent.wasNull()) {
							for(int i = 0; i < paging * 9; i++) { rscontent.next(); }
							int cursor = 0;
							while(rscontent.next()) {
								String di_id = rscontent.getString("di_id");
								String di_titleTemp = rscontent.getString("di_title");
								String di_title = "";
								String di_img = rscontent.getString("di_img");
								if (di_titleTemp.length() <= 10) {
									di_title = di_titleTemp;
								} else if (di_titleTemp.length() > 10) {
									di_title = di_titleTemp.substring(0, 10);
									di_title += "...";
								}
								%>
								 <!-- 컨텐츠1 -->
			                        <div class="contentCard" style="cursor:pointer;" onclick="sub_diary_detail.jsp?co_id=<%=di_id%>">
			                            <div class="imgmom">
			                                <a href="#">
			                                    <img src="<%=di_img%>">
			                                </a>
			                            </div>
			                            <div class="contentInfo">
			                                <a href="#"><%=di_title %> </a>
			                            </div>
			                        </div>
								<%
									cursor ++;
									if (cursor >= 9) { break; }
									}
								}
						
					} else {
						String jsqlcontent = "select * from columntbl where co_id in (select co_id from likecolumn where m_id = ?) order by co_id desc";
						
						PreparedStatement pstmtcontent = con.prepareStatement(jsqlcontent);
						pstmtcontent.setString(1,m_id);
						ResultSet rscontent = pstmtcontent.executeQuery();
						
						if(!rscontent.wasNull()) {
							for(int i = 0; i < paging * 9; i++) { rscontent.next(); }
							int cursor = 0;
							while(rscontent.next()) {
								String co_id = rscontent.getString("co_id");
								String co_titleTemp = rscontent.getString("co_title");
								String co_title = "";
								String co_img = rscontent.getString("co_img");
								if (co_titleTemp.length() <= 10) {
									co_title = co_titleTemp;
								} else if (co_titleTemp.length() > 10) {
									co_title = co_titleTemp.substring(0, 10);
									co_title += "...";
								}
								
						%>
						 <!-- 컨텐츠1 -->
	                        <div class="contentCard" style="cursor:pointer;" onclick="sub_column_detail.jsp?co_id=<%=co_id%>">
	                            <div class="imgmom">
	                                <a href="#">
	                                    <img src="<%=co_img%>">
	                                </a>
	                            </div>
	                            <div class="contentInfo">
	                                <a href="#"><%=co_title %> </a>
	                            </div>
	                        </div>
						<%
							cursor ++;
							if (cursor >= 9) { break; }
							}
						}
					}
					
                    %>
                        
                    </div>

                    <!-- 페이징 영역 -->
                    <div id="paging">
						<ol class="paging">
							<li class="first"><a href="mypage_likeProduct.jsp?m_id=<%=m_id%>&paging=0">첫페이지</a></li>
							<li class="prev"><a href="mypage_likeProduct.jsp?m_id=<%=m_id%>&paging=<%=prevpage%>">이전페이지</a></li>
							<% 
							for (int j=startpage ; j<= endpage ; j++) {
								if (j == paging + 1) {
									%>
									<li class="on"><a style="font-weight:bold;text-decoration:none;color:gray"><%=j %></a></li>
									<%
								} else {
									%>
									<li class="on"><a href="mypage_likeProduct.jsp?m_id=<%=m_id%>&paging=<%=j - 1%>"><%=j %></a></li>
									<%
								}
							}
							%>
							<li class="next"><a href="mypage_likeProduct.jsp?m_id=<%=m_id%>&paging=<%=nextpage%>">다음페이지</a></li>
							<li class="last"><a href="mypage_likeProduct.jsp?m_id=<%=m_id%>&paging=<%=endpage-1%>">마지막페이지</a></li>
						</ol>
					</div>
			
                    
                </div>
                

            </section>
			
			
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
			function order(){//정렬 순서에 따라 링크 이동
				var order=document.orderForm.orderSelect.options[orderForm.orderSelect.selectedIndex].value;
				var orderlink;
				if(order=="column")
					orderlink="mypage_likeContent.jsp?m_id=<%=m_id%>&orderby=column"; 
				if(order=="recipe")
					orderlink="mypage_likeContent.jsp?m_id=<%=m_id%>&orderby=recipe";	
				if(order=="diary")
					orderlink="mypage_likeContent.jsp?m_id=<%=m_id%>&orderby=diary";	
				window.location.href=orderlink;
			}
		</script>
	</body>
</html>