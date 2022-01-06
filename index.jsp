<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>MOM's Holic</title>
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/jquery.bxslider.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
<script> //박스 슬라이더 
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
			});

			//팝업 
			$(document).ready(function(){
				$(".open").on('click',function(){
					$(".popup").show();
					$(".dim").show();
				});
				$(".popup .close").on('click',function(){
					$(this).parent().hide();
					$(".dim").hide();
				});
			});

			
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

		/* 회원가입 성공 시 알림 메세지 설정 및 출력 */
		String messageContent = null;
		if (session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		if (messageContent != null) {
	%>
	<script>
			alert("<%=messageContent%>");
		</script>
	<%
		session.removeAttribute("messageContent");
		}
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
		
				
		
					
		<!--박스 슬라이드-->
		<section id="boxslider">
			<ul class="slider">
				<li><a href="#"><img src="images/keyimage1.jpg"></a></li>
				<li><a href="#"><img src="images/keyimage2.jpg"></a></li>
			</ul>
		</section>

		<!--컨텐츠1(많은 엄마들이 보고있는 물품)-->
		<section id="content1" class="content">
			<div class="content_title">
				<p>많은 엄마들이 보고 있는 물품이에요!</p>
				<a href="category.jsp?ctg=all&orderby=hits" class="content_more">더보기</a>
			</div>
			<div class="content_item">
				<%
					DecimalFormat df = new DecimalFormat("###,###");
					SimpleDateFormat dfdate = new SimpleDateFormat("yyyyMMddHHmmss");
					Calendar c = Calendar.getInstance();

					int yyyy = c.get(Calendar.YEAR);
					int MM = c.get(Calendar.MONTH);
					int dd = c.get(Calendar.DATE);
					int hh = c.get(Calendar.HOUR_OF_DAY);
					int mm = c.get(Calendar.MINUTE);
					int ss = c.get(Calendar.SECOND);
					c.set(yyyy, MM, dd, hh, mm, ss);

					String jsqlcnt = "select count(*) from tradepost";
					PreparedStatement pstmtcnt = con.prepareStatement(jsqlcnt);
					ResultSet rscnt = pstmtcnt.executeQuery();
					rscnt.next();
					int cnt = rscnt.getInt(1);
					int cntTemp = cnt;
					String jsqlcontent1 = "select * from tradepost order by tp_hits desc, tp_id desc";
					PreparedStatement pstmtcontent1 = con.prepareStatement(jsqlcontent1);
					ResultSet rscontent1 = pstmtcontent1.executeQuery();
					if (cnt >= 8) {
						for (int i = 0; i < 6; i++) {
							rscontent1.next();
							int tp_id = rscontent1.getInt("tp_id");
							String tp_img = rscontent1.getString("tp_goodsimg");
							String tp_title = rscontent1.getString("tp_title");
							String tp_hits = rscontent1.getString("tp_hits");
							int tp_priceTemp = rscontent1.getInt("tp_goodsprice");
							String tp_date = rscontent1.getString("tp_date");
							String tp_price = df.format(tp_priceTemp);

							// 날짜계산
							String resyy = tp_date.substring(0, 4);
							String resMM = tp_date.substring(5, 7);
							String resdd = tp_date.substring(8, 10);
							String reshh = tp_date.substring(11, 13);
							String resmm = tp_date.substring(14, 16);
							String resss = tp_date.substring(17, 19);
							String resdate = resyy + resMM + resdd + reshh + resmm + resss;
							String today = dfdate.format(c.getTime());

							java.util.Date beginDate = null;
							java.util.Date endDate = null;

							long diff = 0;
							long diffYears = 0;
							long diffMonths = 0;
							long diffDays = 0;
							long diffTime = 0;
							long diffMinute = 0;
							long diffSecond = 0;

							beginDate = dfdate.parse(resdate);
							endDate = dfdate.parse(today);
							diff = (endDate.getTime() - beginDate.getTime()) / 1000;
							diffYears = diff / (365 * 24 * 60 * 60);
							diffMonths = diff / (31 * 24 * 60 * 60);
							diffDays = diff / (24 * 60 * 60);
							diffTime = diff / (60 * 60);
							diffMinute = diff / 60;
							diffSecond = diff;
							String datecal = "";
							if (diffYears >= 1) {
								datecal = diffYears + "년 전";
							} else if (diffMonths >= 1) {
								datecal = diffMonths + "개월 전";
							} else if (diffDays >= 1) {
								datecal = diffDays + "일 전";
							} else if (diffTime >= 1) {
								datecal = diffTime + "시간 전";
							} else if (diffMinute >= 1) {
								datecal = diffMinute + "분 전";
							} else if (diffSecond >= 1) {
								datecal = diffSecond + "초 전";
							} else {
								datecal = "방금 전";
							}
				%>
				<div class="productCard">
					<div id="imgmom">
						<a href="productDetail.jsp?tp_id=<%=tp_id%>"><img
							src="<%=tp_img%>"></a>
					</div>
					<div class="productInfo">
						<div style="display: flex">
							<a href="productDetail.jsp?tp_id=<%=tp_id%>"><%=tp_title%></a>
							<h2>
								조회수
								<%=tp_hits%></h2>
						</div>
						<div style="display: flex">
							<h3><%=datecal%></h3>
							<h4><%=tp_price%>원
							</h4>
						</div>
					</div>
				</div>
				<%
					}
						for (int j = 0; j < 2; j++) {
							rscontent1.next();
							int tp_id = rscontent1.getInt("tp_id");
							String tp_img = rscontent1.getString("tp_goodsimg");
							String tp_title = rscontent1.getString("tp_title");
							String tp_hits = rscontent1.getString("tp_hits");
							int tp_priceTemp = rscontent1.getInt("tp_goodsprice");
							String tp_date = rscontent1.getString("tp_date");
							String tp_price = df.format(tp_priceTemp);

							// 날짜계산
							String resyy = tp_date.substring(0, 4);
							String resMM = tp_date.substring(5, 7);
							String resdd = tp_date.substring(8, 10);
							String reshh = tp_date.substring(11, 13);
							String resmm = tp_date.substring(14, 16);
							String resss = tp_date.substring(17, 19);
							String resdate = resyy + resMM + resdd + reshh + resmm + resss;
							String today = dfdate.format(c.getTime());

							java.util.Date beginDate = null;
							java.util.Date endDate = null;

							long diff = 0;
							long diffYears = 0;
							long diffMonths = 0;
							long diffDays = 0;
							long diffTime = 0;
							long diffMinute = 0;
							long diffSecond = 0;

							beginDate = dfdate.parse(resdate);
							endDate = dfdate.parse(today);
							diff = (endDate.getTime() - beginDate.getTime()) / 1000;
							diffYears = diff / (365 * 24 * 60 * 60);
							diffMonths = diff / (31 * 24 * 60 * 60);
							diffDays = diff / (24 * 60 * 60);
							diffTime = diff / (60 * 60);
							diffMinute = diff / 60;
							diffSecond = diff;
							String datecal = "";
							if (diffYears >= 1) {
								datecal = diffYears + "년 전";
							} else if (diffMonths >= 1) {
								datecal = diffMonths + "개월 전";
							} else if (diffDays >= 1) {
								datecal = diffDays + "일 전";
							} else if (diffTime >= 1) {
								datecal = diffTime + "시간 전";
							} else if (diffMinute >= 1) {
								datecal = diffMinute + "분 전";
							} else if (diffSecond >= 1) {
								datecal = diffSecond + "초 전";
							} else {
								datecal = "방금 전";
							}
				%>
				<div class="productCard lastCard">
					<div id="imgmom">
						<a href="productDetail.jsp?tp_id=<%=tp_id%>"><img
							src="<%=tp_img%>"></a>
					</div>
					<div class="productInfo">
						<div style="display: flex">
							<a href="productDetail.jsp?tp_id=<%=tp_id%>"><%=tp_title%></a>
							<h2>
								조회수
								<%=tp_hits%></h2>
						</div>
						<div style="display: flex">
							<h3><%=datecal%></h3>
							<h4><%=tp_price%>원
							</h4>
						</div>
					</div>
				</div>
				<%
					}
					} else if (cnt < 8) {
						for (int i = 0; i < cnt; i++) {
							rscontent1.next();
							int tp_id = rscontent1.getInt("tp_id");
							String tp_img = rscontent1.getString("tp_goodsimg");
							String tp_title = rscontent1.getString("tp_title");
							String tp_hits = rscontent1.getString("tp_hits");
							int tp_priceTemp = rscontent1.getInt("tp_goodsprice");
							String tp_date = rscontent1.getString("tp_date");
							String tp_price = df.format(tp_priceTemp);

							// 날짜계산
							String resyy = tp_date.substring(0, 4);
							String resMM = tp_date.substring(5, 7);
							String resdd = tp_date.substring(8, 10);
							String reshh = tp_date.substring(11, 13);
							String resmm = tp_date.substring(14, 16);
							String resss = tp_date.substring(17, 19);
							String resdate = resyy + resMM + resdd + reshh + resmm + resss;
							String today = dfdate.format(c.getTime());

							java.util.Date beginDate = null;
							java.util.Date endDate = null;

							long diff = 0;
							long diffYears = 0;
							long diffMonths = 0;
							long diffDays = 0;
							long diffTime = 0;
							long diffMinute = 0;
							long diffSecond = 0;

							beginDate = dfdate.parse(resdate);
							endDate = dfdate.parse(today);
							diff = (endDate.getTime() - beginDate.getTime()) / 1000;
							diffYears = diff / (365 * 24 * 60 * 60);
							diffMonths = diff / (31 * 24 * 60 * 60);
							diffDays = diff / (24 * 60 * 60);
							diffTime = diff / (60 * 60);
							diffMinute = diff / 60;
							diffSecond = diff;
							String datecal = "";
							if (diffYears >= 1) {
								datecal = diffYears + "년 전";
							} else if (diffMonths >= 1) {
								datecal = diffMonths + "개월 전";
							} else if (diffDays >= 1) {
								datecal = diffDays + "일 전";
							} else if (diffTime >= 1) {
								datecal = diffTime + "시간 전";
							} else if (diffMinute >= 1) {
								datecal = diffMinute + "분 전";
							} else if (diffSecond >= 1) {
								datecal = diffSecond + "초 전";
							} else {
								datecal = "방금 전";
							}
							if (i == 6) {
				%>
				<div class="productCard lastCard">
					<%
						} else {
					%>
					<div class="productCard">
						<%
							}
						%>
						<div id="imgmom">
							<a href="productDetail.jsp?tp_id=<%=tp_id%>"><img
								src="<%=tp_img%>"></a>
						</div>
						<div class="productInfo">
							<div style="display: flex">
								<a href="productDetail.jsp?tp_id=<%=tp_id%>"><%=tp_title%></a>
								<h2>
									조회수
									<%=tp_hits%></h2>
							</div>
							<div style="display: flex">
								<h3><%=datecal%></h3>
								<h4><%=tp_price%>원
								</h4>
							</div>
						</div>
					</div>
					<%
						}
						}
					%>
				</div>
		</section>
		<!--컨텐츠2 (기부 독려 이미지)			-->
		<section id="content2" class="content">
			<img src="images/keyimage3.jpg"
				onClick="location.href='sub_donate.jsp'" style="cursor: pointer;">
		</section>

		<!--컨텐츠3 (이번 주 기부물품)			-->
		<section id="content3" class="content">
			<div class="content_title">
				<p>이번 주 기부물품에 응모하세요!</p>
				<a href="sub_donate2.jsp" class="content_more">더보기</a>
			</div>
			<div class="content_item">
				<%
					DecimalFormat df4 = new DecimalFormat("###,###");
					SimpleDateFormat dfdate4 = new SimpleDateFormat("yyyyMMddHHmmss");
					Calendar c4 = Calendar.getInstance();

					int yyyy4 = c4.get(Calendar.YEAR);
					int MM4 = c4.get(Calendar.MONTH);
					int dd4 = c4.get(Calendar.DATE);
					int hh4 = c4.get(Calendar.HOUR_OF_DAY);
					int mm4 = c4.get(Calendar.MINUTE);
					int ss4 = c4.get(Calendar.SECOND);
					c4.set(yyyy4, MM4, dd4, hh3, MM4, ss4);

					String jsqlcnt3 = "select count(*) from donate";
					PreparedStatement pstmtcnt3 = con.prepareStatement(jsqlcnt3);
					ResultSet rscnt3 = pstmtcnt3.executeQuery();
					rscnt3.next();
					int cnt3 = rscnt3.getInt(1);
					int cntdc3 = cnt3;
					int cntTemp3 = cnt3;
					String jsqlcontent3 = "select * from donate order by do_id desc";
					PreparedStatement pstmtcontent3 = con.prepareStatement(jsqlcontent3);
					ResultSet rscontent3 = pstmtcontent3.executeQuery();
					long remain[] = {0, 0, 0};
					for (int i = 0; i < 3; i++) {
						if (cntdc3 == 0) {
							break;
						} else {
							cntdc3--;
						}
						rscontent3.next();
						int do_id = rscontent3.getInt("do_id");
						String do_img = rscontent3.getString("do_img");
						String do_title = rscontent3.getString("do_title");
						int do_priceTemp = Integer.parseInt(rscontent3.getString("do_price")) / 10;
						String do_date = rscontent3.getString("do_date");
						String do_price = df4.format(do_priceTemp);

						// 날짜계산
						String resyy4 = do_date.substring(0, 4);
						String resMM4 = do_date.substring(5, 7);
						String resdd4 = do_date.substring(8, 10);
						String reshh3 = do_date.substring(11, 13);
						String resmm4 = do_date.substring(14, 16);
						String resss4 = do_date.substring(17, 19);
						String resdate4 = resyy4 + resMM4 + resdd4 + reshh3 + resMM4 + resss4;
						String today3 = dfdate4.format(c4.getTime());

						java.util.Date beginDate4 = null;
						java.util.Date endDate4 = null;

						long diff4 = 0;
						long diffYears4 = 0;
						long diffMonths4 = 0;
						long diffDays4 = 0;
						long diffTime4 = 0;
						long diffMinute4 = 0;
						long diffSecond4 = 0;

						beginDate4 = dfdate4.parse(resdate4);
						endDate4 = dfdate4.parse(today3);
						diff4 = (beginDate4.getTime() - endDate4.getTime()) / 1000;
						remain[i] = diff4;
						diffYears4 = diff4 / (365 * 24 * 60 * 60);
						diffMonths4 = diff4 / (31 * 24 * 60 * 60);
						diffDays4 = diff4 / (24 * 60 * 60);
						diffTime4 = diff4 / (60 * 60);
						diffMinute4 = diff4 / 60;
						diffSecond4 = diff4;
						String datecal4 = "";
						if (diffYears4 >= 1) {
							datecal4 = diffYears4 + "년 전";
						} else if (diffMonths4 >= 1) {
							datecal4 = diffMonths4 + "개월 전";
						} else if (diffDays4 >= 1) {
							datecal4 = diffDays4 + "일 전";
						} else if (diffTime4 >= 1) {
							datecal4 = diffTime4 + "시간 전";
						} else if (diffMinute4 >= 1) {
							datecal4 = diffMinute4 + "분 전";
						} else if (diffSecond4 >= 1) {
							datecal4 = diffSecond4 + "초 전";
						} else {
							datecal4 = "방금 전";
						}
				%>
				<div class="donateCard">
					<input type="hidden" value="<%=diff4%>" id="calculTime<%=i + 1%>">
					<div class="timeDiv">
						<p id="remainTime<%=i + 1%>"></p>
					</div>
					<img src="<%=do_img%>">
					<div class="donateInfo">
						<div>
							<h1><%=do_title%></h1>
							<h2>기부물품 할인가</h2>
							<h3><%=do_price%>원
							</h3>
						</div>
						<a href="#a" class="open"><div class="enterButton">응모하기</div></a>
					</div>
					<div class="remainTime<%=i + 1%>"></div>
				</div>
				<%
					}
				%>

			</div>
		</section>

		<!--컨텐츠4 (많은 엄마들이 읽은 육아칼럼)			-->
		<section id="content4" class="content">
			<div class="content_title">
				<p>많은 엄마들이 읽은 육아칼럼</p>
				<a href="sub_column.jsp" class="content_more">더보기</a>
			</div>
			<div class="columnList">
				<%
					String jsqlcol = "select * from columntbl order by co_hits desc";
					PreparedStatement pstmtcol = con.prepareStatement(jsqlcol);
					ResultSet rscol = pstmtcol.executeQuery();

					for (int x = 0; x < 2; x++) {
						if (rscol.next()) {
							if (x == 1) {
				%>
				<div class="columnLine"></div>
				<%
					}
							String co_id = rscol.getString("co_id");
							String co_titleTemp = rscol.getString("co_title");
							String co_title = "";
							String co_content = "";
							String co_img = rscol.getString("co_img");
							String co_name = rscol.getString("co_name");
							String co_date = rscol.getString("co_date").substring(0, 16);
							int co_hits = rscol.getInt("co_hits");
							int co_likes = rscol.getInt("co_likes");
							String co_contentTemp = rscol.getString("co_content").replaceAll("&nbsp;", " ")
									.replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("<br>", " ");
							if (co_titleTemp.length() <= 20) {
								co_title = co_titleTemp;
							} else if (co_titleTemp.length() > 20) {
								co_title = co_titleTemp.substring(0, 20);
								co_title += "...";
							}
							if (co_contentTemp.length() <= 40) {
								co_content = co_contentTemp;
							} else if (co_contentTemp.length() > 40) {
								co_content = co_contentTemp.substring(0, 40);
								co_content += "...";
							}
				%>
				<div class="column"
					onclick="location.href='sub_column_detail.jsp?co_id=<%=co_id%>'"
					style="cursor: pointer;">
					<a href="#"><img src="<%=co_img%>"></a>
					<div class="columnText">
						<a href="#"><h1><%=co_title%></h1></a> <a href="#"><h2><%=co_content%></h2></a>
						<span>
							<h3><%=co_name%>
								|
								<%=co_date%></h3>
							<h4>
								조회수 <b style="color: #F59A23;"><%=co_hits%></b> | 좋아요 <b
									style="color: #EC808D"><%=co_likes%></b>
							</h4>
						</span>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>
		</section>

		<!--컨텐츠5 (n월 제철 음식 레시피)			-->
		<section id="content5" class="content">
			<div class="content_title">
				<p>5월 제철 음식 레시피!</p>
				<a href="sub_recipe.jsp" class="content_more">더보기</a>
			</div>
			<div class="recipeList">
				<%
					String jsqlcol2 = "select * from recipe";
					PreparedStatement pstmtcol2 = con.prepareStatement(jsqlcol2);
					ResultSet rscol2 = pstmtcol2.executeQuery();

					for (int x = 0; x < 5; x++) {
						if (rscol2.next()) {
							String co_id = rscol2.getString("re_id");
							String co_titleTemp = rscol2.getString("re_title");
							String co_title = "";
							String co_content = "";
							String co_img = rscol2.getString("re_img");
							int co_likes = rscol2.getInt("re_like");
							if (co_titleTemp.length() <= 20) {
								co_title = co_titleTemp;
							} else if (co_titleTemp.length() > 20) {
								co_title = co_titleTemp.substring(0, 20);
								co_title += "...";
							}
				%>

				<div class="recipe"
					onclick="location.href='sub_recipe_detail.jsp?re_id=<%=co_id%>'"
					style="cursor: pointer;">
					<a href="#"><img src="<%=co_img%>"></a> <a href="#"><h1><%=co_title%></h1></a>
					<span><h2>
							좋아요 <b style="color: #EC808D;"><%=co_likes%></b>&nbsp;</b>
						</h2></span>
				</div>
				<%
					}
					}
				%>
			</div>
		</section>

		<!--컨텐츠6 (맘스 육아일기)-->
		<section id="content6" class="content">
			<div class="content_title">
				<p>맘스 육아일기</p>
				<a href="sub_diary.jsp" class="content_more">더보기</a>
			</div>
			<div class="diaryList">
				<div class="diaryRow">
					<%
						String jsqldia = "select * from diary order by di_id desc";
						PreparedStatement pstmtdia = con.prepareStatement(jsqldia);
						ResultSet rsdia = pstmtdia.executeQuery();

						for (int x = 0; x < 4; x++) {
							if (rsdia.next()) {
								if (x == 2) {
					%>
				</div>
				<div class="diaryRow" style="margin-bottom: 20px;">
					<%
						}
								String di_id = rsdia.getString("di_id");
								String di_titleTemp = rsdia.getString("di_title");
								String di_title = "";
								String di_content = "";
								String di_img = rsdia.getString("di_img");
								String di_name = rsdia.getString("m_nickname");
								String di_date = rsdia.getString("di_date").substring(0, 16);
								if (di_titleTemp.length() <= 15) {
									di_title = di_titleTemp;
								} else if (di_titleTemp.length() > 15) {
									di_title = di_titleTemp.substring(0, 15);
									di_title += "...";
								}
					%>
					<div class="diary" style="cursor: pointer;"
						onclick="location.href='sub_diary_detail.jsp?di_id=<%=di_id%>'">
						<a href="#a"><img src="<%=di_img%>"></a>
						<div class="diaryInfo">
							<a href="#a"><h1><%=di_title%></h1></a>
							<h2><%=di_name%></h2>
							<h3><%=di_date%></h3>
						</div>
					</div>
					<%
						}
						}
					%>
				</div>
			</div>
		</section>

		<!--푸터영역-->
		<footer>
			<div id="footerimg">
				<img src="images/logo.png" id="footerLogo"> <img
					src="images/sns.png" id="footerSNS">
			</div>
			<div id="footerInfo">
				<p>
					(주)맘스홀릭 대표이사: 이마마 | 주소: 서울특별시 강남구 강남 대로 234길 맘스타워 8층<br>
					사업자등록번호 : 100-01-54123 통신판매업신고번호 : 제2021-서울강남-0520호 사업자정보확인<br>
					맘스홀릭 고객센터 문의 : 02-550-9988(평일 10시~16시) | 팩스 : 02-560-5050<br>
					호스팅서비스 제공자: MOMS Web Services (MWS)<br>
					<br>
					<br>
				</p>
				<p>
					(주)맘스홀릭은 통신판매중개자로서 거래당사자가 아니며, 맘스홀릭 판매자가 등록한 상품정보 및 거래에 대해 (주)맘스홀릭은
					책임이 없습니다.<br> (주)맘스홀릭. All rights reserved.
				</p>
			</div>
		</footer>
	</div>
</body>
<script>

	$(document).ready(function(){
	//응모 남은시간
	var cnt = <%=cnt3%>;
	if (cnt >= 3) {
		var remain1 = <%=remain[0]%>; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
		var hour1= ""; //시
		var min1 = ""; //분
		var sec1 = ""; //초
		var remain2 = <%=remain[1]%>; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
		var hour2= ""; //시
		var min2 = ""; //분
		var sec2 = ""; //초
		var remain3 = <%=remain[2]%>; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
		var hour3= ""; //시
		var min3 = ""; //분
		var sec3 = ""; //초
		//setInterval(함수, 시간) : 주기적인 실행
		var x = setInterval(function() {
			//parseInt() : 정수를 반환
			min1 = parseInt(remain1/60)%60;//분
			sec1 = remain1%60; //초
			hour1 = parseInt(remain1/60/60); //시간 
			
			min2 = parseInt(remain2/60)%60;//분
			sec2 = remain2%60; //초
			hour2 = parseInt(remain2/60/60); //시간 

			min3 = parseInt(remain3/60)%60;//분
			sec3 = remain3%60; //초
			hour3 = parseInt(remain3/60/60); //시간 

			document.getElementById("remainTime1").innerHTML =hour1 + "시간 " + min1 + "분 " + sec1 + "초";
			document.getElementById("remainTime2").innerHTML =hour2 + "시간 " + min2 + "분 " + sec2 + "초";
			document.getElementById("remainTime3").innerHTML =hour3 + "시간 " + min3 + "분 " + sec3 + "초";
			remain1--;
			remain2--;
			remain3--;

			//타임아웃 시
			if (remain1 < 0) {
				clearInterval(x); //setInterval() 실행을 끝냄
				document.getElementById("remainTime1").innerHTML = "응모가 종료되었습니다.";
			}
			if (remain2 < 0) {
				clearInterval(x); //setInterval() 실행을 끝냄
				document.getElementById("remainTime2").innerHTML = "응모가 종료되었습니다.";
			}
			if (remain3 < 0) {
				clearInterval(x); //setInterval() 실행을 끝냄
				document.getElementById("remainTime3").innerHTML = "응모가 종료되었습니다.";
			}
		}, 1000);
	} else if (cnt == 2) {
		var remain1 = <%=remain[0]%>; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
		var hour1= ""; //시
		var min1 = ""; //분
		var sec1 = ""; //초
		var remain2 = <%=remain[1]%>; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
		var hour2= ""; //시
		var min2 = ""; //분
		var sec2 = ""; //초
		//setInterval(함수, 시간) : 주기적인 실행
		var x = setInterval(function() {
			//parseInt() : 정수를 반환
			min1 = parseInt(remain1/60)%60;//분
			sec1 = remain1%60; //초
			hour1 = parseInt(remain1/60/60); //시간 
			
			min2 = parseInt(remain2/60)%60;//분
			sec2 = remain2%60; //초
			hour2 = parseInt(remain2/60/60); //시간 

			document.getElementById("remainTime1").innerHTML =hour1 + "시간 " + min1 + "분 " + sec1 + "초";
			document.getElementById("remainTime2").innerHTML =hour2 + "시간 " + min2 + "분 " + sec2 + "초";
			remain1--;
			remain2--;

			//타임아웃 시
			if (remain1 < 0) {
				clearInterval(x); //setInterval() 실행을 끝냄
				document.getElementById("remainTime1").innerHTML = "응모가 종료되었습니다.";
			}
			if (remain2 < 0) {
				clearInterval(x); //setInterval() 실행을 끝냄
				document.getElementById("remainTime2").innerHTML = "응모가 종료되었습니다.";
			}
		}, 1000);
	} else if (cnt == 1) {
		var remain = <%=remain[0]%>; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
		var hour= ""; //시
		var min = ""; //분
		var sec = ""; //초
		//setInterval(함수, 시간) : 주기적인 실행
		var x = setInterval(function() {
			//parseInt() : 정수를 반환
			min = parseInt(remain/60)%60;//분
			sec = remain%60; //초
			hour = parseInt(remain/60/60); //시간 

			document.getElementById("remainTime1").innerHTML =hour + "시간 " + min + "분 " + sec + "초";
			remain--;

			//타임아웃 시
			if (remain < 0) {
				clearInterval(x); //setInterval() 실행을 끝냄
				document.getElementById("remainTime1").innerHTML = "응모가 종료되었습니다.";
			}
		}, 1000);
	}
	});

	
	</script>
</html>