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
<button class="btn btn-primary" onclick="OpenWindow('calinderregistForm?wid=${lsupporterstatus.wid}','대상자일정조회',800,800);">작성하기</button>

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
            content: '${calinder.content}',
            start: '<fmt:formatDate value="${calinder.regDate}" pattern="yyyy-MM-dd" />',
            end: '<fmt:formatDate value="${calinder.endDate}" pattern="yyyy-MM-dd" />',
            extendedProps: {
              id: '${calinder.id}'
            }
          },
        </c:forEach>
      ],
      eventRender: function(info) {
        info.el.querySelector('.fc-event-title').textContent = info.event.title;
      },
      eventClick: function(arg) {
        var event = arg.event;
        var title = event.title;
        var content = event.extendedProps.content;
        var id = event.extendedProps.id;

        var url;
        if (id) {
        	  url = 'calinderdetail?id=' + encodeURIComponent(id);
        	} 
		if(!id){
			url ='calinderregistForm'
		}

        var winWidth = 600;
        var winHeight = 400;
        OpenWindow(url, 'Window Title', winWidth, winHeight);

        function OpenWindow(urlStr, winTitle, winWidth, winHeight) {
          var winLeft = (screen.width - winWidth) / 2;
          var winTop = (screen.height - winHeight) / 2;
          var win = window.open(urlStr, winTitle, "scrollbars=yes,width=" + winWidth + ",height=" + winHeight + ",top=" + winTop + ",left=" + winLeft + ",resizable=yes");
          win.focus();
        }
      }
    });
    calendar.render();
  });
</script>




<%@include file="../include/lsupporter/foot.jspf"%>



