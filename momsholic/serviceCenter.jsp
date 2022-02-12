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
<link href="css/serviceCenter.css" rel="stylesheet" type="text/css">
<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
</script>
<script>
<!--자주하는 질문-->
	function Q1() {
		$("#A1").toggleClass("show");
	};

	function Q2() {
		$("#A2").toggleClass("show");
	};

	function Q3() {
		$("#A3").toggleClass("show");
	};

	function Q4() {
		$("#A4").toggleClass("show");
	};

	function Q5() {
		$("#A5").toggleClass("show");
	};

	function Q6() {
		$("#A6").toggleClass("show");
	};

	function Q7() {
		$("#A7").toggleClass("show");
	};

	function Q8() {
		$("#A8").toggleClass("show");
	};
</script>
<script>
	//팝업 
	$(document).ready(function() {
		$(".open").on('click', function() {
			$(".popup").show();
			$(".dim").show();
		});
		$(".popup .close").on('click', function() {
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
		request.setCharacterEncoding("UTF-8");
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


		<!---------------고객센터---------------->
		<section id="serviceCenter">
			<div id="serviceCenterInfo">
				<div id="webnav">
					<p>메인 > 고객센터</p>
				</div>
				<div id="serviceCenterName">고객센터</div>
				<div id="empty"></div>
			</div>

			<!-- 자주묻는 질문 -->
			<div id="QnA_Group">
				<h1>자주묻는 질문</h1>
				<!-- 질문1 -->
				<div class="QnA_Card">
					<a href="javascript:Q1()" id="Q1" class="question"> 거래를 하면 안 되는
						것들은 어떤 것이 있나요? </a>
					<div id="A1" class="answer">
						<p>거래금지품목은 이용약관 및 현행 법률에 따라 즉시 삭제 및 계정 차단이 될 수 있으므로 운영정책을
							참고하셔서 이용 부탁 드립니다.</p>
						<p>개인정보 : 개인정보를 사고파는 행위와 면허증, 허가증, 등록증 등을 위, 변조하는 행위는 형법에 따라
							처벌받을 수 있습니다. 예시) 주민등록증, 여권, 학생증, 수험표, 운전면허증, 대포통장, 듀얼폰, 듀얼넘버 등</p>
						<p>온라인 개인 계정 : 개인 계정 및 인증번호를 통해 각종 피해가 발생되고 있어 맘스홀릭 운영정책에 따라
							제재 됩니다. 예시) 카톡계정, 인스타 계정, 페이스북 계정, 네이버 계정, 카카오톡, 네이버, 페이스북 인증번호 등</p>
						<p>불법현금융통 : 정보통신망 이용촉진 및 정보보호등의 관한 법률 제 72조 통신과금을 이용해 매입하는 행위는
							불법현금융통으로 제재 됩니다. 예시) 불법 현금융통을 목적으로 한 모든 상품 (불법대출, 돈구해요, 개인돈빌려요,
							리니지M등)</p>
						<p>허위매물 : 실물을 확보하지 않은 판매하는 행위는 맘스홀릭 운영정책에 따라 제재 됩니다. (※ 자동차
							허위매물의 경우 증빙 시 해제 가능합니다.) 예시) 백화점/문화 상품권 예약판매, 타 사이트 대리구매(배송지변경),
							알바를 통한 상품 대리판매, 자동차</p>
						<p>사행성 : 불법 도박 및 사행성 상품은 맘스홀릭 운영정책에 따라 제재 됩니다. 예시)토토, 카지노,
							바카라, 화투, 포커, 한게임, 섯다, 바둑이, 홀덤, 세븐등 머니쿠폰, 전용장비, 라이브스코어인증 등</p>
						<p>청소년유해상품 : 청소년유해 매체물/약품/물건은 청소년 보호법에 따라 제재 됩니다. 예시) 청소년불가 등급
							및 선정적 매체 (잡지, DVD, 음반, 서적등), 레이져포인터, 캠핑용 나이프, 눈알젤리, 가스건 등</p>
						<p>반려동물/야생 동, 식물 : 반려동,식물은 맘스홀릭 운영정책에 따라 제재 됩니다. 예시) 반려동물
							판매/구매, 반려동물 무료나눔 불가</p>
						<p>담배(전자담배용품) : 담배사업법에 따라 담배의 온라인 판매는 금지되어 있으며, 담뱃잎을 사용하지 않았다
							하더라도 그 유사한 형태의 끽연용 제품은 담배와 동일하게 판매를 규제하고 있습니다. 예시) 담배, 전자담배</p>
						<p>군용품/군복류 : 군복 및 군용장구의 단속에 관한 법률에 따라 임의로 제조 및 판매할 경우 1년 이하의
							징역 또는 1천만원 이하의 벌금에 처하도록 규정하고 있습니다. (※ 구형의 경우 제재 미적용 ) (※신형 군복 확인
							:
							https://www.army.mil.kr/webapp/user/indexSub.do?codyMenuSeq=213458&siteId=army)

							예시) 총기, 총포, 권총집, 수통, 야전삽, 천막류, 모포, 방탄모, 방탄복, 야전배낭, 전투복, 전투모, 전투화,
							계급장, 야전복, 방한복, 비행복, 특전복, 유사군복(외국군복) 등</p>
						<p>게임 계정/ 아이템/ 대리육성 : 게임산업 진흥에 관한 법률 제32조 불법게임물 등의 유통금지 조항에 따라
							제재 됩니다. 예시) 오버워치계정, 피파계정, 롤계정, 동물의 숲, 게임아이템(롤스킨, 피파귀속거래, 발로란트,
							배틀그라운드), 별풍선 삽니다/팝니다 등</p>
						<p>의약품 : 모든 의약품(동물용 의약품 포함)은 약사법에 의거 약국 개설자(해당 약국에 근무하는 약사 또는
							한약사 포함)만이 판매 가능하며, 약국 개설자의 경우에도 지방자치단체장의 승인을 얻은 경우를 제외하고는 인터넷을 통한
							판매가 불가합니다. 예시) 감기약, 알러지약, 진통제, 두통약, 수면제, 마취제, 프로포폴, 식욕억제제, 구충제,
							펜벤다졸, 파나쿠어, 시알리스, 비아그라 등 의약성분이 포함된 다이어트 식품</p>
						<p>개인 사용 목적으로 해외 직구한 전자제품 : 적합성 평가 면제조건에 해당하는 “개인이 사용할 목적의
							제품”을 해외직구로 구입하여 사용하다가 중고판매를 하고자 하는 경우 판매하려는 경우에는 적합성 평가 면제요건에
							부합하지 아니하므로, 「전파법」 제58조의2에 따라 적합성 평가를 받아야 하며, 받지 않고 게시한 경우 적합성 평가를
							받지 않은 불법방송통신기자재 게시로 인해 처벌받을 수 있습니다.</p>
						<p>기타 : 응모권, 비매품, 랜덤박스, 목적 불분명한 알바등 영리목적으로 제3자에게 자료 및 정보 제공 하는
							경우 맘스홀릭 운영정책에 따라 제재 됩니다.</p>
						<p>위 거래금지품목 이외 전자상거래 또는 통신판매로 유통/판매가 금지되어 있거나, 사회통념상 매매에
							부적합하다고 '회사'가 판단하는 경우 운영정책에 따라 제재 됩니다.</p>
					</div>
				</div>
				<!-- 질문2 -->
				<div class="QnA_Card">
					<a href="javascript:Q2()" class="question">사기거래 피해 발생 시 수사기관
						신고는 어떻게 하나요?</a>
					<div id="A2" class="answer">
						<p>경찰청 사이버범죄 신고 시스템을 통해 온라인 접수 가능</p>
						<p>[수사기관 접수 채널 및 신고 방법]</p>
						<p>1. 상대방과 거래한 내용에 대해 증거자료 수집 (대화내용, 입금내역)</p>
						<p>
							2. 경찰청 사이버안전지킴이 신고(온라인 접수): https://ecrm.cyber.go.kr/minwon/main<br>
							※다중 피해 사건의 피해자 중 1명이라도 신고한 사실이 있다면, 다른 피해자들은 온라인 신고만으로 정식 수사 진행이
							가능합니다.
						</p>
						<p>
							3. 경찰청 민원실 신고(내방 접수)<br> ① 경찰서 민원봉사실 방문 <br> ② 고소장 작성<br>
							③ 사건사실확인서 발급 요청<br> ④ 계좌를 통해 인출된 경우 은행 방문하여 계좌지급정지
							신청(사건사실확인서 제출)
						</p>
						<p>
							4. 추가 필요자료 : 피해자 인적사항, 피해일시, 해당사이트, ID 또는 상점명, 거래내역<br>
							※개인정보보호법에 따라 상대방의 개인정보는 신고인에게 직접 제공은 불가하며, 수사기관 공문을 통해 전달이 가능한 점
							양해 부탁드립니다.
						</p>
					</div>
				</div>
				<!-- 질문3 -->
				<div class="QnA_Card">
					<a href="javascript:Q3()" class="question">교환이나 환불은 어떻게 하나요?</a>
					<div id="A3" class="answer">
						<p>교환/반품은 판매자와 협의 필요</p>
						<p>
							중고상품은 개인간의 거래이므로 전자상거래법, 소비자보호법등이 적용되지 않습니다.<br> 물품을 받으신 후
							단순변심 또는 전달 받지 못한 하자가 확인되어 교환/반품을 원하실 경우, 판매자와 협의를 통해 진행 해 주시기
							바랍니다.
						</p>
						<p>단순변심 환불로 판매자와 협의된 경우 배송비는 구매자 부담이 될 수 있습니다.</p>
					</div>
				</div>
				<!-- 질문4 -->
				<div class="QnA_Card">
					<a href="javascript:Q4()" class="question">공휴일에도 택배 배송이 가능한가요?</a>
					<div id="A4" class="answer">
						<p>공휴일 택배 배송불가</p>
						<p>
							토요일,일요일을 포함한 법정 공휴일에는 접수만 가능하나, 택배 배송은 진행되지 않습니다.<br> 주말과
							공휴일 일정을 참고하여 접수 부탁드립니다.
						</p>
					</div>
				</div>
				<!-- 질문5 -->
				<div class="QnA_Card">
					<a href="javascript:Q5()" class="question">사진 업로드 시 최적 사이즈는 어떻게
						되나요?</a>
					<div id="A5" class="answer">
						<p>[사진 업로드 시 최적 사이즈]</p>
						<p>- 496*420 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.</p>
						<p></p>
						<p></p>
					</div>
				</div>
				<!-- 질문6 -->
				<div class="QnA_Card">
					<a href="javascript:Q6()" class="question">정품을 구매했는데 위조품이에요.
						환불받을 수 있나요?</a>
					<div id="A6" class="answer">
						<p>직거래가 아닌, '맘스페이' 온라인 결제 후, 구매확정 전이라면 환불 받으실 수 있습니다.</p>
						<p>
							단, 구매확정 후에는 판매자에게 입금이 완료되어 환불이 불가하니, 위조품으로 의심되는 경우 <br> 반드시
							‘직접 구매확정’ 또는 ‘자동 구매확정’되기 이전에 1:1 문의로 접수해 주세요.<br> 환불을 위해
							위조품으로 확인 가능한 자료를 요청드릴 수 있으니 위조품으로 입증할 수 있는 자료도 함께 제출해 주시면 더욱 빠르게
							환불 받으실 수 있습니다.
						</p>
						<p>※ 위조품 판별 방법 : 상표권자(브랜드) or 특허청(산업재산침해신고센터)</p>
					</div>
				</div>
				<!-- 질문7 -->
				<div class="QnA_Card">
					<a href="javascript:Q7()" class="question">맘스페이란 무엇인가요?</a>
					<div id="A7" class="answer">
						<p>안전한 거래를 위해 택배거래와 직거래 모두 안전하게 맘스페이로 구매하세요!</p>
						<p>
							거래가 완료될 때까지 맘스페이가 결제대금을 안전하게 보관합니다.<br> 1. 맘스페이를 통해 구매자와
							판매자간의 중계거래를 통해 2.구매확정' 후 즉시 결제 대금이 판매자에게 즉시 입금되어 정산 소요 기간이
							짧아졌습니다.
						</p>
						<p></p>
						<p></p>
					</div>
				</div>
				<!-- 질문8 -->
				<div class="QnA_Card">
					<a href="javascript:Q8()" class="question">실수로 배송완료 전에 구매확정을 먼저
						눌렀어요.</a>
					<div id="A8" class="answer">
						<p>구매확정 후 구매확정 취소 불가</p>
						<p>
							구매확정후 에는 상품 금액이 판매자에게 즉시 입금됩니다.<br> 따라서 배송완료 이전에 판매자가 구매확정을
							요청하는 경우 사기 위험에 노출될 수 있으므로 반드시 상품 확인 후에 구매확정을 해주세요.<br> * 불법
							금융대출 목적으로 맘스페이를 이용할 경우 금융거래에 불이익을 받을 수 있습니다.
						</p>
					</div>
				</div>
			</div>

			<!-- 1:1 문의하기 -->
			<div id="inquiry">
				<h1>1:1 문의하기</h1>
				<p>1:1 문의를 통해 고객님의 불편사항을 받고 있습니다.</p>
				<p>온라인 문의는 아래 1:1 문의하기를 클릭해주세요.</p>
				<p>전화상담 연락처 : 02-0000-0000</p>

				<a href="#a" class="open" id="donateButton"><div id="buttonDiv">1:1
						문의하기</div></a>
			</div>
		</section>


		<!----------------------------------팝업---------------------------------- -->
		<div class="popup">
			<h2>1:1 문의하기</h2>
			<div class="con">
				<table class="type1">
					<colgroup>
						<col style="width: 111px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th><label for="txt1">문의 유형</label></th>
							<td>
								<select class="type" name="">
									<option value="">계정문의</option>
									<option value="">거래신고</option>
									<option value="">이용방법</option>
									<option value="">제보/제안</option>
									<option value="etc">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="txt2">문의 내용</label></th>
							<td><textarea id="txt2" placeholder="문의하실 내용을 적어주세요."></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="txt_center">
				<a href="#a" class="btn_type1">문의신청</a>
			</div>
			<a href="#a" class="close">닫기</a>
		</div>
		<div class="dim" style="display: none;"></div>

		<!-----------------푸터영역----------------->
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
					호스팅서비스 제공자: MOMS Web Services (MWS)<br> <br> <br>
				</p>
				<p>
					(주)맘스홀릭은 통신판매중개자로서 거래당사자가 아니며, 맘스홀릭 판매자가 등록한 상품정보 및 거래에 대해 (주)맘스홀릭은
					책임이 없습니다.<br> (주)맘스홀릭. All rights reserved.
				</p>
			</div>
		</footer>
	</div>
</body>
</html>