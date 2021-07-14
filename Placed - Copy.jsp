<%@ page import ="java.sql.*" %>
<%@ page import ="com.mysql.cj.jdbc.Driver" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="javax.servlet.ServletException" %>
<%@ page import ="javax.servlet.annotation.WebServlet" %>
<%@ page import ="javax.servlet.http.HttpServlet" %>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%@ page import ="javax.servlet.http.HttpServletResponse" %>
<%@ page import ="java.text.SimpleDateFormat" %> 
<%@ page import ="java.util.Date" %>  
<%@ page import ="java.util.Calendar" %>  


<!DOCTYPE html>
<html>
<head>

  <title>Orders</title>
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
	
	 	
  </style>
</head>

<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="shopping.jsp">Home</a>
	  
	  
    </div>
   
    <ul class="nav navbar-nav navbar-right">
      <li><a href="signin_frontend.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
    </ul>
  </div>
</nav>

<%! public class ToCart {

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
	
	public String count(String name, String phone, String address, String payment, String orderID, String total)
	{
		loadDriver();
		String response="<h3>Failed!!</h3>";
		Connection con=getConnection();
		String Query1 = "insert into covid_mart.delivery_details values(?,?,?,?,?,?)";

		try {
			PreparedStatement ps1=con.prepareStatement(Query1);
			ps1.setString(1,orderID);
			ps1.setString(2,phone );
			ps1.setString( 3,name);
			ps1.setString( 4,address);
			ps1.setString(5,total );
			ps1.setString( 6,payment);
			ps1.executeUpdate();
			
			response="<h3>Order Placed Successfully!!</h3><br><h4>OrderID: "+orderID+"<br>Name: "+name+"<br>Contact No.: "+phone+"<br>Total Amount Payable: "+total+"<br>Payment Mode Selected: "+payment+"</h4><br><br><a href=\"shopping.jsp\">Continue Shopping!!</a><br><br>";
			
				
			
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response += e;
		}
		
		return response;
		
	}
	
}
%>


<%
		HttpSession sess = request.getSession(false);
		String orderID = (String)sess.getAttribute("OrderID");
		String total = (String)sess.getAttribute("total_price");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String addr=request.getParameter("address");
		String pay_mode=request.getParameter("payment");
		
		ToCart DBC= new ToCart();
		String result=DBC.count(name,phone,addr,pay_mode,orderID,total);
		
		
 %>

<div class="container">
	<%=result%>
	
	 	
	 
</div>
<br> <br>
<footer >
  <a href="#" class="fa fa-facebook"></a>
<a href="#" class="fa fa-twitter"></a>
<a href="#" class="fa fa-instagram"></a>
<a href="#" class="fa fa-linkedin"></a>
<br>
<br>
<p> &#169; 2021 All rights Reserved. MUKUL. MOHAN. </p>
    

</footer>

    

</div>
 </body>
 </html>