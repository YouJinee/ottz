<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-100">
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/slate/bootstrap.min.css"
	integrity="sha384-8iuq0iaMHpnH2vSyvZMSIqQuUnQA7QM+f6srIdlgBrTSEyd//AWNMyEaSF2yPzNQ"
	crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/resources/css/ottzSearch.css"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/bootjs/css/styles.css" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/resources/bootjs/css/styles.css"
	rel="stylesheet" />
	
	
	
	
	<!--슬라이드 시작  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
     .carousel-inner > .item > img { 
       top: 0;
       left: 0; 
       height: 60vh;
       align-content: center;   	
     }  
  </style>
	<!--슬라이드 끝  -->

</head>




<body>

<div class="container">
  <h2>홍보, 이벤트, 커뮤니티</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="container" >
	    <div class="carousel-inner" >
	      <div class="item active">
	        <img src="resources/images/banner.png" alt="banner" >
	      </div>
	
	      <div class="item">
	        <img src="resources/images/banner2.png" alt="banner2" >
	      </div>
	    
	      <div class="item">
	        <img src="resources/images/banner3.png" alt="banner3" >
	      </div>
	    </div>
	</div>
	
	
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

 



</body>

</html>
