<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<link href="/resources/css/manage.css" rel="stylesheet" />
</head>
<body>

	<div>

		<div class="test1">

			<ul class="nav-container">

				<li><a href="#"><img src="/resources/img/logo_1.png"
						width="100px" height="100px"></a></li>
				<li class="nav-item"><a href="/Manage">관리</a></li>
				<li class="nav-item"><a href="/Regist">등록</a></li>

			</ul>

		</div>


		<div class="two">

			<div class="test2">

				<div class="list" onClick="goRegist()">알바생 등록</div>

			</div>

			<div class="test3">

			</div>

		</div>
	</div>
</body>

<script>

	function goRegist(){
		
		location.href="/ShowRegist";
		
	}

</script>

</html>



