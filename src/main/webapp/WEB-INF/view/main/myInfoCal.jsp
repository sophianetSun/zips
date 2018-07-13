<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더 입력 정보 뷰</title>
<script>
	var databases;
	var infoType = 0;
	var userWeight = '${sessionScope.loginUser.weight}';
	console.log(userWeight);
	var regdate = '${param.regdate}';
	console.log(regdate);
	
	function saveMyInfo() {
		var carbohydrate = $('tfoot td:nth-of-type(2)').text();
		var fat = $('tfoot td:nth-of-type(3)').text();
		var protein = $('tfoot td:nth-of-type(4)').text();
		var calorie = $('tfoot td:nth-of-type(5)').text();
		if (infoType == 1) 
			$('#comment').attr('name', 'work_memo');
		$('#form').append("<input type='hidden' name='carbohydrate' value='" + carbohydrate + "'>");
		$('#form').append("<input type='hidden' name='fat' value='" + fat + "'>");		
		$('#form').append("<input type='hidden' name='protein' value='" + protein + "'>");		
		$('#form').append("<input type='hidden' name='calorie' value='" + calorie + "'>");		
		$('#form').append("<input type='hidden' name='regdate' value='" + regdate + "'>");		
		$('#form').append("<input type='hidden' name='in_type' value='"+ infoType + "'>");
		$('#form').submit();
	}
	
	function observeRow() {
		var trs = $('tbody > tr');
		var btn = document.getElementById("save");
		if (trs.length == 0) btn.setAttribute("disabled", "disabled");  
		else btn.removeAttribute("disabled");	
	}
	
	function deleteRow(button) {
		var row = button.parentNode.parentNode;
		row.parentNode.removeChild(row);
		addSumRow()
	}
	
	function selectSearchFood(aTag) {
		$('#search_text').val(aTag.text);
		$('.list-group').hide();
		if (infoType == 0) {
			makeTbRow(databases[aTag.id].FoodDB);			
		} else {
			makeWorkoutRow(databases[aTag.id].WorkoutDB);
		}
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
		observeRow()
	} 
	
	function makeTbRow(food) {
		$('table #tb_body').append(
			"<tr><td><button type='button' onclick='deleteRow(this)' " 
			+ "class='btn btn-danger'>삭제</button></td>"
			+ "<td>" + regdate + "</td><td>" + food.food_name + "</td>"
			+ "<td>" + food.amount + "</td><td>" + food.carbohydrate + "</td>"
			+ "<td>" + food.fat + "</td><td>" + food.protein + "</td><td>"
			+ food.calorie + "</td></tr>"		 
			 );
		addSumRow();
		$('#search_text').val('');
	}
	
	function addSumWorkoutRow() {
		var arrCalorie = $('tbody td:nth-of-type(7)').toArray();
		var sumCalorie = 0;
		for(var i=0; i<arrCalorie.length;i++) {
			sumCalorie += Number(arrCalorie[i].innerHTML);
		}
		$('tfoot td:nth-of-type(5)').text(sumCalorie.toFixed(1));
		observeRow()
	}
	
	function changeCal(row, time) {
		//console.log(row + ", " + time);
		var tds = row.children;
		var mets = tds[3].innerText;
		var weight = tds[4].innerText;
		tds[6].innerText = (mets * weight * (time/60) * 1.05).toFixed(1);
		addSumWorkoutRow();
	}
	
	function makeWorkoutRow(workout) {
		var mets = workout.calorie;
		$('table #tb_body').append(
				"<tr><td><button type='button' onclick='deleteRow(this)' " 
				+ "class='btn btn-danger'>삭제</button></td>"
				+ "<td>" + regdate + "</td><td colspan='2'>" + workout.name + "</td>"
				+ "<td>" + mets + "</td>"
				+ "<td>" + userWeight + "</td><td>" 
				+ "<input type='number' name='act_time' min='0' value='10' onchange='changeCal(this.parentNode.parentNode, this.value)'>" + "</td><td>"
				+ (mets*userWeight*(10/60)*1.05).toFixed(1) + "</td></tr>"		 
				 );
			addSumWorkoutRow();
			$('#search_text').val('');
	}
	
	function toggleTableHead() {
		 if ($('#type').val() == 'food') {
			  infoType = 0;
			  $('.nutri').show();
			  $('.workout').hide();
			  console.log(infoType);
		  } else {
			  infoType = 1;
			  $('.nutri').hide();
			  $('.workout').show();
			  console.log(infoType);
		  }
	}
  $(document).ready(function() {
	  $('.workout').hide();
	  $('#type').change(function(event) {
		  var flag;
		  if ($('#tb_body > tr').length > 0) {
			flag = confirm("입력하던 자료가 있습니다! 삭제하시겠습니까?");	 
			if (flag == true) {
				$('#tb_body').empty();
				addSumRow();
				toggleTableHead();
			} else {
				event.preventDefault();
				if (infoType == 0) $('#type :nth-child(1)').attr("selected", "selected");
				else $('#type :nth-child(2)').attr("selected", "selected");			
			}
		  } else {
			  if ($('#type').val() == 'food') {
				  infoType = 0;
				  $('.nutri').show();
				  $('.workout').hide();
			  } else {
				  infoType = 1;
				  $('.nutri').hide();
				  $('.workout').show();
			  }
		  }
	  });
	  
	  $(':submit').click(function(event) {
		  event.preventDefault();
		  saveMyInfo();
	  });
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
		 	databases = JSON.parse(data);
		 	var html = "";
			for(var idx in databases) {
				if (idx < 5) {
					var db_data;
					if (infoType == 0) {
						db_data = databases[idx].FoodDB;
						html += '<a href="#" id="' + idx + '" class="list-group-item list-group-item-action" onclick="selectSearchFood(this)">'
					 		+ db_data.food_name + '</a>'
					} else {
						db_data = databases[idx].WorkoutDB;
						html += '<a href="#" id="' + idx + '" class="list-group-item list-group-item-action" onclick="selectSearchFood(this)">'
				 		+ db_data.name + '</a>'
					}
				}
			}		 	
		 	$('.list-group').html(html);
			 $('.list-group').show();		 		
		 	} else {
		 	 $('.list-group').hide();		
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
</div>
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action">First item</a>
  <a href="#" class="list-group-item list-group-item-action">Second item</a>
  <a href="#" class="list-group-item list-group-item-action">Third item</a>
</div>
<form id="form" name="form" action="myinfo/save.zips" method="post" class="mt-3">
<div class="container">
  	<table class="table">
  	  <thead class="thead-dark">
  	    <tr class="nutri">
  	      <th></th>
  	      <th>날짜</th>
  	      <th>타입</th>
  	      <th>양(g)</th>
  	      <th>탄수화물</th>
  	      <th>지방</th>
  	      <th>단백질</th>
  	      <th>열량</th>
  	    </tr>
  	    <tr class="workout">
  	      <th></th>
  	      <th>날짜</th>
  	      <th colspan="2">타입</th>
  	      <th>METs</th>
  	      <th>체중</th>
  	      <th>시간(분)</th>
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
  	<div class="form-group mt-8 mb-3">
  	  <label for="comment">오늘의 한마디</label>
  	  <input type="text" class="form-control" rows="5" id="comment" name="nutri_memo">
  	</div>
  	<button type="submit" id="save" class="btn btn-success btn-block btn-lg" 
  		disabled="disabled">저장하기</button>
</div>
</form>
</body>
</html>