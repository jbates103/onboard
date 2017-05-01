
$(document).on('ready', function(){
  $('#app-search').on('keyup', function(){
  	populate('app');
  });

  $('#poc-search').on('keyup', function(){
  	populate('poc');
  });
});


function populate(app_or_poc){
  var value  = $(".dash-search-" + app_or_poc + "-input").val();
  if (value.length < 3){ 
  	$("." + app_or_poc + "-table").html(""); 
  	return; 
  }
    $.ajax({
    	url: "/search_" + app_or_poc,
  	    data: { search_term: value },
  	    dataType: 'json',
  	    type: 'GET',
  	    error: function(jqXHR, textStatus, errorThrown){
  			 alert('Error: ' + errorThrown);
  		   },
  	    success: function(data){
  	    			var counter = 0;
	  	    	    if (data == '' || data == null){ return; }
	  				var html = app_or_poc == 'app' ? appHeader() : pocHeader();
					$(data).each(function(index, value){
						var class_val = counter % 2 == 0 ? "info" : '';
						var table_row = app_or_poc == 'app' ? appRow(value, class_val) : pocRow(value, class_val);
						html = html.concat(table_row);
						counter++;
					});	
					$("." + app_or_poc + "-table").html(""); 
					$("." + app_or_poc+ "-table").html(html);
	  	          }
   });

}

function appHeader(){
  return `<thead>
			<tr>
			  <th>Application Name</th>
			  <th>Jira Ticket Id</th>
			  <th>Application Url</th>
			  <th>Status</th>
			</tr>
	       </thead>`;
}

function pocHeader(){
	  return `<thead>
			    <tr>
			      <th>First Name</th>
			      <th>Last Name</th>
			      <th>Email</th>
			    </tr>
	         </thead>`;
}

function appRow(value, class_val){
  return `<tr class='cursor ${class_val}' onclick='appLookUp(${value.id})' >  
		    <td>${value.name}</td>
		    <td>${value.jira_ticket_id}</td>
			<td>${value.app_url}</td>
			<td><span class='jira jira-${value.status}'>${value.status.toUpperCase()}</span></td>	
		  </tr>`;

}

function pocRow(value, class_val){
   return `<tr class='cursor ${class_val}' onclick='pointOfContactLookUp(${value.id})'  >  
		    <td>${value.first_name}</td>
		    <td>${value.last_name}</td>
			<td>${value.email}</td>
		  </tr>`;
}
