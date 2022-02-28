<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-200">



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
</head>
  
  <body>
<!--header  -->
    <form class="d-flex">
        <input class="form-control me-sm-2" type="text" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
  		<table class="table table-striped table-bordered table-hover">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th>ott</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${newCon }" var="list">
					<tr class="text-center">
						<td>${list.newConNm }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<%@ include file="/WEB-INF/inc/bottom.jsp"%>
  </body>
  
  
<script type="text/javascript">
function new_con(){
	//실시간차트 데이터 넘기기
	$.ajax({
		url:"<c:url value='/contents/newContents.wow'/>"
		,type:"post"
		,data:data
		,dataType:'json'
		//,data:파라미터들(담을 데이터쓰기)
		,success:function(data){
			alert("성공");
		},
		error: function(error){
			alert("실패");
		}
	});
}


</script>
	<%@ include file="/WEB-INF/inc/bootjs.jsp"%>
</html>
