<%@ page import="java.sql.*,java.util.*" session="true"%>
<%@ include file="DBConnection.jsp" %>
<% 
	int accno=0;
	String type1=(String)session.getAttribute("acctype");
	String top="";
	try
	{ 
		Statement st=con.createStatement();
		ResultSet rs=null;
		PreparedStatement pst=null;
		rs=st.executeQuery("select max(accno) from auto");
		if(rs.next()) 
		{
			accno=rs.getInt(1);
			accno+=1;
			System.out.println(accno);
			pst=con.prepareStatement("insert into auto(accno) values(?)");
			pst.setInt(1,accno);
			pst.execute();
		} 
		else 
			accno=1000;
		if(type1.equals("SB")) top="SB"+accno;
		else if(type1.equals("CA")) top="CA"+accno;
		else if(type1.equals("CC")) top="CC"+accno;
		else if(type1.equals("TD")) top="TD"+accno;
		else top="RD"+accno;
		System.out.println(top);
   } catch(Exception e) {out.println("<h1>"+e+"</h1>");}
%>
<html>
<head>
	<title>
      Account Details
	</title>
</head>

<body id=body>
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=1,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:120px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top>Online Net Banking Solutions For Life Time</td></tr></table>
<h1 align="center">Account Details </h1>

 <form action="Accounts.jsp">   
   <table align="center">
     <tr><td>Account No</td><td> <input type="text" name="acctnum" value='<%=top%>' readonly/> </td></tr>
     <tr><td>Account Category</td><td><select  name="acctcategory" >
		<option value="s">Single
		<option value="j">Joint
		<option value="c">Custodial
	</select></td></tr>
	<tr><td>Operation Mode</td><td><select  name="opermode" >
		<option value="s">Self
		<option value="f">Former/Survivor
		<option value="e">Either/Survivor
	</select></td></tr>
		 <tr><td>Open Date </td><td> <input type="text" name="opendate" value="" />*dd-mmm-yy</td></tr>
		 <tr><td>Balance Amount</td><td> <input type="text" name="balanceamt" value="" /></td></tr>
		 <tr><td>Introducer Name</td><td> <input type="text" name="introdname" value="" /> </td></tr>
		 <tr><td>Introducer Account No</td><td> <input type="text" name="introacno" value="" /> </td></tr>
		 <tr><td>Branch</td><td> <input type="text" name="branch" value="" /> </td></tr>
		 <tr><td>Known Applicants</td><td> <input type="text" name="knownApplicants" value="" maxlength=2 onkeypress="return blockkey(this)" /> </td></tr>
		 
	</table><br><br>
    <center>
     <input type="submit" name="submit" value="SUBMIT"/>
	 <input type="reset" name="reset" value="Cancel"/>
</center>
</form>
</body>
</html>