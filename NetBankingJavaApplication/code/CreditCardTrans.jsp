<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ include file="DBConnection.jsp" %>

<html>
<head><title>Bill Payments</title></head>
<body background="pink">
<hr color=#bb055E>

<% 
     
     String cardnum =  request.getParameter("cardnum").trim();
     String description = request.getParameter("description").trim();
     float creditmat = Float.parseFloat(request.getParameter("creditmat").trim());
     String creditdate=request.getParameter("creditdate").trim();
	 //float billfrom=Float.parseFloat(request.getParameter("maxamt"));
	 String payto=request.getParameter("payto").trim();

	 System.out.println(cardnum);
	
  try { 
		  PreparedStatement ps=con.prepareStatement("insert into card_transactions values(?,?,?,?,?)");
		  ps.setString(1,cardnum);
		  ps.setString(2,description);
		  ps.setFloat(3,creditmat);
		  ps.setString(4,creditdate);
		  ps.setString(5,payto);

		  int n=ps.executeUpdate();
		  
		  if(n>0)
	      {
			  //Connection con1=DriverManager.getConnection("jdbc:odbc:netbanking","sa","");
			  PreparedStatement ps1=con.prepareStatement("select max_amt from credit_cards where credit_card_no= ?");
			  ps1.setString(1,cardnum);
			  ResultSet rs=ps1.executeQuery();
			  float camt=-1;
			  if(rs.next())
				  camt=rs.getFloat(1);

			  camt=camt-creditmat;
			   
			   PreparedStatement ps2=con.prepareStatement("update credit_cards      set max_amt=? where credit_card_no=?");
			   ps2.setFloat(1,camt);
			   ps2.setString(2,cardnum);
			   ps2.executeUpdate();

				out.println("<html><body bgcolor=pink><h2>Credit Transaction Successful</h2>");  
		  %><a href="home.htm">Back to Home Page </a>
		  <%
		  }else
				out.println("<html><body bgcolor=pink><h2>Not Successful");
	
		   ps.close();
           con.close();
         } catch (Exception e) {
			 out.println("Error occured Due to the insertion os date"+e);
			 //out.println("<a href='accountdetails.html'>Back to Account</a>");
			 }  
	
	 
		 
		 %>
