<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ include file="DBConnection.jsp" %>
<%  
	String accno=request.getParameter("accno").trim();
	String nomname=request.getParameter("nomname").trim();
	String nomaddr=request.getParameter("nomaddr").trim();
	int nomage = Integer.parseInt(request.getParameter("nomage").trim());
	String rel= request.getParameter("rel").trim();

	PreparedStatement pst=null;
	Statement sst=null;
	ResultSet rs=null;
	try {
		String cmd="INSERT INTO NOMINEE VALUES(?,?,?,?,?)";
		pst=con.prepareStatement(cmd);
	    pst.setString(1,accno);
		pst.setString(2,nomname);
		pst.setString(3,nomaddr);
		pst.setInt(4,nomage);
		pst.setString(5,rel);
		int n;
		n=pst.executeUpdate();
		if(n>0){	out.println("Nominee Entered");
				out.println("<h3><a href='home.htm'>Back to Home Page</a></h3>");
			} 
	}catch(Exception e)	{
			out.println("<br><h1>Error Occured</h1>"+e);}
%>