<html>
<head>
<%@ page session="true"%>
<%
	String acc=(String) session.getAttribute("account");
	session.invalidate();
%>

<body id=body>
<TITLE> SavingsAccount </TITLE>
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=2,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:60px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top align=center>Online Net Banking Solutions For Life Time</td></tr></table>
</head>
<h1 align="center">Nominee Details</h1><br><br>

<body>
<form action="nominee.jsp">
    <table align="center">
	     <tr><td>Account No</td><td><input type="text" name="accno" value='<%=acc%>' readonly/></td></tr>
	 	 <tr><td>Nominee Name</td><td><input type="text"  name="nomname" value="" /></td></tr>
		 <tr><td>Nominee Address</td><td><input type="text"  name="nomaddr" value="" /></td></tr>
         <tr><td>Nominee Age</td><td><input type="text" name="nomage" value="" /></td></tr>
         <tr><td>Relationship</td><td><input type="text"  name="rel" value="" /></td></tr>
	</table><br><br>
<center><input type="submit" name="submit" value="Submit" />
<input type="reset" name="reset" value="Cancel" /></center>
</form>
</body>
</html>
