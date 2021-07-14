<!DOCTYPE html>
<html lang="en">
<head>

  <title>Sign In</title>
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

    img {
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	  }
	  
	footer{
		background-color: #222222;
	   color: #979b97;
	   text-align: center;
	   bottom: 0;
	   padding:10px;
	}
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Login</a>
    </div>
	    <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="signup_frontend.jsp"><span class="glyphicon glyphicon-user"> </span> Signup</a></li>
      
    </ul>
    
	
    
  </div>
</nav>
  
<div class="container">
	  <img src="Image.png" alt="Essentials" class="center" width="300" height="300" >
	  <form id="form" name="form" method="post" action="signin_backend.jsp">
	   <tab> Sign in using:	&emsp;
	    <label class="radio-inline">
      <input type="radio" name="choice" value="Email">Email
    </label>
    <label class="radio-inline">
      <input type="radio" name="choice" value="CustomerID" checked>Customer ID
    </label> <br> <br>
    
	
	<div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input id="email" type="text" class="form-control" name="Email" placeholder="Email / ID" required>
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control" name="password" placeholder="Password" required onChange="onChange()">
    </div>
    <br>
	    New User?? <a href="signup_frontend.jsp" ><b> SignUp </b></a> <br>
    <br>
  <input type="submit" value="sign in" id="submit">
  </form>
</form>
</div>
<br><br>
<footer>
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