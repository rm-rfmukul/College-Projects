<!DOCTYPE html>
<html lang="en">
<head>

  <title>Sign Up</title>
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
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="signup_frontend.jsp"><span class="glyphicon glyphicon-user"> </span> Signup</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="signin_frontend.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
  
<div class="container">
	  <img src="Image.png" alt="Essentials" class="center" width="300" height="300" >
	  <form id="form" name="form" method="post" action=signup_backend.jsp>
	  
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="name" type="text" class="form-control" name="Name" placeholder="Name" required>
    </div>
    <br>
	<div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
      <input id="phoneNo" type="number" class="form-control" name="Mob" placeholder="PhoneNo" required>
    </div>
    <br>
	<div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input id="email" type="text" class="form-control" name="Email" placeholder="Email" required>
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control" name="password" placeholder="Password" required onChange="onChange()">
    </div>
    <br>
	 <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="confirm_password" type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required onChange="onChange()">
    </div>
    <br>
    
  <input type="submit" value="Register" id="submit">
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

 <script>
    $(document).ready(function(){
        var $submitBtn = $("#form input[type='submit']");
        var $passwordBox = $("#password");
        var $confirmBox = $("#confirm_password");
        var $errorMsg =  $('<span id="error_msg">Passwords do not match.</span>');

        // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
        $submitBtn.removeAttr("disabled");

        function checkMatchingPasswords(){
            if($confirmBox.val() != "" && $passwordBox.val != ""){
                if( $confirmBox.val() != $passwordBox.val() ){
                    $submitBtn.attr("disabled", "disabled");
                    $errorMsg.insertAfter($confirmBox);
                }
            }
        }

        function resetPasswordError(){
            $submitBtn.removeAttr("disabled");
            var $errorCont = $("#error_msg");
            if($errorCont.length > 0){
                $errorCont.remove();
            }  
        }


        $("#confirm_password, #password")
             .on("keydown", function(e){
                /* only check when the tab or enter keys are pressed
                 * to prevent the method from being called needlessly  */
                if(e.keyCode == 13 || e.keyCode == 9) {
                    checkMatchingPasswords();
                }
             })
             .on("blur", function(){                    
                // also check when the element looses focus (clicks somewhere else)
                checkMatchingPasswords();
            })
            .on("focus", function(){
                // reset the error message when they go to make a change
                resetPasswordError();
            })

    });
  </script>


</body>


</html>