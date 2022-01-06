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
		<link href="css/mypage_modify.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
		<script>
		function searchSubmit(){
			if (document.getElementById("searchText").value == "") {
				alert("검색어를 입력해주세요.");
				return false;
			}
			document.getElementById("searchForm").submit();
			
		}
		/* 우편번호 찾기 */
		function addressSearch() {
			daum.postcode.load(function(){
				new daum.Postcode({
				    oncomplete: function(data) {
					var addr = '';
					if (data.userSelectedType === 'R') {
						addr = data.roadAddress;
					} else {
						addr = data.jibunAddress;
					}
					document.getElementById("addressCode").value = data.zonecode;
					document.getElementById("address1").value = addr;
					document.getElementById("address2").focus();
					}
				}).open();
			});
		}
		
		/* 닉네임 체크 */

		function checkingNickname() {
			var inputed = $('#checkNickname').val();
			var hiddeninputed = $('#checkNicknamehidden').val();
			if (inputed  == ""){				
			alert("닉네임을 입력해 주세요."); 
			mypageform.nickname.focus(); 
			return; 
			} else if (inputed == hiddeninputed) {
				$("#checkNickname").css({"background-color":"#FFFFFF" , "margin-top":"10px"});
				$('#checkNicknameText').text("사용할 수 있는 닉네임입니다.");
				$("#checkNicknameText").css("color", "green");
				return;
			}
			
			else {
				$.ajax({
					type: 'POST',
					url: './UserRegCheckServlet2',
					data: {m_nickname: inputed},
					success: function(result) {
						if(result == 1) {
							$("#checkNickname").css({"background-color":"#FFFFFF" , "margin-top":"10px"});
							$('#checkNicknameText').text("사용할 수 있는 닉네임입니다.");
							$("#checkNicknameText").css("color", "green");
						}
						else {
							$("#checkNickname").css({"background-color":"#FFCECE" , "margin-top":"10px"});
							$('#checkNicknameText').text("사용할 수 없는 닉네임입니다.");
							$("#checkNicknameText").css("color", "red");
						}
					}
				})
			}
		}
		
		/* 비밀번호 체크 */
		
		function checkPwd() {
			var inputed = $('#pwd').val();
			var reinputed = $('#repwd').val();
			if(reinputed==""){
				$("#repwd").css({"background-color":"#FFCECE" , "margin-top":"10px"});
				$("#checkPwdText").text("비밀번호를 다시 확인해주세요.");
				$("#checkPwdText").css("color", "red");
			} else if (inputed.length < 8 || inputed.length > 16 || reinputed.length < 8 || reinputed.length > 16) {
				$("#repwd").css({"background-color":"#FFCECE" , "margin-top":"10px"});
				$("#checkPwdText").text("비밀번호는 8~16자 사이의 영문, 숫자 혹은 특수문자이어야 합니다.");
				$("#checkPwdText").css("color", "red");
			} else if (inputed == reinputed) {
				$("#repwd").css({"background-color":"#FFFFFF" , "margin-top":"0px"});
				$("#checkPwdText").text("");
			} else if (inputed != reinputed) {
				$("#repwd").css({"background-color":"#FFCECE" , "margin-top":"10px"});
				$("#checkPwdText").text("비밀번호를 다시 확인해주세요.");
				$("#checkPwdText").css("color", "red");
			}
		}
		
		function submitform() {
			if (document.getElementById("pwd").value == "") {
				alert("비밀번호를 입력하세요.");
				document.getElementById("pwd").focus();
				return false;
			}
			if (document.getElementById("repwd").value == "") {
				alert("비밀번호를 입력하세요.");
				document.getElementById("repwd").focus();
				return false;
			}
			if (document.getElementById("checkNickname").value == "") {
				alert("닉네임을 입력하세요.");
				document.getElementById("checkNickname").focus();
				return false;
			}
			if (document.getElementById("checkPwdText").value == "비밀번호를 다시 확인해주세요.") {
				alert("비밀번호를 다시 확인해주세요.");
				document.getElementById("repwd").focus();
				return false;
			}
			if (document.getElementById("checkNicknameText").value == "사용할 수 없는 닉네임입니다.") {
				alert("닉네임을 다시 확인해주세요.");
				document.getElementById("checkNickname").focus();
				return false;
			}
			if (document.getElementById("name").value == "") {
				alert("이름을 입력하세요.");
				document.getElementById("name").focus();
				return false;
			}
			if (document.getElementById("email1").value == "") {
				alert("이메일을 입력하세요.");
				document.getElementById("email1").focus();
				return false;
			}
			if (document.getElementById("email2").value == "") {
				alert("이메일을 입력하세요.");
				document.getElementById("email2").focus();
				return false;
			}
			if (document.getElementById("addressCode").value == "") {
				alert("주소를 입력하세요.");
				document.getElementById("addressCode").focus();
				return false;
			}

			if (document.getElementById("address1").value == "") {
				alert("주소를 입력하세요.");
				document.getElementById("address1").focus();
				return false;
			}

			if (document.getElementById("address2").value == "") {
				alert("주소를 입력하세요.");
				document.getElementById("address2").focus();
				return false;
			}
			document.getElementById("mypageform").submit();
		}
		</script>
		<script type="text/javascript">
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
		<div id="wrap">
		<%
		// DB접속
				String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
				String DB_ID = "multi";
				String DB_PASSWORD = "abcd";
				Class.forName("org.gjt.mm.mysql.Driver");
				Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		%>
			
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
						
			<div id="webnav">
				<p>메인 > 마이페이지 > 프로필수정</p>
			</div>
			<!--판매하기  -->
			<section>
                <div id="input">
                <%
                String jsql = "select * from member where m_id = ?";
                PreparedStatement pstmt = con.prepareStatement(jsql);
                pstmt.setString(1,loginID);
                ResultSet rs = pstmt.executeQuery();
                rs.next();
                	String nickname = rs.getString("m_nickname");
                	String name = rs.getString("m_name");
                	String birth = rs.getString("m_birth");
                	String phone = rs.getString("m_phone");
                	String addresscode = rs.getString("m_addresscode");
                	String address1 = rs.getString("m_address1");
                	String address2 = rs.getString("m_address2");
                	String email1 = rs.getString("m_email1");
                	String email2 = rs.getString("m_email2");
                	String introduce = rs.getString("m_introduce").replaceAll("&nbsp;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("<br>", "\n");
                %>
                    <form name="mypageform" method="post" action="mypage_modifyOK.jsp" id="mypageform">
					<input type="hidden" name="m_id" value="<%=loginID%>">
                    <div id="modifyTop">
                        <p>회원 프로필 수정</p>
                    </div>
                    <div id="modifyBorder">
                        <table id="table2">
                        	<tr>
                                <td class="col1">비밀번호</td>
                                <td class="col3" colspan="2">
                                    <input type="password" name="password1" class="inputGroup1" id="pwd">
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">비밀번호확인</td>
                                <td class="col3" colspan="2">
                                    <input type="password" name="password2" class="inputGroup1" id="repwd" onblur="checkPwd()">
                                    <div id="checkPwdText" style="font-weight:normal;font-size:10pt"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">닉네임</td>
                                <td class="col2">
                                    <input type="text" name="nickname" class="inputGroup1" value="<%=nickname%>" id="checkNickname">
                                    <input type="hidden" id="checkNicknamehidden" value="<%=nickname %>">
								<div id="checkNicknameText" style="font-weight:normal;font-size:10pt"></div>
                                </td>
                                <td class="col3">
									<div class="checkID"><img onclick="checkingNickname()" src="images/button/CheckNickname.png" class="btnStyle"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">이름</td>
                                <td class="col3" colspan="2">
                                    <input type="text" id="name" name="name" class="inputGroup1" value="<%=name%>">
                                    <!-- <a href="javascript:checkID()">
                                        <div class="checkID"></div>
                                    </a> -->
                                </td>
                                <!-- <td class="col3" style="border-left: 0;"></td> -->
                                <!--  <a href="javascript:checkID()"><div id="checkID"></div></a></td>
                                -->
                            </tr>
                            <tr>
                                <td class="col1">생년월일</td>
                                <td class="col3 " colspan="2"><input type="date" id="birth" name="birth" class="inputGroup1" placeholder="8~16자 영문, 숫자, 특수문자" size="21" value="<%=birth%>"></td>
                            </tr>
                            <tr>
                                <td class="col1">핸드폰</td>
                                <td class="col3" colspan="2"><input type="text" class="inputGroup1" id="phone" name="Phone" placeholder=" ' - ' 제외하고 공백없이 입력" maxlength="11" value="<%=phone%>"></td>
                            </tr>
                            <tr>
                                <td class="col1">이메일</td>
                                <td class="col3" colspan="2">
                                <input type="text" name="email1" class="inputGroup1" placeholder="example" size="21" style="width:137px" id="email1" value="<%=email1%>">&nbsp;@
                                <input type="text" name="email2" class="inputGroup1" placeholder="gmail.com" size="21" style="width:137px" id="email2" value="<%=email2%>">
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">우편번호</td>
                                <td class="col2"><input type="text" name="addressCode" class="inputGroup1" id="addressCode" placeholder="우편번호" size="5" style="width:140px" readonly value="<%=addresscode%>" disabled></td>
                                <td class="col3">
                                        <div class="checkID" id="checkCode"><img onclick="addressSearch()" src="images/button/searchZipcode.png" class="btnStyle" style="cursor:pointer;"></div>
                            </tr>
                            <tr>
                                <td class="col1">기본주소</td>
                                <td class="col3" colspan="2"><input type="text" name="address1" id="address1" class="inputGroup1" placeholder="주소" size="21"  readonly value="<%=address1%>" disabled></td>
                            </tr>
                            <tr>
                                <td class="col1">상세주소</td>
                                <td class="col3" colspan="2"><input type="text" name="address2" id="address2" class="inputGroup1" placeholder="상세주소" size="21" value="<%=address2%>" ></td>
                            </tr>
                            <tr>
                                <td class="col1">인삿말</td>
                                <td class="col4" colspan="2"><textarea placeholder="인삿말 작성" id="introduce" name="introduce"><%=introduce %></textarea></td>
                            </tr>
                            
                        </table>
                    
                        <div id="button">
                            <a href="javascript:submitform();" id="modifyButton">수정하기</a>
                            <a href="mypage.jsp?m_id=<%=loginID %>" id="backButton">돌아가기</a>
                        </div>

                    </div>
                        
                    </form>
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
			
			
			
			
			
	</body>
</html>