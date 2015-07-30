<%@ page import="java.sql.*,java.sql.Date"%>
<%@ include file="DBConnection.jsp" %>
<%  
	String taxpaycode=request.getParameter("taxpaycode").trim();
	String oriacctnum=request.getParameter("oriacctnum").trim().toUpperCase();
	String taxpid=request.getParameter("taxpid").trim();
	String taxpaydt=request.getParameter("taxpaydt").trim();
	String taxfrom=request.getParameter("taxfrom").trim();
	String taxto=request.getParameter("taxto").trim();
	int income = Integer.parseInt(request.getParameter("income").trim());
	int taxamt = Integer.parseInt(request.getParameter("taxamt").trim());
	String taxauth= request.getParameter("taxauth").trim();
	PreparedStatement pst=null;
	Statement sst=null;
	ResultSet rs=null;
	try 
	{
		String cmd1="Select Balance_amt from Accounts where account_no='"+oriacctnum+"'";
		Statement st=con.createStatement();
		ResultSet rs1=st.executeQuery(cmd1);
		long a=0;
		if(rs1.next())
		{
			a=rs1.getInt(1);
			if(a-300>taxamt)
			{ 
				a-=taxamt;
				String cmd2="UPDATE ACCOUNTS SET BALANCE_AMT='"+a+"' where account_no='"+oriacctnum+"'";
				PreparedStatement pstup=con.prepareStatement(cmd2);
				pstup.executeUpdate();
				String cmd="INSERT INTO TAX_PAYMENTS VALUES(?,?,?,?,?,?,?,?,?)";
				pst=con.prepareStatement(cmd);
				pst.setString(1,taxpaycode);
				pst.setString(2,oriacctnum);
				pst.setString(3,taxpid);
				pst.setString(4,taxpaydt);
				pst.setString(5,taxfrom);
				pst.setString(6,taxto);
				pst.setInt(7,income);
				pst.setInt(8,taxamt);
				pst.setString(9,taxauth);
				pst.execute();
				out.println("<h5>Your Tax Payment is Accepted</h5>");
				out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
			}else 
				out.println("<h5>Your Tax Payment is Not Accepted Due to Your balance is Less</h5>");
				out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
		}
	} catch(Exception e)	{
		out.println("<br><h1>Error Occured</h1>");
	}
%>