(function(){
  `use strict`;


function toggleResetPswd(e){
  e.preventDefault();
  $('#logreg-forms .form-signin').toggle() // display:block or none
  $('#logreg-forms .form-reset').toggle() // display:block or none
}

function toggleSignUp(e){
  e.preventDefault();
  $('#logreg-forms .form-signin').toggle(); // display:block or none
  $('#logreg-forms .form-signup').toggle(); // display:block or none
}

$(()=>{
  // Login Register Form
  $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
  $('#logreg-forms #cancel_reset').click(toggleResetPswd);
  $('#logreg-forms #btn-signup').click(toggleSignUp);
  $('#logreg-forms #cancel_signup').click(toggleSignUp);
})


$(function() {

  $("#dialog").dialog({
     autoOpen: false,
     modal: true,
    height: 500,
    width: 500,
    buttons : {
                  Close:
                  function(){
                  $(this).dialog('close');
                      }
              } 
     
   });

   $("#logreg-forms").dialog({
    autoOpen: false,
    modal: true,
   height: 500,
   width: 500,
   buttons : {
                 Close:
                 function(){
                 $(this).dialog('close');
                     }
             } 
    
  });


  $("#dialogSignUp").dialog({
    autoOpen: false,
    modal: true,
   height: 500,
   width: 500,
   buttons : {
                 Close:
                 function(){
                 $(this).dialog('close');
                     }
             } 
    
  });

function sendPar(sorsP,ttlP,resP){
  	$("#png").html('<img src="'+sorsP+'" style="max-width:100%"></img>');
	$("#change").html('<h2>'+ttlP+'</h2>');
	var arr = resP;
	
	for(var i = 0; i < arr.length-1; i++){
  //alert(arr[i]);
	var para = document.createElement("P");
  var t = document.createTextNode('<p><a href="javascript:openLoginPage()">'+arr[i]+'</a></p>'+
'<p><a onClick="openLoginPage()"'+'href="'+ arr[i+1]+'#" ></a></p>');
  para.appendChild(t);
  document.getElementById("#donlod").appendChild(para);
}
		//$("#donlod").html('<p><a href="javascript:openLoginPage()">'+arr[i]+'</a></p>'+
        //'<p><a onClick="openLoginPage()"'+'href="'+ arr[i+1]+'#" ></a></p>');
	//}	

    
    $("#dialog").dialog("open");
//});

}


   $("tr td img").on("click", function(e) {
    e.preventDefault();
  //var formId = this.form.id;
  //
  //$('#'+formId).submit();
    //document.getElementById('form').submit();
    var dateFrom = document.getElementById("from").value;
    $("#dateF").html(dateFrom);
    var dateTo = document.getElementById("to").value;
    $("#dateT").html(dateTo);
    var sat=document.getElementById("sat").value;
    
    
    var sors=$(this).attr('src');
    console.log('src='+sors);
    var ttl=$(this).attr('title');
    console.log('title='+ttl);
var number=100;
    //var mayarray={'title':ttl,'dateF':dateF,'dateT':dateT};
    //makeForm();
    //postForm();
console.log('post');


/*
$.post("find_db.jsp",{
	
	title : ttl,
	startDate : dateFrom,
	endDate : dateTo,
	sate : sat
},

function(result){
	obj = $.parseJSON(result);
var client = obj.name; //client prop is an array
for(var i = 0; i < client.length; i++){
  alert(client[i]);
}
//console.log('function(result');
    sendPar(sors,ttl,result);
  });
	*/

$.post("find_db.jsp",{
	
	title : ttl,
	sate : sat
},

function(result){
	
//console.log('function(result');
   sendPar(sors,ttl,result);
  });
    
            
    


  //   $.clickImg = function() {
  //     alert("clickImg method ");
  //     alert("clickImg method2 ");
  //     var ttl=$(this).attr('title');
  //       alert("ttl ="+ttl);
  //     e.preventDefault();
  //     //var formId = this.form.id;
  //     //
  //     //$('#'+formId).submit();
  //       //document.getElementById('form').submit();
  //       var dateFrom = document.getElementById("from").value;
  //       $("#dateF").html(dateFrom);
  //       alert("sors ="+sors);
  //       var dateTo = document.getElementById("to").value;
  //       $("#dateT").html(dateTo);
        
        
        
  //       var sors=$(this).attr('src');
        
  //       console.log('src='+sors);
  //       var ttl=$(this).attr('title');
  //       console.log('title='+ttl);
  //       alert("ttl ="+ttl);
  //       //var mayarray={'title':ttl,'dateF':dateF,'dateT':dateT};
  //       //makeForm();
  //       //postForm();
  //      if(ifLog=true){ 
  //       //fun1("<br>"+dateTo+"</br>"+"<br>"+dateFrom+"</br>"+"<br>"+ttl+"</br>");
        
  //       $("#png").html('<img src="'+sors+'" style="max-width:100%"></img>');
  //       $("#change").html('<h2>'+ttl+'</h2>');
  //     $("#donlod").html('<p><a href='+'"pic\\IDN_'+ttl+'.png" download >'+ttl+'</a></p>'+
  //         '<p><a href='+'"pic\\IDN_'+ttl+'.png" download>'+ttl+'</a></p>');
  //       $("#dialog").dialog("open");
  //      }
  //      else{
  //       $("#dialogLogin").dialog("open");
    
  //      }
  //  };


});
});



function testOpen(){
  alert("test Open ");

}

    function openLoginPage(){
      $("#dialog").dialog("close");
      $("#dialogLogin").dialog("open"); return false;
    }


  



function ifLog(){
  if (sessionStorage.getItem('status') != null){
    //redirect to page
    return true;
}
else{
    //show validation message
    //alert("Please login ");

return false;
  }
}


function clickBtn() {
  $.clickImg();
};

// LOGIN.js
function click() {
  inputname = $('#name').val();
  inputpassword =$('#pass').val();
  
  for (i in data.username )      //to match username with provided array
  { 
      name = data.username[i];

      for ( i in data.password){
          pass = data.password[i];

          if (inputname == name & inputpassword == pass ){
              //The user has successfully authenticated. We need to store this information
              //for the next page.
              sessionStorage.setItem("AuthenticationState", "Authenticated");
              
              //This authentication key will expire in 1 hour.
              sessionStorage.setItem("AuthenticationExpires", Date.now.addHours(1));
              
              //Push the user over to the next page.
              window.open(query, '_blank');
          }
          else{
            alert("Please login first");  
          }               
      }
  }

  if (inputname != name & inputpassword != pass ){
      alert("Wrong Password");
  }
}

//addHours to a date.
//Credit to: Kennebec
//https://stackoverflow.com/questions/1050720/adding-hours-to-javascript-date-object
Date.prototype.addHours = function(h) {    
 this.setTime(this.getTime() + (h*60*60*1000)); 
 return this;   
}
})();
