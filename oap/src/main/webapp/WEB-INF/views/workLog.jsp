<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>이쁜 달력</title>
<link rel="stylesheet" href="resources/css/test.css">
</head>

<body>

	<div class="main">
		<div class="content-wrap">
			<div class="content-left">
				<div class="main-wrap">
					<div id="main-day" class="main-day"></div>
					<div id="main-date" class="main-date"></div>
				</div>
				<div class="todo-wrap">
					<div class="todo-title">Todo List</div>
					<div class="input-wrap">
						<p>가나다라 pc방    ::  16:00 ~ 22:00</p>
						<p>카페베네 신포점  ::  10:00 ~ 17:00</p>
						<p>설빙 부산본점    ::  09:00 ~ 15:00</p>
					</div>
				</div>
			</div>
			<div class="content-right">
				<table id="calendar" align="center">
					<thead>
						<tr class="btn-wrap clearfix">
							<td><label id="prev"> &#60; </label></td>
							<td align="center" id="current-year-month" colspan="5"></td>
							<td><label id="next"> &#62; </label></td>
						</tr>
						<tr>
							<td class="sun" align="center">일</td>
							<td align="center">월</td>
							<td align="center">화</td>
							<td align="center">수</td>
							<td align="center">목</td>
							<td align="center">금</td>
							<td class="sat" align="center">토</td>
						</tr>
					</thead>
					<tbody id="calendar-body" class="calendar-body"></tbody>
				</table>
			</div>
		</div>
	</div>

</body>

<script>

	var mainTodayDay = document.querySelector('#main-day');
	var mainTodayDate = document.querySelector('#main-date');

	var currentTitle = document.getElementById('current-year-month');
	var calendarBody = document.getElementById('calendar-body');
	var today = new Date();
	var first = new Date(today.getFullYear(), today.getMonth(), 1);
	var dayList = [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
			'Friday', 'Saturday' ];
	var monthList = [ 'January', 'February', 'March', 'April', 'May', 'June',
			'July', 'August', 'September', 'October', 'November', 'December' ];
	var kMonthList = [ '01', '02', '03', '04', '05', '06',
		'07', '08', '09', '10', '11', '12' ];
	var leapYear = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	var notLeapYear = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
	var pageFirst = first;
	var pageYear;
	if (first.getFullYear() % 4 === 0) {
		pageYear = leapYear;
	} else {
		pageYear = notLeapYear;
	}

	function showCalendar() {
		let monthCnt = 100;
		let cnt = 1;
		for (var i = 0; i < 6; i++) {
			var $tr = document.createElement('tr');
			$tr.setAttribute('id', monthCnt);
			for (var j = 0; j < 7; j++) {
				var $td = document.createElement('td');
				$td.addEventListener('click', clickStart);
				if ((i === 0 && j < first.getDay())
						|| cnt > pageYear[first.getMonth()]) {
					//var $td = document.createElement('td');
					$tr.appendChild($td);
				} else {
					//var $td = document.createElement('td');
					$td.textContent = cnt;
					$td.setAttribute('id', cnt);
					$tr.appendChild($td);
					cnt++;
				}
			}
			monthCnt++;
			calendarBody.appendChild($tr);
		}
		currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();
		showMain();
	}

	showCalendar();

	function removeCalendar() {
		let catchTr = 100;
		for (var i = 100; i < 106; i++) {
			var $tr = document.getElementById(catchTr);
			$tr.remove();
			catchTr++;
		}
	}

	// 앞뒤로 넘기기  ( 달수 )

	function prev() {
		const $divs = document.querySelectorAll('#input-list > div');
		$divs.forEach(function(e) {
			e.remove();
		});
		const $btns = document.querySelectorAll('#input-list > button');
		$btns.forEach(function(e1) {
			e1.remove();
		});
		if (pageFirst.getMonth() === 1) {
			pageFirst = new Date(first.getFullYear() - 1, 12, 1);
			first = pageFirst;
			if (first.getFullYear() % 4 === 0) {
				pageYear = leapYear;
			} else {
				pageYear = notLeapYear;
			}
		} else {
			pageFirst = new Date(first.getFullYear(), first.getMonth() - 1, 1);
			first = pageFirst;
		}
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate()); //2
		currentTitle.innerHTML = monthList[first.getMonth()]
				+ '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();
		removeCalendar();
		showCalendar();
		showMain();
		clickedDate1 = document.getElementById(today.getDate());
		clickedDate1.classList.add('active');
		clickStart();
		
		alert("Today = " + first.getFullYear() +"-"+ kMonthList[first.getMonth()] + "-" + today.getDate());
	}

	function next() {
		const $divs = document.querySelectorAll('#input-list > div');
		$divs.forEach(function(e) {
			e.remove();
		});
		const $btns = document.querySelectorAll('#input-list > button');
		$btns.forEach(function(e1) {
			e1.remove();
		});
		if (pageFirst.getMonth() === 12) {
			pageFirst = new Date(first.getFullYear() + 1, 1, 1);
			first = pageFirst;
			if (first.getFullYear() % 4 === 0) {
				pageYear = leapYear;
			} else {
				pageYear = notLeapYear;
			}
		} else {
			pageFirst = new Date(first.getFullYear(), first.getMonth() + 1, 1);
			first = pageFirst;
		}
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		currentTitle.innerHTML = monthList[first.getMonth()]
				+ '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();
		removeCalendar();
		showCalendar();
		showMain();
		clickedDate1 = document.getElementById(today.getDate());
		clickedDate1.classList.add('active');
		clickStart();
		
	}

	function showMain() {
		mainTodayDay.innerHTML = dayList[today.getDay()];
		mainTodayDate.innerHTML = today.getDate();
	}
	var clickedDate1 = document.getElementById(today.getDate());
	clickedDate1.classList.add('active');
	var prevBtn = document.getElementById('prev');
	var nextBtn = document.getElementById('next');
	prevBtn.addEventListener('click', prev);
	nextBtn.addEventListener('click', next);
	var tdGroup = [];
	function clickStart() {
		for (let i = 1; i <= pageYear[first.getMonth()]; i++) {
			tdGroup[i] = document.getElementById(i);
			tdGroup[i].addEventListener('click', changeToday);
		}
	}
	function changeToday(e) {
		for (let i = 1; i <= pageYear[first.getMonth()]; i++) {
			if (tdGroup[i].classList.contains('active')) {
				tdGroup[i].classList.remove('active');
			}
		}
		clickedDate1 = e.currentTarget;
		clickedDate1.classList.add('active');
		today = new Date(today.getFullYear(), today.getMonth(), clickedDate1.id);
		showMain();
		keyValue = today.getFullYear() + '-' ;
		keyValue += (today.getMonth()+1) >= 10 ? (today.getMonth()+1) : '0' + (today.getMonth()+1) + '-';
		keyValue +=	today.getDate() >= 10 ? today.getDate() : '0' + today.getDate();
		alert("keyValue= " + keyValue);
		serverSubmit(keyValue);
	}
	
	
	function serverSubmit(key){
		
		alert("서버로 전송 >" + key);
	}


</script>
</html>