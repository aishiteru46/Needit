<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<title>달력</title>
<style>
    @import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

    body { background-color : skyblue; } 

    div {
        background-color : white;
        height: auto;
        width: 400px;
        margin: 0px;
        padding: 20px;
        margin: 0 auto;
        border-radius:5px;
        box-shadow:0px 40px 30px -20px rgba(0,0,0,0.3);
    }

    td {
        width: 50px;
        height: 50px;
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
        background: #0A174E;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
    }
</style>

<script type="text/javascript">
$(function(){
    // 다음 달의 날짜에 대한 클릭 이벤트 추가
    $(".Calendar").on("click", ".futureMonth", function(){
        let clickedDate = $(this).text();
        let nextMonth = nowMonth.getMonth() + 1; // 다음 달
        let fullDate = new Date(nextMonth + "/" + clickedDate);
        console.log("클릭한 날짜 선택", fullDate);
        
        // 선택한 날짜를 hidden input에 설정
        $("#selectedDate").val(fullDate.getTime());

        $("#time").show();
    });

})
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

<!-- 예약 시간 -->
<script type="text/javascript">
$(function(){
    // 예약하기 버튼 클릭 시 서버로 전송
    $("#submit").click(function () {
        let selectedDate = $(".choiceDay").text();
        let selectedTime = $("input[name='time']:checked").val();

        // 예약 정보를 서버로 전송
        $.ajax({
            type: "POST",
            url: "/share/book"
            , data: {
                bookDate: new Date(parseInt(selectedDate)),
                bookTime: selectedTime
            }
            // 예약 성공 시 추가 작업 수행
            , success: function (res) {
                console.log("서버 응답:", res);
            }
            , error: function (error) {
                console.error("에러 발생:", error);
            }
        });
    });
});
</script>
</head>

<body>
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
                    <td>일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
    </div><br><br>
    
    <!-- 예약 시간을 선택하는 폼 -->
    <form action="/share/book" method="post">
        <div style="display: none;" id="time">
            <span>예약 시간</span>
            <p><input type="checkbox" name="time" value="1">8 : 00 ~ 10: 00 </p>
            <p><input type="checkbox" name="time" value="2">10 : 00 ~ 12: 00 </p>
            <p><input type="checkbox" name="time" value="3">12 : 00 ~ 02: 00 </p>
            <p><input type="checkbox" name="time" value="4">02 : 00 ~ 04: 00 </p>
            <p><input type="checkbox" name="time" value="5">04 : 00 ~ 06: 00 </p>
            <p><input type="checkbox" name="time" value="6">08 : 00 ~ 10: 00 </p>
            <p><input type="checkbox" name="time" value="7">10 : 00 ~ 12: 00 </p>
		    <button type="button" name="submit" id="submit">예약하기</button>
        </div>
        
        <!-- 선택한 날짜를 저장할 hidden input -->
        <input type="hidden" name="selectedDate" id="selectedDate" >
    </form>

    <!-- 예약하기 버튼 -->
</body>

</html>