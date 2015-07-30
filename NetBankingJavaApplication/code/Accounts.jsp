<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" session="true"%>
<%@ include file="DBConnection.jsp" %>
<html>
<head><title>Account Information</title></head>
<body background="pink">
<hr color=#bb055E>
<% 
	String accno =  request.getParameter("acctnum").trim(); 
	String acccat = request.getParameter("acctcategory").trim();
	String opermode = request.getParameter("opermode").trim();
	String opendate=request.getParameter("opendate").trim();
	float balamt=Float.parseFloat(request.getParameter("balanceamt"));
	String introname=request.getParameter("introdname").trim();
	String introacno=request.getParameter("introacno").trim();
	String bran=request.getParameter("branch").trim();
	int  knowapp=Integer.parseInt(request.getParameter("knownApplicants"));
	try 
	{ 
//           int accno=-1;
		PreparedStatement ps=con.prepareStatement("insert into accounts values(?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,accno);
		ps.setString(2,acccat);
		ps.setString(3,opermode);
		ps.setString(4,opendate);
		ps.setFloat(5,balamt);
		ps.setString(6,introname);
		ps.setString(7,introacno);
		ps.setString(8,bran);
		ps.setInt(9,knowapp);
		ps.setString(10,"SB");
        int n=ps.executeUpdate();
		if(n>0)
		{
			session.setAttribute("account",accno);
			%>
			<jsp:forward page="customers_reg.jsp" />
			<%
		}else
			out.println("<html><body bgcolor=pink><h2>Not Successful");
		ps.close();
        con.close();
	} catch (Exception e) {
		out.println("Error occured Due to the insertion os date"+e);
	}  
%>