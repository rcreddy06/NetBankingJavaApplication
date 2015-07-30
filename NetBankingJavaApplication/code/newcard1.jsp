<%@ page import="java.io.*,java.sql.*" session="true"%>
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
	Connection conn=null,conn1=null;
	PreparedStatement ps,ps1,ps2;
	String creditnum=request.getParameter("cardnum");
	String issuedate=request.getParameter("issdate");
	String expdate=(String)session.getAttribute("exdate");
	String acctnum=(String)session.getAttribute("actnum");
	System.out.println("cr"+creditnum);
	System.out.println("dt"+issuedate);
	System.out.println("ex"+expdate);
	System.out.println("acc"+acctnum);
	int i=0;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","netbank","netbank"); 
		conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","netbank","netbank"); 
		ps1=conn1.prepareStatement("update credit_cards set credit_card_no=? where account_no=? ");
		ps2=conn1.prepareStatement("update card_transactions set credit_card_no=? ");
		ps1.setString(1,creditnum);
		ps1.setString(2,acctnum);
		int n=ps1.executeUpdate();
		ps2.setString(1,creditnum);
		int n1=ps2.executeUpdate();
		if(n>0 && n1>0) 
			out.println("updated");
	     else
			out.println("not updated");
		conn.close();
	} catch(Exception e)
 {	 out.println(e); } %>