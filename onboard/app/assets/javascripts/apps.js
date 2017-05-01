// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready', function(){
  $('.onselect-status').on('change', function(){
    var appId = $('#app-id').val();
    changeStatus(appId);
  });

  $('.change-status-link').on('click', function(){
    displayStatusChanger();
  });

  $('tr[data-link]').on('click', function(){
     window.location = $(this).data('link');
  });
});



function changeStatus(appId){
  var status = $('.onselect-status').val();
  $.ajax({
  		url: '/change_status',
  		type: 'PUT',
  		data: {
  			id: appId,
  			status: status
  		},
  		dataType: 'json',
  		error: function(jqXHR, textStatus, errorThrown){
  			 alert('Error: ' + errorThrown);
  		   },
  		success: function(data){
        var classes = getJiraClasses();
        var updated_status = data.pop();
        
        $('.display-status').removeClass(getJiraClasses());
        $('.display-status').addClass('jira-' + updated_status);
        $('.display-status').html(updated_status.toUpperCase().replace('_', ' '));
  			$('.onselect-status').hide();
        $('.display-status').show();
  		}
  });
}

function displayStatusChanger(){
  $('.onselect-status').show();
  $('.display-status').hide();
}

function getJiraClasses(){
  return "jira-not_started jira-in_progress jira-completed jira-accepted jira-blocked jira-done";
}