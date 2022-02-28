<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html class="html">

<head>
<link
	href="<%=request.getContextPath()%>/resources/bootjs/css/styles3.css"
	rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">

	<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>


	<div class="top" id="top" style="text-align: center;">
		<h2>각종 미디어 콘텐츠를 한 곳에서</h2>
		<h1 style="font-family: 'Ubuntu', sans-serif;">OTTZ</h1>
		<a href="./conPage.wow">이동하기 ></a>
		
		<img alt="..." src="resources/images/promotion.jpg">
	</div>
	
	<div class="con">
		<div class="netflix" style="text-align: center;">
		<img alt="..." src="resources/images/netflix.png">
			<p>전 세계 190개국 이상의, 2.1억 명의 회원을 보유한 스트리밍 엔터테인먼트 기업으로서<br> 
			영화와 드라마, TV 프로그램, 다큐멘터리, 애니메이션 등의 <br>
			매우 다양한 장르의 컨텐츠들을 언제, 어디서나, 무제한으로 제공합니다
			</p>
			<a href="https://www.netflix.com/kr">이동하기 ></a>
		</div>
		
		<div class="watcha" style="text-align: center;">
		<img alt="..." src="resources/images/watcha.png">
			<p>스마트폰, 태플릿, TV, PC, 크롬캐스트, Android에서 10만여 편의 작품을 무제한 스트리밍<br>
			 매주 5백 여편의 신작이 업데이트 되며, 추가 요금은 전혀 없어요<br>
			 최대 Ultra HD 4K 해상도로 생생한 감동을 느껴보세요<br>
			</p>
			<a href="https://watcha.com/">이동하기 ></a>
		</div>		
		
		<div class="disney" style="text-align: center;">
		<img alt="..." src="resources/images/disney.jpg">
			<p>
			Disnep, MARVEL, PIXAR, STAR WARS, <br>
			NATIONAL GEOGRAPHIC, 20th CENTURY STUDIOS까지 모두 만나보세요<br>
			더 짜릿하게, 더 감동적으로, 무한한 star의 세상으로
			</p>
			<a href="https://www.disneyplus.com/ko-kr">이동하기 ></a>
		</div>		
	
	
		<div class="tving" style="text-align: center;">
		<img alt="..." src="resources/images/tving.png">
			<p>
			티빙 오리지널 콘텐츠, <br>
			방송, 영화, 해외 시리즈까지!<br>
			재미를 플레이해보세요
			</p>
			<a href="https://www.tving.com/onboarding">이동하기 ></a>
		</div>		
	</div>



<!--위로가기 버튼  -->
	<div style="position: fixed; bottom: 10px; right: 20px;">
		<a href="#top"><img alt="" src="resources/images/top.png" title="↑" width="50px;"></a>
	</div>


<%@ include file="/WEB-INF/inc/bottom.jsp"%>
</body>
<%@ include file="/WEB-INF/inc/bootjs.jsp"%>
</html>
