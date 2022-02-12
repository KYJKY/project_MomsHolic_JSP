<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>MOM's Holic</title>
		<link href="css/sub_column_detail.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script language="javascript" src="js/login.js" charset="UTF-8"></script>
	</head>

	<body onLoad="login_focus()">
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
							<div id="profileBar">
								<p>멀티미디어님</p>
								<div id="messengerIcon"><a href="#"><img src="images/icon/messenger.png"><p>맘스톡</p></a></div>
								<div id="bellIcon"><a href="#"><img src="images/icon/bell.png"><p>알림</p></a></div>
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
			<!-- 웹경로 -->
			<div id="webnav">
				<p>메인 > MOM's칼럼 > 칼럼읽기</p>
			</div>

			<!-- ----------------칼럼-------------- -->
			<section id="column">
				<!--칼럼제목/정보  -->
				<div class="columnInfo">
					<h1 class="title">우리 아이가 친구들과 잘 어울리게 하려면</h1>
					<p class="info">칼럼니스트 권성욱  |  2017.10.09 08:52  |  좋아요 10  |  조회수 20</p>
				</div>
				<div class="columnBody">
					<p>[연재] 일 가정 양립을 꿈꾸는 워킹대디의 육아칼럼
						토요일 오전에 업무가 있어서 출근했다가 오후 4시쯤 퇴근해 조용히 책이나 읽으려고 했더니 집에 오자마자 "우리 놀이터가서 놀자" 타령하는 나은공주. 딸래미 성화에 이길 아빠는 없죠.</p>
					<p>더위가 한풀 꺾인 선선한 가을 날씨라서 아파트 놀이터에는 아이들이 제법 나와 있었습니다. 빨간색 옷을 입은 서너 살 돼 보이는 꼬맹이부터 제법 큰 언니까지. 하나같이 모르는 얼굴들이지만 나은공주는 스스럼없이 다가가서는 어느 사이 함께 어울립니다. 깔깔대면서 술래잡기도 하고 '무궁화 꽃이 피었습니다' 놀이도 합니다. 어떤 언니가 가져온 초코파이를 하나 얻어서 맛나게 먹었습니다. 옆에서 아빠가 기다리는 것은 아랑곳없이 시간 가는 줄 모르고 신나게 놉니다.</p>
					<p>
						어떻게 하면 처음 보는 아이들과 저렇게 잘 어울릴 수 있을까. 유치원에서도 "나은이는 사회성이 참 좋아요"라고 말합니다. 친구들 잘 챙기고 누가 싸우면 가운데에서 중재하기도 합니다. 어린 동생이 넘어지면 일으켜 세워주고 울지마 다독거립니다. 좋아하는 선생님에게는 "저는요. 선생님이 제일 좋아요"라고 자기 마음을 표현할 줄 압니다. 나은공주는 그렇게 외향적인 성격도 아니고 아빠 닮아서 숫기도 많은 편입니다. 때로는 친구 때문에 상처받는 일도 합니다. 하지만 교우관계가 원만하고 무슨 일이건 그다지 마음에 두지 않아 선생님도 친구들도 다 좋아합니다. 겨우 7살인데도 친구의 얘기를 잘 들어주고 남의 감정에 공감할 줄 압니다. 타고나기를 숫기 많고 상처 잘 받는 아빠로서는 신기하기도, 부럽기도 합니다.</p>
					<p>흔히 어른들은 "원래 아이들은 어른과 달리 쉽게 어울리고 뛰어논다"라고 생각하지만 착각입니다. 아이들의 인간 관계 또한 어른들과 크게 다르지 않습니다. 타인과의 상호 작용을 거의 하지 않는 두 살, 세 살이라면 몰라도 어느 정도 사리 분별을 하는 대여섯 살만 돼도 낯설면 경계하고 자기와 맞지 않으면 싫어합니다. 오히려 아이들은 자기 마음에 충실하기 때문에 속내와 상관없이 적당히 남에게 맞춰 주는 어른들보다 훨씬 호불호가 분명합니다. 따라서 남들이 부러워 할 만큼 친구들과 잘 어울리는 아이가 있는가 하면 친구 관계에 심한 어려움을 겪는 아이들도 있죠. 요즘 초등학교나 중학교에서 왕따 문제가 심각하게 대두되고 있지만 정도의 차이가 있을 뿐 유치원에도 왕따가 있습니다.</p>
					<p>우리 아이가 친구들과 잘 지내기를 바라는 것은 모든 부모들의 바람이죠. 하지만 모든 아이가 그렇지는 못합니다. 나은공주가 다니는 유치원만 해도 교우관계에 어려움을 겪는 아이들을 봅니다. 심지어 서울 강남에는 친구 사귀는 법을 가르치는 학원도 따로 있다고 하죠. 그만큼 인간 관계란 아이나 어른이나 쉽지 않다는 얘기이죠. 하지만 대수롭게 여겨서는 안 됩니다. 어른들도 직장 생활에서 가장 큰 어려움이 업무가 아니라 '상사나 주변 동료와의 관계'를 꼽듯, 친구들과 제대로 지내지 못하는 아이들은 오죽 힘들겠습니까.</p>
					<p>
						사회성이 좋은 아이와 그렇지 못한 아이의 차이는 어디에 있을까. 바로 '자존감'에 있습니다. 자아존중감, 즉 자존감이란 진심으로 나 자신을 사랑하고 소중하게 여기는 마음입니다. 아무리 힘든 일이 있어도 물러서지 않는 자신감, 끈기, 의지력, 타인에 대한 당당함 모두 자존감에서 나옵니다. 이것은 겉으로 드러내는 자존심과는 엄연히 다릅니다. 자존감이 낮은 사람들이 오히려 자존심은 강한 경우가 많습니다. 자신의 낮은 자존감을 남들에게 감추려는 일종의 '방어기제'가 작용하기 때문입니다. 주변의 사소한 장난이나 농담 한마디에도 금세 발끈해 민감하게 반응하는 사람은 자존감이 낮은 사람입니다. 반대로 자기 주관없이 남이 하자는대로 따라하는 사람, 남의 비위에 맞추려는 사람 역시 자존감이 낮은 사람이죠.</p>
					<p>이런 사람들일수록 타인에 대한 공감능력이 떨어지며 내가 남에게 상처를 주는 것에는 둔감하면서 남이 나에게 상처 주는 것은 참지 못합니다. 사람의 관계란 서로의 존중에서 비롯되는데 나는 존중하지 않으면 남으로부터 존중받기만 원한다면 갈등이 되는 것은 당연합니다. 매사 자기 중심적이거나 반대로 줏대 없이 그저 주변에 휘둘리는 사람은 남에게 쉽게 상처를 주고 자신도 쉽게 상처를 받습니다. 결국 서로 상처를 받지 않으려고 남도 나를 피하게 되고 나도 남을 피하게 됩니다.</p>
				</div>
				<div class="columnImg">
					<img src="images/column/colEx/ex1.jpg">
				</div>
				<div class="likeButtonDiv">
					<a href="#" class="likeButton">좋아요 10</a>
				</div>

			</section>

			<!-- --------------댓글영역------------ -->
			<section id="comment">
				<h1>댓글 n</h1> <!--n=댓글 수-->
				<div id="commentInput">
					<textarea placeholder="댓글을 입력해주세요."></textarea>
					<a href="#"><div id="commentButton">입력하기</div></a>
				</div>
				
				<div id="commentGroup">
					<!--댓글1  -->
					<div class="commentInfo">
						<h1>닉네임</h1>
						<h2>2021-03-10 09:12</h2>
					</div>
					<p>내용 123456790 가나다라마바사아다가타카타하하가나바갖가날마</p>
					
					<!--댓글1  -->
					<div class="commentInfo">
						<h1>닉네임</h1>
						<h2>2021-03-10 09:12</h2>
					</div>
					<p>내용 123456790 가나다라마바사아다가타카타하하가나바갖가날마</p>
					
					<!--댓글1  -->
					<div class="commentInfo">
						<h1>닉네임</h1>
						<h2>2021-03-10 09:12</h2>
					</div>
					<p>내용 123456790 가나다라마바사아다가타카타하하가나바갖가날마</p>
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