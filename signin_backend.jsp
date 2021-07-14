<%@ page import ="java.sql.*" %>
<%@ page import ="com.mysql.cj.jdbc.Driver" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="javax.servlet.ServletException" %>
<%@ page import ="javax.servlet.annotation.WebServlet" %>
<%@ page import ="javax.servlet.http.HttpServlet" %>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%@ page import ="javax.servlet.http.HttpServletResponse" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ page import ="javax.servlet.*" %>



<!DOCTYPE html>
<html>
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
      <a class="navbar-brand" href="#">Login</a>
	  </div>
	  <ul class="nav navbar-nav navbar-right">
      <li><a href="signin_frontend.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
    </div>
</nav>

<%! public class LoginDBC {

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
	
	public String verify(String choice, String userid, String pass, HttpSession sess)
	{
		loadDriver();
		Connection con=getConnection();
		final String CustomerID;
		boolean resp = false; 
		String Query;
		if( choice.equals("Email") )
		{ Query="select * from covid_mart.customers where Email = ? and Password = ?"; }
		else 
		{ Query="select * from covid_mart.customers where CustID = ? and Password = ?"; }
		
		try {
			PreparedStatement ps=con.prepareStatement(Query);
			ps.setString(1, userid);
			ps.setString(2, pass);
			ResultSet res = ps.executeQuery();
			
			if(res.next()){
			CustomerID = res.getString("CustID");
			sess.setAttribute("CustomerID",CustomerID);
			   
			//sess.setAttribute("CustomerID", CustomerID);
			return "<h3>Login Successfull!</h3><br><h3><a href = \"shopping.jsp\"> Start Shopping!!</a></h3>";
		}
		else{
			return "<h3>Invalid  Credentials!! <br><br><a href = \"signin_frontend.jsp\">Please try again!</a></h3>";
		}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "<h3>Invalid  Credentials!! <br><br><a href = \"signin_frontend.jsp\">Please try again!</a></h3>";
		
		
		
	}
	
}
%>

<div class="container">
<%
		String choice=request.getParameter("choice");
		String userid=request.getParameter("Email");
		String pass=request.getParameter("password");
		HttpSession sess=request.getSession(); 
		//public static String CustomerID;
		LoginDBC DBC= new LoginDBC();
		String result=DBC.verify(choice, userid, pass, sess);
		//response.getWriter().println(result);
		
 %>
 <%=result%>
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