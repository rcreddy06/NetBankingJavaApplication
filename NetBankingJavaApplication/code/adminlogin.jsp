<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ include file="DBConnection.jsp" %>

<html>
<head><title>Admin Login Authentication</title></head>
<body background="background.jpg">
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=1,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:120px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top>Online Net Banking Solutions For Life Time</td></tr></table>
<hr color=#bb055E>
<% 
     String admin = request.getParameter("adminuser").trim();
     String pass = request.getParameter("adminpass").trim();
	 try { 
			String cmd="Select * from admin where username='"+admin+"' and password='"+pass+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(cmd);
			if(rs.next())
			{
			%>
			<jsp:forward page="accounttype.html" />
			 
			 <%
			 }
			else{
					out.println("<html><body><h2>Not Successful");
				out.println("<a href='adminlogin.htm'>Back to Login</a>");}
		   st.close();
           con.close();
         } catch (Exception e) {out.println("error"+e);}  
%>