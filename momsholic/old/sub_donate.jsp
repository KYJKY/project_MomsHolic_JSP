<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>MOM's Holic</title>
		<link href="css/sub_donate.css" rel="stylesheet" type="text/css">
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
                <h3>메인 > MOM's 나눔터 > 물품 기부하기</h3>
            </div>

            <!-- 기부/응모 전환탭 -->
            <div id="manuTab">
                <a href="sub_donate.html"><div id="donateTab">물품 기부하기</div></a>
                <a href="sub_donate2.html"><div id="entryTab">응모하기</div></a>
            </div>

            <!-- "물품기부 신청", 개요/이미지 -->
            <section id="summary">
                <h1>물품기부 신청</h1>
                <div class="underline"></div>
                <h2>기부물품은 맘스홀릭 나눔터에서 응모판매되며, 그 수익금은 국내외 소외 이웃과 빈곤가정을 위해 사용됩니다.</h2>
                <img src="images/subpage/donate/donate_summary.png">
            </section>

            <!-- 물품기부 과정 / 물품기부 방법-->
            <section id="process">
                <h1>물품기부 과정</h1>
                <img src="images/subpage/donate/donate_process.png">

                <h1>물품기부 방법</h1>
                <p>맘스홀릭 물품기부 신청하기 접수, 물품기부 담당자와 연락 후 발송</p>
                <p>담당자 연락처 : 02-0000-0000</p>
                <p>사전 연락 없이 물품을 보내주시면 필요한 물품이 아니거나 보관 장소가 없는 경우 곤란을 겪게 됩니다.</p>
                <!-- 물품기부 버튼-->
                <a href="#a" class="open" id="donateButton"><div id="buttonDiv">물품기부 신청하기</div></a>
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
