<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>MOM's Holic</title>
		<link href="css/sub_column.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="css/jquery.bxslider.min.css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="js/jquery.bxslider.min.js"></script>	
	</head>

	<body>
		<div id="wrap">
			<!--헤더-->
			<header id="header">
				<!--윗 네비게이션-->
				<div id="topNav">
					<ul>
						<li id="logo"><a href="index.html"><img src="images/Logo.png"></a></li>
						<li>
							<form>
								<input type="text" id="searchText" placeholder="검색어를 입력해 주세요.">
								<div id="searchButton"><a href="#"><img src="images/button/search.png"></a></div>
							</form>
						</li>
						<li id="log_register_customer">
							<a href="login.html">로그인</a>&nbsp;&nbsp;|&nbsp;
							<a href="register.html">회원가입</a>&nbsp;&nbsp;|&nbsp;
							<a href="#">고객센터</a>
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
								<li><a href="#"><img src="images/icon/shopping-cart.png"><p>전체</p></a></li>
								<li><a href="#"><img src="images/icon/baby-clothing.png"><p>의류</p></a></li>
								<li><a href="#"><img src="images/icon/baby-shoes.png"><p>신발</p></a></li>
								<li><a href="#"><img src="images/icon/book.png"><p>도서</p></a></li>
								<li><a href="#"><img src="images/icon/rubber-duck.png"><p>장난감/완구</p></a></li>
								<li><a href="#"><img src="images/icon/menu.png"><p>기타</p></a></li>
							</ul>
						</li>		
						<li id="mainlist2"><a href="#">MOM's 나눔터</a></li>
						<li id="mainlist3"><a href="#">MOM's 칼럼</a></li>
						<li id="mainlist4"><a href="#">MOM's 레시피</a></li>
						<li id="mainlist5"><a href="#">MOM's 일기</a></li>
						<li id="mainlist6"><a href="#">
								 물건 판매하기
						</a></li>
					</ul>
				</div>
				<div id="topline"></div>
			</header>
            
            <!--서브 키이미지, 사이트 경로-->
            <div id="subKeyimage">
				<img src="images/subpage/column/column_subimage.jpg">
                <h1>MOM's 칼럼</h1>
                <h2>전문가의 육아칼럼을 한 자리에</h2>
                <h3>메인 > MOM's 칼럼</h3>
            </div>

			<!-- 칼럼탑라인, 정렬순서 -->
			<section>
				<div id="topList">
					<h1>우리 아이를 위한 전문 육아 칼럼</h1>
					<form action="#" name="orderForm">
						<select name="orderSelect" onchange="order()">
							<option value="new">최신순</option>
							<option value="old">오래된순</option>
							<option value="like">좋아요순</option>
							<option value="hits">조회수순</option>
						</select>
					</form>
				</div>
				
				<!-- 칼럼그룹 -->
				<div id="columnGroup">
					<!-- 칼럼1 -->
					<div class="columnCard">
						<a href="sub_column_detail.html"><img src="images/column/colEx/ex1.png"></a>
						<div class="columnInfo">
							<a href="sub_column_detail.html"><h1 class="title">우리 아이가 친구들과 잘 어울리게 하려면</h1></a>
							<a href="sub_column_detail.html"><p class="preview">[연재] 일 가정 양립을 꿈꾸는 워킹대디의 육아칼럼토요일 오전에 업무가 있어서 출근했다가 오후 4시쯤 퇴근해 조용히 책이나 읽으려고 했더니 집에 오자마자 "우리 놀이터가서 놀자" 타령하는 나은공주. 딸래미</p></a>
							<div class="columnSubinfo">
								<div class="name_date">칼럼니스트 권성욱  | 2017.10.09 08:52</div>
								<div class="hits_like">조회수 <b class="hits">20</b> | 좋아요 <b class="like">10</b></div>
							</div>
						</div>
					</div>
					
					<!-- 칼럼2 -->
					<div class="columnCard">
						<a href="#"><img src="images/column/colEx/ex2.png"></a>
						<div class="columnInfo">
							<a href="#"><h1 class="title">갑작스러운 등원거부, 무엇이 문제일까?</h1></a>
							<a href="#"><p class="preview">첫 등원이라면 이해할 수 있겠지만, 갑작스러운 아이의 행동변화에 답답하고 안쓰럽고 속상하고 화도 난다. 잘 다니던 유치원 등원을 갑자기 거부한다면 다음과 같은 사항을 점검해보고 조치를 취해야 한다.</p></a>
							<div class="columnSubinfo">
								<span class="name_date">칼럼니스트 김정옥 | 2017.08.02 17:56</span>
								<span class="hits_like">조회수 <b class="hits">18</b> | 좋아요 <b class="like">9</b></span>
							</div>
						</div>
					</div>

					<!-- 칼럼3 -->
					<div class="columnCard">
						<a href="#"><img src="images/column/colEx/ex3.png"></a>
						<div class="columnInfo">
							<a href="#"><h1 class="title">아이에게 까꿍 놀이가 왜 중요할까요?</h1></a>
							<a href="#"><p class="preview">정신분석가 멜라니 클라인(Melanie Klein)에 의하면 영아가 경험하는 대상은 환상 속에서 존재합니다. 유아기에는 환상과 상상이 공존하고, 양육자의 돌봄과 정서적 교감으로 인해 외부 대상을 현실 대상으로 인식하면서 환상이 현실화 됩니다.</p></a>
							<div class="columnSubinfo">
								<div class="name_date">칼럼니스트 윤정원  | 2021.04.27 09:11</div>
								<div class="hits_like">조회수 <b class="hits">15</b> | 좋아요 <b class="like">8</b></div>
							</div>
						</div>
					</div>

					<!-- 칼럼4 -->
					<div class="columnCard">
						<a href="#"><img src="images/column/colEx/ex4.png"></a>
						<div class="columnInfo">
							<a href="#"><h1 class="title">아이의 시선에서 본 세상은 얼마나 큰 세상일까?</h1></a>
							<a href="#"><p class="preview">어느 날 아침이었다. 아이가 좋아하는 과일을 씻어 베이킹소다를 푼 물에다 잠시 담갔다. 보글보글거리는 물에다 담긴 포도를 만지작거리다 다가온 아이가 말했다. “엄마, 뭐야?” “응? 포도야~” “포도~ 포도.” 빨리 먹고 싶은지 재촉하는 아이에게 “기다려”, “금방 될거야” 내가 할 수 있는 발화와 몸짓으로 설명했다. 그래도 기다리기 싫은지 자꾸 빨리 달라는 표현을 하는 아이</p></a>
							<div class="columnSubinfo">
								<div class="name_date">칼럼니스트 이샛별 | 2021.04.20 08:57</div>
								<div class="hits_like">조회수 <b class="hits">12</b> | 좋아요 <b class="like">7</b></div>
							</div>
						</div>
					</div>

					<!-- 칼럼5 -->
					<div class="columnCard">
						<a href="#"><img src="images/column/colEx/ex5.png"></a>
						<div class="columnInfo">
							<a href="#"><h1 class="title">미국 초등학교의 영재·우등 프로그램 시험을 치러봤어요</h1></a>
							<a href="#"><p class="preview">두 아이를 미국에서 키우면서 나는 큰 아이는 만 4살이 될 때까지 기관에 보낸 적이 없고 작은 아이도 현재 만 3살이 됐지만 아직은 기관에 보내고 있지 않다. 게다가 주로 한인 인구가 많지 않은 도시에 살았거나 한인 인구</p></a>
							<div class="columnSubinfo">
								<div class="name_date">칼럼니스트 권성욱  | 2017-10-09 08:52</div>
								<div class="hits_like">조회수 <b class="hits">11</b> | 좋아요 <b class="like">6</b></div>
							</div>
						</div>
					</div>

					<!-- 칼럼6 -->
					<div class="columnCard">
						<a href="#"><img src="images/column/colEx/ex6.png"></a>
						<div class="columnInfo">
							<a href="#"><h1 class="title">모두가 다른 아이들, 협업을 통한 대처가 필요해요</h1></a>
							<a href="#"><p class="preview">매달 개별화교육회의를 진행합니다. 함께 모여 아이에 대한 고민을 나누는 편안한 자리가 되길 바라는 마음으로 늘 개별화교육회의를 진행하고 있습니다. 그럼에도 불구하고 실제 운영사례는 전문서적에서조차 구체적인 사례를 찾아보기가 어렵습니다.</p></a>
							<div class="columnSubinfo">
								<div class="name_date">칼럼니스트 이은 | 2021.04.09 07:41</div>
								<div class="hits_like">조회수 <b class="hits">10</b> | 좋아요 <b class="like">5</b></div>
							</div>
						</div>
					</div>

					<!-- 칼럼7 -->
					<div class="columnCard">
						<a href="#"><img src="images/column/colEx/ex7.png"></a>
						<div class="columnInfo">
							<a href="#"><h1 class="title">균형 있는 발달을 돕는 아기 마사지</h1></a>
							<a href="#"><p class="preview">아이의 성장발달을 효과적으로 돕기 위해서는 식사와 수면 등 기본적인 생활 습관에 신경을 써야 합니다. 잘 자고 잘 먹는 아기가 건강하게 자라는 것은 당연한 이치입니다. 여기에 하나 추가한다면 마사지나 지압</p></a>
							<div class="columnSubinfo">
								<div class="name_date">칼럼니스트 김소형  | 2021.04.01 09:17</div>
								<div class="hits_like">조회수 <b class="hits">9</b> | 좋아요 <b class="like">4</b></div>
							</div>
						</div>
					</div>

					<!-- 칼럼8 -->
					<div class="columnCard">
						<a href="#"><img src="images/column/colEx/ex8.png"></a>
						<div class="columnInfo">
							<a href="#"><h1 class="title">어린이에게도 '인생'이 있다</h1></a>
							<a href="#"><p class="preview">어린이가 어른의 반만 하다고 해서 어른의 반만큼 존재하는 것은 아니다. 어린이가 아무리 작아도 한 명은 한 명이다. 하지만 어떤 어른들은 그 사실을 깜빡하는 것 같다.”</p></a>
							<div class="columnSubinfo">
								<div class="name_date">칼럼니스트 최가을  | 2021.04.01 09:13</div>
								<div class="hits_like">조회수 <b class="hits">8</b> | 좋아요 <b class="like">2</b></div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-----------------페이징 영역----------------->
			<div id="paging">
				<ol class="paging">
					<li class="first"><a href="#a">첫페이지</a></li>
					<li class="prev"><a href="#a">이전페이지</a></li>
					<li class="on"><a href="#a">1</a></li>
					<li><a href="#a">2</a></li>
					<li><a href="#a">3</a></li>
					<li class="next"><a href="#a">다음페이지</a></li>
					<li class="last"><a href="#a">마지막페이지</a></li>
				</ol>
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
