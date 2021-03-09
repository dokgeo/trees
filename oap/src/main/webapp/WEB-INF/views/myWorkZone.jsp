<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <title>myWorkZone</title>
   <link href="/resources/css/myWorkZone.css" rel="stylesheet"/> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body onload="init()">
	<div class="work_wrap"> 
	<div class="worklist">나의 매장 목록

	<div class ="addwork_btn">
	<i class="far fa-plus-square "></i><input type ="button"  class= "addstore" value="매장추가" onClick="addstore()"></div>
   <div class ="deletework_btn">
   <i class="far fa-minus-square"></i><input type ="button" class= "delstore"value="매장삭제" onClick="deletestore()"> </div>
    </div>
	<section id= "workZone">
	
	<div id= "workInfo"></div>
	</section>
   


  
   
 
   <br/><br/>
  </body>
  <script src="https://kit.fontawesome.com/95e4c2790a.js" crossorigin="anonymous"></script>
  <script>
  function init() {
	   let section = document.getElementById("workZone");
	   let workInfo = document.getElementById("workInfo");
		let log = '${WL}';
		let workrep = log.replace(/\n/g,'\\n');
		let work = JSON.parse(workrep);

		
		for(i = 0; i<work.length; i++){
			let div = document.createElement('Div');
			div.className = "workzone";
			div.style.margin ="40px 0px";
			section.appendChild(div)
			let shName = document.createElement('h2');
			shName.textContent = work[i].shName;
			shName.className="workInfo";
			let shtype = document.createElement('h4');
			shtype.textContent = "업종 : " +work[i].shType;
			shtype.className="kname";
			let workman = document.createElement('h4');
			workman.textContent = "직원수 : " +work[i].workman +"명";
			workman.style.margin ="10px 0px";
			workman.className="kmember";
// 			let workimg = document.createElement('Div');
// 			workimg.style.backgroundImage = "url(/resources/image/" +work[i].workimg + ")";
// 			workimg.style.backgroundSize = "contain";
// 			workimg.className="workimg";
			
// 			div.appendChild(workimg);
			div.appendChild(workman);
			div.appendChild(shtype);
			div.appendChild(shName);
			
		}
}
	function addstore(){
		let form = document.createElement("form");
		form.setAttribute("method","get");
		form.setAttribute("action",'addWorkZone');
		form.setAttribute("target","매장등록");
		
		document.body.appendChild(form);
			
			
			  window.open('addWorkZone.jsp','매장등록','top=10,left=10,width=800,height=600,status=no,menubar=no,toolbar=no,resizable=no');
			
			 
			 form.submit();
	
		}

  </script>
</html>