
<%@ page import="java.sql.*,java.util.*"%>
<%@ include file="DBConnection.jsp" %>
<%  
   String type=(String)session.getAttribute("account");
   //String type=request.getParameter("account").toLowerCase();
   String top="";
   String top1="";
 %>
<HTML>
<HEAD>
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
 
<fieldset><legend align=center>Register Form</legend><br>
<table id=register align ="center" width=200 cellspacing=0 cellpadding=2>


<form action='customers.jsp' method='post' onsubmit="return validate(this)">
<% 
	int custcode=10;
	try 
	{ 
		Statement st=con.createStatement();
		ResultSet rs=null;
		PreparedStatement pst=null;
		rs=st.executeQuery("select max(cust_code) from auto");
		System.out.println("afger select max from auto");
		if(rs.next()) 
		{
			custcode=rs.getInt(1);
			custcode+=1;
			pst=con.prepareStatement("insert into auto(cust_code) values(?)"); 
System.out.println("afger insert in to auto");
			pst.setInt(1,custcode);
			pst.execute();
		} 
		else 
			custcode=1000;
		top="cd"+custcode;
		top1=""+custcode;
	}catch(Exception e){	out.println("Error Occured" +e);	}
%>
<Tr><Td colspan=4 align=right><a href="nomine.jsp" style="font-size:15px">Nominee Details</a></td></tr>		
<tr><td align=right nowrap>Customer Code:</td><td>
<input type="text" name="customercode" value='<%=top%>' maxlength=7></td>
<td align=right nowrap>Profession</td><td>
<input type="text" name="profession"></td></tr>
<tr><td align=right nowrap>Applicant No</td>
<td><input type="text" name="applnum" maxlength=1 onkeypress="return blockkey(this)"></td>
<td align=right nowrap>Organization</td><td>
<input type="text" name="orgni"></td></tr>
<tr><td align=right nowrap>Account No</td>
<td><input type="text" name="accnum" value="<%=type%>" maxlength=8 readonly></td>
<td align=right nowrap>Working Since</td><td nowrap>
<input type="text" name="worksin">*dd-mmm-yy</td></tr>
<tr><td align=right nowrap>Second Account No</td><td>
<input type="text" name="secondappno" maxlength=8>(optional)</td>
<td align=right nowrap>Designation</td><td>
<input type="text" name="designation"></td></tr>
<tr><td align=right nowrap>Cust FirstName</td><td>
<input type="text" name="ftname"></td>
<td align=right nowrap>OFF Door_No</td><td>
<input type="text" name="offdoorno"></td></tr>
<tr><td align=right nowrap>Cust MiddleName</td><td>
<input type="text" name="midname"></td>
<td align=right nowrap>OFF Street</td><td>
<input type="text" name="offstreet"></td></tr>
<tr><td align=right nowrap>Cust LastName</td><td>
<input type="text" name="lstname"></td>
<td align=right nowrap>OFF Area</td><td>
<input type="text" name="offarea"></td></tr>
<tr><td align=right nowrap>House No</td><td>
<input type="text" name="houseno"></td>
<td align=right nowrap>OFF City</td><td>
<input type="text" name="offcity"></td></tr>
<tr><td align=right nowrap>Street1</td><td>
<input type="text" name="street1"></td>
<td align=right nowrap>OFF Pin</td><td>
<input type="text" name="offpin" maxlength=6></td></tr>
<tr><td align=right nowrap>Street2</td><td>
<input type="text" name="street2"></td>
<td align=right nowrap>OFF State Code </td><td>
<input type="text" name="offstatecd" maxlength=2></td></tr>
<tr><td align=right nowrap>Area</td><td>
<input type="text" name="area"></td>
<td align=right nowrap>OFF Phone_No</td><td>
<input type="text" name="offphone"></td></tr>
<tr><td align=right nowrap>City</td><td>
<input type="text" name="city"></td>
<td align=right nowrap>Pan Girn</td><td>
<input type="text" name="pangrin"></td></tr>
<tr><td align=right nowrap>Pin No</td><td>
<input type="text" name="pin" maxlength=6></td>
<td align=right nowrap>Gender</td><td>
<select name="gender"><option value="m">Male<option value="f">Female</select></td></tr>
<tr><td align=right nowrap>State Code</td><td>
<input type="text" name="statecd" maxlength=2></td>
<td align=right nowrap>Birth Date</td><td>
<input type="text" name="datebirth">*dd-mmm-yy</td></tr>
<tr><td align=right nowrap>Res Phone</td><td>
<input type="text" name="resphn"></td>
<td align=right nowrap>Marital Status</td><td>
<select name="marstatus"><option value="m">Married<option value="u">Unmarried</select></td></tr>
<tr><td align=right nowrap>Cell Phone</td><td>
<input type="text" name="cellphn"></td>
<td align=right nowrap>Relation Ship</td><td>
<input type="text" name="relshipapp"></td></tr>
<tr><td align=right nowrap>E-Mail</td><td>
<input type="email" name="email"></td>
<td align=right nowrap>Educational Qualification</td><td>
<input type="text" name="eduquali"></td></tr>
<tr><td align=right nowrap>No Years Residing At</td><td>
<input type="text" name="noyersadds" maxlength=2 onkeypress="return blockkey(this)"></td>
<td align=right nowrap>Montly Income</td><td>
<input type="text" name="monthincome" maxlength=6 onkeypress="return blockkey(this)"></td></tr>
<td align=right nowrap>GuardianName</td><td>
<input type="text" name="garname"></td>
<td align=center nowrap colspan=2>
<%
		System.out.println("before submit form");
%>
<input type="submit" value="mysubmit"/>&nbsp;&nbsp;
<button type="reset" accesskey="R"><u>R</u>eset</button></td><td>
 </td></form></table>
<script>setColor();</script>
</BODY></HTML>