<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TraPick</title>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("input").checkboxradio();
   });
</script>
<title>여행상품</title>
</head>
<body>
   <div class="items">
      <h1>여행상품 보기</h1>

      <div id="checkbox">
         <legend>정렬 기준: </legend>
         <label for="checkbox-1">가격순</label> 
            <input type="checkbox" name="checkbox-1" id="checkbox-1"> 
         <label for="checkbox-2">판매량순</label> 
            <input type="checkbox" name="checkbox-2" id="checkbox-2">
         <label for="checkbox-3">인기순</label> 
            <input type="checkbox" name="checkbox-3" id="checkbox-3"> 
      </div>
      <div id="ajaxReturn">  
      </div>

        <form action="/Recommend/search" method="post">
        <input type="text" name="country_name"> 
  		<input type="text" name="city_name"> 
		<input type="submit" value="search">
		</form>

   </div>
</body>
</html>