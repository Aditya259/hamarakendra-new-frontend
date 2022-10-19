$(function() {
  var INDEX = 0; 
  $("#chat-submit").click(function(e) {
    e.preventDefault();
    var msg = $("#chat-input").val(); 
    if(msg.trim() == ''){
      return false;
    }else{
		if(msg.toLowerCase().trim() == 'hi'){
		 generate_message(msg, 'self');  
		 msg = "How may i help you .? <br> Please type below service on which you need assistence"	
		 msg += "<ul>";
		 msg += "<li>";
		 msg += "<b>Aadhaar Service</b>";
		 msg += "</li>";
		 msg += "<li>";
		 msg += "<b>Passport Service</b>";
		 msg += "</li>";
		 msg += "<li>";
		 msg += "<b>PAN Service</b>";
		 msg += "</li>";
		 msg += "<li>";
		 msg += "<b>RTO Service</b>";
		 msg += "</li>";
		 msg += "<li>";
		 msg += "<b>Voting Card Service</b>";
		 msg += "</li>";
		 msg += "<li>";
		 msg += "<b>Ration Card Service</b>";
		 msg += "</li>";
		 msg += "<li>";
		 msg += "<b>Smart Card Service</b>";
		 msg += "</li>";
		 
		 msg += "</ul>";
		 
		}
		
		if(msg.toLowerCase() == 'aadhaar service'){
			generate_message(msg, 'self');  
			msg = "For new Aashaar card or to update new Aadhaar Card" 
			msg += "Kindly click on the link <b><a href='aadharServices?serv='aadharServices'>Aadhar Services </a></b>"
		}
		
		if(msg.toLowerCase() == 'passport service'){
			generate_message(msg, 'self');  
			msg = "For passport related services" 
			msg += "Kindly click on the link <b><a href='passportServices?serv='passportServices'>Passport Services </a></b>"
		}
		
		if(msg.toLowerCase() == 'pan service'){
			generate_message(msg, 'self');  
			msg = "For PAN card related services" 
			msg += "Kindly click on the link <b><a href='pancardServies?serv='pancardServies'>Pan Card Services </a></b>"
		}
		
		if(msg.toLowerCase() == 'rto service'){
			generate_message(msg, 'self');  
			msg = "For RTO related services" 
			msg += "Kindly click on the link <b><a href='RTOServices?serv='pancardServies'>RTO Services </a></b>"
		}
		
		if(msg.toLowerCase() == 'voting card service'){
			generate_message(msg, 'self');  
			msg = "For Voting Card related services" 
			msg += "Kindly click on the link <b><a href='bookappointment?serv='newVotingCard'>Voting Card Services </a></b>"
		}
		
		if(msg.toLowerCase() == 'ration card service'){
			generate_message(msg, 'self');  
			msg = "For Ration Card related services" 
			msg += "Kindly click on the link <b><a href='bookappointment?serv='newRationCard'>Ration Card Services </a></b>"
		}
		
		if(msg.toLowerCase() == 'smart card service'){
			generate_message(msg, 'self');  
			msg = "For Smart Card related services" 
			msg += "Kindly click on the link <b><a href='bookappointment?serv='smartCard'>Smart Card Services </a></b>"
		}
		
		

    
    
    //generate_message(msg, 'self');
    var buttons = [
        {
          name: 'Existing User',
          value: 'existing'
        },
        {
          name: 'New User',
          value: 'new'
        }
      ];
    setTimeout(function() {      
      generate_message(msg, 'user');  
    }, 1000)
	}    
  })
  
  function generate_message(msg, type) {
    INDEX++;
    var str="";
    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
    str += "          <span class=\"msg-avatar\">";
    str +=            
    str += "          <\/span>";
    str += "          <div class=\"cm-msg-text\">";
    str += msg;
    str += "          <\/div>";
    str += "        <\/div>";
    $(".chat-logs").append(str);
    $("#cm-msg-"+INDEX).hide().fadeIn(300);
    if(type == 'self'){
     $("#chat-input").val(''); 
    }    
    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);    
  }  
  
  function generate_button_message(msg, buttons){    
    /* Buttons should be object array 
      [
        {
          name: 'Existing User',
          value: 'existing'
        },
        {
          name: 'New User',
          value: 'new'
        }
      ]
    */
    INDEX++;
    var btn_obj = buttons.map(function(button) {
       return  "              <li class=\"button\"><a href=\"javascript:;\" class=\"btn btn-primary chat-btn\" chat-value=\""+button.value+"\">"+button.name+"<\/a><\/li>";
    }).join('');
    var str="";
    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg user\">";
    str += "          <span class=\"msg-avatar\">";
    str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
    str += "          <\/span>";
    str += "          <div class=\"cm-msg-text\">";
    str += msg;
    str += "          <\/div>";
    str += "          <div class=\"cm-msg-button\">";
    str += "            <ul>";   
    str += btn_obj;
    str += "            <\/ul>";
    str += "          <\/div>";
    str += "        <\/div>";
    $(".chat-logs").append(str);
    $("#cm-msg-"+INDEX).hide().fadeIn(300);   
    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);
    $("#chat-input").attr("disabled", true);
  }
  
  $(document).delegate(".chat-btn", "click", function() {
    var value = $(this).attr("chat-value");
    var name = $(this).html();
    $("#chat-input").attr("disabled", false);
    generate_message(name, 'self');
  })
  
  $("#chat-circle").click(function() {    
    $("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
  })
  
  $(".chat-box-toggle").click(function() {
    $("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
  })
  
})