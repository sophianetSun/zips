<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매/구매 진행중인 게시판 보기</title>
<style type="text/css">
	td:first-child {
	width: 20%;
}
	td:nth-child(1) {
	width: 20%;
}
	td:last-child {
	width: 80%;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#confirm').click(function(){
			
			if($(this).val() == 'shop_seller_confirm') {			
				
				var shop_no = ${shop.shop_no}
				var confirmType = 'shop_seller_confirm';
				
				$.post("checkConfirm.zips", { shop_no : shop_no, confirmType : confirmType }, function(data, status) {
					console.log(data);
				
					if(data == '0') {
						$.post("confirmShop.zips", { shop_no : shop_no, confirmType : confirmType }, function(data, status) {
							alert('인계 확인 하였습니다.');
							location.href="list.zips";
						})
					} else {
						alert('처리가 완료된 상태입니다.');
						location.href="list.zips";
					}
				});
			}
			
			if($(this).val() == 'shop_buyer_confirm') {			
				
				var shop_no = ${shop.shop_no};
				var confirmType = 'shop_buyer_confirm';
				var coin = ${shop.shop_price};
				var shop_seller_id = '${shop.shop_seller_id}';
				
				$.post("checkConfirm.zips", { shop_no : shop_no, confirmType : confirmType }, function(data, status) {
					console.log(data);
				
					if(data == '0') {
						$.post("confirmShop.zips", { shop_no : shop_no, confirmType : confirmType, coin : coin, shop_seller_id : shop_seller_id }, function(data, status) {
							console.log(data);
							alert('인수 확인 하였습니다.');
							location.href="list.zips";
						})
					} else {
						alert('처리가 완료된 상태입니다.');
						location.href="list.zips";
					}
				});
			}
			
		});
		
		var seller_table = "<table class='table table-bordered'>";
		seller_table += "<tr><td>아이디</td><td>" + "${sellerUser.id}" + "</td></tr>";
		seller_table += "<tr><td>이름</td><td>" + "${sellerUser.name}" + "</td></tr>";
		seller_table += "<tr><td>닉네임</td><td>" + "${sellerUser.nickname}" + "</td></tr>";
		seller_table += "<tr><td>전화번호</td><td>" + "${sellerUser.tel}" + "</td></tr>";
		seller_table += "<tr><td>주소</td><td>" + "${sellerUser.address}" + "</td></tr></table>";	
	
		$('#seller').html(seller_table);
	
	var buyer_table = "<table class='table table-bordered'>";
		buyer_table += "<tr><td>아이디</td><td>" + "${buyerUser.id}" + "</td></tr>";
		buyer_table += "<tr><td>이름</td><td>" + "${buyerUser.name}" + "</td></tr>";
		buyer_table += "<tr><td>닉네임</td><td>" + "${buyerUser.nickname}" + "</td></tr>";
		buyer_table += "<tr><td>전화번호</td><td>" + "${buyerUser.tel}" + "</td></tr>";
		buyer_table += "<tr><td>주소</td><td>" + "${buyerUser.address}" + "</td></tr></table>";	
	
		$('#buyer').html(buyer_table);
	
	$('#shop_seller_id').click(function() {
		if($('#shop_seller_id').text()=='-'){
			$('#seller').attr("style","display:none");
			$('#shop_seller_id').text('+');
		}else{
			$('#seller').attr("style","display:block");
			$('#shop_seller_id').text('-');
		}
	})
	
	$('#shop_buyer_id').click(function() {
		if($('#shop_buyer_id').text()=='-'){
			$('#buyer').attr("style","display:none");
			$('#shop_buyer_id').text('+');
		}else{
			$('#buyer').attr("style","display:block");
			$('#shop_buyer_id').text('-');
		}
	})
	
	$('#buyerdealcancel').click(function(){
		alert('구매를 취소하셨습니다.');
	})
	
	$('#sellerdealcancel').click(function(){
		alert('판매를 취소하셨습니다.');
	})

});
	
	
	
</script>

</head>
<body> 
<div class="blog-post">
		<input type="text" name="quantity" id="quantity">

		<input type="text" name="quantity2" id="quantity2">
		
		<h2 class="blog-post-title">구매정보 확인</h2>
		<p class="blog-post-meta">
			<fmt:formatDate value="${shop.shop_regdate}"
				pattern="yyyy-MM-dd HH:mm" />
		</p>
		<hr>
		<blockquote>
			<div align="center">&nbsp;
				<h2>판매자 회원 정보 <button type="button" id="shop_seller_id" name="shop_seller_id">-</button> </h2>
				<div id="seller"></div>
			</div>
		</blockquote>
		</div>
		<blockquote>
			<div align="center">
				<h2>구매자 회원 정보 <button type="button" id="shop_buyer_id" name="shop_buyer_id">-</button> </h2>
				<div id="buyer"></div>
			</div> 
		</blockquote>
		<blockquote>
			<div align="center">
				<h2>결제 정보</h2>
				<table class='table table-bordered'>
					<tr><td>결제 코인</td>
						<td>${shop.shop_price} Coin</td></tr>
				</table>
			</div>
		</blockquote>
		<br>
		<hr>
		
		<div class="row">
		<div align="right" style="height: 100px; width: 50%;">
			<!-- 판매자 아이디 == 로그인 유저 아이디 -->
			<c:if test="${shop.shop_seller_id == loginUser.id }">
				<button type="button" class="btn btn-sm btn-outline-primary"
					style="width: 100px; height: 50px;" id="confirm" name="shop_seller_confirm"
					value="shop_seller_confirm">
					인계 확인
				</button>
			</c:if>
			
			<!-- 구매자 아이디 == 로그인 유저 아이디 -->
			<c:if test="${shop.shop_buyer_id == loginUser.id}">
				<button type="button" class="btn btn-sm btn-outline-primary" id="confirm" name="shop_buyer_confirm"
					value="shop_buyer_confirm" 
					style="width: 100px; height: 50px; font-weight: bold;">
					인수 확인
				</button>
			</c:if>
			
		</div>
		<div align="left" style="height: 100px; width: 50%;">	
			<!-- 판매자 아이디 == 로그인 유저 아이디 -->
			<c:if test="${shop.shop_seller_id == loginUser.id }">
			<form action="dealcancel.zips?shop_no=${shop.shop_no}" method="post">
			<input type="hidden" name="coin" value="${shop.shop_price}">
			<input type="hidden" name="shop_id" value="${shop.shop_seller_id}">
			<button type="submit" id="sellerdealcancel" class="btn btn-sm btn-outline-danger" 
						style="width: 100px; height: 50px; font-weight: bold;">
							판매 취소
			</button>
			</form>
			</c:if>
			<!-- 구매자 아이디 == 로그인 유저 아이디 -->
			<c:if test="${shop.shop_buyer_id == loginUser.id}">
			<form action="dealcancel.zips?shop_no=${shop.shop_no}" method="post">
			<input type="hidden" name="coin" value="${shop.shop_price}">
			<input type="hidden" name="shop_id" value="${shop.shop_buyer_id}">
			<button type="submit" id="buyerdealcancel" class="btn btn-sm btn-outline-danger" 
						style="width: 100px; height: 50px; font-weight: bold;">
							구매 취소
			</button>
			</form>
			</c:if>
		</div>
		</div>
		
		<div align="center"> 
		<h2>실시간 채팅</h2>
			+
		</div>
		<hr>
		<div align="right">
			
			<button type="button" class="btn btn-primary"
				onclick="location.href='list.zips'">
				상품 목록
			</button>
			<br> 
			<br>
		</div>
<div>
</div>
</body>
</html>
