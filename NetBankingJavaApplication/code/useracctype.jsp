<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" session="true" %>
<%@ include file="DBConnection.jsp" %>
<html>
<head><title>Account Information</title></head>
<body background="pink">
<hr color=#bb055E>
<% 
    String acc =  request.getParameter("acctcode").trim();
    String acccat = request.getParameter("acctypedesc").trim();
    int opermode =Integer.parseInt(request.getParameter("miniamtdep").trim());
    float itrname=Float.parseFloat(request.getParameter("interestrate").trim());
	int intronum=Integer.parseInt(request.getParameter("minpermonths").trim());
	out.println(acc+"<BR>"+acccat+"<BR>"+opermode+"<BR>"+itrname+"<BR>"+intronum);
	try 
	{ 
		PreparedStatement ps=con.prepareStatement("insert into user_account_types  values(?,?,?,?,?)");
		ps.setString(1,acc);
		ps.setString(2,acccat);
		ps.setInt(3,opermode);
		ps.setFloat(4,itrname);
		ps.setInt(5,intronum);
		int n=ps.executeUpdate();
		if(n>0)
		{	
			session.setAttribute("acctype",acc);
			%>
			<jsp:forward page="accountdetails.jsp" />
    	  	<%	  
		}
		else 
			out.println("<h1>Invalid Transaction</h1><center><BR><a href=\"javascript:history.back()\">Back to Accounts </a></center>");
	} catch(Exception e) 
		 { out.println("Error occured Due to the insertion date"+e);}
%>