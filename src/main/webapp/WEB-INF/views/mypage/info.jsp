<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="h-100">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.text-center {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.footer-demo.section-dark {
	/* 	position: fixed;  */
	bottom: 0;
	width: 100%;
}

.save-table td {
	padding: 5px;
}

.save-table img {
	border-radius: 15px 15px;
}

.starpoint_wrap {
    display: inline-block;
    text-align: center;
    margin-left: 50px;
}

.starpoint_box {
	position: relative;
	background:
		url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 0
		no-repeat;
	font-size: 0;
}

.starpoint_box .starpoint_bg {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	height: 18px;
	background:
		url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0
		-20px no-repeat;
	pointer-events: none;
}

.starpoint_box .label_star {
	display: inline-block;
	width: 10px;
	height: 18px;
	box-sizing: border-box;
}

.starpoint_box .star_radio {
	opacity: 0;
	width: 0;
	height: 0;
	position: absolute;
}

.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg {
	width: 10%;
}

.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg {
	width: 20%;
}

.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg {
	width: 30%;
}

.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg {
	width: 40%;
}

.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg {
	width: 50%;
}

.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg {
	width: 60%;
}

.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg {
	width: 70%;
}

.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg {
	width: 80%;
}

.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg {
	width: 90%;
}

.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg {
	width: 100%;
}
.score-table td {
	padding: 5px;
}

.score-table img {
	border-radius: 15px 15px;
}
.scoreText{
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
		<h3>
			<b>마이페이지</b>
		</h3>

		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>아이디</th>
					<c:if test="${member.memPass != null}">
						<td>${member.memId }</td>
					</c:if>
					<c:if test="${member.memPass == null}">
						<td>${member.memName }</td>
					</c:if>
				</tr>
				<tr>
					<th>회원명</th>
					<td>${member.memName }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${member.memNickName }</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${member.memHp }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${member.memMail }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${member.memAddress }</td>
				</tr>
				<tr>
					<th>회원 삭제 여부</th>
					<td>${member.memDelYn }</td>
				</tr>
				<tr>
					<td colspan="2"><a onclick="back()"
						class="btn btn-default btn-sm"><span
							class="glyphicon glyphicon-list" aria-hidden="true"></span>
							&nbsp;목록 </a> <a href='edit.wow?memId=${member.memId }'
						class="btn btn-info btn-sm"> <span
							class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							&nbsp;수정
					</a></td>
				</tr>
			</tbody>
		</table>
		<h3>
			<b>찜 목록</b>
		</h3>
		<table class="save-table">
			<tbody>
				<c:forEach items="${saveList }" var="save" varStatus="saveSta">
					<c:if test="${saveSta.index % 6 == 0 }">
						<tr>
					</c:if>
					<td>
						<p>
							<a href="ottzView.wow?conNo=${save.conNo}"> <img
								src="${save.conImg }" style="width: 200px;">
							</a>
						</p>
						<div
							style="font-size: 15px; text-align: center; font-weight: bold;">
							${save.conTitle }</div>
					</td>
				</c:forEach>
			</tbody>
		</table>
		<h3>
			<b>평점 목록</b>
		</h3>
		<table class="score-table">
			<tbody>
				<c:forEach items="${scoreList }" var="score" varStatus="scoreSta">
					<c:if test="${scoreSta.index % 6 == 0 }">
						<tr>
					</c:if>
					<td><a href="ottzView.wow?conNo=${score.conNo}">
							<img alt="" src="${score.conImg }" style="width: 200px;">
							</a>
						<div
							style="font-size: 15px; text-align: center; font-weight: bold;">
							${score.conTitle }</div>
							
						<div class="starpoint_wrap">
							<div class="starpoint_box" style="float: left; height: 18px;">
								<label for="starpoint${scoreSta.index}_1" class="label_star"
									title="0.5"> <span class="blind">0.5점</span>
								</label> <label for="starpoint${scoreSta.index}_2" class="label_star"
									title="1"> <span class="blind">1점</span>
								</label> <label for="starpoint${scoreSta.index}_3" class="label_star"
									title="1.5"> <span class="blind">1.5점</span>
								</label> <label for="starpoint${scoreSta.index}_4" class="label_star"
									title="2"> <span class="blind">2점</span>
								</label> <label for="starpoint${scoreSta.index}_5" class="label_star"
									title="2.5"> <span class="blind">2.5점</span>
								</label> <label for="starpoint${scoreSta.index}_6" class="label_star"
									title="3"> <span class="blind">3점</span>
								</label> <label for="starpoint${scoreSta.index}_7" class="label_star"
									title="3.5"> <span class="blind">3.5점</span>
								</label> <label for="starpoint${scoreSta.index}_8" class="label_star"
									title="4"> <span class="blind">4점</span>
								</label> <label for="starpoint${scoreSta.index}_9" class="label_star"
									title="4.5"> <span class="blind">4.5점</span>
								</label> <label for="starpoint${scoreSta.index}_10" class="label_star"
									title="5"> <span class="blind">5점</span>
								</label> <input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_1" class="star_radio"
									value="0.5"
									${score.conScore eq 0.5 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_2" class="star_radio"
									value="1.0"
									${score.conScore eq 1.0 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_3" class="star_radio"
									value="1.5"
									${score.conScore eq 1.5 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_4" class="star_radio"
									value="2.0"
									${score.conScore eq 2.0 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_5" class="star_radio"
									value="2.5"
									${score.conScore eq 2.5 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_6" class="star_radio"
									value="3.0"
									${score.conScore eq 3.0 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_7" class="star_radio"
									value="3.5"
									${score.conScore eq 3.5 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_8" class="star_radio"
									value="4.0"
									${score.conScore eq 4.0 ? "checked='checked'" : ''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_9" class="star_radio"
									value="4.5"
									${score.conScore eq 4.5 ? "checked='checked'" :''   }>
								<input type="radio" name="starpoint${scoreSta.index}"
									id="starpoint${scoreSta.index}_10" class="star_radio"
									value="5.0"
									${score.conScore eq 5.0 ? "checked='checked'" : ''   }>
								<span class="starpoint_bg"></span>
							</div>
						</div>
						<br>
						<div class="scoreText">
								${score.conScore }점
						</div>
						
					</td>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<%@ include file="/WEB-INF/inc/bottom.jsp"%>

</body>

<%@ include file="/WEB-INF/inc/bootjs.jsp"%>
<script type="text/javascript">
	
</script>
</html>