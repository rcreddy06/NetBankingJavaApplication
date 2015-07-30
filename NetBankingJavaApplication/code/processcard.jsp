<html>
<%@ page import="java.sql.*,java.util.*" session="true"%>
<%@ include file="DBConnection.jsp" %>
<body id=body>
<style>
body {font-family:arial}
</style>
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=2,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:50px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top align=center>Online Net Banking Solutions For Life Time</td></tr></table>

<%

	int n=0,ct,em;
	Statement stm,stm1,stm3;
	String s1,s2,v="";
	try
	{
		stm =con.createStatement();
		String s="select max(processcreditcard) from auto";
		ResultSet rs=stm.executeQuery(s);
		if(rs.next())
		{
			n=rs.getInt(1);
			n++;
			s1="insert into auto(processcreditcard) values("+n+")";
			stm1=con.createStatement();
			ct=stm1.executeUpdate(s1);
			if(ct<1)
				System.out.println("not updated");
				else
				System.out.println(" updated");
             }
			 else
			{
				n=100;
			}
			v="prn"+n;
%>
<fieldset>
<legend align=center><font face=tahoma>New Card Request</legend><BR>
<table width=50% align=center cellspacing=0 cellpadding=5 style="border:1px solid gray"><form action="newcard1.jsp" method="post" onsubmit="return validate(this)">
                <tr bgcolor=mistyrose><td align=right>New Credit Card No</td><td><input type="text" name="cardnum" value="<%=v%>" readonly /></td></tr>
	       <tr bgcolor=linen><td  align=right>Issue Date</td><td><input type="text" name="issdate" value="" /></td></tr>
		   <tr bgcolor=mistyrose><td colspan=2 align=center><button type="submit"><u>S</u>ubmit</button>&nbsp;&nbsp;<button type=reset><u>R</u>eset</button></td></tr>
</form></table></center><BR>
</fieldset>                
<%
		con.close();
	}catch(Exception e)
		{e.printStackTrace();}
%>