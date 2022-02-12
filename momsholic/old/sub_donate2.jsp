<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>MOM's Holic</title>
		<link href="css/sub_donate2.css" rel="stylesheet" type="text/css">
		<link href="css/base.css" rel="stylesheet" type="text/css">
		<link href="css/header.css" rel="stylesheet" type="text/css">
		<link href="css/footer.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="css/jquery.bxslider.min.css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="js/jquery.bxslider.min.js"></script>	
		<script> 
			

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

			//응모 남은시간
			var remain1 = 20; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
			var remain2 = 4; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
			var remain3 = 1; //응모 남은시간(초) 나중에 jsp로 받아와서 넣기
			
			var hour1= ""; //시
			var min1 = ""; //분
			var sec1 = ""; //초

			var hour2= ""; //시
			var min2 = ""; //분
			var sec2 = ""; //초
			
			var hour3= ""; //시
			var min3 = ""; //분
			var sec3 = ""; //초

			//setInterval(함수, 시간) : 주기적인 실행
			var timer1 = setInterval(function() {
				//parseInt() : 정수를 반환
				min1 = parseInt(remain1/60)%60;//분
				sec1 = remain1%60; //초
				hour1 = parseInt(remain1/60/60); //시간 

				document.getElementById("remainTime1").innerHTML =hour1 + ":" + min1 + ":" + sec1 + "";
				remain1--;

				//타임아웃 시
				if (remain1 < 0) {
					clearInterval(timer1); //setInterval() 실행을 끝냄
					document.getElementById("remainTime1").innerHTML = "응모종료";
					$("#entryButton1").css({"display":"none"});
				}
			}, 1000);

			var timer2 = setInterval(function() {
				//parseInt() : 정수를 반환
				min2 = parseInt(remain2/60)%60;//분
				sec2 = remain2%60; //초
				hour2 = parseInt(remain2/60/60); //시간 

				document.getElementById("remainTime2").innerHTML =hour2 + ":" + min2 + ":" + sec2 + "";
				remain2--;

				//타임아웃 시
				if (remain2 < 0) {
					clearInterval(timer2); //setInterval() 실행을 끝냄
					document.getElementById("remainTime2").innerHTML = "응모종료";
					$("#entryButton2").css({"display":"none"});
				}
			}, 1000);

			var timer3 = setInterval(function() {
				//parseInt() : 정수를 반환
				min3 = parseInt(remain3/60)%60;//분
				sec3 = remain3%60; //초
				hour3 = parseInt(remain3/60/60); //시간 

				document.getElementById("remainTime3").innerHTML =hour3 + ":" + min3 + ":" + sec3 + "";
				remain3--;

				//타임아웃 시
				if (remain3 < 0) {
					clearInterval(timer3); //setInterval() 실행을 끝냄
					document.getElementById("remainTime3").innerHTML = "응모종료";
					$("#entryButton3").css({"display":"none"});
				}
			}, 1000);
		</script>
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
				<img src="images/subpage/donate/donate_subimage2.jpg">
                <h1>MOM's 나눔터</h1>
                <h2>이웃에게 사랑을 나눠주세요</h2>
                <h3>메인 > MOM's 나눔터 > 응모하기</h3>
            </div>

            <!-- 기부/응모 전환탭 -->
            <div id="manuTab">
                <a href="sub_donate.html"><div id="donateTab">물품 기부하기</div></a>
                <a href="sub_entry.html"><div id="entryTab">응모하기</div></a>
            </div>

            <!-- "물품 응모 신청", 개요/이미지 -->
            <section id="summary">
                <h1>물품 응모하기</h1>
                <div class="underline"></div>
                <h2>기부물품을 응모해보세요! 싼 값에 기부물품을 구매할 수 있습니다. 구매금액은 국내외 소외 이웃과 빈곤가정을 위해 사용됩니다. </h2>
                <img src="images/subpage/entry/donate2_summary.jpg">
            </section>

            <!-- 물품 응모 과정 / 응모물품 카드-->
            <section id="process">
                <h1>물품 응모 과정</h1>
                <img src="images/subpage/entry/donate2_process.jpg">

				<h1>이번 주 응모 물품이에요!</h1>
				<div id="entryDiv">
					<!-- 응모카드1 -->
					<div class="entryCard">
						<img src="images/product/ex1.png">
						<div class="entryInfo">
							<p class="entryTitle">뉴나 레블 플러스 회전형</p>
							<p class="priceText">응모 할인가</p>
							<div class="entryPrice"><h2 class="beforePrice"><del>210,000원</del></h2><h2 class="afterPrice">21,000원</h2></div>
						</div>
						<div class="entryTime">
							<p class="timeText">응모까지 남은 시간</p>
							<h1 id="remainTime1">로딩 중..</h1>
							<a href="#" id="entryButton1">응모하기</a>
						</div>
					</div>

					<!-- 응모카드2 -->
					<div class="entryCard">
						<img src="images/product/ex2.png">
						<div class="entryInfo">
							<p class="entryTitle">콤비 F2 알파 유모차</p>
							<p class="priceText">응모 할인가</p>
							<div class="entryPrice"><h2 class="beforePrice"><del>150,000원</del></h2><h2 class="afterPrice">15,000원</h2></div>
						</div>
						<div class="entryTime">
							<p class="timeText">응모까지 남은 시간</p>
							<h1 id="remainTime2">로딩 중..</h1>
							<a href="#" id="entryButton2">응모하기</a>
						</div>
					</div>

					<!-- 응모카드3 -->
					<div class="entryCard">
						<img src="images/product/ex3.png">
						<div class="entryInfo">
							<p class="entryTitle">헬로카봇 스타블래스터</p>
							<p class="priceText">응모 할인가</p>
							<div class="entryPrice"><h2 class="beforePrice"><del>82,000원</del></h2><h2 class="afterPrice">8,200원</h2></div>
						</div>
						<div class="entryTime">
							<p class="timeText">응모까지 남은 시간</p>
							<h1 id="remainTime3">로딩 중..</h1>
							<a href="#" id="entryButton3">응모하기</a>
						</div>
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


			<!----------------------------------팝업---------------------------------- -->
			<div class="popup">
				<h2>물품 기부 신청</h2>
				<div class="con">
					<table class="type1">
						<colgroup>
							<col style="width: 111px">
							<col>
						</colgroup>
						<tbody>  
							<tr>
								<th><label for="txt1">제품이름</label></th>
								<td><input type="text" id="txt1" placeholder="이름을 입력해 주세요."></td>
							</tr>
							<tr>
								<th><label for="txt2">수량</label></th>
								<td><input type="number" id="txt2" placeholder="숫자만 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for="txt3">메모</label></th>
								<td><textarea id="txt3" placeholder="기부물품의 특이사항을 적어주세요."></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="txt_center">
					<a href="#a" class="btn_type1">신청하기</a>
				</div>
				<a href="#a" class="close">닫기</a>
			</div>
			<div class="dim" style="display: none;"></div>
		</div>
			
			
			
			
			
	</body>
</html>
