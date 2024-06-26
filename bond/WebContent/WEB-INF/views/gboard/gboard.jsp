<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스파이 명단</title>
<link rel="stylesheet" type="text/css" href="../resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="../resources/css/user.css">
<script type="text/javascript" src="../resources/js/colorClass.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.7.1.min.js"></script>
<style type="text/css">
	p{
		margin : 0px!important;
	}
	
	hr{
		margin : 3px!important;
	}
	
	#wmodal{
		display : none;
	}
	#msg{
		display : block;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#home').click(function(){
			$(location).attr('href','/main.bond');
		});
		
		$('#login').click(function(){
			$(location).attr('href','/member/login.bond');
		});
		
		$('#logout').click(function(){
			$(location).attr('href','/member/logoutProc.bond');
		});
		
		$('#join').click(function(){
			$(location).attr('href','/member/join.bond');
		});
		
		$('#wbtn').click(function(){
			$('#wmodal').css('display', 'block');
		});
		$('#close, #cbtn').click(function(){
			document.frm.reset();
			$('#wmodal').css('display','none');
		});
		$('#mclose, #cmbtn').click(function(){
			document.frm.reset();
			$('#msg').css('display','none');
		});
		$('#write').click(function(){
			// 데이터 유효성 검사
			var sid=$(document.frm.id).val();
			if(!sid || sid=='null'){
				// 로그인 안되있는 경우
				// 로그인 페이지로 보내기
				$(location).attr('href','/member/login.bond');
			}
			
			// 입력 메세지 읽고
			var body=$('#body').val();
			if(!body){
				// 내용입력이 안된 경우
				alert('내용이 입력이 안됬습니다.');
				$('#body').focus();
			}
			
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw600">
		<h1 class="w3-col w3-blue w3-center w3-padding">Bond 방명록</h1>
		<div class="w3-col">
			<div class="w3-green w3-btn" id="home">home</div>
<c:if test="${empty SID }">
			<div class="w3-pink w3-btn w3-right" id="join">회원가입</div>
			<div class="w3-blue w3-btn w3-right" id="login">로그인</div>
</c:if>
<c:if test="${not empty SID}">
			<div class="w3-red w3-btn" id="logout">로그아웃</div>
<c:if test="${empty CNT or CNT eq 0 }">
			<div class="w3-orange w3-btn w3-right" id="wbtn">글작성</div>
</c:if>

</c:if>
		</div>
		<div class="w3-col w3-margin-top">
<c:forEach var="DATA" items="${List}">
			<div class="w3-col w3-padding w3-card-4 w3-margin-bottom">
				<div class="w3-col"
					style="width : 110px; height : 100px; padding-right 10px; border-right : 1px solid lightgray">
				<img src="/resources/image/avatar/${DATA.sname}" class="imgBox w3-left w3-border">
				</div>
				<div class="w3-rest" style="padding-left : 10px">
					<div class="w3-col w3-border-bottom" style="padding-bottom: 3px;">
						<p class="w3-half w3-left-align"><strong>작성자 : ${DATA.id} </strong></p>
						<p class="w3-half w3-right-align">${DATA.sdate}</p>
					</div>
					<!-- <hr class="w3-col"> -->
					<div class="w3-col w3-padding">
						<pre><small>${DATA.body}</small></pre>
					</div>
				</div>
			</div>
</c:forEach>
		</div>
	</div>
	
	<div id="wmodal" class="w3-modal">
		<form method="post" action="/gboard/gWriteProc.bond"
				name="frm" id="frm" class="w3-modal-content mxw550">
			<input type="hidden" name="id" value="${SID}">
			<header class="w3-container w3-blue"> 
				<span class="w3-btn w3-display-topright" id="close">&times;</span>
				<h2>Bond 방명록 작성</h2>
			</header>
			<div class="w3-container w3-padding">
				<textarea name="body" id="body" class="w3-input w3-border" 
							style="resize : none;" placeholder="인사글을 작성하세요!"></textarea>
			</div>
			<footer class="w3-col">
				<div class="w3-half w3-purple w3-btn" id="cbtn">취소</div>
				<div class="w3-half w3-blue w3-btn" id="write">등록</div>
			</footer>
		</form>
	</div>
	
<c:if test="${not empty MSG}">
	<div id="msg" class="w3-modal">
		<div class="w3-modal-content mxw550">
			<header class="w3-container w3-blue"> 
				<span class="w3-btn w3-display-topright" id="mclose">&times;</span>
				<h2>Bond 방명록 등록 결과</h2>
			</header>
			<div class="w3-container w3-padding">
				<h3 class="w3-center">${MSG} - 등록에 성공했습니다.</h3>
			</div>
			<footer class="w3-col">
				<div class="w3-col w3-purple w3-btn" id="cmbtn">확인</div>
			</footer>
		</div>
	</div>
</c:if>
</body>
</html>