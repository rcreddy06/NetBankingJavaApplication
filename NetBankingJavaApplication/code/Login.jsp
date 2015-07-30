<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ include file="DBConnection.jsp" %>

<html>
<head><title> Login Authentication</title></head>
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
	    
     String acc = request.getParameter("account").trim();
     String pass = request.getParameter("upass").trim();
	 try { 
          String accno=" ";
		  PreparedStatement ps=con.prepareStatement("select username from users where password=?");
		  ps.setString(1,pass);
		  ResultSet rs=ps.executeQuery();
		  if(rs.next())
		  {
			  accno=rs.getString(1);
		  }
		  if(accno.equalsIgnoreCase(acc))
			  response.sendRedirect("home.htm");
		  else{
				out.println("<html><body><h2>Not Successful");
				out.println("<a href='login.html'>Back to Login</a>");}
		   ps.close();
           con.close();
         } catch (Exception e) {out.println("error"+e);}  
	 	 
		 %>
