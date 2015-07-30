<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ include file="DBConnection.jsp" %>
<title>Credit Card Issue</title>
<body id=body>
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=2,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:50px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR>
<Td id=grad valign=top align=center>Online Net Banking Solutions For Life Time</td></tr></table>
<hr color=#bb055E>
<% 
	String billpcode =  request.getParameter("cardnum").trim();
	String accno = request.getParameter("accountno").trim();
	String billno = request.getParameter("issuedate").trim();
	String billdate=request.getParameter("expirydate").trim();
	float billfrom=Float.parseFloat(request.getParameter("maxamt"));
	String billto=request.getParameter("status").trim();
	try 
	{ 
		PreparedStatement ps=con.prepareStatement("insert into credit_cards values(?,?,?,?,?,?)");
		ps.setString(1,billpcode);
		ps.setString(2,accno);
		ps.setString(3,billno);
		ps.setString(4,billdate);
		ps.setFloat(5,billfrom);
		ps.setString(6,billto);
		int n=ps.executeUpdate();
		if(n>0)
	    {
			out.println("<html><body bgcolor=pink><h2>Credit Card Issued</h2>");  
%><a href='javascript:self.close()'>Back to Home Page</a>
<%
		}else
			out.println("<html><body bgcolor=pink><h2>Not Successful");
		ps.close();
        con.close();
	} catch (Exception e) {
		out.println("Error occured Due to the insertion os date"+e); }  
%>