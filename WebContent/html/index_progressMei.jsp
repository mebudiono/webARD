<%@ page import="java.util.ArrayList,java.io.File"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="style.css">


    <!-- Latest compiled and minified CSS--> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 


<!-- Local custom jQuery-->
<link rel="stylesheet" href="html\jQuery\jquery-ui.min.css">
<script src="html\jQuery\external\jquery\jquery.js"></script>
<script src="html\jQuery\jquery-ui.min.js"></script>



<!-- Popper JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 
<style>
   

    table.table-fit {
    width: auto !important;
    table-layout: auto !important;
}
table.table-fit thead th, table.table-fit tfoot th {
    width: auto !important;
}
table.table-fit tbody td, table.table-fit tfoot td {
    width: auto !important;
}
    </style>

  <script>
  

    function testOpen(){
      alert("test Open ");
    
    }

    function openLoginPage(){
      //$("#dialog").dialog("close");
      $("#logreg-forms").dialog("open"); return false;
    }
    
    function openSignPage(){
        //$("#dialog").dialog("close");
        $("#dialogSigningUp").dialog("open"); return false;
      }
    
    function openListPage(tileName){
    	var arrSet=[];
        var inp=tileName;
        var str1=tileName.slice(56,inp.length-15);
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
        	
        	newBaitTag.setAttribute('href',"\""+arrSet[i]+"\"");
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
    (function(){
  function id(v){return document.getElementById(v); 
  }
  
  function tryLoad(mes){
  	alert(mes);
  }
  
  
  
  function cekLoggedIn(){
	  if (localStorage.getItem('currentLoggedIn') != null){
		  var user = localStorage.getItem('currentLoggedIn');  
		  $("#userLogo").attr('src','./html/img/user_u.png');
		  
		  var text =  document.getElementById("opsi1").textContent;
		  //alert(text);
		  //if(text="Reports"){
			 // <a id="opsi1" href="#" class="dropdown-item">Reports</a>
				var tag1 = document.createElement('a');
				//var newBaitTag = document.createElement('a');
	    		var tag1Text = document.createTextNode("Info");
				tag1.setAttribute('href','http://www.detik.com/');
				//newBait.appendChild(newBaitTag);
				tag1.appendChild(tag1Text);
				document.querySelector("#opsi1").appendChild(tag1);
				
				var tag2 = document.createElement('a');
				//var newBaitTag = document.createElement('a');
	    		var tag2Text = document.createTextNode("Logout");
				tag2.setAttribute('href','javascript:loggedOut();');
				//tag2.setAttribute('onclick','loggedOut();');
				//newBait.appendChild(newBaitTag);
				tag2.appendChild(tag2Text);
				document.querySelector("#opsi2").appendChild(tag2);
		  //}
		  //$("#opsi1").html("Info");
		  //$("#opsi1").attr('href','http://pustekdata.lapan.go.id/');
		  //$("#opsi2").html("Logout");
		  //$("#opsi2").attr('href','javascript:LoggedOut()');
	  }
	  else{
		  /*
	  
		  $("#userLogo").attr('src','./html/img/user_logo_t.png');
		  
		  var text =  document.getElementById("opsi1").textContent;
		  //alert(text);
		  //if(text="Reports"){
			 // <a id="opsi1" href="#" class="dropdown-item">Reports</a>
				var tag1 = document.createElement('a');
				//var newBaitTag = document.createElement('a');
	    		var tag1Text = document.createTextNode("Sign In");
				tag1.setAttribute('href','detik.com');
				//newBait.appendChild(newBaitTag);
				tag1.appendChild(tag1Text);
				document.querySelector("#opsi1").appendChild(tag1);
				
				var tag2 = document.createElement('a');
				//var newBaitTag = document.createElement('a');
	    		var tag2Text = document.createTextNode("Login");
				tag2.setAttribute('href','javascript:loggedOut()');
				//newBait.appendChild(newBaitTag);
				tag2.appendChild(tag2Text);
				document.querySelector("#opsi2").appendChild(tag2);
		  
		*/
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


    function loggedOut()
    {
    alert("loggedout");
    localStorage.clear();
   // $("#userLogo").attr('src','./html/img/user_logo_t.png');
    defaultPic();

    }
    

    function defaultPic()
    {
    	$("#userLogo").attr('src','./html/img/user_logo_t.png');
		  
		  var text =  document.getElementById("opsi1").textContent;
		  //alert(text);
		  //if(text="Reports"){
			 // <a id="opsi1" href="#" class="dropdown-item">Reports</a>
				var tag1 = document.createElement('a');
				//var newBaitTag = document.createElement('a');
	    		var tag1Text = document.createTextNode("Sign In");
				tag1.setAttribute('href','javascript:openSignPage()');
				//newBait.appendChild(newBaitTag);
				tag1.appendChild(tag1Text);
				document.querySelector("#opsi1").appendChild(tag1);
				
				var tag2 = document.createElement('a');
				//var newBaitTag = document.createElement('a');
	    		var tag2Text = document.createTextNode("Login");
				tag2.setAttribute('href','javascript:openLoginPage()');
				//newBait.appendChild(newBaitTag);
				tag2.appendChild(tag2Text);
				document.querySelector("#opsi2").appendChild(tag2);

    }
  
    //}
    </script>
    



</head>
<body>

  <div id="overlay">
    <div id="progstat"></div>
    <div id="progress"></div>
  </div>	
   <nav class="navbar navbar-expand-md bg-white navbar-white sticky-top">
    <a class="navbar-brand" href="http://pustekdata.lapan.go.id/"
	target="_blank"> <img src="./html/img/logo_lapan.png" alt="logo"
	style="width: 80px;">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
	data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	 <span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	 <ul class="navbar-nav">
	  <li class="nav-item"><a class="nav-link" href="a">Link</a></li>
	  <li class="nav-item"><a class="nav-link" href="a">Link</a></li>
	  <li class="nav-item dropdown">
	       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown link
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
	  </li>
	 </ul>
	 
	 
	 <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
	  <li class="nav-item order-2 order-md-1">
	   <a href="a" class="nav-link" title="settings">
	    <i class="fas fa-sign-in-alt"></i>
	   </a>
	  </li>
	 </ul>	
	 
	 
	 <ul class="nav navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                    <img id ="userLogo" src="./html/img/user_logo_t.png" alt="logo" style="width: 20px"></img>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a id="opsi1" href="#" class="dropdown-item"></a>
                        <a id="opsi2" href="#" class="dropdown-item"></a>
                        <!-- 
                        <div class="dropdown-divider"></div>
                        <a href="#"class="dropdown-item">Logout</a>
                     	-->
                    </div>
                </li>
            </ul>
	 
	 
<!-- 	 
	 <ul class="navbar-nav">
	  <li class="nav-item dropdown">
	       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img id ="userLogo" src="./html/img/user_logo_t.png" alt="logo" style="width: 20px"></img>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>	
	

				<a id ="dDown" class="navbar-brand" href="javascript:openLoginPage()"> 
	
	<ul class="nav navbar-nav flex-row justify-content-between ml-auto">
	  <li class="nav-item order-2 order-md-1">
	   <a href="a" class="nav-link" title="settings">
	    <i class="fas fa-sign-in-alt"></i>
	   </a>
	  </li>
	 </ul>		
	 			 
				
	 <a id ="dDown" class="navbar-brand" href="#"> 
					<img id ="userLogo" src="./html/img/user_logo_t.png" alt="logo" style="width: 40px"></img>
				</a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="userLogo" data-toggle="Ddown" aria-haspopup="true" aria-expanded="false">
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Menu item 1</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Menu item 2</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Menu item 3</a></li>
        <li role="presentation" class="divider"></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Menu item 4</a></li>
      </ul>
				
				
				<li class="dropdown order-1">
					<button type="button" id="dropdownMenu1" data-toggle="dropdown"
						class="btn btn-outline-secondary dropdown-toggle">
						Login <span class="caret"></span>
					</button>
					
					<ul class="dropdown-menu dropdown-menu-right mt-2">
						<li class="px-3 py-2">
							<form class="form" role="form">
								<div class="form-group">
									<input id="emailInput" placeholder="Email"
										class="form-control form-control-sm" type="text" required="">
								</div>
								<div class="form-group">
									<input id="passwordInput" placeholder="Password"
										class="form-control form-control-sm" type="text" required="">
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">Login</button>
								</div>
								<div class="form-group text-center">
									<small><a href="a" data-toggle="modal"
										data-target="#modalPassword">Forgot password?</a></small>
								</div>
							</form>
						</li>
					</ul>
				</li>
				
				<li class="nav-item order-2 order-md-1"><a href="a"
					class="nav-link" title="settings"><i class="fas fa-user"></i></a></li>
				<li class="dropdown order-1">
					<button type="button" id="dropdownMenu1" data-toggle="dropdown"
						class="btn btn-outline-secondary dropdown-toggle">
						Sign Up <span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right mt-2">
						<li class="px-3 py-2">
							<form class="form" role="form">
								<div class="form-group">
									<input id="emailInput" placeholder="Email"
										class="form-control form-control-sm" type="text" required="">
								</div>
								<div class="form-group">
									<input id="passwordInput" placeholder="Password"
										class="form-control form-control-sm" type="text" required="">
								</div>
								
								
							</form>
						</li>
					</ul>
				
				</li>
			</ul>
			
			<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">Sign
										Up</button>
					<ul class="dropdown-menu dropdown-menu-right mt-2">
						<li class="px-3 py-2">
							<form class="form" role="form">
								<div class="form-group">
									<input id="emailInput" placeholder="Email"
										class="form-control form-control-sm" type="text" required="">
								</div>
								<div class="form-group">
									<input id="passwordInput" placeholder="Password"
										class="form-control form-control-sm" type="text" required="">
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">Sign
										Up</button>
								</div>
							</form>
						</li>
					</ul>
					</div>
-->				
	 </div>

	</nav>



	<script>
		//***************************
		//need setting
		//"IDN","KHM","LAO","MMR","PHL","THA","VNM"
		const region = "IDN"
		var datefrom = document.getElementById("from").value;
		var dateto = document.getElementById("to").value;
console.log("datefrom="+datefrom);
console.log("dateto="+dateto);
		//**************************
	</script>

	<!-- <script>
  function bigImg(x) {
  //x.style.color = "#0000FF";
  //x.style.border = "thin solid #0000FF";
  //x.style.width = "20px";
  //x.style.height = "20px";
  //x.style.backgroundColor = "red";
  x.style.opacity="0.1"
  x.style.cursor = "pointer";

//x.title="tile.name";
  }

  function normalImg(x) {
  //x.style.color = "none";
  //x.style.border = "0";
  x.style.opacity="1"
  
  //x.style.width = "25px";
  //x.style.height = "25px";
  }
</script> 
<script>
function onClick(element) {
  document.getElementById("img01").src = element.src;
  
  document.getElementById("modal01").style.display = "block";
}
</script>-->
	<div class="container-fluid">
		<div class="row">
			<div class="col">
			<select id="sat">
				<option value="S1">Sentinel-1</option>
				<option value="A2">Palsar-2</option>
			</select> 
			<label for="from">From</label> <input type="text" id="from"
				name="from"> <label for="to">to</label> <input type="text"
				id="to" name="to">

			<script>
				$(function() {
					var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
						defaultDate : "+1w",
						changeMonth : true,
						changeYear : true
					}).on("change", function() {
						to.datepicker("option", "minDate", getDate(this));
					}), to = $("#to").datepicker({
						defaultDate : "+1w",
						changeMonth : true,
						changeYear : true
					}).on("change", function() {
						from.datepicker("option", "maxDate", getDate(this));
					});

					function getDate(element) {
						var date;
						try {
							date = $.datepicker.parseDate(dateFormat,
									element.value);
						} catch (error) {
							date = null;
						}
						console.log(date)
						return date;
					}
				});
			</script>
</div>
</div>

				<h4>Geographic Region</h4>

				<div class="table-responsive">
            <table class="table table-borderless table-fit">

						<%!   
						int x1 = 95;
						int x2 = 141;
						int y1 = -11;
						int y2 = 7;
						String fileName, tile;%>
						<%
							for (int i = y2; i >= y1; i--) {
						%>
						<tr>

							<%
								for (int j = x1; j <= x2; j++) {
								if (i >= 0) {
									if (j < 100) {
										tile = "N0" + i + "E0" + j;
										fileName = "IDN_" + tile + ".png";
							%>
							<td ><span></span><a href="$"><img  width="20px" height="20px"
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td> 
							<%
								} else {
									tile = "N0" + i + "E" + j;
									fileName = "IDN_" + tile + ".png";
							
							%>
							<td ><span></span><a href="$"> <img  width="20px" height="20px"
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
							<%
								}
							} else {
							if (j < 100) {
							if (i > -10) {
								tile = "S0" + i*-1 + "E0" + j;
								fileName = "IDN_" + tile + ".png";
								%>
							<td ><span></span><a href="$"><img  width="20px" height="20px"
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
							<%
								} else {
									tile = "S" + i*-1 + "E0" + j;
									fileName = "IDN_" + tile + ".png";
							%>
							<td ><span></span><a href="$"> <img  width="20px" height="20px"
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
							<%
								}
							} else {
							if (i > -10) {
								tile = "S0" + i*-1 + "E" + j;
								fileName = "IDN_" + tile + ".png";
							%>
							<td ><span></span><a href="$"><img  width="20px" height="20px"
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
								<%
								} else {
									tile = "S" + i*-1 + "E" + j;
									fileName = "IDN_" + tile + ".png";
									%>
							<td ><span></span><a href="$"><img  width="20px" height="20px"
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
							<%
								}
							}
						
								}
							}
							}
							%>


						</tr>
					</table>


					<p>sadasdasdasdasd</p>
				</div>
				</div>
		
		
		 <div id="dialog" title="List Files">

        <div class="row">
          <div class="col-8">
            <p id="png"></p>
            <p id="change">Modal body text goes here.</p>
        
          </div>
          <div class="col-4">
            <h3 id="lists">Ditemukan hasil sejumlah : </h3>
            <p id="result"></p>
            <p>Date From :</p>
            <p id="dateF"></p>
        <p>Date To :</p>
            <p id="dateT"></p>
        <p id="donlod">Hasil pencarian :</p>
            
          </div>
        </div>
    </div>
      
      
       <div id="dialogSignedUp" title="List Files">

        <div class="row">
          <div class="col-8">
            <p id="pngD"></p>
            <p id="changeD">Modal body text goes here.</p>
        
          </div>
          <div class="col-4">
            <h3 id="listsD">Ditemukan hasil sejumlah : </h3>
            <p id="resultD"></p>
            <p>Date From :</p>
            <p id="dateFD"></p>
        <p>Date To :</p>
            <p id="dateTD"></p>
        <p id="donlodD">Hasil pencarian :</p>
            
          </div>
        </div>
    </div>
      
      
      <div id="dialogListFile" title="List Files">

        
            <p><h3 id="listsL">Click to download : </h3></p>
            <p id="resultL"></p>
           <p id="donlodL">Hasil pencarian :</p>
            
          
    </div>
      
      
      
    <div id="logreg-forms">
          <form class="form-signin" >
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
            <input type="ID" id="inputID" class="form-control" placeholder="ID" required="" >
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
            
            <button class="btn btn-success btn-block" type="submit" id="signingIn"><i class="fas fa-sign-in-alt"></i> Sign in</button>
            <a href="#" id="forgot_pswd">Forgot password?</a>
            <hr>
            <!-- <p>Don't have an account!</p>  -->
            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button>
            </form>

            <form action="/reset/password/" class="form-reset">
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" >
                <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            
            <br>
      </div>
            
      <div id="dialogSigningUp">
                      
            <form class="needs-validation" novalidate>

                <label for="validationCustom01">*Nama Lengkap</label>
      <input type="text" class="form-control" id="user-full" placeholder="First name" value="Nama Lengkap" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      
      <label for="validationCustom02">*Instansi</label>
      <input type="text" class="form-control" id="user-instansi" placeholder="Instansi" value="Mark" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      
      <label for="validationCustom03">*Email</label>
      <input type="text" class="form-control" id="user-email" placeholder="user@email_provider" value="Mark" required>
      <div class="invalid-feedback">
        Mohon masukkan informasi email.
      </div>
      
      <label for="validationCustom04">*Password</label>
      <input type="text" class="form-control" id="user-email" placeholder="Password" value="Mark" required>
      <div class="invalid-feedback">
        Harap masukkan password.
      </div>
      
      
      
      
      <!--
                <input type="text" id="user-full" class="form-control" placeholder="Full name" required="" >
                <input type="text" id="user-instansi" class="form-control" placeholder="Instansi" required="" >
                <input type="email" id="user-email" class="form-control" placeholder="Email address" required >
                <input type="text" id="user-name" class="form-control" placeholder="Username" required="" >
                <input type="password" id="user-pass" class="form-control" placeholder="Password" required >
                <input type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required >
-->
                <button class="btn btn-primary btn-block" type="submit" id="reg"><i class="fas fa-user-plus"></i>Daftar</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            <br>
      </div>      
              
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
        regPressed();
    
      }, false);
    });
  }, false);
})();
</script>
 <script src="html/js/showtiles6.js"></script>    	
</body>
</html>