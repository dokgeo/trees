<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>날짜 선택</title>
</head>
<body onLoad="init()">
	<a href="http://192.168.219.106/LoginForm" >로그인폼 이동</a><br />
	<P>  Now Time : ${Access} </P>
	<section id="movieZone" style="display:flex;">
		<div id="movieInfo"></div>
		<div id="selectionDate">상영일을 선택해주세요</div>
		<div id="selectionTime">selectionTime</div>
	</section>
</body>
<script>
let screeningData;
function init(){
	/* Convert Date */
	let dateList =document.getElementById("selectionDate")
	let dayStr = "${Access}";
	let day = dayStr.split("-");
	let now = new Date(parseInt(day[0]), parseInt(day[1])-1, parseInt(day[2]));
	for(i=0; i<7; i++){
		now.setDate(i==0? now.getDate():now.getDate()+1);
		let dateDiv = document.createElement('Div');
		let month = ((now.getMonth()+1)<10)? "0"+(now.getMonth()+1):(now.getMonth()+1);
		let date = ((now.getDate()<10)? "0"+now.getDate():now.getDate());
		dateDiv.textContent = now.getFullYear()+"-"+ month+"-"+date;
		dateDiv.style.cursor="pointer";
		dateDiv.addEventListener('click',function(){divClick( movie[0].mvCode,this.textContent);});
		dateList.appendChild(dateDiv);
	}

	let movieInfo = document.getElementById("movieInfo");
	/* Append movieInfo Div */
	let movie = JSON.parse('${movieData}');
	
	let mvImage = document.createElement('Div');
	mvImage.style.width = "400px";
	mvImage.style.height = "400px";
	mvImage.style.margin = "0px 10px 20px 0px";
	mvImage.style.backgroundImage = "url(/resources/image/" + movie[0].mvImage + ")";
	mvImage.style.backgroundSize = "contain";
	movieInfo.appendChild(mvImage);
	
	let mvTitle = document.createElement('Div');              
	mvTitle.textContent = movie[0].mvName;
	mvImage.className = "movie";
	movieInfo.appendChild(mvTitle);
	
	   let mvGrade = document.createElement('Div');  
	   if(movie[0].mvGrade='K'){
	      mvGrade.textContent = "전체상영가";
	   }else if(movie[0].mvGrade='Y'){
	      mvGrade.textContent = "12세 이상 관람가";
	   }else if(movie[0].mvGrade='M'){
	      mvGrade.textContent = "15세 이상 관람가";
	   }else{
	      mvGrade.textContent = "19세 이상 관람가";
	   }
	mvGrade.className = "movie";
	movieInfo.appendChild(mvGrade);
	
	let mvStatus = document.createElement('Div');              
	if(movie[0].mvStatus =='I'){
		mvStatus.textContent = "상영중";
	}else{
		
		mvStatus.textContent = "상영예정";
	}
	mvStatus.className = "movie";
	movieInfo.appendChild(mvStatus);
	
	let mvComments = document.createElement('Div');              
	mvComments.textContent = movie[0].mvComments;
	mvComments.className = "movie";
	movieInfo.appendChild(mvComments);
}

function divClick(mvCode,date){
	//서버전
	   
	   let request = new XMLHttpRequest();
	   request.onreadystatechange = function(){
	      if(this.readyState == 4 && this.status == 200){ 
	         let jsonData = decodeURIComponent(request.response);
	      screeningData= JSON.parse(jsonData);
	         screening(date);
	         
	      }
	   };
	request.open("post","toTime", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=toTime&mvCode="+mvCode+"&toDate="+date);
	
}
function screening(date){
	let tList = document.getElementById("selectionTime");
	
	for(index=0; index<screeningData.length; index++){
		let i= index;
	let stt = document.createElement('Div');
	let mCode =screeningData[index];
	let st= screeningData[index].TIME;
	let sc = screeningData[index].SI_SCREEN+"관";
	
	let spec = stt.innerHTML +="상영시간" +st.substring(0,2)+"시"
	+st.substring(2,4)+"분"+ "("+screeningData[index].SI_SCREEN
			+"관)" +"<br/>";
	stt.value = "spec";
	stt.type= "button";		
	stt.style.cursor= "pointer";
	stt.addEventListener('click',function(){timeClick(i,date);});
	tList.appendChild(stt);
	}

	function timeClick (index,date){

		let formData = "sCode=toSeat&mvCode=" + screeningData[index].mvCode + 
		"&mvThCode=1&toDate=" +date.replace(/-/g,"") + screeningData[index].TIME.substring(0,2)+screeningData[index].TIME.substring(2,4)
		 + "&SI_SCREEN=" + screeningData[index].SI_SCREEN;
		
		let form =document.createElement("form");
		form.action="toSeat?"+formData;
		form.method="post";
		
		document.body.appendChild(form);
		form.submit();
	}

	
}
</script>
</html>