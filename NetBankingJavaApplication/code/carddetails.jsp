<html>
<%@ page import="java.sql.*,java.util.*"%>
<%@ include file="DBConnection.jsp" %>
<body id=body>
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=2,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:50px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top align=center>Online Net Banking Solutions For Life Time</td></tr></table>
<fieldset>
<legend align=center><font face=tahoma>CardCard Issuing </legend><BR>
<% 
	int crcardno=0;
	String top="a";
	try 
	{ 
		Statement st=con.createStatement();
		ResultSet rs=null;
		PreparedStatement pst=null;
		rs=st.executeQuery("select max(credit_cardno) from auto");
		if(rs.next()) 
		{
			crcardno=rs.getInt(1);
			crcardno+=1;
			pst=con.prepareStatement("insert into auto(credit_cardno) values(?)"); 
			pst.setInt(1,crcardno);
			pst.execute();
		} 
		else 
			crcardno=100;
		top= "cre"+crcardno;
	} catch(Exception e) {out.println("<h1>"+e+"</h1>");}
%>
<table style="border:1px solid gray" align="center" id=register width=500 cellspacing=0 cellpadding=2>
<form action="CreditCardIssue.jsp" method="post" onsubmit="return validate(this)">
<tr><td align=right>CardNo</td><td>
<input type="text" name="cardnum" value="<%=top%>" maxlength=10 readonly /></td></tr>
<tr><td align=right>AccountNo</td><td><input type="text" name="accountno" value="" /></td></tr>
<tr><td align=right>IssueDate</td><td><input type="text" name="issuedate" value="" />*dd-mmm-yy</td></tr>
<tr><td align=right>ExpiryDate</td><td><input type="text" name="expirydate" value="" />*dd-mmm-yy</td></tr>
<tr><td align=right>MaximumAmount</td><td><input type="text" name="maxamt" value="" maxlength=6/></td></tr>
<tr><td align=right>Status</td><td><select name="status">
<option value="v">valid</option><option value="l">lost</option></td></tr>
<tr bgcolor=mistyrose><td colspan=2 align=center><button type="submit"><u>S</u>ubmit</button>&nbsp;&nbsp;
<button type=reset><u>R</u>eset</button></td></tr>
</form></table><br></fieldset><script>setColor()</script>
</body>
</html>