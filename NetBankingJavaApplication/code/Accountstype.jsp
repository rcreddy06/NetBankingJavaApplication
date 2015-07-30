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
    String acc =  request.getParameter("acctcode").trim();
    String acccat = request.getParameter("acctypedesc").trim();
    int opermode =Integer.parseInt(request.getParameter("miniamtdep").trim());
    float itrname=Float.parseFloat(request.getParameter("interestrate").trim());
	int intronum=Integer.parseInt(request.getParameter("minpermonths").trim());
	try 
	{ 
		PreparedStatement ps=con.prepareStatement("insert into account_types  values(?,?,?,?,?)");
		ps.setString(1,acc);
		ps.setString(2,acccat);
		ps.setInt(3,opermode);
		ps.setFloat(4,itrname);
		ps.setInt(5,intronum);
		int n=ps.executeUpdate();
		if(n>0)
			out.println("	<a href='javascript:self.close()'>Back to Home Page</a>");
				  		  //response.sendRedirect("customers_reg.jsp");	  }
		else 
			out.println("<h1>This account type is already existing. Try for another</h1><center><BR><a href=\"javascript:history.back()\">Back to Accounts </a></center>");
	} //catch(Exception e) { out.println("Error occured Due to the insertion date"+e);}
	 catch(SQLException e){	
		 out.println("<h1>Already this account type, is registered .Invalid Transaction</h1><center><BR><a href=\"javascript:history.back()\">Back to Accounts </a></center>");	}
%>