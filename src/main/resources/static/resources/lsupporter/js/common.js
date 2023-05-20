function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth  
							+",height="+ WinHeight +",top="+ wintop +",left=" 
							+ winleft +",resizable=yes"  );
	win.focus() ; 
}

  function nonlist_go(page) {
	  
	  
	  var data = {
		      "searchType": $('select[name="searchType"]').val(),
		      "keyword": $('input[name="keyword"]').val(),
		      "page": page, // Pass the page parameter
		      "perPageNum": 5 // Hard-coded to 5 for displaying 5 results per page
		    };

    $.ajax({
      type: "GET",
      data: data,
      url: "/ers/lsupporter/nonmemberreportFormAction",
      async: true,
      contentType: 'application/json',
      dataType: "json",
      success: function(response) {
        // Update the table with the search results
        var table = $('.searchlist');
        table.find('tbody').empty(); // Clear existing table body

        // Iterate over the search results and generate table rows
        $.each(response.memberList, function(index, member) {
          var row = '<tr>' +
            '<td class="modal_content">' + member.picture + '</td>' +
            '<td onclick="membersearch();" class="modal_content" id="modalname">' + member.name + '</td>' +
            '<td class="modal_content">' + member.gender + '</td>' +
            '<td class="modal_content">' + member.birth + '</td>' +
            '</tr>';
          table.find('tbody').append(row); // Append each row to the table body
        });
      },
      error: function(error) {
        console.log(error);
      }
    });
  };

 function list_go(page) {
  var data = {
    "searchType": $('select[name="searchType"]').val(),
    "keyword": $('input[name="keyword"]').val(),
    "page": page,
    "perPageNum": 5
  };

  $.ajax({
    type: "GET",
    data: data,
    url: "/ers/lsupporter/reportlistAction",
    async: true,
    contentType: 'application/json',
    dataType: "json",
    success: function(response) {
      var rows = $('#tableContent tbody tr'); // Get all existing table rows

      // Iterate over the response data and update the corresponding table rows
      for (var i = 0; i < response.length; i++) {
        var member = response[i];
        var row = rows.eq(i); // Get the current table row

        // Update the content of each cell in the table row
        row.find('.tg-3xi5:eq(1)').text(member.RNo);
        row.find('.tg-3xi5:eq(2)').html(member.picture);
        row.find('.tg-3xi5:eq(3)').text(member.name);
        // Update other cells in the same way

        // Uncomment the following line if you want to update the row's click event as well
        // row.attr('onclick', 'location.href=\'/ers/lsupporter/memberdetail\'');
      }
    },
    error: function(error) {
      console.log(error);
    }
  });
}


//팝업창 닫기
function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}

//사진출력
function MemberPictureThumb(contextPath){
	 for(var target of document.querySelectorAll('.manPicture')){	
		 var id = target.getAttribute('data-id');
		 
		target.style.backgroundImage="url('"+contextPath+"/member/getPicture.do?id="+id+"')";				
		target.style.backgroundPosition="center";
		target.style.backgroundRepeat="no-repeat";
		target.style.backgroundSize="cover";
	 }
}

	












