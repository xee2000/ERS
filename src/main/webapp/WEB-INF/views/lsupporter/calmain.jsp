<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/lsupporter/head.jspf"%>
<link rel="stylesheet" href="/resources/lsupporter/css/calmain.css">
  <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.7/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.7/index.global.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!--캘린더 기본스크립트  -->



 <script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      locale: 'ko', // 한국어 설정
      initialView: 'dayGridMonth',
      navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      editable: true, // 수정 가능?
      selectable: true, // 달력 일자 드래그 설정 가능
      nowIndicator: true, // 현재 시간 마크
      dayMaxEvents: true,
      eventAdd: function(info) { // 이벤트가 추가되면 발생하는 이벤트
        console.log(info.event);
      },
      eventChange: function(info) { // 이벤트가 수정되면 발생하는 이벤트
        console.log(info.event);
      },
      eventRemove: function(info) { // 이벤트가 삭제되면 발생하는 이벤트
        console.log(info.event);
      },
      select: function(info) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: info.start,
            end: info.end,
            allDay: info.allDay
          });
        }
        calendar.unselect();
      },
      events: [
        {
          title: 'All Day Event',
          start: '2021-07-01'
        },
       
      ]
    });
    calendar.render();
  });
</script>

<section class="content-header" style="height:900px;">
<div class="row">
<div class="col-12 flex justify-end">
 <button type="button" class="btn btn-dark btn-lg backbtn mb-1" onclick="historyback();'">뒤로가기</button>
</div>
</div>
<h2 id="calendarTitle"></h2>

<div id="calendar"></div>
</section> 
<%@include file="../include/lsupporter/calmainfoot.jspf"%>