<%@ page import="java.sql.*,java.text.*,java.util.*"%>
<%@ include file="DBConnection.jsp" %>
<%  
	String ftranscode=request.getParameter("ftranscode").trim();
	String oriacctnum=request.getParameter("oriacctnum").trim().toUpperCase();
	String desacctnum=request.getParameter("desacctnum").trim().toUpperCase();
	String desbank=request.getParameter("desbank").trim();
	String desbranch=request.getParameter("desbranch").trim();
	int transamt = Integer.parseInt(request.getParameter("transamt").trim());
	String freq= request.getParameter("freq").trim();
	int instal = Integer.parseInt(request.getParameter("instal").trim());
	String transdate=request.getParameter("transdate");

	PreparedStatement pst=null;
	Statement st=null;
	ResultSet rs=null;
	try {
		String cmd1="Select Balance_amt from Accounts where account_no='"+oriacctnum+"'";
		st=con.createStatement();
		ResultSet rs1=st.executeQuery(cmd1);
		long a=0,b=0;
		if(rs1.next()){
			a=rs1.getInt(1);
			if(a-300>transamt){ 
					a-=transamt;
					String cmd2="UPDATE ACCOUNTS SET BALANCE_AMT='"+a+"' where account_no='"+oriacctnum+"'";
					PreparedStatement pstup=con.prepareStatement(cmd2);
					pstup.executeUpdate();
					String cmd4="Select balance_amt from accounts where account_no='"+desacctnum+"'";
					Statement sst1=con.createStatement();//out.println(rs.next());
					ResultSet rs4=sst1.executeQuery(cmd4);
					if(rs4.next()){	b=rs4.getInt(1);
					b+=transamt;
					String cmd3="UPDATE ACCOUNTS SET BALANCE_AMT='"+b+"' where account_no='"+desacctnum+"'";
					PreparedStatement pstup1=con.prepareStatement(cmd3);
					pstup1.executeUpdate();}
					String cmd="INSERT INTO FUNDS_TRANSFERS VALUES(?,?,?,?,?,?,?,?,?)";
					pst=con.prepareStatement(cmd);
					pst.setString(1,ftranscode);
					pst.setString(2,oriacctnum);
					pst.setString(3,desacctnum);
					pst.setString(4,desbank);
					pst.setString(5,desbranch);
					pst.setFloat(6,transamt);
					pst.setString(7,freq);
					pst.setInt(8,instal);
					pst.setString(9,transdate);
					pst.execute();
					out.println("<h1>Funds Transfered</h1>");
					out.println("<h4><a href='fundstrans.jsp'>Want to do Another Transaction</a></h4>");
					out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
			}else{ out.println("Your Transaction amount is exceeding the limit");
				   out.println("<h4><a href='fundstrans.jsp'>Want to do Another Transaction</a></h4>");
				   out.println("<h4><a href='home.htm'>Back to Home Page</a></h4>");	}}
			else{out.println("Check your account no:");
				 out.println("<h4><a href='fundstrans.jsp'>Want to do Another Transaction</a></h4>");
				 out.println("<h4><a href='home.htm'>Back to Home Page</a></h4>");}
	} catch(Exception e)	{
			out.println("<br><h1>Error Occured</h1>"+e);}
%>