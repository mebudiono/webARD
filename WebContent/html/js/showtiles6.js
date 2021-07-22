
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

	$(
		()=>{
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


  		$("#dialogSigningUp").dialog({
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

$("#dialogListFile").dialog({
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

	
	$("tr td img").on("click", function(e) {
	e.preventDefault();
  
		var dateFrom = document.getElementById("from").value;
		$("#dateF").html(dateFrom);
		var dateTo = document.getElementById("to").value;
		$("#dateT").html(dateTo);
		var sat=document.getElementById("sat").value;
    	var sors=$(this).attr('src');
		console.log('src='+sors);
		var ttl=$(this).attr('title');
		console.log('title='+ttl);
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
	
	
	
	function sendPar(sorsP,ttlP,resP){
  		$("#png").html('<img src="'+sorsP+'" style="max-width:100%"></img>');
		$("#change").html('<h2>'+ttlP+'</h2>');
		var arr = [];
		arr=resP;
		var dateL1=document.getElementById("from").value;
		var dateL2=document.getElementById("to").value;
		if(dateL1==""){
			dateL1 = "2010-01-01";
		}
		if(dateL2==""){
			dateL2 = "2099-31-01";
		}
		if(arr.length==0){	
			total=(arr.length);
			console.log('total='+total);
			$("#result").html('<h2>Belum ada data</h2>');
			$("#dateF").html('<h2>'+dateL1+'</h2>');
			$("#dateT").html('<h2>'+dateL2+'</h2>');
			document.querySelector("#donlod").innerHTML= "";	
		
			
		}
		else{
			total=(arr.length-2)/2;
			console.log('total='+total);
			$("#result").html('<h2>'+total+'</h2>');
			$("#dateF").html('<h2>'+dateL1+'</h2>');
			$("#dateT").html('<h2>'+dateL2+'</h2>');
			document.querySelector("#donlod").innerHTML= "";	
		
			for(var i = 0; i < arr.length-2; i+=2){
		
				var newBait = document.createElement('p');
				var newBaitTag = document.createElement('a');
    			var newBaitText = document.createTextNode(arr[i]);
				var arrInp = arr[i+1];
				console.log('arr['+i+']='+arr[i]);
				if (localStorage.getItem('currentLoggedIn') != null){
    //redirect to page
					console.log('here (status) != null');
					newBaitTag.setAttribute('href',"javascript:openListPage('"+arrInp+"')");
					//newBaitTag.setAttribute('href',"javascript:openListPage('tes')");
					
					newBait.appendChild(newBaitTag);
					newBaitTag.appendChild(newBaitText);
					document.querySelector("#donlod").appendChild(newBait);
				//document.donlod.innerHTML= "";
					glo1=arr[i];
				}
				else{
					console.log('here (status) == null');
    				newBaitTag.setAttribute('href',"javascript:openLoginPage()");
					newBait.appendChild(newBaitTag);
					newBaitTag.appendChild(newBaitText);
					document.querySelector("#donlod").appendChild(newBait);
				
					glo1=arr[i];
//return false;
  					}
    
				}
   			}
    	$("#dialog").dialog("open");

arr=[];
	}

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

			function(resultCek){
				//var obj = JSON.parse(resultCek);
//obj.result = new Date(obj.birth);
				if(resultCek.result=true){
		
console.log('resultCek.result='+resultCek.result);	
console.log('glo1='+glo1);
					$.post("find_db2.jsp",{
	
						folder : glo1
					},

						function(resFind){
							console.log('this is resfind');	
//console.log('glo1='+glo1);

   							sendPar2(glo1,resFind);
	
		  				});
							
				}

			});
	});

	function sendPar2(fold,resP){
		var arr = [];
		arr=resP;
		total=(arr.length);
		$("#resultD").html('<h2>'+total+'</h2>');
		document.querySelector("#donlodD").innerHTML= "";
			
		for(var i = 0; i < arr.length; i++){
			
			var newBait = document.createElement('p');
			var newBaitTag = document.createElement('a');
    		var newBaitText = document.createTextNode(arr[i]);
			newBaitTag.setAttribute('href',arr[i]);
			newBait.appendChild(newBaitTag);
			newBaitTag.appendChild(newBaitText);
			document.querySelector("#donlodD").appendChild(newBait);
		}
   		$("#dialogSignedUp").dialog("open");
arr=[];
	}

function valUser(){
e.preventDefault();
		var inpRFull= document.getElementById("user-full").value;
    	var inpRIns = document.getElementById("user-instansi").value;
    	var inpREma = document.getElementById("user-email").value;
		var inpRNam = document.getElementById("user-name").value;
		var inpRPass = document.getElementById("user-pass").value;
		var inpRPass2 = document.getElementById("user-repeatpass").value;
		
		$.post("cre_user.jsp",{
			rFull : inpRFull,
			rIns : inpRIns,
			rEma: inpREma,
			rNam:inpRNam,
			rPass:window.btoa(inpRPass)
		},

			function(regProc){
				//var obj = JSON.parse(resultCek);
//obj.result = new Date(obj.birth);
				if(regProc.result=true){
//--->close dialog signin, change user icon 					
					LoggedIn(inpREma);
									}
				else{
					
				}

			});
	
	
	}

function regPressed(){
	alert("this is regpressed()");  
	valUser();
}


$("#reg").on("click", function(e) {
		e.preventDefault();
		var inpRFull= document.getElementById("user-full").value;
    	var inpRIns = document.getElementById("user-instansi").value;
    	var inpREma = document.getElementById("user-email").value;
		var inpRNam = document.getElementById("user-name").value;
		var inpRPass = document.getElementById("user-pass").value;
		var inpRPass2 = document.getElementById("user-repeatpass").value;
		
		$.post("cre_user.jsp",{
			rFull : inpRFull,
			rIns : inpRIns,
			rEma: inpREma,
			rNam:inpRNam,
			rPass:window.btoa(inpRPass)
		},

			function(regProc){
				//var obj = JSON.parse(resultCek);
//obj.result = new Date(obj.birth);
				if(regProc.result=true){
//--->close dialog signin, change user icon 					
					LoggedIn(inpREma);
						
					$("#logreg-forms").dialog('close');	
//console.log('regProc.result='+resultCek.result);	
//console.log('glo1='+glo1);

//$("#png").html('<img src="'+sorsP+'" style="max-width:100%"></img>');

					$.post("find_db2.jsp",{
	
						folder : glo1
						},

							function(resFind){
								console.log('this is resfind');	
//console.log('glo1='+glo1);

   								sendPar2(glo1,resFind);
	//$("#logreg-forms").dialog("close");
	
	
		  			});

							
				}
				else{
					
				}

			});
	});

	
function LoggedIn(user)
{


localStorage.setItem("currentLoggedIn",user);
console.log("currentLoggedIn="+localStorage.getItem('currentLoggedIn'));
$("#userLogo").attr('src','./html/img/user_u.png');
//localStorage.setItem('all_users',JSON.stringify(a));
Date.prototype.addHours = function(h) {    
 this.setTime(this.getTime() + (h*60*60*1000)); 
 return this;   
}

}

function cekLoginSession(userS,passS)
{
   const hash = Object.fromEntries(
   a.map(e => [e.name, e.password])
)
//var username = document.getElementById('uname').value;
//var password = document.getElementById('psw').value;
for (let key of hash) 
{
    
    if(key[0] === userS && key[1]===atob(passS))
     {
         alert('Login successful');
     }
 
else
     {
         alert('Login fail');
     }
}
}

})();
