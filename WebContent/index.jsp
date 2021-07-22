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


</head>
<body>

  <div id="overlay">
    <div id="progstat"></div>
    <div id="progress"></div>
  </div>	
  
  <nav class="navbar navbar-expand-md bg-white navbar-light sticky-top">
    	<a class="navbar-brand" href="http://pustekdata.lapan.go.id/"
		target="_blank"> <img src="./html/img/logo_lapan.png" alt="logo"
		style="width: 80px;">
		</a>
		<!-- 
		<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	 		<span class="navbar-toggler-icon"></span>
		</button>
		-->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
		
		<!-- 	
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
	 	-->
	 	<div class="collapse navbar-collapse" id="navbarSupportedContent">	
	 		<ul class="navbar-nav">
	  			<li class="nav-item"><a class="nav-link" href="a">Home</a></li>
	  			<li class="nav-item"><a class="nav-link" href="a">Panduan</a></li>
	  			<li class="nav-item dropdown">
	       		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          				Mengenai ARD
        		</a>
        			<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          			<a class="dropdown-item" href="#">Sentinel-1 A/B</a>
          			<a class="dropdown-item" href="#">ALOS2</a>
          			<a class="dropdown-item" href="#">ARD LAPAN</a>
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
            		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
             		<a id="opsi1" href="#" class="dropdown-item"></a>
             		<a id="opsi2" href="#" class="dropdown-item"></a>
                        <!-- 
                        <div class="dropdown-divider"></div>
                        <a href="#"class="dropdown-item">Logout</a>
                     	-->
            		</div>
             	</li>
         	</ul>
		</div>

</nav>
	 
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
				<option value="A2">ALOS2</option>
			</select> 
			<label for="from">From</label> <input type="text" id="from"
				name="from"> <label for="to">to</label> <input type="text"
				id="to" name="to">

			<script>
			$(function(){
		        $("#to").datepicker({ dateFormat: 'yy-mm-dd' ,defaultDate : "+1w",changeMonth : true,changeYear : true});
		        	$("#from").datepicker({ dateFormat: 'yy-mm-dd',defaultDate : "+1w",changeMonth : true,changeYear : true }).bind("change",function(){
		            var minValue = $(this).val();
		            minValue = $.datepicker.parseDate("yy-mm-dd", minValue);
		            minValue.setDate(minValue.getDate()+1);
		            $("#to").datepicker( "option", "minDate", minValue );
		            console.log("from ="+from);
		        })
		        
		    });
			
			<!--
				$(function() {
					var dateFormat = "yy-mm-dd", from = $("#from").datepicker({
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
						console.log("getdate > date="+date);
						return date;
					}
				});
			-->
			</script>
</div>
</div>

				<h4>Geographic Region</h4>

				<div class="table-responsive">
				<!-- 
            <table class="table table-borderless table-fit">
-->
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


					<p>Placeholder</p>
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
    <div id="form_daftar" title="Silakan Isi Data User ">
                      <!-- <p>Don't have an account!</p>  -->
          
            
            <form action="/signup/" class="form-signup">

                <input type="text" id="user-full" class="form-control" placeholder="Nama Lengkap" required="" >
                <input type="text" id="user-instansi" class="form-control" placeholder="Nama Instansi" required="" >
                <input type="email" id="user-email" class="form-control" placeholder="Alamat Email" required >
                <input type="text" id="user-name" class="form-control" placeholder="Nama Akun (untuk login)" required="" >
                <input type="password" id="user-pass" class="form-control" placeholder="Password" required >
                <!-- 
                <input type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required >
				-->
                <button class="btn btn-primary btn-block" type="submit" id="reg"><i class="fas fa-user-plus"></i> Sign Up</button>
                <!-- <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>-->
            </form>
           </div>
      
</div>

    <div id="form_login" title="Silakan Login">
          
            
		<form class="form-signin" >
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
            <input type="ID" id="inputID" class="form-control" placeholder="ID" required="" >
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
            
            <button class="btn btn-success btn-block" type="submit" id="login2"><i class="fas fa-sign-in-alt"></i>Login</button>
            <!--
            <a href="#" id="forgot_pswd">Forgot password?</a>
            <hr>
             
                      
                       <form action="/reset/password/" class="form-reset">
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" >
                <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
      
            </form>
              <hr>
            <p>Don't have an account!</p>  -->
            <hr>
            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i>Pendaftaran User Baru</button>
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
            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i>Pendaftaran User Baru</button>
            </form>

            <form action="/reset/password/" class="form-reset">
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" >
                <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            
            <form action="/signup/" class="form-signup">

                <input type="text" id="user-full" class="form-control" placeholder="Full name" required="" >
                <input type="text" id="user-instansi" class="form-control" placeholder="Instansi" required="" >
                <input type="email" id="user-email" class="form-control" placeholder="Email address" required >
                <input type="text" id="user-name" class="form-control" placeholder="Username" required="" >
                <input type="password" id="user-pass" class="form-control" placeholder="Password" required >
                <input type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required >

                <button class="btn btn-primary btn-block" type="submit" id="reg"><i class="fas fa-user-plus"></i> Sign Up</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            <br>
      </div>
              




 <script src="html/js/showtiles6_progress.js"></script>    	
</body>
</html>