<%@page import="java.util.ArrayList"%>
<%@page import="trapick.recommend.domain.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>TraPick</title>
<link rel="stylesheet" type="text/css" href="../style/css/scheduler.css" />
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<<<<<<< HEAD
<link rel="stylesheet" href="/resources/demos/style.css">
=======
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript"
   src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script type="text/javascript"
   src="http://maps.google.com/maps/api/js?key=AIzaSyC3G1qQMeFpartaXg_UguoBElqDEDYu3Rg"></script>
<script>


function initialize() {
    
    var mapOptions = {
                        zoom: 18, // 지도를 띄웠을 때의 줌 크기
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
     
     
    var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
                                mapOptions);
     
    var size_x = 40; // 마커로 사용할 이미지의 가로 크기
    var size_y = 40; // 마커로 사용할 이미지의 세로 크기
 
    // 마커로 사용할 이미지 주소
    var image = new google.maps.MarkerImage( '주소 여기에 기입!',
                                                new google.maps.Size(size_x, size_y),
                                                '',
                                                '',
                                                new google.maps.Size(size_x, size_y));
     
    // Geocoding *****************************************************
    var address = "<%=request.getParameter("city_name")%>"; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
    var marker = null;
    var geocoder = new google.maps.Geocoder();

    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            marker = new google.maps.Marker({
                            map: map,
                            icon: image, // 마커로 사용할 이미지(변수)
                            title: '한밭도서관', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                            position: results[0].geometry.location
                        });

            var content = "위치"; // 말풍선 안에 들어갈 내용
         
            var infowindow = new google.maps.InfoWindow({ content: content});
            google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
        
    });     
}
google.maps.event.addDomListener(window, 'load', initialize);
   
/*    window.onload = function() {
      $("#popUp").hide();
   }
   
   function showPopup() {
      $("#popUp").show();
   }
    */
   function hidePopup() {
      $("#popUp").hide();
   }
   
  
</script>

<script type="text/javascript">
//호텔 , 음식점 스크립트
<<<<<<< HEAD
$(function() {
   
   $('#restList').hide();
   $('#hotelList').hide();
});
   
$(function() {
	$('#tab-1').click(function() {
	      $('#itemList').show();
	      $('#hotelList').hide();
	      $('#restList').hide();
	   });
	
   $('#tab-2').click(function() {
      $('#restList').show();
      $('#hotelList').hide();
      $('#itemList').hide();
   });
   
   $('#tab-3').click(function() {
	      $('#hotelList').show();
	      $('#itemList').hide();
	      $('#restList').hide();
	   });
});

//호텔 음식점 스크립트 끝

=======
   $(function() {
      $('#restList').hide();
      $('#hotelList').hide();
      $('#tab-1').addClass('selected');
   });

   $(function() {

      $('#tab-2').click(function() {
         $('#restList').show();
         $('#hotelList').hide();
         $('#itemList').hide();
         $('#tab-1').removeClass('selected');
         $('#tab-2').addClass('selected');
         $('#tab-3').removeClass('selected');

      });
   });

   $(function() {

      $('#tab-3').click(function() {
         $('#hotelList').show();
         $('#itemList').hide();
         $('#restList').hide();
         $('#tab-1').removeClass('selected');
         $('#tab-2').removeClass('selected');
         $('#tab-3').addClass('selected');
      });
   });

   $(function() {

      $('#tab-1').click(function() {
         $('#itemList').show();
         $('#hotelList').hide();
         $('#restList').hide();
         $('#tab-1').addClass('selected');
         $('#tab-2').removeClass('selected');
         $('#tab-3').removeClass('selected');
      });
   });

//호텔 음식점 스크립트 끝
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git


   $(function(){
      
<<<<<<< HEAD
      
      //합친거 끝
      
      var html = "";

      
       $('.drag').draggable({
             helper: 'clone',
             opacity: 0.5,
             revert: true,
             start : function(e,ui){
                $(".delete_schedule").click(function(){
                    $(this).parent().empty();
                 })
              html += '<button type="button" class="delete_schedule btn btn-default">x</button>';
                html += $(this).html();
             },
             stop : function(e,ui){
               $(".delete_schedule").click(function(){
                      $(this).parent().empty();
                   })
                   
             }
           }); 
        
        $('table td').droppable({
             accept: "div",
             drop: function(event, ui) {
                $(this).empty();
            $(this).append(html);
            html = "";
             }
         });
      
   
      $('#save').on("click", function(){
         var htmlSource = $('#mySheduleTable').html();
         console.log(htmlSource);
         $.ajax({
            url : 'saveAjax',
            type: 'post',
            dataType:'json',
            data :{html : htmlSource} ,
            success : function(data){
               
            }
         })
         location.href = '/TrePick/index.jsp';
         return false;
      })
      
      
=======
	   
      function pop($selector){
         var url= "";    //팝업창 페이지 URL
          var winWidth = 700;
           var winHeight = 600;
           var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
           var detail = $selector.parent().find('#detail').text();
           var name = $selector.parent().find('#name').text();
           var price = $selector.parent().find('#price').text();
           var img = $selector.parent().find('img').attr('src');
           var str = '<img src = "'+img+'"><br>이름 : '+name+'<br>상세설명 : '+detail+'<br>가격 : '+price;
          window.open(url,"",popupOption).document.write(str);
      }
      
      function event(){
         $(".delete_schedule").click(function(){
                 $(this).parent().empty();
              })
              $('.detailbt').click(function(){
                 pop($(this));
            })
      }
      
      
      var html = "";

      
       $('.drag').draggable({
             helper: 'clone',
             opacity: 0.5,
             revert: true,
             start : function(e,ui){
                event();
              html += '<button type="button" class="delete_schedule btn btn-default liveButton">x</button>';
              html += '<input type ="button" class = "detailbt liveInput" value ="상세보기">';
                html += $(this).html();
             },
             stop : function(e,ui){
                event();
             }
           }); 
        
        $('table td').droppable({
             accept: "div",
             drop: function(event, ui) {
                $(this).empty();
            $(this).append(html);
            html = "";
             }
         });
      
      //일정 저장
      $('#save').on("click", function(){
         var htmlSource = $('#mySheduleTable').html();
         $.post('saveAjax',{html : htmlSource});
         location.href = '/TrePick/index.jsp';
         return false;
      })
      
      //도시선택시 ajax 구동
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
      $('#city_search').on("click",function(){
         //랜드마크 ajax
         $.ajax({
            url : 'landMarkAjax',
            type: 'post',
            dataType:'json',
            data :{city_name : $('#city option:selected').val()} ,
            success : function(data){
               
               $('#landmarkDiv').empty();
               $.each(data, function(index, item){
<<<<<<< HEAD
                  var text = '<div class = "drag"><img src = "'+item.image+'"> <span>'+item.name+'</span></div>';
                  $('#landMarkList').append(text);
=======
                  /* var text = '<div class="row drag" ><div class="list_thumb" ><img class="img" src='
                  +item.image+'></div><div class="list_detail"><div id = "name" class="row">'
                  +item.name+'</div><div  style = "display : none"  id ="detail" class="row">'
                  +item.detail+'</div></div></div>'; */
                  var text = '<div class="row drag"><div class="list_thumb"><img src='
                  +item.image+' class ="img"></div><div class="list_detail" id="landDetail"><div class="name" id="name">'
                  +item.name+'</div><div   class="detail"  id="detail">'
                  +item.detail+'</div></div></div>';
                  $('#landmarkDiv').append(text);
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
               })
               
               $('.drag').draggable({
                      helper: 'clone',
                      opacity: 0.5,
                      revert: true,
                      start : function(e,ui){
<<<<<<< HEAD
                         $(".delete_schedule").click(function(){
                             $(this).parent().empty();
                          })
                       html += '<button type="button" class="delete_schedule btn btn-default>x</button>';
                         html += $(this).html();
                      },
                      stop : function(e,ui){
                        $(".delete_schedule").click(function(){
                               $(this).parent().empty();
                            })
                            
=======
                         event();
                         html += '<button type="button" class="delete_schedule btn btn-default liveButton">x</button>';
                         html += '<input type ="button" class = "detailbt liveInput" value ="상세보기">';
                         html += $(this).html();
                      },
                      stop : function(e,ui){
                         event();
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
                      }
                    }); 
            }
         })
         //아이템 ajax
         $.ajax({
            url : 'itemAjax',
            type: 'post',
            dataType:'json',
            data :{city_name : $('#city option:selected').val()} ,
            success : function(data){
               
               $('#itemList').empty();
               $.each(data, function(index, item){
<<<<<<< HEAD
                  var text = '<div class = "drag"><img src = "'+item.img+'"> <span>'+item.name+'</span></div>';
=======
                     var text = '<div class="row drag" ><div class="list_thumb" ><img class="img" src='
                         +item.img+'></div><div class="list_detail"><div id = "name" class="row">'
                         +item.name+'</div><div  style = "display : none"  id ="detail" class="row">'
                         +item.detail+'<div  id="price" class="row">'
                         +item.price+'</div></div></div>';
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
                  $('#itemList').append(text);
               })
               
               $('.drag').draggable({
                      helper: 'clone',
                      opacity: 0.5,
                      revert: true,
                      start : function(e,ui){
<<<<<<< HEAD
                         $(".delete_schedule").click(function(){
                             $(this).parent().empty();
                          })
                       html += '<button type="button" class="delete_schedule btn btn-default">x</button>';
                         html += $(this).html();
                      },
                      stop : function(e,ui){
                        $(".delete_schedule").click(function(){
                               $(this).parent().empty();
                            })
                            
=======
                         event();
                         html += '<button type="button" class="delete_schedule btn btn-default liveButton">x</button>';
                         html += '<input type ="button" class = "detailbt liveInput" value ="상세보기">';
                         html += $(this).html();
                      },
                      stop : function(e,ui){
                         event();
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
                      }
                    }); 
            }
         })
<<<<<<< HEAD
          $.ajax({
           url : 'restAjax',
           type : 'post',
           dataType : 'json',
           data :{city_name : $('#city option:selected').val()} ,
           success : function(data){
              
              $('#restList').empty();
                $.each(data, function(index, item){
                   var text = '<img src = "'+item.img+'"> <span>'+item.name+'</span>';
                   $('#restList').append(text);
                   console.log(text);
                }) 
                $('.drag').draggable({
                   helper: 'clone',
                   opacity: 0.5,
                   revert: true,
                   start : function(e,ui){
                      $(".delete_schedule").click(function(){
                          $(this).parent().empty();
                       })
                    html += '<button type="button" class="delete_schedule btn btn-default">x</button>';
                      html += $(this).html();
                   },
                   stop : function(e,ui){
                     $(".delete_schedule").click(function(){
                            $(this).parent().empty();
                         })
                         
                   }
                 }); 
           }
        })
        //숙박 ajax
       $.ajax({
          url : 'hotelAjax',
          type : 'post',
          dataType : 'json',
          data :{city_name : $('#city option:selected').val()} ,
          success : function(data){
              
              $('#hotelList').empty();
                $.each(data, function(index, item){
                   var text = '<img src = "'+item.img+'"> <span>'+item.name+'</span>';
                   $('#hotelList').append(text);
                   console.log(text);
                }) 
                $('.drag').draggable({
                   helper: 'clone',
                   opacity: 0.5,
                   revert: true,
                   start : function(e,ui){
                      $(".delete_schedule").click(function(){
                          $(this).parent().empty();
                       })
                    html += '<button type="button" class="delete_schedule btn btn-default">x</button>';
                      html += $(this).html();
                   },
                   stop : function(e,ui){
                     $(".delete_schedule").click(function(){
                            $(this).parent().empty();
                         })
                         
=======
         //식당 ajax
          $.ajax({
              url : 'restAjax',
              type : 'post',
              dataType : 'json',
              data :{city_name : $('#city option:selected').val()} ,
              success : function(data){
                 
                 $('#restList').empty();
                   $.each(data, function(index, item){
                	   var text = '<div class="row drag" ><div class="list_thumb" ><img class="img" src='
                           +item.img+'></div><div class="list_detail"><div id = "name" class="row">'
                           +item.name+'</div><div  style = "display : none"  id ="detail" class="row">'
                           +item.detail+'</div></div></div>';
                      $('#restList').append(text);
                   }) 
                   $('.drag').draggable({
                      helper: 'clone',
                      opacity: 0.5,
                      revert: true,
                      start : function(e,ui){
                         event();
                         html += '<button type="button" class="delete_schedule btn btn-default liveButton">x</button>';
                         html += '<input type ="button" class = "detailbt liveInput" value ="상세보기">';
                         html += $(this).html();
                      },
                      stop : function(e,ui){
                         event();
                      }
                    }); 
              }
        })
        //숙박 ajax
       $.ajax({
          url : 'hotelAjax',
          type : 'post',
          dataType : 'json',
          data :{city_name : $('#city option:selected').val()} ,
          success : function(data){
              
              $('#hotelList').empty();
                $.each(data, function(index, item){
                	var text = '<div class="row drag" ><div class="list_thumb" ><img class="img" src='
                        +item.img+'></div><div class="list_detail"><div id = "name" class="row">'
                        +item.name+'</div><div  style = "display : none"  id ="detail" class="row">'
                        +item.detail+'<div  id="price" class="row">'
                        +item.price+'</div></div></div>';
                   $('#hotelList').append(text);
                   console.log(text);
                }) 
                $('.drag').draggable({
                   helper: 'clone',
                   opacity: 0.5,
                   revert: true,
                   start : function(e,ui){
                      event();
                      html += '<button type="button" class="delete_schedule btn btn-default liveButton">x</button>';
                      html += '<input type ="button" class = "detailbt liveInput" value ="상세보기">';
                      html += $(this).html();
                   },
                   stop : function(e,ui){
                      event();
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
                   }
                 }); 
           }
        })
         /* return false; */
      })
   })

</script>
<style type="text/css">
<<<<<<< HEAD
   table td{
      height: 100px;
      width: 100px;
   }
   .drag{
      width : 100px;
      height: 100px;
   }
=======
table td {
   height: 100px;
   width: 100px;
}

.drag {
   width: 200px;
   height: 200px;
}
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
</style>

<title>여행상품</title>
</head>
<body>
   <p id="subject">Travel Scheduler</p>
   <div  id="asdf">
      <select id="city" name="city_name">
         <c:forEach var="cityList" items="${cityList }">
            <option value="${cityList }">${cityList }</option>
         </c:forEach>
      </select>
      <button id="city_search">검색</button>
   </div>
   <div class="container">

      <div class="row">
         <div class="col-6">
            <!-- Temp_Scheduler -->
<<<<<<< HEAD
            <form action="????????" id="scheduleTable">
               <p>여행 일정표</p>
               <div id = "mySheduleTable">
                  <table border="1">
                     <tr>
                        <th>일정</th>
                        <th>1일차</th>
                        <th>2일차</th>
                        <th>3일차</th>
                        <th>4일차</th>
                        <th>5일차</th>
                     </tr>
                     <tr>
                        <td>06 ~ 09</td>
                        <td>이름 </td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                     </tr>
                     <tr>
                        <td>09 ~ 12</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                     </tr>
                     <tr>
                        <td>12 ~ 15</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                     </tr>
                     <tr>
                        <td>15 ~ 18</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                     </tr>
                     <tr>
                        <td>18 ~ 21</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                     </tr>
                     <tr>
                        <td>21 ~ 24</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                        <td>빈칸</td>
                     </tr>
                  </table>
                </div>
            </form>



            <form action="searchCity" id="searchCity">
               도시 검색 : <input type = "text" name = "search_City">
               <input type = "submit" value="검색">
            </form>
         <select id = "city" name = "city_name">
            <c:forEach var="cityList" items="${cityList }">
               <option value = "${cityList }">${cityList }</option>
            </c:forEach>
         </select>
         <button id = "city_search">검색</button>
            <form action="sortList" id="sortButton">
               <button value="price" name="price">가격 순</button>
               <button value="sales" name="sales">판매량 순</button>
               <button value="hits" name="hits">인기 순</button>
               <button value="dist" name="dist" onclick="showPopup();">거리순</button>
               <input type="hidden" name="country_name" value="<%=request.getParameter("country_name")%>">
               <input type="hidden" name="city_name" value="<%=request.getParameter("city_name")%>">
            </form>
            <div id="popUp">
               <form action="sortDist">
                  위치 : <input type="text" name="current" value="">
                  <button value="distance" name="distance">확인</button>
                  <input type="hidden" name="country_name"
                     value="<%=request.getParameter("country_name")%>"> <input
                     type="hidden" name="city_name"
                     value="<%=request.getParameter("city_name")%>">
               </form>
=======
            <form action="#" id="scheduleTable">
               <div>
                  <table id="mySheduleTable" border=2>
                     <tr>
                        <th>일정</th>
                        <th>1 일차</th>
                        <th>2 일차</th>
                        <th>3 일차</th>
                        <th>4 일차</th>
                        <th>5 일차</th>
                     </tr>
                     <tr>
                        <td class="time">06:00<br>
                        <br>&nbsp;&nbsp; ~ 09:00
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td class="time">09:00<br>
                        <br>&nbsp;&nbsp; ~ 12:00
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td class="time">12:00<br>
                        <br>&nbsp;&nbsp; ~ 15:00
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td class="time">15:00<br>
                        <br>&nbsp;&nbsp; ~ 18:00
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td class="time">18:00<br>
                        <br>&nbsp;&nbsp; ~ 21:00
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr>
                        <td class="time">21:00<br>
                        <br>&nbsp;&nbsp; ~ 24:00
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                  </table>
               </div>
            </form>
            <br>
            <button id="save" class="btn btn-secondary btn-lg">일정 저장</button>
            <br>
         </div>
         <div class="col-3" id="city_List">
            <div id="landMarkList">
               <ul>
                  <li><a id="land">관광지</a></li>
               </ul>
               <div id="landmarkDiv">
                  <c:forEach var="landMarkList" items="${landMarkList }">
                     <div class="row drag" >
                        <div class="list_thumb">
                           <img src=${landMarkList.image } class ="img" >
                        </div>
                        <div class="list_detail"
                           id="landDetail" >
                           <div class="name" id="name" >${landMarkList.name}</div>
                           <div class="detail"  id="detail" >${landMarkList.detail }</div>
                        </div>
                     </div>
                  </c:forEach>
               </div>
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
            </div>
            <button id = "save">일정 저장</button>
         </div>
         <!-- 음식점 숙박 -->
         <div class="col-3">
<<<<<<< HEAD
            <h3>관광 명소</h3>
            <div id ="landMarkList">
               <c:forEach var="landMarkList" items="${landMarkList }">
               <div class="row drag">
                  <div class="col-4">
                     <img src=${landMarkList.image }>
                  </div>
                  <div class="col-8">
                     <div class="row">${landMarkList.name }</div>
                     <div class="row">${landMarkList.detail }</div>
=======
            <form action="sortList" id="sortButton">
               <button value="price" name="price" class="btn btn-primary">가격
                  순</button>
               <button value="sales" name="sales" class="btn btn-primary">판매량
                  순</button>
               <button value="hits" name="hits" class="btn btn-primary">인기
                  순</button>
               <button value="dist" name="dist" onclick="showPopup();"
                  class="btn btn-primary">거리순</button>
               <input type="hidden" name="country_name"
                  value="<%=request.getParameter("country_name")%>"> <input
                  type="hidden" name="city_name"
                  value="<%=request.getParameter("city_name")%>">
            </form>

            <div id="tabs">
               <ul>
                  <li><a href="#" id="tab-1">상품</a></li>
                  <li><a href="#" id="tab-2">음식</a></li>
                  <li><a href="#" id="tab-3">숙박</a></li>
               </ul>
               <div id="tabs-1">
                  <div id="itemList">
                     <c:forEach var="list" items="${list }">
                        <div class="row drag" id="list_thum">
                           <div>
                              <div class="list_thumb">
                                 <img src=${list.img } class ="img">
                              </div>
                           </div>
                           <div class="list_detail">
                              <div id="name" class="listName">${list.name }</div>
                              <div style="display: none" id="detail" class="listDetail">${list.detail }</div>
                              <div id="price" class="listPrice">${list.price }</div>
                           </div>
                        </div>
                     </c:forEach>
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
                  </div>

               </div>
<<<<<<< HEAD
               </c:forEach>
               
            </div>
         </div>
         <!-- 음식점 숙박 -->
          <div class="col-3">
      
               <div id="tabs">
                    <ul>
                   <li><a href="#tabs-1" id = "tab-1">여행 상품</a></li>
                   <li><a href="#tabs-2" id = "tab-2">카페 음식점</a></li>
                   <li><a href="#tabs-3" id = "tab-3">숙박</a></li>
                    </ul>
                    <div id="tabs-1">
                      <h3>여행 상품</h3>
                        <div id="itemList">
                              <c:forEach var="list" items="${list }">
                                 <div class="row drag">
                                    <div class="col-4">
                                       <img src=${list.img }>
                                    </div>
                                    <div class="col-8">
                                       <div class="row">${list.name }</div>
                                       <div class="row">${list.detail }</div>
                                       <div class="row">${list.price }</div>
                                    </div>
                                 </div>
                              </c:forEach>
                        </div>
                    </div>
                    <div id="tabs-2">
                      <h3>카페 음식점</h3>
                     <div id="restList">
                        <c:forEach var="list_Rest" items="${list_Rest }">
                           <div class="row drag">
                              <div id="img" class="col-4">
                                 <img src=${list_Rest.img }>
                              </div>
                              <div class="col-8">
                                 <div class="row">${list_Rest.name }</div>
                                 <div class="row">${list_Rest.detail }</div>
                              </div>
                           </div>
                        </c:forEach>   
                     </div>
                    </div>
                    <div id="tabs-3">
                      <h3>숙박</h3>   
                     <div id="hotelList">
                        <c:forEach var="list_Hotel" items="${list_Hotel }">
                           <div class="row drag">
                              <div id="img" class="col-4">
                                 <img src=${list_Hotel.img }>
                              </div>
                              <div class="col-8">
                                 <div class="row">${list_Hotel.name }</div>
                                 <div class="row">${list_Hotel.detail }</div>
                              </div>
                           </div>
                        </c:forEach>
                     </div>   
                    </div>
               </div>
            </div>                   


=======
               <div id="tabs-2">
                  <div id="restList">
                     <c:forEach var="list" items="${list_Rest }">
                        <div class="row drag" id="list_thum">
                           <div>
                              <div class="list_thumb">
                                 <img src=${list.img } class ="img">
                              </div>
                           </div>
                           <div class="list_detail">
                              <div id="name" class="listName">${list.name }</div>
                              <div style="display: none" id="detail" class="listDetail">${list.detail }</div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
               <div id="tabs-3">
                  <div id="hotelList">
                     <c:forEach var="list" items="${list_Hotel }">
                        <div class="row drag" id="list_thum">
                           <div>
                              <div class="list_thumb">
                                 <img src=${list.img } class ="img">
                              </div>
                           </div>
                           <div class="list_detail">
                              <div id="name" class="listName">${list.name }</div>
                              <div style="display: none" id="detail" class="listDetail">${list.detail }</div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
>>>>>>> branch 'master' of https://github.com/sprtms16/TrePick.git
      </div>
   </div>

   <div class="row">
      <div id="map-canvas" style="width: 40%; height: 340px" title="지도"
         id="Map"></div>
   </div>
</body>
</html>