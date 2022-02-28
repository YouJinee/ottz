
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-100">
<style>
.wholePage {
	width: 100%;
}

.search-div {
	width: 100%;
	text-align: center;
}
/* .accordion {
    margin: 0 auto;
    width: 50%;
} */
.searchInput {
	width: 50%;
	margin: 0 auto;
}

.accordion {
	position: relative;
	width: 50%;
	margin: 20px auto;
}

.checkOtt {
	padding-top: 20px;
	height: 100%;
	width: 100%;
}

.searchOtt {
	margin: auto;
}

.progress {
	margin-bottom: 10px;
	margin-top: 10px;
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

.accordion-body {
	display: flex;
}

input[type="checkbox"] {
	display: none;
}

.accordion-body .btn-group-toggle {
	margin-left: 20px;
}

#id_review_list_area {
	margin-bottom: 40px;
}

.card.h-100 {
	margin-left: 10px;
	margin-right: 10px;
}

.search-div {
	position: relative;
	top: 30px;
}

.ageText {
	color: slategrey;
}

.scroll_icon {
	position: fixed;
	bottom: 30px;
	right: 100px;
	width: 50px;
	height: 50px;
	background-color: lightgray;
	border-radius: 50%;
	padding: 5px;
}

.p-4 {
	padding: 0.5rem !important;
}
</style>
<head>
<!-- Latest compiled JavaScript -->
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gothic+A1:wght@400;800&family=Gugi&family=Sunflower:wght@500&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>
	<!--header  -->
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
		<!-- search -->

		<div class="search">
			<div class="search-div">
				<form class="d-flex" name="searchName" id="search-form"
					action="ottzSearch.wow" method="post">
					<input type="hidden" name="curPage" value="${searchVO.curPage }">
					<input type="hidden" name="rowSizePerPage"
						value="${searchVO.rowSizePerPage }">
					<div class="searchInput">
						<input class="form-control me-sm-2" type="text" name="searchWord"
							value="${searchVO.searchWord }" placeholder="영화 이름을 검색해보세요!">
					</div>
					<div class="checkOtt">
						<input type="checkbox" name="searchOtt" class="searchOtt"
							id="checkNetflix" value="Netflix"
							${searchVO.searchOtt.contains("Netflix") ? "checked='checked'" : ""   } />
						<label for="checkNetflix"><div class="netflixImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkDisneyPlus" value="Disney Plus"
							${searchVO.searchOtt.contains("Disney Plus") ? "checked='checked'" : ""   } />
						<label for="checkDisneyPlus"><div class="disneyImg"></div></label>
						<input type="checkbox" name="searchOtt" class="searchOtt"
							id="checkWatcha" value="Watcha"
							${searchVO.searchOtt.contains("Watcha") ? "checked='checked'" : ""   } />
						<label for="checkWatcha"><div class="watchaImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkWavve" value="wavve"
							${searchVO.searchOtt.contains("Watcha") ? "checked='checked'" : ""   } />
						<label for="checkWavve"><div class="wavveImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkAmazon" value="Amazon Prime Video"
							${searchVO.searchOtt.contains("Amazon Prime Video") ? "checked='checked'" : ""   } />
						<label for="checkAmazon"><div class="amazonImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkApple" value="Apple TV Plus"
							${searchVO.searchOtt.contains("Apple TV Plus") ? "checked='checked'" : ""   } />
						<label for="checkApple"><div class="appleImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkBroad" value="BroadwayHD"
							${searchVO.searchOtt.contains("BroadwayHD") ? "checked='checked'" : ""   } />
						<label for="checkBroad"><div class="broadImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt" id="checkWow"
							value="WOW Presents Plus"
							${searchVO.searchOtt.contains("WOW Presents Plus") ? "checked='checked'" : ""   } />
						<label for="checkWow"><div class="wowImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt" id="checkPlex"
							value="Plex"
							${searchVO.searchOtt.contains("Plex") ? "checked='checked'" : ""   } />
						<label for="checkPlex"><div class="plexImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkGuide" value="GuideDoc"
							${searchVO.searchOtt.contains("GuideDoc") ? "checked='checked'" : ""   } />
						<label for="checkGuide"><div class="guideImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkCuriosity" value="Curiosity Stream"
							${searchVO.searchOtt.contains("Curiosity Stream") ? "checked='checked'" : ""   } />
						<label for="checkCuriosity"><div class="curiosityImg"></div></label>
						<input type="checkbox" name="searchOtt" class="searchOtt"
							id="checkHoichoi" value="Hoichoi"
							${searchVO.searchOtt.contains("Hoichoi") ? "checked='checked'" : ""   } />
						<label for="checkHoichoi"><div class="hoichoiImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkDekkoo" value="Dekkoo"
							${searchVO.searchOtt.contains("Dekkoo") ? "checked='checked'" : ""   } />
						<label for="checkDekkoo"><div class="dekkooImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt"
							id="checkDocAlliance" value="DocAlliance Films"
							${searchVO.searchOtt.contains("DocAlliance Films") ? "checked='checked'" : ""   } />
						<label for="checkDocAlliance"><div class="docAllianceImg"></div></label>
						<input type="checkbox" name="searchOtt" class="searchOtt"
							id="checkCrunchy" value="Crunchyroll"
							${searchVO.searchOtt.contains("Crunchyroll") ? "checked='checked'" : ""   } />
						<label for="checkCrunchy"><div class="crunchyImg"></div></label> <input
							type="checkbox" name="searchOtt" class="searchOtt" id="checkMubi"
							value="Mubi"
							${searchVO.searchOtt.contains("Mubi") ? "checked='checked'" : ""   } />
						<label for="checkMubi"><div class="mubiImg"></div></label>
					</div>
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne">원하는
									장르를 선택하세요.</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample"
								style="">
								<div class="accordion-body">
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("액션") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }
											for="action"> <input type="checkbox"
											name="searchGenre" class="searchGenre" value="액션" id="action"
											${searchVO.searchGenre.contains("액션") ? "checked='checked'" : ""  } />액션
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("SF") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="SF"
											${searchVO.searchGenre.contains("SF") ? "checked='checked'" : ""   } />SF
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("로맨스") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="로맨스"
											${searchVO.searchGenre.contains("로맨스") ? "checked='checked'" : ""   } />로맨스
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("코미디") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="코미디"
											${searchVO.searchGenre.contains("코미디") ? "checked='checked'" : ""   } />코미디
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("가족") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="가족"
											${searchVO.searchGenre.contains("가족") ? "checked='checked'" : ""   } />가족
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("드라마") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="드라마"
											${searchVO.searchGenre.contains("드라마") ? "checked='checked'" : ""   } />드라마
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("공포") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="공포"
											${searchVO.searchGenre.contains("공포") ? "checked='checked'" : ""   } />공포
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("애니메이션") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="애니메이션"
											${searchVO.searchGenre.contains("애니메이션") ? "checked='checked'" : ""   } />애니메이션
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("판타지") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="판타지"
											${searchVO.searchGenre.contains("판타지") ? "checked='checked'" : ""   } />판타지
										</label>
									</div>
									<div class="btn-group-toggle" data-toggle="buttons">
										<label
											${searchVO.searchGenre.contains("다큐멘터리") ? "class='btn btn-light active'" : "class=		'btn btn-light'"   }>
											<input type="checkbox" name="searchGenre" class="searchGenre"
											value="다큐멘터리"
											${searchVO.searchGenre.contains("다큐멘터리") ? "checked='checked'" : ""   } />다큐멘터리
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<img class="scroll_icon" style="cursor: pointer;" alt=""
						src="<c:url value='/resources/images/up-arrows.png'/>"
						onclick="topClick()">
					<button class="btn btn-secondary my-2 my-sm-0" type="button"
						id="id_btn_reset">Reset</button>
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>

				</form>
			</div>
		</div>
		<!-- searchList -->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div id="contents_list"
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				</div>
			</div>
		</section>
	</div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
	<script type="text/javascript">
		$form = $("form[name = 'searchName']");
		$curPage = $form.find("input[name='curPage']");

		$form.find("button[type=submit]").click(function(e) {
			e.preventDefault();
			$curPage.val(1);
			$form.submit();
		});

		var genres = [];
		var otts = [];
		$("input[name='searchGenre']:checked").each(function(i) {
			genres.push($(this).val());
		});
		$("input[name='searchOtt']:checked").each(function(i) {
			otts.push($(this).val());
		});
		console.log(genres.toString());
		var firstParams = {
			"curPage" : 1,
			"rowSizePerPage" : 8,
			"searchWord" : "${searchVO.searchWord}",
			"searchGenre" : genres.toString(),
			"searchOtt" : otts.toString()
		};
		var params = {
			"curPage" : 2,
			"rowSizePerPage" : 8,
			"searchWord" : "${searchVO.searchWord}",
			"searchGenre" : genres.toString(),
			"searchOtt" : otts.toString()
		};
		console.log(genres)
		$(function() {
			$
					.ajax({
						url : "<c:url value = '/ottSearch/contentsList'/>",
						type : 'POST',
						data : firstParams,
						dataType : 'JSON',
						success : function(data) {
							console.log(data);
							$
									.each(
											data.data,
											function(index, element) {
												var conOrgTitle = element.conOrgTitle;
												if (conOrgTitle == null) {
													conOrgTitle = "&nbsp;";
												}
												var conAge = element.conAge;
												var ageImg = "";
												if (element.conAge == 7) {
													ageImg = "<c:url value='/resources/images/ageIcon/7age.png'/>";
													ageText = "7세이상 관람가"
												} else if (element.conAge == 12) {
													ageImg = "<c:url value='/resources/images/ageIcon/12age.png'/>";
													ageText = "12세이상 관람가"
												} else if (element.conAge == 15) {
													ageImg = "<c:url value='/resources/images/ageIcon/15age.png'/>";
													ageText = "15세이상 관람가"
												} else if (element.conAge == 19) {
													ageImg = "<c:url value='/resources/images/ageIcon/noTeenager.png'/>";
													ageText = "청소년 관람 불가"
												} else if (element.conAge == null) {
													ageImg = "<c:url value='/resources/images/ageIcon/noAge.png'/>";
													ageText = "등급을 제공하지 않는 콘텐츠입니다. "
												} else if (element.conAge == 'ALL') {
													ageImg = "<c:url value='/resources/images/ageIcon/allAge.png'/>";
													ageText = "전체 관람가"
												}
												var str = "";
												str = str
														+ '<div class="col mb-5"> <div class="card h-100">'
														+ '<img class="card-img-top" src="'
														+ element.conImg
														+ '" alt="..." onclick="location.href = \'ottzView.wow?conNo='
														+ element.conNo
														+ '\';" style="cursor:pointer;"/>'
														+ '<div class="card-body p-4"> <div class="text-center">'
														+ '<h5 class="fw-bolder">'
														+ element.conTitle
														+ '</h5>'
														+ conOrgTitle
														+ '<br>'
														+ '<img alt="" src="'+ageImg+'" width="50px" height="50px">'
														+ '<div class="ageText">'
														+ ageText + '</div>'
												if (element.conScore !== null) {
													str = str
															+ '<div class="progress">'
															+ '<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="${conScore }"'
															+ 'aria-valuemin="0" aria-valuemax="100" style="width: '
															+ element.conScore
															+ '%;">'
															+ element.conScore
															+ '%</div> </div>';
												}
												str = str
														+ '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
														+ '	<div class="text-center">'
														+ '<a class="btn btn-outline-dark mt-auto" id = "viewOptionsBtn" href="ottzView.wow?conNo='
														+ element.conNo
														+ '">ABOUT</a></div></div></div>'
												$('#contents_list').append(str);
											});
						}
					});
		});
		$(window)
				.scroll(
						function() {
							var scrolltop = $(document).scrollTop();
							var height = $(document).height();
							var height_win = $(window).height();
							if (Math.round($(window).scrollTop()) == $(document)
									.height()
									- $(window).height()) {
								$
										.ajax({
											url : "<c:url value = '/ottSearch/contentsList'/>",
											type : 'POST',
											data : params,
											dataType : 'JSON',
											success : function(data) {
												console.log(data);
												$
														.each(
																data.data,
																function(index,
																		element) {
																	var conOrgTitle = element.conOrgTitle;
																	if (conOrgTitle == null) {
																		conOrgTitle = "&nbsp;";
																	}
																	var ageImg = "";
																	var ageText = "";
																	if (element.conAge == 7) {
																		ageImg = "<c:url value='/resources/images/ageIcon/7age.png'/>";
																		ageText = "7세이상 관람가"
																	} else if (element.conAge == 12) {
																		ageImg = "<c:url value='/resources/images/ageIcon/12age.png'/>";
																		ageText = "12세이상 관람가"
																	} else if (element.conAge == 15) {
																		ageImg = "<c:url value='/resources/images/ageIcon/15age.png'/>";
																		ageText = "15세이상 관람가"
																	} else if (element.conAge == 19) {
																		ageImg = "<c:url value='/resources/images/ageIcon/noTeenager.png'/>";
																		ageText = "청소년 관람 불가"
																	} else if (element.conAge == null) {
																		ageImg = "<c:url value='/resources/images/ageIcon/noAge.png'/>";
																		ageText = "등급을 제공하지 않는 콘텐츠입니다. "
																	} else if (element.conAge == 'ALL') {
																		ageImg = "<c:url value='/resources/images/ageIcon/allAge.png'/>";
																		ageText = "전체 관람가"
																	}
																	var str = "";
																	str = str
																			+ '<div class="col mb-5"> <div class="card h-100">'
																			+ '<img class="card-img-top" src="'+ element.conImg+'" alt="..." />'
																			+ '<div class="card-body p-4"> <div class="text-center">'
																			+ '<h5 class="fw-bolder">'
																			+ element.conTitle
																			+ '</h5>'
																			+ conOrgTitle
																			+ '<br>'
																			+ '<img alt="" src="'+ageImg+'" width="50px" height="50px">'
																			+ '<div class="ageText">'
																			+ ageText
																			+ '</div>'
																	if (element.conScore !== null) {
																		str = str
																				+ '<div class="progress">'
																				+ '<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="${conScore }"'
																				+ 'aria-valuemin="0" aria-valuemax="100" style="width: '
																				+ element.conScore
																				+ '%;">'
																				+ element.conScore
																				+ '%</div> </div>';
																	} else {
																		str = str
																				+ '<div class="progress">'
																				+ '<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="${conScore }"'
																				+ 'aria-valuemin="0" aria-valuemax="100" style="width: 0%;">평점을 제공하지 않는 콘텐츠입니다.</div> </div>';
																	}
																	str = str
																			+ '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
																			+ '	<div class="text-center">'
																			+ '<a class="btn btn-outline-dark mt-auto" href="ottzView.wow?conNo='
																			+ element.conNo
																			+ '">ABOUT</a></div></div></div>';
																	$(
																			'#contents_list')
																			.append(
																					str);
																});
												params.curPage += 1;
											}
										//스크롤이 끝에 도달했을때 실행될 이벤트 
										});
							}
						});

		$('#id_btn_reset').click(
				function() {
					$curPage.val(1);
					$form.find("input[name='searchWord']").val("");
					$form.find("input:checkbox[name='searchGenre']").attr(
							"checked", false);
					$form.find("input:checkbox[name='searchOtt']").attr(
							"checked", false);
					$form.submit();
				})
		function topClick() {
			event.preventDefault();
			$('html, body').animate({
				scrollTop : 0
			});
		}
	</script>
</body>
</html>
