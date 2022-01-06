<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<img src="images/subpage/recipe/recipe_subimage.jpg">
                <h1>MOM's 레시피</h1>
                <h2>우리 아이를 위한 균형잡힌 레시피</h2>
                <h3>메인 > MOM's 레시피 > 초기이유식</h3>
            </div>

            <!-- 기부/응모 전환탭 -->
            <div id="manuTab">
				<ul>
					<li id="nowpage"><a href="sub_recipe.html">초기 이유식</a></li>
					<li class="otherpage"><a href="sub_recipe2.html">중기 이유식</a></li>
					<li class="otherpage"><a href="sub_recipe3.html">후기 이유식</a></li>
					<li class="otherpage"><a href="sub_recipe4.html">완료기 이유식</a></li>
					<li class="otherpage"><a href="sub_recipe5.html">유아식</a></li>
					<li class="otherpage"><a href="sub_recipe6.html">아이간식</a></li>
				</ul>
            </div>

            <section>
				<div id="topList">
					<h1 class="title">초기 이유식 <span id="month">생후 4~6개월</span></h1>
					<!-- <form action="#" name="orderForm">
						<select name="orderSelect" onchange="order()">
							<option value="like">좋아요순</option>
							<option value="hits">조회수순</option>
						</select>
					</form> -->
				</div>

				<!-- 레시피 그룹 -->
				<div id="recipeGroup">
					<!-- 레시피1 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex1.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">초기, 중기 이유식으로도 좋고 남녀노소 누구나 좋아하는 단호박 죽</h1></a>
							<a href="#"><p class="preview">만들기 쉬운 단호박 죽은 남녀노소는 물론 초기, 중기 이유식으로도 좋고 강아지들에게도 정말 좋은 음식입니다. 강아지들에게도 자주 해주는 음식입니다.</p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 단호박 1개, 쌀 1종이컵, 물</div>
							</div>
						</div>
					</div>
					<!-- 레시피2 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex2.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">아기 첫 이유식 10배죽 찹쌀미음 레시피 (베이비무브쿡미스터)</h1></a>
							<a href="#"><p class="preview">베이비 무브 쿡 마스터를 사용하여
								10배죽 찹쌀미음을 만들어봅시다!</p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 찹쌀 20g, 끓였다식힌 물 200g</div>
							</div>
						</div>
					</div>
					<!-- 레시피3 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex4.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">각종 과일퓨레(배, 바나나, 사과)</h1></a>
							<a href="#"><p class="preview">과일로 만든 퓨레는 쌀미음 시작 한 후에
								먹어야 채소를 싫어하지 않는 아이로 자랄 수 있어요!
								풍부한 비타민이 들어있는 과일미음으로
								우리아이 다양한 이유식을 만들어 보세요!</p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 배 100g, 바나나 100g, 사과 100g, 물 250ml</div>
							</div>
						</div>
					</div>
					<!-- 레시피4 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex3.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">채소미음, 애호박고구마미음, 단호박브로콜리미음</h1></a>
							<a href="#"><p class="preview">변비에 좋은 고구마와 비타민이 많은 브로콜리를 이용한
								이유식으로 걱정없이 이유식 시작해보세요!</p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 불린 쌀 30g, 애호박 20g, 고구마 10g, 물 300ml</div>
							</div>
						</div>
					</div>
					<!-- 레시피5 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex5.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">부드럽고 고소한 두부참깨 이유식</h1></a>
							<a href="#"><p class="preview">자칫하면 밋밋한 죽으로 변할 수 있는 이유식에 뭘 넣으면 좋을지 고민하다가, 고소한 참깨와 두부를 넣고 만들게 되었습니다.</p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 두부 1/4모, 참깨 조금, 쌀밥 100g</div>
							</div>
						</div>
					</div>
					<!-- 레시피6 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex6.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">초기이유식1단계 청경채미음</h1></a>
							<a href="#"><p class="preview">청경채는 칼슘이 풍부해서 성장기 아기에게 좋은 식재료라고 하네요. 치아와 골격 형성에 도움을 주고 세포조직도 튼튼하게 한답니다.</p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 쌀 16g, 청경채 13g, 물 330ml</div>
							</div>
						</div>
					</div>
					<!-- 레시피7 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex7.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">고소한 고구마미음 만들기</h1></a>
							<a href="#"><p class="preview">아기들마다 채소에 따라 거부하는 종류가 다르기에 순서는 중요하지 않은데요. 단맛이 있는 채소는 조금 늦게 많이들 해요. 단맛에 길들여지면 다른 이유식은 좋아하지 않는 아이들이 많거든요. </p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 불린 멥쌀 15g, 찐 고구마 20g</div>
							</div>
						</div>
					</div>
					<!-- 레시피8 -->
					<div class="recipeCard">
						<a href="#"><img src="images/recipe/recipeEx/ex8.png"></a>
						<div class="recipeInfo">
							<a href="#"><h1 class="recipeTitle">초기이유식 다양한 소고기미음!</h1></a>
							<a href="#"><p class="preview">고기에 너무 익숙하지 않게 다양한 재료를 넣어 만드는
								소고기 미음! 이유식의 고민하는 초보맘들을 위해!</p></a>
							<div class="recipeSubinfo">
								<div class="hits_like">[재료] 불린 쌀 30g, 소안심 20g, 무 20g, 물 300ml, 애호박 10g, 단호박 10g</div>
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
