<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/log.css" rel="stylesheet">
</head>
<body onLoad="init()">

<h1> 근무일지 </h1>
<section id= "logZone">
<div id ="logInfo"></div>
</section>


	<div id="work_diary_contents">
	<div class="test999">

			<div class="work_diary">
				<div class="work_diary_contents">
					<div class="work_diary_contents_name" >근무자</div>
					<div class="work_diary_contents_data" >${abName}</div>
				</div>
				<div class="work_diary_contents">
					<div class="work_diary_contents_name" >근무시간</div>
					<div class="work_diary_contents_data" >${workTime}</div>
				</div>
		
				<div class="work_diary_strongbox_contents">
					<div class="work_diary_contents_name" >인수 금고현황</div>
					<div class="work_diary_strongbox">50,000원</div><input class="work_diary_strongbox_data" name= "moneytype" value="${oman}" disabled> 
					<div class="work_diary_strongbox">10,000원</div><input class="work_diary_strongbox_data" name= "moneytype" value="${man}" readonly>
					<div class="work_diary_strongbox">5,000원</div><input class="work_diary_strongbox_data" name = "moneytype" value="${ocheon}" readonly>
				    <div class="work_diary_strongbox">1,000원</div><input class="work_diary_strongbox_data" name = "moneytype" value="${cheon}" readonly>
				    <div class="work_diary_strongbox">500원</div><input class="work_diary_strongbox_data" name = "moneytype" value="${obak}" readonly>
				    <div class="work_diary_strongbox">100원</div><input class="work_diary_strongbox_data" name = "moneytype" value="${bak}" readonly>
				    <div class="work_diary_strongbox">50원</div><input class="work_diary_strongbox_data" name = "moneytype" value="${osip}" readonly>
				    <div class="work_diary_strongbox">10원</div><input class="work_diary_strongbox_data" name = "moneytype" value="${sip}"readonly>
				</div>
				<div class="work_diary_contents_matters_test"><b>특이사항</b></div>
				<div class="work_diary_contents_matters" >${note} 
 
				</div>
			</div>
		
			</div>
			
		</div>		

		
		

		

			
			
			
		


	



</body>

<script>
function init(){
	let section = document.getElementById("logZone");
 	let logInfo = document.getElementById("logInfo");
 	let log = JSON.parse('${Log}');
 	
 	let nameTemp;
 	let timeTemp;
 	let moneyTemp;
 	let moneycnt;
 	let noteTemp;
 	let div = document.createElement('div');
 	div.className= "logZone";
	let diary = document.createElement('div');
		diary.className = "work_diary";
		
			
	let moneycon = document.createElement('div');
	moneycon.className = "work_diary_strongbox_contents";
	let moneyconName = document.createElement('div');	
	moneyconName.textContent= "인수 금고현황"
	moneyconName.className = "work_diary_contents_name";
	moneycon.appendChild(moneyconName);
 	section.appendChild(div);
 	for(i =0; i<log.length; i++){
 		if(nameTemp == log[i].abName){
 		
 		}else{
 		
 			let conbox = document.createElement('div');
 			conbox.className = "work_diary_contents";
 			
 			let alName = document.createElement('div');
 			alName.textContent = "근무자";
 			alName.className= "work_diary_contents_name";
 			let alNamedat = document.createElement('div');
 			nameTemp = log[i].abName
 			alNamedat.textContent = nameTemp;
 			alNamedat.className= "work_diary_contents_data";
 			
 			let conbox2 = document.createElement('div');
 			conbox2.className = "work_diary_contents";
 			
 			let workt = document.createElement('div');
 			workt.textContent = "근무시간";
 			workt.className= "work_diary_contents_name";
 			let worktdat = document.createElement('div');
 			timeTemp = log[i].workTime;
 			worktdat.textContent = timeTemp;
 			worktdat.className= "work_diary_contents_data";

 			
 			let note = document.createElement('div');
 			 note.textContent ="특이사항";
 			note.className= "work_diary_contents_matters_test";
 			
 			let notedat = document.createElement('div');
 			noteTemp = log[i].NOTE;
			notedat.textContent =noteTemp;
			notedat.className= "work_diary_contents_matters";
 		
 			
 			
 			conbox2.appendChild(workt);
 			conbox2.appendChild(worktdat);
 			conbox.appendChild(alName);
 			conbox.appendChild(alNamedat);
 			diary.appendChild(conbox);
 			diary.appendChild(conbox2);
 			diary.appendChild(moneycon);
 			diary.appendChild(note);
 			diary.appendChild(notedat);
 			div.appendChild(diary);
 			
 		}
 	}
 	for(i =0; log.length; i++){
 		let money = document.createElement('div');
 			moneyTemp = log[i].MONEY;
 			money.textContent = moneyTemp +"원";
 			money.className = "work_diary_strongbox";
 			moneycon.appendChild(money);
 			
 			let moneycount = document.createElement('div');
 			moneycnt = log[i].MCOUNT;
 			moneycount.textContent = moneycnt ;
 			moneycount.className = "work_diary_strongbox_data";
 			moneycon.appendChild(moneycount);
 	}
	
}



</script>




</html>