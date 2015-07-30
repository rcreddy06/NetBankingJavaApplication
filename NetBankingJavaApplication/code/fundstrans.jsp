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
<legend align=center><font face=tahoma>Funds Transfer</legend><BR>
<table style="border:1px solid gray" align="center" id=register width=500 cellspacing=0 cellpadding=2><form action="./trans_funds.jsp" method=post onsubmit="return validate(this)">
<TR>

<%
	String ftr="ft";
	String ftranscode=null;
	String todb=null;
	PreparedStatement pst=null;
	Statement sst=null;
	ResultSet rs=null;
	try {
		String cmd1="SELECT MAX(TRANS_CODE_GEN) from AUTO";
		sst=con.createStatement();
		ResultSet rs1=sst.executeQuery(cmd1);
		int val=0;
		if(rs1.next()){
			val=rs1.getInt(1);
			if (val>0){ val+=1;}
			else{val=1;}
		}
		ftranscode=ftr+val;
		String cmd="INSERT INTO AUTO(trans_code_gen) VALUES(?)";
		pst=con.prepareStatement(cmd);
		pst.setInt(1,val);
		pst.execute();
%>
 <tr><td align=right>Funds Transfer Code</td><td> <input type="text" name="ftranscode" value=<%=ftranscode%>> </td></tr>
     <tr><td align=right>Origin Account No</td><td> <input type="text" name="oriacctnum" value="" /> </td></tr>
	 <tr><td align=right>Destination Account No</td><td> <input type="text" name="desacctnum" value="" /> </td></tr>
	 <tr><td align=right>Destination Bank</td><td> <input type="text" name="desbank" value="" /> </td></tr>
     <tr><td align=right>Destination Branch</td><td> <input type="text" name="desbranch" value="" /> </td></tr>
	 <tr><td align=right>Transfer Amount</td><td> <input type="text" name="transamt" value="" /> </td></tr>  
	
	 <TR><TD align=right>Frequency</TD><TD colspan=3><select name=freq >

		<option value="o" >One Time</option>
		<option value="q" >Quarterly</option>
		<option value="h" >Half Yearly</option>
		<option value="y" >Yearly</option>
	</select></TD></tr>
	<tr><td align=right>Installments</td><td> <input type="text" name="instal" value="" onkeypress="return blockkey(this)"/> </td></tr>
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
		<tr><td align=right>Transfer Date</td><td> <input type="text" name=transdate value=<%=todb%>> 
	</td></tr>

</TD></TR>

<TR>
<TD colspan=3 align=center><BR><button TYPE="Submit" accesskey="S"><u>S</u>ave It</button>&nbsp;&nbsp;
<button TYPE="Reset" accesskey="R"><u>R</u>efresh</button></TD>
<tr>
</TABLE></center></form><script>setColor();</script>
</BODY>
</HTML>