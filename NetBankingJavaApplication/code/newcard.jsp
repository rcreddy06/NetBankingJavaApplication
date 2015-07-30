<%@ page import="java.io.*,java.sql.*"%>
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
  Connection conn,conn1;
  PreparedStatement ps,ps1;
 //HttpSession session1=request.getSession(true);
 String lastdate=request.getParameter("lastdate");
 String acctnum=request.getParameter("acctnum").trim();
 
 session.setAttribute("actnum",acctnum);
 String i=null;
 String expdate;
  
 try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","netbank","netbank"); 
	conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","netbank","netbank"); 
	
	ps=conn.prepareStatement("select * from credit_cards where account_no=?");
	ps.setString(1,acctnum);
	ResultSet rs=ps.executeQuery();
    	
	if(rs.next())
	 {
      i=rs.getString("credit_card_no");
	  expdate=rs.getString("expiry_date");
	   session.setAttribute("exdate",expdate);

	   ps1=conn1.prepareStatement("update credit_cards set status='l' where account_no=? ");
         ps1.setString(1,acctnum) ;
        int x=ps1.executeUpdate();

     if(x<1)
		 System.out.println("not updated");
	else
       System.out.println(" updated");
	%>
	 <html>
	 <body>
	 <p style="text-align:center;color:maroon;font-family:tahoma">
	 Please click on the link u will view u r NewNumber & fill the required details<br>
	 <a href="processcard.jsp">Continue</a>
	 </p>
	 <%
	 conn.close();
	 conn1.close();
   }
   else{
	   %>
		 
	 <p style="text-align:center;color:maroon;font-family:tahoma">
	 Please check u r Account number<br>
	 <a href="newcard.html">Continue</a>
	 </p>
	 </body>  
	 </html> 
	 <%
 }
 }	 catch(Exception e)
 {
	 out.println(e);
 }
%>	 

	      