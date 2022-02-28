
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-200">
<style>
.wholePage {
	width: 100%;
}

.search-div {
	width: 100%;
	text-align: center;
}

.searchInput {
	width: 50%;
	margin: 0 auto;
}

.accordion-div .accordion {
	position: relative;
	width: 70%;
	margin: 20px auto;
}

.checkOtt {
	padding-top: 20px;
	height: 100%;
	width: 100%;
}
.searchOtt{
margin: auto;
}


.headerUl {
    display: flex;
    padding-top: 30px;
    padding-bottom: 30px;
    margin-bottom: 50px;
    background-color: #0B1426;
}

.headerUl li {
	list-style-type: none;
	padding: 0 134px;
}

.headerUl a {
	font-family: 'Nanum Gothic', sans-serif;
	text-decoration-line: none;
	color: white;
	font-size: 19px;
	transition: all ease-out 0.2s 0s;
	text-decoration: none;
}

.fw-bolder{
font-size: 1.25rem;
}

.p{
	font-size: 60px;
    text-align: center;
    color: white;
    font-family: 'Do Hyeon', sans-serif;
}



</style>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
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
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

</head>



<body>

	<header>
		<div class="headerDiv">
			<ul class="headerUl">
				<li><a href="conPage.wow">HOME</a></li>
				<li><a href="ottzPromotion.wow">INFORMATION</a></li>
				<li><a href="ottzSearch.wow">CONTENTS</a></li>
				<li><a href="freeList.wow">COMMUNITY</a></li>
				<li><a href="questionsList.wow">Q & A</a></li>
			</ul>
		</div>
	</header>



	<div class="wholePage">

		<!-- searchList -->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
			<p class="p">&lt;&lt; 랜덤 &gt;&gt;</p>
				<div id="theme_list"
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				</div>
			</div>
		</section>
	</div>
	
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
		

</body>

<script type="text/javascript">
		var firstParams = {
			"curPage" : 1,
			"rowSizePerPage" : 8,
			"theme": "${searchVO.theme}"			
		};

		$(function() {
			$.ajax({
						url : "<c:url value = '/ottzRandom'/>",
						type : 'POST',
						data : firstParams,
						dataType : 'JSON',
						success : function(data) {
						 	$
									.each(
											data.data,
											function(index, element) {
												console.log(index);
												var conOrgTitle = element.conOrgTitle;
												if (conOrgTitle == null) {
													conOrgTitle = "&nbsp;";
												}
												var str = "";
												str = str
														+ '<div class="col mb-5"> <div class="card h-200">'
														+ '<img class="card-img-top" src="'+ element.conImg+'" alt="..." />'
														+ '<div class="card-body p-4"> <div class="text-center">'
														+ '<h5 class="fw-bolder">'
														+ element.conTitle
														+ '</h5>'
														+ conOrgTitle
														+ '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
														+ '	<div class="text-center">'
														+ '<a class="btn btn-outline-dark mt-auto" href="ottzView.wow?conNo='
														+ element.conNo
														+ '">View options</a></div></div></div>'
												$('#theme_list').append(str);
											}); 
							}
					});
		});
		
		
		
	</script>
</html>
