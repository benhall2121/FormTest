// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})


$(document).ready(function() {
		
  $('.add_mission').click(function(){
  	this_id = $(this).attr('id');
  	$.post('/mission_info', {"id": this_id}, null, 'script');
  });
  
});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
