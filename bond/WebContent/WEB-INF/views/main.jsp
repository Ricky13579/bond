<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="../resources/css/user.css">
<script type="text/javascript" src="../resources/js/jquery-3.7.1.min.js"></script>
<title>스파이 패밀리</title>
<script type="text/javascript">
	$(document).ready(function(){		
		
		$('#login').click(function(){
			var sid="${SID}";
			if(!sid || sid!='null'){
				
			$(location).attr('href','/member/login.bond');
			}else{
				alert('로그인 되어있으므로 다시 돌아가세요');
			}
		});
		
		$('#logout').click(function(){
			$(location).attr('href','/member/logoutProc.bond');
		});
		
		$('#join').click(function(){
			// 로그인 여부 검사
			var sid='${SID}';
			if(!sid || sid !='null'){
				$(location).attr('href','/member/join.bond');
			}else{
				return;
			}
		});
	});
</script>
</head>
<body>
	<div class="w3-center w3-content mxw650">
		<h1 class=" w3-aqua w3-card-4 w3-padding">심장 소리 재밌어~~~ 하하하하하하</h1>

		<div class="w3-col mgt10">
<!-- 로그인에 성공하면 session에 SID라는 속성으로 아이디를 기억시켜 놓을 것이므로 -->
 <c:if test="${not empty SID}">
			<div class="w3-btn w3-small w3-left w3-orange" id="logout">로그아웃</div>	
</c:if>
<c:if test="${empty SID}">
			<div class="w3-btn w3-small w3-right w3-blue" id="join">회원가입</div>
			<div class="w3-btn w3-small w3-right w3-green" id="login">로그인</div>
</c:if>
		</div>
	</div>
</body>
</html>