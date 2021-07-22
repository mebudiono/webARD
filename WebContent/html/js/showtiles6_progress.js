var glo1;
var statLog;
var LOGIN_TIMEOUT; 

var IDLE_TIMEOUT = 15; //minutes
localStorage.setItem("lastInteraction", Date.now());

document.onclick = function () {    
    localStorage.setItem("lastInteraction", Date.now());
};

document.onmousemove = function () {   
    localStorage.setItem("lastInteraction", Date.now());
};

document.onkeypress = function () {  
    localStorage.setItem("lastInteraction", Date.now());
};

document.onfocus = function () {  
    localStorage.setItem("lastInteraction", Date.now());
};

/*
window.setInterval(CheckIdleTime, 10000);
function CheckIdleTime() {  
	console.log("checking idle last interaction="+Number(localStorage.getItem("lastInteraction")));
	console.log("checking idle last interaction="+Date(localStorage.getItem("lastInteraction")));
	console.log("Date.now="+Date.now());
	console.log("Date="+Date());
    //localStorage.setItem("setTimeOut", parseInt(localStorage.getItem("setTimeOut"))+1);
    if (Number(localStorage.getItem("lastInteraction")) + (IDLE_TIMEOUT * 60000) < Date.now()){
        alert('Times up!, You are idle for about 15 minutes, Please login to continue');
        document.location.href = "javascript:loggedOut();";
    }
}

window.setInterval(CheckLoginTime, 10000);
					function CheckLoginTime() {  
					console.log("checking idle lastLogin="+Number(localStorage.getItem("lastLogin")));
					console.log("checking idle lastLogin="+Date(localStorage.getItem("lastLogin")));
					console.log("Date.now="+Date.now());
					console.log("Date="+Date());
    //localStorage.setItem("setTimeOut", parseInt(localStorage.getItem("setTimeOut"))+1);
    				if (Number(localStorage.getItem("lastLogin")) + (LOGIN_TIMEOUT * 10000) < Date.now()){
        			alert('Times up!, Your last login was 2 hours ago, Please login to continue');
        			document.location.href = "javascript:loggedOut();";
    				}
				}
*/
function daftar()
    {
    //alert("Daftar");
    //localStorage.clear();
   // $("#userLogo").attr('src','./html/img/user_logo_t.png');
    //defaultPic();
	$("#form_daftar").dialog("open"); return false;
}

function daftarDB(){
		//e.preventDefault();
		alert("this is start of daftarDB()");  
		
		var daftarFull= document.getElementById("user-full").value;
    	var daftarIns = document.getElementById("user-instansi").value;
    	var daftarEma = document.getElementById("user-email").value;
		var daftarNam = document.getElementById("user-name").value;
		var daftarPass = document.getElementById("user-pass").value;
		//var inpRPass2 = document.getElementById("user-repeatpass").value;
		
		$.post("cre_user.jsp",{
			dbUFull : daftarFull,
			dbUIns : daftarIns,
			dbUEma: daftarEma,
			dbUNam:daftarNam,
			dbUPass:window.btoa(daftarPass)
		},

			function(regProc){
				//var obj = JSON.parse(resultCek);
//obj.result = new Date(obj.birth);
				if(regProc.result=true){
//--->close dialog signin, change user icon 					
					loggedIn(daftarNam);
									}
				else{
					alert("user sudah terdaftar, silakan login")
					//close and clear daftar page
					//open login page
				}

			});
	alert("this is end of daftarDB()");  
	//});
	}


function login()
    {
	statLog=1;
    //alert("Daftar");
    //localStorage.clear();
   // $("#userLogo").attr('src','./html/img/user_logo_t.png');
    //defaultPic();
	$("#form_login").dialog("open"); return false;


}

function iconIn(){
	document.getElementById("opsi1").innerHTML = "Info";
	document.getElementById("opsi1").href = "'https://www.detik.com/";
	document.getElementById("opsi2").innerHTML = "Logout";
	document.getElementById("opsi2").href = "javascript:loggedOut();";
}

function iconOut(){
	document.getElementById("opsi1").innerHTML = "Daftar";
	document.getElementById("opsi1").href = "'javascript:daftar()";
	document.getElementById("opsi2").innerHTML = "Login";
	document.getElementById("opsi2").href = "javascript:login();";
}

function openLoginPage(){
      //$("#dialog").dialog("close");
      $("#form_login").dialog("open"); return false;
}
    
function openListPage(tileName){
    	var arrSet=[];
        var inp="./data/"+tileName;
        var str1="./data/"+tileName.slice(56,inp.length-15);
        //alert("str1="+str1);
        var str2=tileName.slice(56,inp.length-13);
        //alert("str2="+str2);
        //alert(tileName);
        var res11 = str1.concat("H_G0_dB.png");
        var res12 = str1.concat("H_G0_dB.tif");
        
        var res21 = str1.concat("V_G0_dB.png");
        var res22 = str1.concat("V_G0_dB.tif");
        
        var res25 = str2.concat(".json");
        var res26 = str2.concat(".kml");
        var res23 = str2.concat("_IN.tif");
        var res24 = str2.concat("_LS.tif");
        
		
        var arrSet=[res11,res12,res21,res22,res23,res24,res25,res26];
        document.querySelector("#resultL").innerHTML= "";
        for (var i = 0; i < arrSet.length; i++){
        	var newBait = document.createElement('p');
    		var newBaitTag = document.createElement('a');
        	var newBaitText = document.createTextNode(arrSet[i]);
    		
        	//var newBaitText = document.createTextNode("res1");
        	
        	newBaitTag.setAttribute('href',arrSet[i]);
			newBait.appendChild(newBaitTag);
			newBaitTag.appendChild(newBaitText);
			document.querySelector("#resultL").appendChild(newBait);
		}
        /*
        <a class="nav-link" href=str1>res</a>
        <a class="nav-link" href="a">Link</a>
        <a class="nav-link" href="a">Link</a>
        <a class="nav-link" href="a">Link</a>
        */
        
        $("#dialogListFile").dialog("open"); return false;
      
}
    
    
function openLogPage(){
      //alert("open register");
      //$("#dialogLogin).dialog("close");
      $("#dialogSignedUp").dialog("open"); return false;
};

//List of Jquery functions
(function(){
  function id(v){return document.getElementById(v); 
  }
  
  function tryLoad(mes){
  	alert(mes);
  }
  
  
  
  function cekLoggedIn(){
	  if (localStorage.getItem('currentLoggedIn') != null){
		$("#userLogo").attr('src','./html/img/user_logged.png');
		iconIn();
	  }
	  else{
		defaultPic();
	  }
	  
   }
  
  	function loadbar() {
  
	  var ovrl = id("overlay"),
  prog = id("progress"),
  stat = id("progstat"),
  img = document.images,
  c = 0;
  tot = img.length;

    	function imgLoaded(){
      	c += 1;
      	var perc = ((100/tot*c) << 0) +"%";
      	prog.style.width = perc;
      	stat.innerHTML = "Loading "+ perc;
      	if(c===tot) return doneLoading();
    	}
    
    	function doneLoading(){
      	ovrl.style.opacity = 0;
      	setTimeout(function(){ 
        ovrl.style.display = "none";
        cekLoggedIn();
        tryLoad("Success");
      	}, 1200);
   }
   for(var i=0; i<tot; i++) {
   var tImg     = new Image();
   tImg.onload  = imgLoaded;
   tImg.onerror = imgLoaded;
   tImg.src     = img[i].src;
   }
   
  }
  document.addEventListener('DOMContentLoaded', loadbar, false);
}());

	$("#reg").on("click", function(e) {
		e.preventDefault();
		alert("this is reg");
let str = $('#user-email').val();
str.includes("world")   // Returns true

		if($('#user-full').val() == ''){
      		alert('Silakan isi nama lengkap');
   		}
		else if($('#user-instansi').val() == ''){
      		alert('Silakan isi nama instansi');
   		}
		else if($('#user-email').val() == ''){
      		alert('Silakan isi email');
   		}
		else if(!str.includes("@")){
      		alert('Alamat email kurang lengkap');
   		}
		else if($('#user-name').val() == ''){
      		alert('Silakan isi username');
   		}
		else if($('#user-pass').val() == ''){
      		alert('Silakan isi password');
   		}
		else{
	alert("thuis is else");		
			daftarDB();	
		}

	});



    function loggedOut()
    {
    alert("loggedout");
    localStorage.clear();
   // $("#userLogo").attr('src','./html/img/user_logo_t.png');
    defaultPic();

    }
    

    function defaultPic()
    {
    	$("#userLogo").attr('src','./html/img/user_notL.png');
			iconOut();
		
    }




(function(){

`use strict`;

/*
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
*/

	$(function() {
		
		$("#form_daftar").dialog({
    		autoOpen: false,
    		modal: true,
   			height: 450,
   			width: 600,
   			buttons : {
                 Close:
                 function(){
                 $(this).dialog('close');
                     }
             } 
    
  		});
  		
		$("#form_login").dialog({
    		autoOpen: false,
    		modal: true,
   			height: 450,
   			width: 600,
   			buttons : {
                 Close:
                 function(){
                 $(this).dialog('close');
                     }
             } 
    
  		});


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

	$("#btn-signup").on("click", function(e) {
	//clear n close login dialog
	$("#form_login").dialog("close"); 
	//open daftar dialog
	$("#form_daftar").dialog("open"); 
	
	});

$("tr td img").on("click", function(e) {
	e.preventDefault();
  statLog=2;
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
				//console.log('arr['+i+']='+arr[i]);
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


$("#login2").on("click", function(e) {
		e.preventDefault();
		var inpName= document.getElementById("inputID").value;
    //$("#dateF").html(dateFrom);
		var inpPass = document.getElementById("inputPassword").value;
    //$("#dateT").html(dateTo);

		$.post("cek_user.jsp",{
	
			name : inpName,
			pass : window.btoa(inpPass)
		},

			function(resultCek){
				if (resultCek.result==true){
					console.log("resultcek IF true,resultcek ="+resultCek.result);
					//login from right icon
					if(statLog=1){
					console.log("resultcek IF staLog 1");	
						//alert("statLog from resultcek="+statLog);
						//change pic
						console.log("statLog from resultcek="+statLog);
						$("#userLogo").attr('src','./html/img/user_logged.png');
						iconIn();
						//add localstorage
						localStorage.setItem("currentLoggedIn",inpName);
						//clear input values
						//close dialog
					LOGIN_TIMEOUT = 2; //hours
					localStorage.setItem("lastLogin", Date.now());

					
					}
					//login from click tiles
					else{
						
						//alert("statlog from else resultcek : "+statLog);
						console.log("resultcek IF staLog 1 statlog from else resultcek : "+statLog);
						//change pic
						$("#userLogo").attr('src','./html/img/user_logged.png');
						iconIn();						//add localstorage
						localStorage.setItem("currentLoggedIn",inpName);
						//clear input values
						//close form-login dialog
						//opendialog list files to download (sendpar2)
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
				}
				//wrong user or pass
				
				else{
				console.log("resultcek false : "+resultCek.result);
					//alert user/password salah
					alert("User atau password salah");
				}
			});
	});



	$("#login").on("click", function(e) {
		e.preventDefault();
		var inpName= document.getElementById("inputID").value;
    //$("#dateF").html(dateFrom);
		var inpPass = document.getElementById("inputPassword").value;
    //$("#dateT").html(dateTo);

		$.post("cek_user.jsp",{
	
			name : inpName,
			pass : window.btoa(inpPass)
		},

			function(resultCek){
				//var obj = JSON.parse(resultCek);
//obj.result = new Date(obj.birth);
				if(resultCek.result==true){
					alert("This is resultCek="+resultCek.result);
					console.log('resultCek.result='+resultCek.result);	
					console.log('glo1='+glo1);
					alert("This is glo1="+glo1);
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

/*
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
*/
	
function loggedIn(user)
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
