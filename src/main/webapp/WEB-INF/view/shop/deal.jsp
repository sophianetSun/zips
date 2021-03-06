<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매 신청 페이지</title>
<style type="text/css">
	td:first-child {
	width: 20%;
	font-weight: bold; 
}
	td:nth-child(1) {
	width: 20%;
	font-weight: bold;
	
}
	td:last-child {
	width: 80%; 
}
	#buy {
	color: #007bff;
    background-color: transparent;
    background-image: none;
    border-color: #007bff;
     padding: .25rem .5rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .2rem;
}

</style>
<script type="text/javascript">  
	$(document).ready(function(){
		 
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
		
		$('#buy').click(function() {
			if(${buyerUser.coin >= shop.shop_price})
			alert('구매신청 하셨습니다');
			
		})
	});
	
</script>
</head>
<body> 

	<div class="blog-post">
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
					<tr><td>나의 보유 코인</td>
						<td>${buyerUser.coin} Coin</td></tr>  
				</table>
			</div>
		</blockquote>
		<br>
		<hr>
		
		<div align="center" style="height: 50px;">
			<!-- 판매자 아이디 != 로그인 유저 아이디 -->
			<c:if test="${shop.shop_seller_id != loginUser.id }">
				<c:if test="${empty shop.shop_buyer_id}">
					<form action="dealpage.zips?shop_no=${shop.shop_no}" method="post" id="f">
						<input type="hidden" name="coin" id="coin" value="${shop.shop_price}">
						<input type="submit" id="buy" value="구매 신청" class="btn btn-sm btn-outline-primary"
							style="width: 100px; height: 50px; font-weight: bold;">
						<button type="button" class="btn btn-sm btn-outline-primary" 
						style="width: 100px; height: 50px; font-weight: bold;"
						onclick="javascript:history.go(-1)">
							구매 취소
						</button>
					</form>
				</c:if> 
			</c:if>
		</div>
		
		<hr>
		<div align="right">
			<c:if test="${shop.shop_seller_id == loginUser.id }">
				<button type="button" class="btn btn-sm btn-outline-danger"
					style="width: 100px; height: 50px;"
					onclick="location.href='update.zips?shop_no=${shop.shop_no}'">
					상품 수정
				</button>
				<button type="button" class="btn btn-primary" 
					onclick="location.href='delete.zips?shop_no=${shop.shop_no}'">
					상품 삭제
				</button>
			</c:if>
			<button type="button" class="btn btn-primary"
				onclick="location.href='list.zips'">
				상품 목록
			</button>
			<br> 
			<br>
		</div>
</body>
</html>
