<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script> -->

<style>
@import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

.modal {
	--bs-modal-width: 560px;
}

.Calendar {
    text-align: center;
}

.Calendar>thead>tr:first-child>td {
    font-family: 'Questrial', sans-serif;
    font-size: 1.1em;
    font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
    font-family: 'Questrial', sans-serif;
    font-weight: 600;     
}

.Calendar>tbody>tr>td>p {
    font-family: 'Montserrat', sans-serif;
    height: 45px;
    width: 45px;
    border-radius: 45px;
    transition-duration: .2s;
    line-height: 45px;
    margin: 2.5px;
    display: block;
    text-align: center;
}        

.pastDay {
    color: lightgray;
}

.today {
    background-color: #F5D042;            
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}

.futureDay {
    background-color: #FFFFFF;
    cursor: pointer;
}
.futureDay:hover{
    background:#eee;
}

.futureDay.choiceDay,
.today.choiceDay {
    background: rgb(255,83,63);
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}

#makeRent {
	color: white;
	background-color: rgb(255,83,63);
}

#startTmSelected td {
	padding: 0;
}
#startTmSelected td div {
	padding: 0.75em;
	text-align: center;
}

.reserved {
	background-color: #ccc;
	text-decoration-line:line-through;
}

.reserving {
	background-color: rgb(255,83,63);
	color: white;
}
</style>

<%-- 전역변수 Scope --%>
<script>
var now = new Date(); //renderTable() 함수에서 시간표시 해주는 for문에 targetnow변수와 비교에 사용할 변수
var clickedDate; ////renderTable() 함수에서 시간표시 해주는 for문에서 targetnow변수에 현재일자로 넣어줄 매개변수
</script>

<script type="text/javascript">
$(function(){
	
    // 다음 달의 날짜에 대한 클릭 이벤트 추가
    $(".Calendar").on("click", ".futureMonth", function(){
        clickedDate = parseInt($(this).text()); // 문자열을 숫자로 변환
        console.log(clickedDate)
        let nextMonth = nowMonth.getMonth() + 1; // 현재 월에 1을 더해 다음 달로 설정
        let fullDate = new Date(nowMonth.getFullYear(), nextMonth - 1, clickedDate); // 월의 경우 1을 빼줌
        console.log("클릭한 날짜 선택", fullDate);
        
        // 선택한 날짜를 hidden input에 설정
        $("#selectedDate").val(fullDate.getTime());

        $("#time").show();
        renderTable(fullDate.getTime());
    });
});

//대여테이블 시간표 만들기
function renderTable(selectedDate) {
	
	var startSelect = $("#startTmSelected");
	var tmp = "";
	var reservedTime = [];
	var tempDate = new Date(parseInt(selectedDate));
	
	//예약정보 가져오기
	<c:forEach var="sta" items="${status}">
		var rentDate = new Date('${sta.RENT_DATE}');
		console.log(rentDate + "\r\n " + tempDate)
		
	 	if (rentDate.toLocaleString() ===  tempDate.toLocaleString()) {
			for (let i=${sta.START_TIME}; i<=${sta.END_TIME}; i++) {	
				reservedTime.push(i);
			}
		}
	</c:forEach>
	
	//대여시간 테이블 랜더링
	for (let i=1; i<=48; i++) {	
		var time = new Date('2023-01-01 00:00:00');
		time.setMinutes((i-1)*30);
		
		//현재 날짜,시간 구하기
	    var targetnow = new Date();
	    targetnow.setDate(clickedDate)
	    targetnow.setSeconds(0);
		targetnow.setHours(Math.floor(((i-1) / 48) * 24))
	    if (i % 2 === 0) {
	       targetnow.setMinutes(30)
		} else {
			targetnow.setMinutes(0)
		}
		
		//대여가능 시간 테이블 생성
		if ((i-1)%6==0) {tmp += '<tr>';}
		if (reservedTime.indexOf(i) == -1 && now<targetnow) {
			tmp += `<td><div type="button" name='endTime' value='\${i}' onClick="timeSet(event, \${i})">\${time.toString().substring(16,21)}</div></td>`;				
		} else {
			tmp += `<td><div type="button" name='endTime' value='\${i}' class="reserved">\${time.toString().substring(16,21)}</div></td>`;
		}
		if (i%6==0) {tmp += '</tr>';}
	}

	startSelect.html(tmp);

}

</script>

<script>
    window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

    // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
    function buildCalendar() {

        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);
        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear();
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);

        while (tbody_Calendar.rows.length > 0) {
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();

        for (let j = 0; j < firstDate.getDay(); j++) {
            let nowColumn = nowRow.insertCell();
        }

        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {

            let nowColumn = nowRow.insertCell();

            let newDIV = document.createElement("p");
            newDIV.innerHTML = leftPad(nowDay.getDate());
            nowColumn.appendChild(newDIV);

            if (nowDay.getDay() == 6) {
                nowRow = tbody_Calendar.insertRow();
            }

            if (nowDay < today) {
                newDIV.className = "pastDay";
            }
            else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) {
                newDIV.className = "today";
                newDIV.onclick = function () { choiceDate(this); }
            }
            else if (nowDay.getMonth() == today.getMonth() + 1 || nowDay.getMonth() == today.getMonth() + 2) {
                newDIV.className = "futureDay futureMonth";
                newDIV.onclick = function () { choiceDate(this); }
            }
            else {
                newDIV.className = "futureDay";
                newDIV.onclick = function () { choiceDate(this); }
            }       
        }
    }

    // 날짜 선택
    function choiceDate(newDIV) {
        if (document.getElementsByClassName("choiceDay")[0]) {
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        }
        newDIV.classList.add("choiceDay", "futureMonth");
    }

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());
        buildCalendar();
    }

    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());
        buildCalendar();
    }

    // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
    function leftPad(value) {
        if (value < 10) {
            value = "0" + value;
            return value;
        }
        return value;
    }
</script>

<!-- 대여 시간 -->
<script type="text/javascript">

let fromTime = 0;
let toTime = 0;

//이미 지나간 시간인지 확인하는 함수
function isPastTime(selectedDate, timeValue) {
    let currentTime = new Date();
    let selectedDateTime = new Date(selectedDate);
    selectedDateTime.setMinutes((timeValue - 1) * 30);

    return selectedDateTime < currentTime;
}

//대여할 시간 선택 영역 표시, 선택된 값 저장
function timeSet(event, t) {
	
	var selectedDate =  $("#selectedDate").val();
	var reservedTime = [];
	var tempDate = new Date(parseInt(selectedDate));
	
	<c:forEach var="sta" items="${status}">
	
	var rentDate = new Date('${sta.RENT_DATE}');
	console.log(rentDate + "\r\n " + tempDate)
	
 	if (rentDate.toLocaleString() ===  tempDate.toLocaleString()) {
		for (let i=${sta.START_TIME}; i<=${sta.END_TIME}; i++) {	
			reservedTime.push(i);
		}
	}
	</c:forEach>
	
	if (fromTime == 0 || toTime !=0 || fromTime >= t) {
		$("#startTmSelected td div").removeClass('reserving');
		fromTime = t;
		toTime = 0;
		$(event.target).addClass('reserving');
		console.log(event.target);
	
	} else {
		toTime = t;
		
		//대여시간 잘못 선택시 예외처리
		for (let i=fromTime; i<=toTime; i++) {			
			if (reservedTime.indexOf(i) != -1) {
				alert('선택불가한 시간입니다.');
				$("#startTmSelected td div").removeClass('reserving');
				fromTime = 0;
				toTime = 0;
				return false;
			}
			$(`#startTmSelected td div[value="\${i}"]`).addClass('reserving');
		}
	}
	
}


// 대여신청 버튼 클릭 시 서버로 전송
$(document).ready(function(){
  $("#makeRent").click(function () {
	  console.log("대여신청 버튼 클릭 됨!");
	  
      let selectedDate = $("#selectedDate").val();
      let startTime = fromTime;
      let endTime = toTime;
      
      if (fromTime == 0 || toTime == 0 || fromTime >= toTime) {
		alert('선택불가한 시간입니다.');
		
		$("#startTmSelected td div").prop("style","background-color:transparent;");
		fromTime = 0;
		toTime = 0;
		
		return false;  
      }

    // 대여신청 정보를 서버로 전송
	    $.ajax({
	        type: "POST",
	        url: "/rent/rent"
	        , data: {
	        	boardNo: "${board.boardNo }",
	        	renterId: "${id }",
	        	rentDate: new Date(parseInt(selectedDate)),
	        	startTime: startTime,
	            endTime: endTime,
	            rentStatus : 1
	        }
	    
	        // 대여신청 성공 시 추가 작업 수행
	        , success: function (res) {
	            console.log("대여신청 성공:", res);
	            
	           // 대여신청 성공 시 알림창 띄우기
	           alert("대여신청이 성공적으로 완료되었습니다. 승인을 기다려주세요.");
	           	 
	           // 페이지 새로고침
	           location.reload();
	            
	        }
	        , error: function (error) {
	            console.error("대여신청 실패:", error);
	            
	            // 대여신청 실패 시 알림창 띄우기
	            alert("대여신청에 오류가 발생했습니다. 다시 신청해주세요.");
	            
	        }
	    });
  });
});
</script>

<!-- Modal, 대여 -->
<div class="modal fade" id="rentModal" tabindex="-1" aria-labelledby="rentModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h5 class="modal-title" id="rentModalLabel">대여일 선택</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div><!-- .modal-header -->
			
			<!-- Modal Body -->
			<div class="modal-body">
				    <div>
				        <table class="Calendar">
				            <thead>
				                <tr>
				                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
				                    <td colspan="5">
				                        <span id="calYear"></span>년
				                        <span id="calMonth"></span>월
				                    </td>
				                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
				                </tr>
				                <tr>
				                    <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
				                </tr>
				            </thead>
				            <tbody>
				            </tbody>
				        </table>
				    </div><br><br>
				    
				    <!-- 예약 시간을 선택하는 폼 -->
				    <div>
				        <div style="display: none;" id="time">
				            <div style="margin-bottom: 5px; display: grid;">
			            	<span style="margin-bottom: 5px;">시간을 선택해주세요.</span>
			            	<span style="margin-bottom: 5px; font-size: 15px;">*다음 대여자를 위해 장기 대여는 삼가주세요.</span>
			            	<span style="margin-bottom: 5px; font-size: 15px;">*날짜가 넘어가면 여러번 신청해야 합니다.</span>
			            	<span style="margin-bottom: 5px; font-size: 15px;">*선택한 시간 전까지 반납필수!</span>
			            	<table>
			            	<thead></thead>
					            <tbody id="startTmSelected">
					            </tbody>
			            	</table>
			            	<br>
						    <button type="button" name="makeRent" id="makeRent" class="btn float-end">대여신청</button>
				            </div>
				        </div>
				        
				        <!-- 선택한 날짜를 저장할 hidden input -->
				        <input type="hidden" name="selectedDate" id="selectedDate" >
				    </div>
			</div><!-- .modal-body -->
			
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div><!-- .modal-footer -->
		</div>
	</div><!-- .modal-dialog -->
</div><!-- .modal fade -->


