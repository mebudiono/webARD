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
    
    
    
    var sors=$(this).attr('src');
    console.log('src='+sors);
    var ttl=$(this).attr('title');
    console.log('title='+ttl);
    //var mayarray={'title':ttl,'dateF':dateF,'dateT':dateT};
    //makeForm();
    //postForm();
    
    //fun1("<br>"+dateTo+"</br>"+"<br>"+dateFrom+"</br>"+"<br>"+ttl+"</br>");
    if(ifLog()==true){ 
	$(document).ready(function() {
  $.ajax({
            type:       "post",
            url:        "calculate.jsp",
            data:       "number=" + 5,
            success:    function(msg) {
            	alert(msg);
                            
       
        $("#png").html('<img src="'+sors+'" style="max-width:100%"></img>');
        $("#change").html('<h2>This is change v:'+msg+'</h2>');
        $("#donlod").html('<p><a href='+'"pic\\IDN_'+ttl+'.png" download>'+ttl+'</a></p>'+
          '<p><a href='+'"pic\\IDN_'+ttl+'.png" download>'+ttl+'</a></p>');
        $("#dialog").dialog("open");


   $("#result").append('<p><br>number: '+v.persons1+' From:'+v.prsons2+' To: '+v.persons3+'</br></p>');
            }		
            		//alert("key :",key," number :",value.number,value.dateF,value.dateT);
           		
    });        		 
     return false;
    });




    }
    else{
      $("#png").html('<img src="'+sors+'" style="max-width:100%"></img>');
        $("#change").html('<h2>'+ttl+'</h2>');
$.ajax({                    
    url: 'array.jsp',
    type: 'post',
dataType:  "text",  // [text, xml, json, script, text, html]
    data: {title: ttl, source: sors}, // i, txt have some values.
    success:    function(data, textStatus, jqXHR) {
            var jsonRepsonse = JSON.parse(data);
            alert('Success post to URL entered \n\n The data returned the following: ' + jsonRepsonse.title + ", " + jsonRepsonse.source);
        }, 
        error:function (xhr, ajaxOptions, thrownError){ 
            alert('Error xhr : ' + xhr.status); 
            alert('Error thrown error: ' + thrownError); 
        }
});

        $("#donlod").html('<p><a href="javascript:openLoginPage()">'+ttl+'</a></p>'+
          '<p><a onClick="openLoginPage()"'+'href="#" >'+ttl+'</a></p>');
        $("#dialog").dialog("open");

          
    
    }  
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
