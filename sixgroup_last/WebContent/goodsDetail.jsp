<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/301043e4a8.js"
	crossorigin="anonymous"></script>
<title>GoodsDetail Page</title>
<link rel="icon" type="image/png" href="image/icia-logo.png">
<link rel="stylesheet" href="css/style_goods.css">
</head>
<body onload="init()">
	<!-- Header -->
	<header id="header">
		<div class="search">
			<span class="search__logo"> <a href="https://www.icia.co.kr/"><img
					id="logo2" src="image/icia-logo2.png"></a>
			</span> <span class="search__input"> <input type="text" name="word"
				id="word">
				<button type="button" onclick="searchGoods()" id="button">
					<i class="fas fa-search"></i>
				</button>
			</span>
		</div>
	</header>

	<!-- Section -->
	<section id="goodsdeatil">
		<!-- 상품정보 -->
		<div id="title">
			<!-- 상품이미지 -->
			<div id="goodsImg" class="goodsinfo">
				<img id="goodsImg__img" src="${goodsImage}">
			</div>
			<!--상품개요  -->
			<div id="goodsSummary" class="goodsinfo">
				<!-- 상품명 -->
				<div id="goods-name">${item }</div>
				<!-- 상품가격 -->
				<div id="goods-price">${price }원</div>
				<!-- 상품옵션선택 -->
				<div id="option">
					<div class="option__label">
						<label for="opt">옵션선택</label>
					</div>
					<div class="option__select">
						<input type="text" name="opt" class="opt" id="increase" value="1"
							readOnly /> <input type="button" value="+" class="opt"
							onClick="increase(1)" /> <input type="button" value="-"
							class="opt" onClick="increase(-1)" />
					</div>
				</div>
				<!-- 장바구니 | 구매하기 -->
				<div id="order">
					<!-- 서버 -->
					<span class="order__Btn"><input class="order__input c1"
						type="button" value="장바구니" onClick="order(true,'${gInfo}')"></span>
					<span class="order__Btn"><input class="order__input c2"
						type="button" value="주문하기" onClick="order(false,'${gInfo}')"></span>
				</div>
			</div>
		</div>
		<!-- 상품상세정보 :: image -->
		<div id="detail">
			<div id="detail__img">
				<img src="${detailImage }">
			</div>
			<div id="detail__seller">${seller }</div>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<span class="footer__icon"><a href="https://www.icia.co.kr/"><img
				id="footer__icon" src="image/icia-logo.png" alt=""></a></span> <span
			class="footer__rights">Copyright <b>Sookyeong Lee.</b> All
			Rights Reserved.
		</span>
	</footer>
</body>
<script>
		
	function init() {
		var mType = "${mType}";
		var message = "${message}";
		var check;
		if(mType){
			check = confirm(message);
			if(check){
				var gInfo = "${gInfo}";
				var info = gInfo.split(":");
				
				var form = document.createElement("form");
				form.action = "BasketCheck?gInfo=" + info[0];
				form.method = "post";
				document.body.appendChild(form);
				form.submit();
			}
		}else{
			alert(message);
		}
		
	}
	
	function increase(n) {
		var text = document.getElementById("increase");
		text_val = parseInt(text.value);
		text_val += n;
		text.value = text_val;
		if(text_val <= 0){
			   text.value = 1; 
			   }
		if(text_val > 5){
			text.value = 5; 
		}
	}
		
		function order(type, gInfo){
			
			var form = document.createElement("form");
			form.method="post";
			form.action=(type)? "Basket":"Joomoon";
			//gInfo --> id:gocode:secode
			var info = gInfo.split(":");
			for(index=0; index<info.length; index++){
				var input =document.createElement("input");
				input.name ="gInfo";
				input.value=info[index];
				form.appendChild(input);
				
			}
			form.appendChild(document.getElementsByName("opt")[0]);
			
			document.body.appendChild(form);
			form.submit();
		}
		function searchGoods(){
			var f=document.createElement("form");
			f.action = "Search";
			f.method = "post";
			f.appendChild(document.getElementsByName("word")[0]);
			
			document.body.appendChild(f);
			f.submit();
		}
		
		
	</script>
</html>