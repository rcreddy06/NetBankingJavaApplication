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
	    
     String uname = request.getParameter("account");
     String pass = request.getParameter("upass");
     String repass = request.getParameter("repass");
     System.out.println(uname);
          System.out.println(pass);
	 if(pass.equalsIgnoreCase(repass)) {

    try 
	{ 
		int accno=-1;
		Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","orbit","orbit");
		PreparedStatement ps=con.prepareStatement("INSERT INTO USERS VALUES(?,?)");
		ps.setString(1,uname);
		ps.setString(2,pass);
		int n=ps.executeUpdate();
		if(n>0){ 
			out.println("User Successfully Registered");
			out.println("<a href='login.html'>Back to Login</a>");}
		ps.close();
        con.close();
	} catch (Exception e) {out.println("error"+e);}  
	}
%>