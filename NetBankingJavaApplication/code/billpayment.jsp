<html>

<%@ page import="java.sql.*,java.util.*,java.text.*,java.lang.*"%>
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
<legend align=center><font face=tahoma>Bill Payments</legend><BR>
<table style="border:1px solid gray" align="center" id=register width=450 cellspacing=0 cellpadding=2>
<form action="billpmt.jsp" method=post onsubmit="return validate(this)">
<TR>
<%
	String bpcode="bp";
	String billpaycode=null;
	String todb=null;
	PreparedStatement pst=null;
	Statement sst=null;
	ResultSet rs=null;
	try {
		String cmd1="SELECT MAX(bill_pay_code_maxno) from bill_pay_code_maxno";
		sst=con.createStatement();
		ResultSet rs1=sst.executeQuery(cmd1);
		int val=0;
		if(rs1.next()){
			val=rs1.getInt(1);
			if (val>0){ val+=1;}
			else{val=1;}
		}
		billpaycode=bpcode+val;
		String cmd="INSERT INTO bill_pay_code_maxno(bill_pay_code_maxno) VALUES(?)";
		pst=con.prepareStatement(cmd);
		pst.setInt(1,val);
		pst.execute();
%>
<tr><td align=right>Bill Pay Code</td><td> <input type="text" name="billpaycode" readonly value=<%=billpaycode%>> </td></tr>

<TR>
	<TD align=right>ACCOUNT No.</TD>
	<TD><INPUT TYPE="text" NAME="account_no"></TD>
</TR>
<TR>
	<TD align=right>BILL No.</TD>
	<TD><INPUT TYPE="text" NAME="bill_no"></TD>
</TR>

<%		
		java.util.Date td=new java.util.Date();
		String temp=td.toString();
		StringTokenizer st=new StringTokenizer(temp," ");
		Vector vec=new Vector();
		while(st.hasMoreTokens()) vec.addElement(st.nextToken());
		for(int i=0;i<vec.size();i++) 
			vec.elementAt(i);	
			todb=vec.elementAt(2)+"-"+vec.elementAt(1)+"-"+vec.elementAt(vec.size()-1);
	}catch(Exception e){	out.println("Error Occured"+e);	}
%>
<TR>
	<TD align=right>BILL DATE</TD>
	<TD><INPUT TYPE="text" NAME="bill_date" value=<%=todb%> readonly>*dd/mm/yyyy</TD>
</TR>
<TR>
	<TD align=right>BILL FROM</TD>
	<TD><INPUT TYPE="text" NAME="bill_from">*dd/mm/yyyy</TD>
</TR>
<TR>
	<TD align=right>BILL TO</TD>
	<TD><INPUT TYPE="text" NAME="bill_to">*dd/mm/yyyy</TD>
</TR>
<TR>
	<TD align=right>PAYEE</TD>
	<TD><INPUT TYPE="text" NAME="payee"></TD>
</TR>
<TR>
	<TD align=right>BILL AMOUNT</TD>
	<TD><INPUT TYPE="text" NAME="bill_amount"></TD>
</TR>
<TR>
	<TD align=right>BILL DESCRIPTION</TD>
	<TD><INPUT TYPE="text" NAME="bill_desc"></TD>
</TR>
<tr bgcolor=mistyrose><td colspan=2 align=center><button type="submit"><u>S</u>ubmit</button>&nbsp;&nbsp;<button type=reset><u>R</u>eset</button></td></tr>	            
</form></table><br><br><script>setColor();</script>
</BODY>
</HTML>
