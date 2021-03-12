<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<link href="/resources/css/modify.css" rel="stylesheet" />
</head>

<body onload="init()">
	<div class="large" id="large">
		<!-- 아이디 -->
		<div class="space">
			<div class="title">아이디</div>

			<div class="spaceright">
			<span  id="idDat"></span>
			</div>
	</div>
			<!-- 비밀번호 -->
			<div class="space">
				<div class="title">비밀번호</div>

				<div class="spaceright">
						<span  id="pwDat"></span>
					<div id="myButton1">
						<input onClick="editPassword()" class="button1" type="button"
							value="수정">
					</div>

					<!-- 안보이게 숨겨둠 -->
					<span id="passwordEdit">
						<input type="password" id="editValue1" value="${editN}" 	placeholder="변경할 비밀번호를 입력하세요">
							 <input class="button1"
							onClick="sendData1()" type="button" value="수정완료">
					</span>
				</div>
			</div>
	
		<!-- 이름 -->
		<div class="space">
			<div class="title">이름</div>

			<div class="spaceright" >
				<span id="nameDat"></span>
				<span id="myButton2">
				
					<input class="button1" onClick="editName()" type="button"
						value="수정">
						</span>
					</div>

				<!-- 안보이게 숨겨둠 -->
				<span id="nameEdit"> 
					<input type="text" id="editValue2" placeholder="변경할 이름을 입력하세요">
					<input class="button1" onClick="sendData2()" type="button"
						value="수정완료">
				</span>
			</div>
		

		<!-- 생년월일 -->
		<div class="space">
			<div class="title">생년월일</div>

			<div class="spaceright" >
				<span  id="birthDat"></span></div>
		</div>
		<!-- 성별 -->
		<div class="space">
			<div class="title">성별</div>

			<div class="spaceright">
				<span  id="genderDat"></span></div>
		</div>
		<!-- 계좌번호 -->
		<div class="space">
			<div class="title">계좌번호</div>

			<div class="spaceright" >
				<span id="accountDat"></span>
				<span id="myButton3">
					<input class="button1" onClick="editAccount()" type="button"
						value="수정">
						</span>
				</div>

				<!-- 안보이게 숨겨둠 -->
				<span id="accountEdit">
					<select id="bankName" name="bankName"  >
						<option value="은행이름">은행이름</option>
						<option value="농협은행">농협은행</option>
						<option value="기업은행">기업은행</option>
						<option value="우리은행">우리은행</option>
						<option value="국민은행">국민은행</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="케이뱅크">케이뱅크</option>
					</select> <input type="text" id="editValue3"  placeholder="변경할 계좌를 입력하세요">
					<input class="button1" onClick="sendData3()" type="button"
						value="수정완료">
				</span>
			</div>
		</div>
<!-- 			<div class="buttonlocation"> -->
<!-- 				<input class="button1" type="button" onclick="updateForm()" value="수정완료"> -->
<!-- 			</div> -->
</body>

<script>

	let albaInfo = '${memInfo}';
//	let editN = '${editN}';

	let memberInfo = JSON.parse(albaInfo);	
	function init() {
		

		//아이디

		let idNameDat = document.getElementById('idDat');
		idNameDat.className = "spaceright";
		idNameDat.textContent = memberInfo[0].abId;

		//비밀번호
		let pwcon = document.getElementById('pwDat');
		pwcon.className = "spaceright";
		let pwNameDat = document.createElement('input');
		pwNameDat.readOnly = true;
		pwNameDat.type="password";
		pwNameDat.className="noborder"
		pwNameDat.value=memberInfo[0].abPw;
		pwcon.appendChild(pwNameDat);
		//이름
		let nameDat = document.getElementById('nameDat');
		nameDat.className = "spaceright";
		nameDat.textContent = memberInfo[0].abName;
	
		//생년월일
		let birthDat = document.getElementById('birthDat');
		birthDat.className = "spaceright";
		birthDat.textContent = memberInfo[0].abBirth.substring(0,4)+"년"
		+ memberInfo[0].abBirth.substring(4,6) +"월"
		 +memberInfo[0].abBirth.substring(6,8)+"일";
		
		//성별
		let genderDat = document.getElementById('genderDat');
		genderDat.className = "spaceright";
		if (memberInfo[0].abGender == "M") {
			genderDat.textContent = "남자";
		} else {
			genderDat.textContent = "여자";
		}

		//계좌정보
		for(i=0; i<memberInfo.length; i++){
		let accountbox = document.createElement('div');
		accountbox.className = "spaceright";
		accountbox.textContent =  memberInfo[i].acBankName + " " +  memberInfo[i].acAccount;
		let accountDat =document.getElementById("accountDat");
		
		
		accountDat.appendChild(accountbox);
		}
	}

	function editPassword() {
		var myButton1 = document.getElementById("myButton1");
		var passwordEdit = document.getElementById("passwordEdit");
		
		myButton1.style.display = 'none';
		passwordEdit.style.display = 'block';
	}

	function editName() {
		let myButton2 = document.getElementById("myButton2");
		let nameEdit = document.getElementById("nameEdit");
		
		myButton2.style.display = 'none';
		nameEdit.style.display = 'block';
		

	}

	function editAccount() {
		var myButton3 = document.getElementById("myButton3");
		var accountEdit = document.getElementById("accountEdit");
		for(i=0; i<memberInfo.length; i++){
			let accountbtn = document.createElement('input');
			accountbtn.type="button";
			accountbtn.className= "button1";
			myButton3.addEventlistner('click',sendData3);
	
		}
		myButton3.style.display = 'none';
		accountEdit.style.display = 'block';
	
			
			
		
	
	}

	function sendData1() {
		var editValue1 = document.getElementById("editValue1");
		alert(editValue1.value);
		
		
		let pwInfo = editValue1.value;
		let pwEdit = document.createElement('input');
		pwEdit.type = "hidden";
		pwEdit.value = memberInfo[0].abCode;
		let codeInfo = pwEdit.value;
		
		let form =document.createElement('form');
		form.action="ModifyComplete?abCode="+codeInfo+"&abPw="+pwInfo ;
		form.method ="POST";
		document.body.appendChild(form);
		form.appendChild(accountEdit);

		form.submit();
		
	}
	

	function sendData2() {
		var editValue2 = document.getElementById("editValue2");
		let infoCode = document.getElementById("nameDat");
		let nameInfo =editValue2.value;
		let nameEdit = document.createElement('input');
		nameEdit.type = "hidden";
		nameEdit.value = memberInfo[0].abCode;
		let codeInfo = nameEdit.value;
		
		let form =document.createElement('form');
		form.action="ModifyComplete2?abCode="+codeInfo+"&abName=" +nameInfo;
		form.method ="POST";
		document.body.appendChild(form);
		form.appendChild(nameEdit);

		form.submit();
		
		alert(nameInfo);
		
		
		

	}
	

	function sendData3() {
		var b = document.getElementById("bankName");
		var bankName = b.options[b.selectedIndex].text;
		var editValue3 = document.getElementById("editValue3");
		alert("은행명: " + bankName + " 계좌번호: " + editValue3.value);
		let accInfo = editValue3.value;
		let accountEdit = document.createElement('input');
		accountEdit.type = "hidden";
		accountEdit.value = memberInfo[0].abCode;
		let codeInfo = accountEdit.value;
		
		let form =document.createElement('form');
		form.action="ModifyComplete3?abCode="+codeInfo+"&acBankName=" +bankName +"&acAccount="+accInfo;
		form.method ="POST";
		document.body.appendChild(form);
		form.appendChild(accountEdit);

		form.submit();
		

	}
	

	

</script>

</html>