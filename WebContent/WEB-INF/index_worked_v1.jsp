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
    
    $("#png").html('<img src="'+sors+'" style="max-width:100%"></img>');
    $("#change").html('<h2>'+ttl+'</h2>');
	$("#donlod").html('<p><a href='+'"pic\\IDN_'+ttl+'.png" download>'+ttl+'</a></p>'+
			'<p><a href='+'"pic\\IDN_'+ttl+'.png" download>'+ttl+'</a></p>');
    $("#dialog").dialog("open");
    });
    

});
	
	
</script>
    



</head>
<body>
	
	<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
		<a class="navbar-brand" href="http://pustekdata.lapan.go.id/"
			target="_blank"> <img src="./html/img/logo_lapan.png" alt="logo"
			style="width: 40px;">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="a">Link</a></li>
				<li class="nav-item"><a class="nav-link" href="a">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="a" id="navbardrop"
					data-toggle="dropdown"> Dropdown link </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="a">Link 1</a> <a
							class="dropdown-item" href="a">Link 2</a> <a
							class="dropdown-item" href="a">Link 3</a>
					</div></li>
			</ul>
			<ul class="nav navbar-nav flex-row justify-content-between ml-auto">
				<li class="nav-item order-2 order-md-1"><a href="a"
					class="nav-link" title="settings"><i class="fas fa-sign-in-alt"></i></a></li>
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
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">Sign
										Up</button>
								</div>
							</form>
						</li>
					</ul>
				</li>
			</ul>
		</div>

	</nav>



	<script>
		//***************************
		//need setting
		//"IDN","KHM","LAO","MMR","PHL","THA","VNM"
		const region = "IDN"
		var datefrom = document.getElementById("from").value;
		var dateto = document.getElementById("to").value;

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
		<div class="col-8 wf">
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
							<td ><span></span><a href="$"><img
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										width=17 height=17 onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td> 
							<%
								} else {
									tile = "N0" + i + "E" + j;
									fileName = "IDN_" + tile + ".png";
							
							%>
							<td ><span></span><a href="$"> <img
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										width=17 height=17 onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
							<%
								}
							} else {
							if (j < 100) {
							if (i > -10) {
								tile = "S0" + i*-1 + "E0" + j;
								fileName = "IDN_" + tile + ".png";
								%>
							<td ><span></span><a href="$"><img
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										width=17 height=17 onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
							<%
								} else {
									tile = "S" + i*-1 + "E0" + j;
									fileName = "IDN_" + tile + ".png";
							%>
							<td ><span></span><a href="$"> <img
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										width=17 height=17 onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
							<%
								}
							} else {
							if (i > -10) {
								tile = "S0" + i*-1 + "E" + j;
								fileName = "IDN_" + tile + ".png";
							%>
							<td ><span></span><a href="$"><img
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										width=17 height=17 onclick="onClick(this);" class="modal-hover-opacity">
								</img></a></td>
								<%
								} else {
									tile = "S" + i*-1 + "E" + j;
									fileName = "IDN_" + tile + ".png";
									%>
							<td ><span></span><a href="$"><img
										src="html\tes_tiles\<%=fileName%>" title="<%=tile%>"
										width=17 height=17 onclick="onClick(this);" class="modal-hover-opacity">
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
		
		
		
<div id="dialog" title="List Files">

  <div class="row">
    <div class="col-8">
      <p id="png"></p>
      <p id="change">Modal body text goes here.</p>
  
    </div>
    <div class="col-4">
      <h3 id="lists">List items</h3>
      <p id="result">1</p>
      <p>Date From :</p>
      <p id="dateF"></p>
<p>Date To :</p>
      <p id="dateT"></p>
  <p id="donlod"></p>
      <p style="font-size:10px; color:#03225C;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit adipiscing blandit. Aliquam placerat, velit a fermentum fermentum, mi felis vehicula justo, a dapibus quam augue non massa.   </p>

    </div>
  </div>
</div>


    	
</body>
</html>