<%@ page import="java.sql.*,java.text.*,java.util.*"%>
<%@ include file="DBConnection.jsp" %>
<%  
	String cheqrocode=request.getParameter("cheqrocode").trim();
	String accno=request.getParameter("accno").trim();
	String reqdate=request.getParameter("reqdate").trim();
	PreparedStatement pst=null;
	Statement sst=null;
	ResultSet rs=null;
	try 
	{
		String cmd="INSERT INTO CHEQUE_REORDER VALUES(?,?,?)";
		pst=con.prepareStatement(cmd);
		pst.setString(1,cheqrocode);
		pst.setString(2,accno);
		pst.setString(3,reqdate);
		pst.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from cheque_reorder");
		out.println("<h3>Inserted</h3>");
		out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
	} catch(Exception e)	{
			out.println("Check it again");
			out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
	}
%>