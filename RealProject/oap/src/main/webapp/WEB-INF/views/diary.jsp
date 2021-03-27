<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/diary.css" rel="stylesheet" media="screen"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body onLoad="Loader()">

    <table style="align-items: center;" class="all">
    
        <thead class="one">
        
            <tr class="one-1">
                <th id="btn-prev" colspan="2">◀</th>
                <th id="calendar-year" colspan="2">년</th>
                <th id="calendar-month">월</th>
                <th id="btn-next" colspan="2">▶</th>
            </tr>
            
            <tr class="one-2">
                <th class="small-0">일</th>
                <th class="small-1">월</th>
                <th class="small-1">화</th>
                <th class="small-1">수</th>
                <th class="small-1">목</th>
                <th class="small-1">금</th>
                <th class="small-2">토</th>
            </tr>
            
            <tr class="one-11">
            	<th></th>
            	<th class="bar"></th>
            	<th class="bar"></th>
            	<th class="bar"></th>
            	<th class="bar"></th>
            	<th class="bar"></th>
            	<th class="bar"></th>
            </tr>
            
        </thead>
        
        <tbody id="calendar-days">
            <!--달력 행렬 생성(정적으로 써놔도 괜찮음)-->
            <script>
                var table_body = document.getElementById("calendar-days");
                for (var i = 0; i < 6; i++) {
                    var new_row = document.createElement("tr");
                    new_row.setAttribute("id", "calendar-row" + i)
                    for (var j = 0; j < 7; j++) {
                        var new_col = document.createElement("td");
                        new_col.setAttribute("id", "btn-day" + j);
                        new_col.setAttribute("name", "btn-day");
                        new_col.innerText = "N";
                        new_col.style.cursor="pointer";
                        new_row.appendChild(new_col);
                    }
                    table_body.appendChild(new_row);
                }
            </script>
            
        </tbody>
    </table>
    <!--여기서 클릭 이벤트 및 달력 기능 정리-->

</body>

<script>
    // OnLoad시 필요한 동작들 정의
    function Loader(){
        var curr = new Date()
        SetCalendarTable(curr.getFullYear(), curr.getMonth());
        SetCalendarOnclickListener();
    }

   // 연도와 월로 달력 테이블 셋팅
    function SetCalendarTable(year, month){
        var calendar_year = document.getElementById("calendar-year");
        var calendar_month = document.getElementById("calendar-month");
        var btn_days = document.getElementsByName("btn-day");
        
        var end_date = new Date(year, month + 1, 0);
        var start_date = new Date(year, month, 1);

        var cnt = 0;

        calendar_year.value = year;
        calendar_month.value = month;
        calendar_year.innerText = year + "년";
        calendar_month.innerText = (month + 1) + "월";

        for(var i = 0; i< btn_days.length; i++){
            btn_days[i].innerText = "";
        }

        for(var i = start_date.getDay(); i < start_date.getDay() + end_date.getDate(); i++){
            btn_days[i].innerText = ++cnt;
        }
    }

    // 모든 달력의 클릭 이벤트 리스너 등록
    function SetCalendarOnclickListener(){
        //btn_prev
        var btn_prev = document.getElementById("btn-prev");
        var btn_next = document.getElementById("btn-next");
        var btn_days = document.getElementsByName("btn-day");
        
        btn_prev.addEventListener("click", ClickedPrev);
        btn_next.addEventListener("click", ClickedNext);

        for(var i = 0; i < btn_days.length; i++){
            btn_days[i].addEventListener("click", ClickedDay);
        }
    }
    
    // 이전 달 버튼 클릭했을때 콜백함수
    function ClickedPrev(){
        var year = document.getElementById("calendar-year").value;
        var month = document.getElementById("calendar-month").value;
        
        month -= 1;
        if(month < 0){
            year -= 1;
            month = 11;
        }

        SetCalendarTable(year, month);
    }

    // 다음 달 버튼 클릭했을때 콜백함수
    function ClickedNext(){
        var year = document.getElementById("calendar-year").value;
        var month = document.getElementById("calendar-month").value;

        month += 1;
        if(month > 11){
            year += 1;
            month = 0;
        }

        SetCalendarTable(year, month);
    }

    // 일(day) 버튼 클릭했을때 콜백함수
    function ClickedDay(){
    	
    	var shCode = $("#shopSelect option:selected").val();
    	
        var day = this.innerText;
        var year = document.getElementById("calendar-year").value
        var month = document.getElementById("calendar-month").value;
        var dDay = year+""+ ((month + 1)>= 10 ? (month+1) : "0" + (month+1)) + "" + (day >=10 ? day : ("0" + day));
        
        let form = document.createElement("form");
        let inp = document.createElement('input');
        inp.name = "rtTime";
        inp.type = "hidden";
        inp.value = dDay;
        
        form.setAttribute("method", "post");
        form.setAttribute("action", 'goLog?shCode='+shCode);
        form.setAttribute("target", "정산상세보기")
        form.appendChild(inp);
        
        document.body.appendChild(form);

        window.open('','정산상세보기','top=10,left=10,width=800,height=600,status=no,menubar=no,toolbar=no,resizable=no');

        form.submit();

        
        alert(dDay);
    }



</script>
</html>



