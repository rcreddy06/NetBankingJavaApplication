<html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
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

<%
    String accno=request.getParameter("account");
	accno=accno.toUpperCase();
    try { 
		  PreparedStatement ps=con.prepareStatement("select * from customers where account_no=?");
		  ps.setString(1,accno);

		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
	  %>
		 <BODY bgcolor="pink">
	<form action="Update_Final.jsp" method="post">
	<table align ="left">
	<tr><td>Customer_Code</td><td><input type="text" name="customercode" value="<%=rs.getString(1)%>" maxlength=7 readonly></td></tr>
	     <tr><td>Application_No</td><td><input type="text" name="applnum" value="<%=rs.getInt(2)%>" maxlength=1 onkeypress="return blockkey(this)"></td></tr>
           <tr><td>Account_No</td><td><input type="text" name="accnum" value="<%=rs.getString(3)%>" maxlength=8 readonly></td></tr>
		<tr><td>Second_Account_No</td><td><input type="text" name="secondappno" value="<%=rs.getString(4)%>" maxlength=8>(optional)</td></tr>



		<tr><td>Cust_FirstName</td><td><input type="text" name="ftname" value="<%=rs.getString(5)%>"></td></tr>
		<tr><td>Cust_MiddleName</td><td><input type="text" name="midname" value="<%=rs.getString(6)%>"></td></tr>
		<tr><td>Cust_LastName</td><td><input type="text" name="lstname" value="<%=rs.getString(7)%>"></td></tr>
		<tr><td>Address:</td><td></td></tr>
           
            <tr><td>House_No</td><td><input type="text" name="houseno" value="<%=rs.getString(8)%>"></td></tr>
             <tr><td>Street1</td><td><input type="text" name="street1" value="<%=rs.getString(9)%>"></td></tr>
		<tr><td>Street2</td><td><input type="text" name="street2" value="<%=rs.getString(10)%>"></td></tr>
            <tr><td>Area</td><td><input type="text" name="area" value="<%=rs.getString(11)%>"></td></tr>
            <tr><td>City</td><td><input type="text" name="city" value="<%=rs.getString(12)%>"></td></tr>
            <tr><td>Pin_No</td><td><input type="text" name="pin" value="<%=rs.getString(13)%>" maxlength=6></td></tr>
            <tr><td>StateCode</td><td><input type="text" name="statecd" value="<%=rs.getString(14)%>" maxlength=2></td></tr>
            <tr><td>Res_Phone</td><td><input type="text" name="resphn" value="<%=rs.getString(15)%>" ></td></tr>
            <tr><td>Cell_Phone</td><td><input type="text" name="cellphn" value="<%=rs.getString(16)%>"></td></tr>
            <tr><td>E-Mail</td><td><input type="email" name="email" value="<%=rs.getString(17)%>"></td></tr>
            <tr><td>No Years Residing with in the Address</td><td><input type="text" name="noyersadds" value="<%=rs.getInt(18)%>" maxlength=2 onkeypress="return blockkey(this)"></td></tr>
		<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
		<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>

         <tr><td align="left"><input type="submit" name="update" value="Update"></td></tr>
</table>
            

<table align="right">
  	      <tr><td>Profession</td><td><input type="text" name="profession" value="<%=rs.getString(19)%>"></td></tr>
		<tr><td>Organization</td><td><input type="text" name="orgni" value="<%=rs.getString(20)%>"></td></tr>
            <tr><td>Working_Since</td><td><input type="text" name="worksin" value="<%=rs.getString(21)%>"></td></tr>
		<tr><td>Designation</td><td><input type="text" name="designation" value="<%=rs.getString(22)%>"></td></tr>
		
		<tr><td>OFF_Door_No</td><td><input type="text" name="offdoorno" value="<%=rs.getString(23)%>"></td></tr>
		<tr><td>OFF_Street</td><td><input type="text" name="offstreet" value="<%=rs.getString(24)%>"></td></tr>
		<tr><td>OFF_Area</td><td><input type="text" name="offarea" value="<%=rs.getString(25)%>"></td></tr>
		<tr><td>OFF_City</td><td><input type="text" name="offcity" value="<%=rs.getString(26)%>"></td></tr>
		<tr><td>OFF_Pin</td><td><input type="text" name="offpin" value="<%=rs.getString(27)%>" maxlength=6></td></tr>
		<tr><td>OFF State Code </td><td><input type="text" name="offstatecd" value="<%=rs.getString(28)%>" maxlength=2></td></tr>
		<tr><td>OFF_Phone_No</td><td><input type="text" name="offphone" value="<%=rs.getString(29)%>" ></td></tr>
		<tr><td>Pan_Girn</td><td><input type="text" name="pangrin" value="<%=rs.getString(30)%>"></td></tr>
		<tr><td>Gender</td><td><input type="text" name="gender" value="<%=rs.getString(31)%>">
             </td></tr>

		<tr><td>Birth_Data</td><td><input type="text" name="datebirth" value="<%=rs.getString(32)%>">(dt-mon-yy)</td></tr>
		<tr><td>Mar_Status</td><td><input type="text" name="marstatus" value="<%=rs.getString(33)%>"></td></tr>		
		<tr><td>Relation Ship With The First Application</td><td><input type="text" name="relshipapp" value="<%=rs.getString(34)%>"></td></tr>

		<tr><td>EducationalQualification</td><td><input type="text" name="eduquali" value="<%=rs.getString(35)%>"></td></tr>
		<tr><td>MontlyIncome</td><td><input type="text" name="monthincome" value="<%=rs.getFloat(36)%>" maxlength=6 onkeypress="return blockkey(this)"></td></tr>
		
		<tr><td>GuardianName</td><td><input type="text" name="garname" value="<%=rs.getString(37)%>"></td></tr>
		<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
		
		</table><br><br>
		
            
	</form>
	
</BODY>
</HTML>
<%
		  }

         
	}catch(Exception e){out.println("error occurred");}

	%>