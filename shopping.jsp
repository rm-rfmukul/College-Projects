<!DOCTYPE html>
<html lang="en">
<head>

  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
		.fa {
	  padding: 15px;
	  
	  text-align: center;
	  text-decoration: none;
	  margin: 5px 2px;
	  border-radius: 50%;
	}

	.fa:hover {
		opacity: 0.7;
	}

	.fa-facebook {
	  background: #3B5998;
	  color: white;
	}

	.fa-twitter {
	  background: #55ACEE;
	  color: white;
	}

	.fa-instagram {
	  background:  #125688;
	  color: white;
	}

	.fa-linkedin {
	  background: #007bb5;
	  color: white;
	}

    .f {
	   position: absolute;
	   left: 0;
	   padding: 10px;
	   bottom: 0;
	   width: 100%;
	   background-color: #222222;
	   color: #979b97;
	   text-align: center;
	}
	
	footer{
		background-color: #222222;
	   color: #979b97;
	   text-align: center;
	   bottom: 0;
	   padding:10px;
	}
	
		img {
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	  }
  </style>
</head>
<body >

</style>
</head>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
     
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#"> Home</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="signin_frontend.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
   
   
    </div>
   
    
  </div>
</nav>

<div style="background-image: url('back.jpg');">

 <div class="container"> 
 <img src="Image.png"  alt="Essentials" class="center" width="300" height="300" >
 <marquee><p1>Products availability may vary as per the Gov. regulation of your zone</p1></marquee>
 <br> <br>
 <form method="post" action="tocart.jsp">

 <div class="row">
	
	<div class="col-sm-4">  
      <div class="panel panel-primary">
        <div class="panel-heading">Water</div>
        <div class="panel-body"><img src="watercan.jpeg" class="img-responsive" alt="Image" height= "60%" ></div>
        <div class="panel-footer">&#8377; 50     <span style="float:right"><select id="water" name="1" >
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Milk</div>
        <div class="panel-body"><img src="milk.jpg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 30    <span style="float:right"><select id="milk" name="2">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Curd</div>
        <div class="panel-body"><img src="curd.jpeg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 35     <span style="float:right"><select id="Curd" name="3">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	
	<div class ="row">
	
	</div>
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Oil</div>
        <div class="panel-body"><img src="oil.jpeg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 110     <span style="float:right"><select id="Oil" name="4">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	
	
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Rice</div>
        <div class="panel-body"><img src="rice.jpeg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 100     <span style="float:right"><select id="rice" name="5">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Eggs</div>
        <div class="panel-body"><img src="eggs.jpeg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 70     <span style="float:right"><select id="eggs" name="6">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	</div>
	
	
	<div class= "row">
	
	
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Onion</div>
        <div class="panel-body"><img src="onion.jpg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 35    <span style="float:right"><select id="onion" name="7">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Potato</div>
        <div class="panel-body"><img src="potato.jpg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 25    <span style="float:right"><select id="potato" name="8">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	<div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Tomato</div>
        <div class="panel-body"><img src="tomato.jpg" class="img-responsive" alt="Image"></div>
        <div class="panel-footer">&#8377; 25     <span style="float:right"><select id="tomato" name="9">
    <option value="0">0</option>
	<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
	<option value="5">5</option>
  </select></div>
      </div>
    </div>
	
	<br>  <button type="submit" class="btn btn-primary btn-lg btn-block">Proceed to Payment</button> <br>
  </form>

</div>
<br> <br>
</div>
<footer >
  <a href="#" class="fa fa-facebook"></a>
<a href="#" class="fa fa-twitter"></a>
<a href="#" class="fa fa-instagram"></a>
<a href="#" class="fa fa-linkedin"></a>
<br>
<br>
<p> &#169; 2021 All rights Reserved. MUKUL. MOHAN. </p>
    

</footer>



</body>


</html>