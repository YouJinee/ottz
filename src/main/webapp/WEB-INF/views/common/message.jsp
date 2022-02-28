<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html class="h-100">
<head>
<link href="<%=request.getContextPath()%>/resources/css/success.css"
	rel="stylesheet">
	
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">


</head>
<body>

<div class="container">
		<div class="row col-md-8 col-md-offset-2">
			<div class="page-header">
				<h3 class="title" 
				style="font-family: 'Hahmlet', serif;"
				>${resultMessageVO.title}</h3>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" style="font-family: 'Hahmlet', serif;">
					<p>${resultMessageVO.message}</p>
				</div>
				
				<div class="panel-body">
					<a href="${pageContext.request.contextPath}/conPage.wow"
						class="btn1"> 
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						&nbsp;Home
					</a>
 					<div class="pull-right">
						<c:if test="${not empty resultMessageVO.url}">
							<a href="<c:url value='info.wow' />"
								class="btn2"> 
								<span class="glyphicon glyphicon-new-window aria-hidden="true"></span>
								&nbsp;${resultMessageVO.urlTitle}
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container -->
</body>
</html>