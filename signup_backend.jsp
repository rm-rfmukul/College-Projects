<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager "%>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="com.mysql.cj.jdbc.Driver" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="javax.servlet.ServletException" %>
<%@ page import ="javax.servlet.annotation.WebServlet" %>
<%@ page import ="javax.servlet.http.HttpServlet" %>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%@ page import ="javax.servlet.http.HttpServletResponse" %>

<!DOCTYPE html>
<html>
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

    .footer {
	   position: fixed;
	   left: 0;
	   padding: 10px;
	   bottom: 0;
	   width: 100%;
	   background-color: #222222;
	   color: #979b97;
	   text-align: center;
	}
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="signup_frontend.jsp">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#"><span class="glyphicon glyphicon-user"> </span> Signup</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="signin_frontend.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>

<%! public class RegisterDBC {

	private String dburl="jdbc:mysql://localhost:3306/students_registered";
	private String dbuname="root";
	private String dbpassword="Password!234";
	//private String dbdriver="com.mysql.cj.jdbc.Driver";
	public void loadDriver()
	{
		try {
			DriverManager.registerDriver(new Driver());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	public Connection getConnection()
	{
		Connection con=null;
		try {
			con=DriverManager.getConnection(dburl,dbuname, dbpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	
	public String insert(String name, String email, String mob, String pass)
	{
		loadDriver();
		Connection con=getConnection();
		String response="Customer Successfully Registered!!";
		String Query="insert into covid_mart.customers (Name,Email,Contact,Password) values(?,?,?,?)";
		String Query2="select * from covid_mart.customers where Email=?";
		try {
			PreparedStatement ps=con.prepareStatement(Query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, mob);
			ps.setString(4, pass);
			ps.executeUpdate();
			PreparedStatement ps2=con.prepareStatement(Query2);
			ps2.setString(1, email);
			ResultSet res = ps2.executeQuery();
			
			if(res.next()){
				String custID = res.getString("CustID");
				response = "<h3>"+response + "<br><br> Cutomer ID: " + custID +"<br><br> Email ID: "+email+"</h3><a href=\"signin_frontend.jsp\">Login to Start Shopping</a>";
			}
			else{
				response="<h3>Error Storing Data!! <a href = \"signup_frontend.jsp\">Please try again!</a></h3>";
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 response="<h3>Error!! <a href = \"signup_frontend.jsp\">Please try again!</a></h3>";
		}
		
		return response;
		
		
	}
	
}
%>
<div class="container">
<%

		String name=request.getParameter("Name");
		String email=request.getParameter("Email");
		String mob=request.getParameter("Mob");
		String pass=request.getParameter("password");
		RegisterDBC DBC= new RegisterDBC();
		String result=DBC.insert(name,email,mob,pass); 
		//response.getWriter().println(result);
 %>
 <p> <%=result%></p>
</div>
<div class="footer">
  <a href="#" class="fa fa-facebook"></a>
<a href="#" class="fa fa-twitter"></a>
<a href="#" class="fa fa-instagram"></a>
<a href="#" class="fa fa-linkedin"></a>
<br>
<br>
<p> &#169; 2021 All rights Reserved. MUKUL. MOHAN. </p>
    

</div>

 </body>
 </html>