<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-100">
<head>
<!-- 글꼴  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gothic+A1:wght@100&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- 글꼴 끝 -->

<%-- 
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/bootjs/css/styles2.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />	
 --%>
 
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/resources/bootjs/css/styles2.css"
	rel="stylesheet" />
	
	
	<!--슬라이드 시작  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  <style type="text/css">
     .carousel-inner > .item > img { 
       top: 0;
       left: 0; 
       height: 55vh;
       align-content: center;   	
     }  
     
     
  </style>
	<!--슬라이드 끝  -->






</head>
 
 
 
<body>



<%@ include file="/WEB-INF/inc/top.jsp"%>




	<div class="top" id="top" type="text">
		<p class="text1" style="font-family: 'Ubuntu', sans-serif;">All OTT in the world <br>at your accommodation<br>OTTZ</p>
		<p class="text2" style="font-family: 'Ubuntu', sans-serif;">start here</p>
			<div class="d-flex"  style="margin:auto;text-align:center; ">
	     <input class="form-control me-sm-2" id="search1" border-style: none; 
	     type="button" value="콘텐츠명을 검색하세요" style="cursor: text; color: #aaaaaa;"
	     onClick="location='ottzSearch.wow'">
		     </div>

	</div>





 <!--header / search랑 메뉴바! -->
<!--      -->
<!-- header / search랑 메뉴바! -->
  
  
  
  <!--슬라이드 시작  -->
<div class="main">
<div class="slideMove">
 <!-- <h2>홍보, 이벤트, 커뮤니티</h2>-->
 <h2></h2>   
  <div id="myCarousel" class="carousel slide" data-ride="carousel"
  style="height: 550px;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="container" >
	    <div class="carousel-inner" style="width: 1230px" >
	      <div class="item active" data-bs-interval="50">
	        <img src="resources/images/banner.png" alt="..." style="border-radius: 40px;">
	      </div>
	
	      <div class="item" data-bs-interval="50">
	        <img src="resources/images/banner2.png" alt="..." style="border-radius: 40px;">
	      </div>
	    
	      <div class="item" data-bs-interval="50">
	        <img src="resources/images/banner3.png" alt="..." style="border-radius: 40px;">
	      </div>
	    </div>
	</div>
	
	
    <!-- Left and right controls -->
    <a class="left carousel-control" id="left-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" id="right-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>

    </a>
  </div>
</div>

  <!--슬라이드 끝  -->


  
  
  
  
  <!--실시간 시작  -->
 <div class="tool">
<table class="table table-striped table-bordered " id="rankList" 
	height='600' >
	<colgroup class="bord" >
		<col width="3%" />
		<col width="20%" />
	</colgroup>
	<thead>
		<tr>
			<th><font size="4">순위</th>
			<th><font size="4">제목</th>
		</tr>
	</thead>
	<tbody id="movie_list">
		<c:forEach items="${rankList }" var="list">
			<tr class="text-center" style="font-size: 16px;">
				<td class="num">${list.rank }</td>
				<td>${list.movieNm }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
<!--실시간 끝  -->
  
  
  
  
  
  
  
  <!--테마 리스트 시작이욥~  -->
<div class="theme">
  <!--테마 리스트 시작이욥~  -->
<h1 class="theme-title" style="color: white; text-align: center; 
margin-top: 100px; margin-bottom: 50px;
font-family: 'Do Hyeon', sans-serif;
">테마 리스트</h1>
	<section class="theme-list-section" style="display: flex;
font-family: 'Black Han Sans', sans-serif;
font-family: 'Gothic A1', sans-serif;">
	<div class="contents-list-wrap" style="display: flex;"> <!--테마 전체 -->
		<div class="list-hero">
			<a href="ottzThemeList.wow?theme=1" style="display: block;" id="list-hero">
				<img src="resources/images/aven.png">
			</a>
			<div class="hero-title">어벤져스 시리즈</div>
		</div>
		
		<div class="list-harry">
			<a href="ottzThemeList.wow?theme=2" style="display: block;" id="list-harry">
				<img src="resources/images/harry.png">
			</a>
			<div class="harry-title">해리 포터 시리즈</div>
		</div>
		
		<div class="list-ring">
			<a href="ottzThemeList.wow?theme=3" style="display: block;" id="list-ring">
				<img src="resources/images/ring.png">
			</a>
			<div class="ring-title">반지의 제왕 & 호빗 시리즈</div>
		</div>
		
		<div class="list-thriller">
			<a href="ottzThemeList.wow?theme=6" style="display: block;" id="list-thriller">
				<img src="resources/images/thriller.png">
			</a>
			<div class="thriller-title">스릴러</div>
		</div>

	</div>
	
	</section>
	
	
	<section class="theme-list-section" style="display: flex;
font-family: 'Black Han Sans', sans-serif;
font-family: 'Gothic A1', sans-serif;	">
	<div class="contents-list-wrap" style="display: flex;">
		<div class="list-spring">
			<a href="ottzThemeList.wow?theme=5" style="display: block;" id="list-spring">
				<img src="resources/images/spring.png">
			</a>
			<div class="spring-title">로맨스</div>
		</div>
		
		
		<div class="list-fantasy">
			<a href="ottzThemeList.wow?theme=4" style="display: block;" id="list-fantasy">
				<img src="resources/images/fantasy.png">
			</a>
			<div class="fantasy-title">판타지</div>
		</div>
		
		
		<div class="list-docu">
			<a href="ottzThemeList.wow?theme=7" style="display: block;" id="list-docu">
				<img src="resources/images/docu.png">
			</a>
			<div class="docu-title">다큐멘터리</div>
		</div>
		
		<div class="list-random">
<!-- 			<a href="ottzThemeList.wow?theme=8" style="display: block;" id="list-random"> -->
			<a href="ottzRandomList.wow" style="display: block;" id="list-random">
				<img src="resources/images/random.png">
			</a>
			<div class="random-title">랜덤</div>
		</div>	
	
	</div>	
</section>

</div>  
	




</div>  

<!--footer  -->		
<%@ include file="/WEB-INF/inc/bottom.jsp"%>

  </body>
  
  
<script type="text/javascript">

$(document).ready(function (){
	function fn_movielist(){
		//실시간차트 데이터 넘기기
		$.ajax({
			url:"<c:url value='/conPage_1.wow'/>"
			,type:"POST"
			,dataType:'JSON'
			,success : function(data) {     // 정상적으로 완료되었을 경우에 실행된다
					$.each(data.rankList, function(index, element) {
						var str ="";
						str = str +'<tr class="text-center" style="font-size: 16px;">'
							+'<td class="num">'+ element.rank+ '</td>'
							+'<td>'+element.movieNm+'</td>'
						+'</tr>';
						$('#movie_list').append(str);
					});
			},error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			complete : function () {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수
			}
		});
	}
	fn_movielist();
});





</script>
</html>
