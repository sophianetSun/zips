<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더 입력 정보 뷰</title>
<script>
	var foodDBs;
	var myInfoDB;
	function deleteRow(button) {
		var row = button.parentNode.parentNode;
		row.parentNode.removeChild(row);
		addSumRow()
	}
	
	function selectSearchFood(aTag) {
		$('#search_text').val(aTag.text);
		//alert(foodDBs[aTag.id].FoodDB.food_name);
		$('.list-group').hide();
		makeTbRow(foodDBs[aTag.id].FoodDB);
	}
	
	function changeCalorie(foodAmount) {
		console.log(foodAmount.value);
		console.log(foodAmount.parentNode.parentNode.lastChild.innerHTML);
	}
	function addSum(total, value, index, array) {
		return total + value;
	}
	function addSumRow() {
		var arrCarbohydrate = $('tbody td:nth-of-type(5)').toArray();
		var arrFat = $('tbody td:nth-of-type(6)').toArray();
		var arrProtein = $('tbody td:nth-of-type(7)').toArray();
		var arrCalorie = $('tbody td:nth-of-type(8)').toArray();
		var sumCarbohydrate = 0;
		var sumFat = 0;
		var sumProtein = 0;
		var sumCalorie = 0;
		for(var i=0; i<arrCarbohydrate.length;i++) {
			sumCarbohydrate += Number(arrCarbohydrate[i].innerHTML);
			sumFat += Number(arrFat[i].innerHTML);
			sumProtein += Number(arrProtein[i].innerHTML);
			sumCalorie += Number(arrCalorie[i].innerHTML);
		}
		$('tfoot td:nth-of-type(2)').text(sumCarbohydrate.toFixed(1));
		$('tfoot td:nth-of-type(3)').text(sumFat.toFixed(1));
		$('tfoot td:nth-of-type(4)').text(sumProtein.toFixed(1));
		$('tfoot td:nth-of-type(5)').text(sumCalorie.toFixed(1));
	} 
	
	function makeTbRow(food) {
		var d = new Date();
		var dateStr = d.getFullYear() + "-" + d.getMonth() + "-" + d.getDate();
		$('table #tb_body').append(
			"<tr><td><button type='button' onclick='deleteRow(this)' " 
			+ "class='btn btn-danger'>삭제</button></td>"
			+ "<td>" + dateStr + "</td><td>" + food.food_name + "</td>"
			+ "<td>식품</td><td>" + food.carbohydrate + "</td>"
			+ "<td>" + food.fat + "</td><td>" + food.protein + "</td><td>"
			+ food.calorie + "</td></tr>"		 
			 );
		addSumRow();
	};
	
  $(document).ready(function() {
	  $('.list-group').hide();
	  $('#search_btn').click(function() {
		 var type = $('#type').val();
	  	 var text = $('#search_text').val();
		  $.post('myinfo/search.zips', {
			 searchType : type,
			 searchText : text
		 }, function(data, status) {
			 console.log(type + ',' + text);
			 console.log(data);
		 });
		  
		 $('table #tb_body').append(
			"<tr><td><button type='button' onclick='deleteRow(this)' class='btn btn-danger'>삭제</button></td>" +
			"<td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>"		 
		 )
	  });
	  
	  $('#search_text').keyup(function() {
		  var type = $('#type').val();
		  var text = $(this).val();
		  $.post('myinfo/search.zips', {
			searchType : type,
		 	searchText : text
		 }, function(data, status) {
		 	if (data) {
		 	foodDBs = JSON.parse(data);
		 	var html = "";
			for(var idx in foodDBs) {
				var food = foodDBs[idx].FoodDB;
				html += '<a href="#" id="' + idx + '" class="list-group-item list-group-item-action" onclick="selectSearchFood(this)">'
			 		+ food.food_name + '</a>'
			}		 	
		 	$('.list-group').html(html);
			 $('.list-group').show();		 		
		 	}
			
			
		 }); 
	  });
	  
	  
  });
</script>
</head>
<body>
<div class="form-group">
<label for="type">입력 정보 타입:</label>
  <select class="form-control" id="type">
    <option value="food">영양정보</option>
    <option value="workout">운동정보</option>
  </select>
</div>
<div id='search_div' class="input-group">
  <input id='search_text' type="text" class="form-control" placeholder="Search">
  <!-- <div class="input-group-append">
    <button id='search_btn' class="btn btn-success" type="submit">OK</button> 
  </div> -->
</div>
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action">First item</a>
  <a href="#" class="list-group-item list-group-item-action">Second item</a>
  <a href="#" class="list-group-item list-group-item-action">Third item</a>
</div>
<form action="#" class="mt-3">
  <div class="container">
  	<table class="table">
  	  <thead class="thead-dark">
  	    <tr>
  	      <th></th>
  	      <th>날짜</th>
  	      <th>타입</th>
  	      <th>항목</th>
  	      <th>탄수화물</th>
  	      <th>지방</th>
  	      <th>단백질</th>
  	      <th>열량</th>
  	    </tr>
  	  </thead>
  	  <tbody id="tb_body">
  	  </tbody>
  	  <tfoot>
  	  	<tr class="table-info">
  	  	  <td colspan="4">합계</td>
  	  	  <td></td>
  	  	  <td></td>
  	  	  <td></td>
  	  	  <td></td>
  	  	</tr>
  	  </tfoot>
  	</table>
  </div>
</form>
</body>
</html>