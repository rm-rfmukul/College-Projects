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
	table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  text-align:center;
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
	
	public String count(String CustomerID, String[] items, HttpSession sess)
	{
		loadDriver();
		String response="Failed!!";
		Connection con=getConnection();
		String Query1 = "insert into covid_mart.order_summary (CustID, Date) values(?,?)";
		String Query2 = "select * from covid_mart.order_summary where Date = ?";
		String Query3 = "insert into covid_mart.order_details values(?,?,?)";
		String Query4 = "select covid_mart.items.Name, covid_mart.order_details.Quantity, covid_mart.items.Price*covid_mart.order_details.Quantity as Price from covid_mart.items, covid_mart.order_details where covid_mart.order_details.idOrders = ? and covid_mart.items.idItems = covid_mart.order_details.idItems";
		String Query5 = "select SUM(covid_mart.items.Price*covid_mart.order_details.Quantity) as Total from covid_mart.items, covid_mart.order_details where covid_mart.order_details.idOrders = ? and covid_mart.items.idItems = covid_mart.order_details.idItems";
		Date date = Calendar.getInstance().getTime();  
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		String current_date = dateFormat.format(date);
		try {
			PreparedStatement ps1=con.prepareStatement(Query1);
			ps1.setString(1, CustomerID);
			ps1.setString(2, current_date);
			ps1.executeUpdate();
			PreparedStatement ps2=con.prepareStatement(Query2);
			ps2.setString(1, current_date);
			ResultSet res = ps2.executeQuery();
			
			if(res.next()){
				String orderID = res.getString("OrderID");
				sess.setAttribute("OrderID",orderID);
				PreparedStatement ps3=con.prepareStatement(Query3);
				String itemID;
				for(int i=0;i<9;i++){
					if(Integer.parseInt(items[i])!=0){
						System.out.println(i);
						itemID = ""+(i+1);
						ps3.setString(1, orderID);
						ps3.setString(2, itemID);
						ps3.setString(3, items[i]);
						ps3.executeUpdate();
					}
				}
				PreparedStatement ps4=con.prepareStatement(Query4);
				ps4.setString(1, orderID);
				ResultSet res1 = ps4.executeQuery();
				response = "<tr><th>Item</th><th>Quantity</th><th>Price</th></tr>";
				while(res1.next()){
					response+="<tr><td>"+res1.getString("Name")+"</td><td>"+res1.getString("Quantity")+"</td><td>"+res1.getString("Price")+"</td></tr>";
				}
				PreparedStatement ps5=con.prepareStatement(Query5);
				ps5.setString(1, orderID);
				ResultSet res2 = ps5.executeQuery();
				if(res2.next()){
					String total=res2.getString("Total");
					sess.setAttribute("total_price",total);
					response+="<tr><td>Total</td><td></td><td>"+total+"</td></tr>";
				}
			}
			else{
				response="Failed";
			}		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return response;
		
	}
	
}
%>


<%
		HttpSession sess = request.getSession(false);
		String CustomerID = (String)sess.getAttribute("CustomerID");
		String[] items = new String[9];
		String count;
		for(int i=0;i<9;i++)
		{
			count=""+(i+1);
			items[i] = request.getParameter(count);
		}
		ToCart DBC= new ToCart();
		String result=DBC.count(CustomerID, items, sess);
		
		
 %>

<div class="container">
	<h3>Order Summary</h3>
	<table width=70%><%=result%></table>
	 	<br><br>
	  <form id="form" name="form" method="post" action="Placed.jsp">
	    Deliver To:	&emsp;
	    
		<br><br>
	
	<div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="Name" type="text" class="form-control" name="name" placeholder="Name" required>
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
      <input id="PhoneNo" type="text" class="form-control" name="phone" placeholder="PhoneNo" required>
    </div>
    <br>
	 <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
      <input id="Address" type="text" class="form-control" name="address" placeholder="Address" required >
    </div>
    <br>
	
		Payment mode on Delivery: 
	    <span style="float:center"><select id="payment" name="payment">
		
    <option value="Cash">Cash</option>
	<option value="Upi">Upi</option>
    <option value="Card">Card</option>
   
  </select></span> <br>
    <br>
<button type="submit" class="btn btn-primary btn-lg btn-block"> Place Order</button>
  </form>

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