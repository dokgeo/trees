<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>Home</title>
	<style>
	  .movie{
width:150px;
height:30px; 
margin: 5px;
background-size: contain;
}
.row{
display:flex;
}
.able{
width:4%;
height:30px;
float:left;
background-color:#4374D9;
border: 1px solid #FFFFFF;
cursor:pointer;
}
.hall{
width:4%;
height:30px;
float:left;
background-color:#FFFFFF;
border: 1px solid #FFFFFF;
cursor:default;
}
.repair{
width:4%;
height:30px;
float:left;
background-color:#BDBDBD;
border: 1px solid #FFFFFF;
cursor:default;
}
.reserve{
width:4%;
height:30px;
float:left;
background-color:#FFBB00;
border: 1px solid #FFFFFF;
cursor:default;
}
	</style>
</head>
<body onLoad ="init()">
	<a href="http://192.168.219.106/LoginForm" >로그인폼 이동</a><br />
	<P>  Now Time : ${Access} </P>
	<section id="seatZone">좌석 선택 페이지입니다.</section>
</body>
<script>
function init(){
	let sZone = document.getElementById("seatZone");
	let seatInfo =JSON.parse('${SeatInfo}');
	let rows;
	let cols;
	
    
	for(rowIndex = 0;rowIndex<20;rowIndex++){
		rows = document.createElement("div");
		rows.className="row";
		for(colIndex=0; colIndex<20;colIndex++){
		 cols= document.createElement("div");
			cols.setAttribute("name","seat");
			cols.className="able";
		
			rows.appendChild(cols);
		}
		sZone.appendChild(rows);
	}
	
    /* Inactive Seat 배치 */
    let seat = document.getElementsByName("seat");
    
    for(index=0; index<seatInfo.length; index++){
       // if(index==seatInfo[index].seatNum-1){
       seat[seatInfo[index].seatNum-1].className = (seatInfo[index].seatType == "H")? "hall":
          ((seatInfo[index].seatType=="R")? "reserve":"repair");

    }
     let rowChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
     let cnt = -1;
    for(index=0; index<seat.length; index++){
        // if(index==seatInfo[index].seatNum-1){
        if(seat[index].className != "hall"){
        	cnt++;
        	let first = rowChar.substr(parseInt(cnt/10),1);
        	let second = (cnt%10)+1;
        	if(seat[index].className == "able")		
          seat[index].setAttribute("onClick","selectSeat("+(index+1)+",'"+first+second+"')");
          

     }
        }
    }
    function selectSeat(sNumber,cNumber){
    	let type = prompt("성인: A 청소년:J 어린이:C" );
    	alert(sNumber+":"+cNumber+":"+type);
    	
    }

    /* able인 경우 eventListener 추가 */
 

	
	
	
	
	
	
	
	
	
	
	



</script>
</html>
