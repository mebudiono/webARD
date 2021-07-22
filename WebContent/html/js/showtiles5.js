
(function(){
var glo1;
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
	}
)



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


$("#dialogSignedUp").dialog({
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
});

function sendPar(sorsP,ttlP,resP){
  	$("#png").html('<img src="'+sorsP+'" style="max-width:100%"></img>');
	$("#change").html('<h2>'+ttlP+'</h2>');
	var arr = resP;
	var dateL1=document.getElementById("from").value;
	var dateL2=document.getElementById("to").value;
	if(dateL1==""){
		dateL1 = "2010-01-01";
	}
	if(dateL2==""){
		dateL2 = "2099-31-01";
	}
	
	total=(arr.length-2)/2;
	$("#result").html('<h2>'+total+'</h2>');
	$("#dateF").html('<h2>'+dateL1+'</h2>');
	$("#dateT").html('<h2>'+dateL2+'</h2>');
	
	for(var i = 0; i < arr.length-2; i+=2){
		
		
  /*alert(arr[i]);
	var para = document.createElement("P");
  var t = document.createTextNode('<a href="javascript:openLoginPage()">'+arr[i+1]+'</a>'+
'<a onClick="openLoginPage()"'+'href="'+ arr[i]+'#" ></a>');
var t1 = document.createTextNode("This is a paragraph.");  
para.appendChild(t1);
  document.querySelector("#donlod").appendChild(para);
*/
	var newBait = document.createElement('p');
	var newBaitTag = document.createElement('a');
    var newBaitText = document.createTextNode(arr[i]);
		if (sessionStorage.getItem('status') == null){
    //redirect to page
		newBaitTag.setAttribute('href',arr[i+1]);
		newBait.appendChild(newBaitTag);
		newBaitTag.appendChild(newBaitText);
		document.querySelector("#donlod").appendChild(newBait);
glob1=arr[i+1];
		}
		else{
    	newBaitTag.setAttribute('href',"javascript:openLoginPage()");
		newBait.appendChild(newBaitTag);
		newBaitTag.appendChild(newBaitText);
document.querySelector("#donlod").appendChild(newBait);
glob1=arr[i+1];
//return false;
  	}
    
	}
   
    $("#dialog").dialog("open");

}


function sendPar2(nama,resP){
/*  	
$("#png").html('<img src="'+sorsP+'" style="max-width:100%"></img>');
	$("#change").html('<h2>'+ttlP+'</h2>');
	var dateL1=document.getElementById("from").value;
	var dateL2=document.getElementById("to").value;
	if(dateL1==""){
		dateL1 = "2010-01-01";
	}
	if(dateL2==""){
		dateL2 = "2099-31-01";
	}
	$("#dateF").html('<h2>'+dateL1+'</h2>');
	$("#dateT").html('<h2>'+dateL2+'</h2>');
	
	*/
	var arr = resP;
	
	total=(arr.length-2)/2;
	$("#result").html('<h2>'+total+'</h2>');
	
	for(var i = 0; i < arr.length-2; i+=2){
		
		
  /*alert(arr[i]);
	var para = document.createElement("P");
  var t = document.createTextNode('<a href="javascript:openLoginPage()">'+arr[i+1]+'</a>'+
'<a onClick="openLoginPage()"'+'href="'+ arr[i]+'#" ></a>');
var t1 = document.createTextNode("This is a paragraph.");  
para.appendChild(t1);
  document.querySelector("#donlod").appendChild(para);
*/
	var newBait = document.createElement('p');
	var newBaitTag = document.createElement('a');
    var newBaitText = document.createTextNode(arr[i]);
		newBaitTag.setAttribute('href',arr[i+1]);
		newBait.appendChild(newBaitTag);
		newBaitTag.appendChild(newBaitText);
		document.querySelector("#donlod").appendChild(newBait);
	
//return false;
  	
    
	}
   

$("#dialogSignedUp").dialog("open");

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
//var number=100;
    //var mayarray={'title':ttl,'dateF':dateF,'dateT':dateT};
    //makeForm();
    //postForm();
console.log('post');



	$.post("find_db.jsp",{
	
		title : ttl,
		date1 : dateFrom,
		date2 : dateTo,
		sate : sat
	},

		function(result){
	
//console.log('function(result');
   		sendPar(sors,ttl,result);
  		});
    
	});
});

$("#signingIn").on("click", function(e) {
e.preventDefault();
var inpName= document.getElementById("inputID").value;
    //$("#dateF").html(dateFrom);
var inpPass = document.getElementById("inputPassword").value;
    //$("#dateT").html(dateTo);

	$.post("cek_user.jsp",{
	
		name : inpName,
		pass : inpPass
	},

		function(result){
			if(result==true){
		
	
//console.log('function(result');
				$.post("find_db2.jsp",{
	
					find : glo1
				},

					function(resFind){


   						sendPar2(glo1,resFind);
	
		  
					});
							
			}

		});
	});
});


function cekPass(nama,resP){
/*  	
$("#png").html('<img src="'+sorsP+'" style="max-width:100%"></img>');
	$("#change").html('<h2>'+ttlP+'</h2>');
	var dateL1=document.getElementById("from").value;
	var dateL2=document.getElementById("to").value;
	if(dateL1==""){
		dateL1 = "2010-01-01";
	}
	if(dateL2==""){
		dateL2 = "2099-31-01";
	}
	$("#dateF").html('<h2>'+dateL1+'</h2>');
	$("#dateT").html('<h2>'+dateL2+'</h2>');
	
	*/
	var cekP = resP;
	
	
	total=(arr.length-2)/2;
	$("#result").html('<h2>'+total+'</h2>');
	
	for(var i = 0; i < arr.length-2; i+=2){
		
		
  /*alert(arr[i]);
	var para = document.createElement("P");
  var t = document.createTextNode('<a href="javascript:openLoginPage()">'+arr[i+1]+'</a>'+
'<a onClick="openLoginPage()"'+'href="'+ arr[i]+'#" ></a>');
var t1 = document.createTextNode("This is a paragraph.");  
para.appendChild(t1);
  document.querySelector("#donlod").appendChild(para);
*/
	var newBait = document.createElement('p');
	var newBaitTag = document.createElement('a');
    var newBaitText = document.createTextNode(arr[i]);
		newBaitTag.setAttribute('href',arr[i+1]);
		newBait.appendChild(newBaitTag);
		newBaitTag.appendChild(newBaitText);
		document.querySelector("#donlod").appendChild(newBait);
	
//return false;
  	
    
	}
   

$("#dialogSignedUp").dialog("open");

}




function testOpen(){
  alert("test Open ");

}
/*
    function openLoginPage(){
      $("#dialog").dialog("close");
      $("#dialogLogin").dialog("open"); return false;
    }
``

  



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

*/

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
