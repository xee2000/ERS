<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/lsupporter/head.jspf"%>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
		<!-- Main content -->
		<section class="content-header" style="height:1000px">
<div class="col-12">
<h3 class="loginname mb-4">${lsupporterstatus.name }생활지원사님 환영합니다.</h3>
</div>
		<div id="calendar">
		
		</div>

</section>
<!--foot -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'ko', // set Korean language
      headerToolbar: {
        start: "",
        center: "prev title next",
        end: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      selectable: true,
      droppable: true,
      editable: true,
      events: [
        // Use JSTL forEach to generate events dynamically
        <c:forEach items="${calinderList}" var="calinder">
       
          {
            title: '${calinder.title}',
            contnet: '${calinder.content}',
            start: '<fmt:formatDate value="${calinder.regDate}" pattern="yyyy-MM-dd" />',
            end: '<fmt:formatDate value="${calinder.endDate}" pattern="yyyy-MM-dd" />',
          },
        </c:forEach>
      ]
    });
    calendar.render();
  });
</script>



<%@include file="../include/lsupporter/foot.jspf"%>



