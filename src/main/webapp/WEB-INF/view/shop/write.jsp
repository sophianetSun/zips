<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고 장터 물품 등록</title>
<style type="text/css">
	#preview img {
		width: 200px;
		height: 200px;
	}
</style>
<script type="text/javascript">
$(document).ready(
	    function() {
	        // 태그에 onchange를 부여한다.
	        $('#file').change(function() {
	                addPreview($(this)); //preview form 추가하기
	        });
	    });
	 
	    // image preview 기능 구현
	    // input = file object[]
	    function addPreview(input) {
	        if (input[0].files) {
	            //파일 선택이 여러개였을 시의 대응
	            for (var fileIndex = 0 ; fileIndex < input[0].files.length ; fileIndex++) {
	                var file = input[0].files[fileIndex];
	                var reader = new FileReader();
	 
	                reader.onload = function (img) {
	                    //div id="preview" 내에 동적코드추가.
	                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                    $("#preview").append(
	                        "<img src=\"" + img.target.result + "\"\/>"
	                    );
	                };
	                
	                reader.readAsDataURL(file);
	            }
	        } else alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	    }
	 
	</script>
</head>
<body>
<h2 align="center"> 중고 장터 게시물 작성 </h2>
<div class="container">
    <form:form modelAttribute="shop" action="write.zips" method="post">
      <div class="form-group">
        <label for="subject">제목 <font color="red"><form:errors path="shop_subject" /></font> </label>
        <input type="text" class="form-control" id="subject" name="shop_subject" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="writer">작성자 <font color="red"><form:errors path="shop_seller_id" /></font> </label>
        <input type="text" class="form-control" id="writer" name="shop_seller_id" value="${loginUser.nickname}" readonly="readonly">
        
      </div>
      <div class="form-group">
        <label for="content">내용 <font color="red"><form:errors path="shop_content" /></font></label>
        <textarea class="form-control" id="content" name="shop_content" rows="3"></textarea>
      </div>
      <div class="form-group">
        <label for="price">상품 가격 <font color="red"><form:errors path="shop_price" /></font></label>
        <input type="text" class="form-control" id="writer" name="shop_price" placeholder="가격을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="file">상품 사진 첨부</label>
        <input type="file" class="form-control" id="file" name="file" multiple>
      </div>
 	<div id="preview"></div>
      <button type="submit" class="btn btn-primary">작성</button>
      <input type="button" class="btn btn-primary" value="상품 목록" onclick="location.href='list.zips'">
    </form:form>
</div>
</body>
</html>