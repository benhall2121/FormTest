// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})


$(document).ready(function() {
		
  $('#import_missions').click(function(){
    mission_ids = new Array();

    $("input:checkbox[class=mission_ids]:checked").each(function() {
       mission_ids.push($(this).val());
    });

    if(mission_ids.length == 0){
      alert("please select a mission.");
    } else {
  	  $.post('/mission_info', {"ids": mission_ids}, null, 'script');
    }

    return false;
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
