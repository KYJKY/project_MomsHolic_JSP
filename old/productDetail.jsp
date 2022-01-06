<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>MOM's Holic</title>
		<link href="css/productDetail.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script>
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
		// DB접속
		String DB_URL = "jdbc:mysql://localhost:3306/momsholic";
		String DB_ID = "multi";
		String DB_PASSWORD = "abcd";
		Class.forName("org.gjt.mm.mysql.Driver"); 
 		Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
		request.setCharacterEncoding("UTF-8");
		
		String tp_id = request.getParameter("tp_id");
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
						<li id="logo"><a href="index.jsp"><img src="images/logo.png"></a></li>
						<li>
							<form>
								<input type="text" id="searchText" placeholder="검색어를 입력해 주세요.">
								<div id="searchButton"><a href="#"><img src="images/button/search.png"></a></div>
							</form>
						</li>
						<li id="log_register_customer">
						<div id="loginBar">
						<%
							// 로그인 세션 받기
							String loginID = null;
							if(session.getAttribute("loginSession")!=null){
								loginID = (String)session.getAttribute("loginSession");
							}
							// 로그인이 안 됐을 경우 메뉴 표시
							if(loginID==null){
						%>
							<a href="login.jsp">로그인</a>&nbsp;&nbsp;|&nbsp;
							<a href="register.jsp">회원가입</a>&nbsp;&nbsp;|&nbsp;
						<%
							}
							// 로그인이 됐을 경우 메뉴 표시
							else {
						%>
							<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;|&nbsp;
							<a href="mypage.jsp">마이페이지</a>&nbsp;&nbsp;|&nbsp;
						<%
							}
						%>
							<a href="#">고객센터</a>
						</div>
						<div id="profileBar">
						<%
						if(loginID!=null) {
						%>
								<div id="profileDiv">
									<p><%=loginID %>님</p>
								</div>
								<div id="messengerIcon"><a href="#"><img src="images/icon/messenger.png"><p>맘스톡</p></a></div>
								<div id="bellIcon"><a href="#"><img src="images/icon/bell.png"><p>알림</p></a></div>
						<%
						}
						%>
						</div>
						</li>
					</ul>
				</div>
				<div id="topline"></div>
				
				<!--아래 네비게이션-->
				<div id="bottomNav">
					<ul id="mainmenu">
						<li id="mainlist1"><a href="#">
								<img src="images/categorySymbol.PNG" id="category1">
								<p id="category2">MOM's 마켓</p>
								<img src="images/categorySymbol2.png" id="category3">
							</a>
							<ul id="submenu">
								<li><a href="category.jsp?ctg=all"><img src="images/icon/shopping-cart.png"><p>전체</p></a></li>
								<li><a href="category.jsp?ctg=clothes"><img src="images/icon/baby-clothing.png"><p>의류</p></a></li>
								<li><a href="category.jsp?ctg=shoes"><img src="images/icon/baby-shoes.png"><p>신발</p></a></li>
								<li><a href="category.jsp?ctg=book"><img src="images/icon/book.png"><p>도서</p></a></li>
								<li><a href="category.jsp?ctg=toy"><img src="images/icon/rubber-duck.png"><p>장난감/완구</p></a></li>
								<li><a href="category.jsp?ctg=etc"><img src="images/icon/menu.png"><p>기타</p></a></li>
							</ul>
						</li>		
						<li id="mainlist2"><a href="#">MOM's 나눔터</a></li>
						<li id="mainlist3"><a href="#">MOM's 칼럼</a></li>
						<li id="mainlist4"><a href="#">MOM's 레시피</a></li>
						<li id="mainlist5"><a href="#">MOM's 일기</a></li>
						<li id="mainlist6"><a href="sell.jsp">
								 물건 판매하기
						</a></li>
					</ul>
				</div>
				<div id="topline"></div>
			</header>

			<!-- 사이트 경로 -->
			<div id="webnav">
				<p>메인 > 판매하기</p>
			</div>

			<!------------------상세보기 영역----------------->
			<section id="line1">
				<div id="productImg">
					<img src="<%=img%>">
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
						<a href="#"><div id="dibsButton">찜하기♥</div></a>
						<a href="payment.jsp?tp_id=<%=tp_id%>"><div id="dealButton">거래하기</div></a>
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
									<h2><%=otherpost %></h2></a>
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
					<div>
						<h2><%=nickname %>(<%=m_id %>)</h2>
						<p>인삿말 <br><%=introduce %></p>
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
			
			
			
			
			
	</body>
</html>