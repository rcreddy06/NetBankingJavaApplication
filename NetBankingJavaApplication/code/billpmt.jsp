<%@ page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="DBConnection.jsp" %>
<% 
	String bill_pay_code=request.getParameter("billpaycode").trim();
	String account_no=request.getParameter("account_no").trim().toUpperCase();
	String bill_no=request.getParameter("bill_no");
	String bill_date=request.getParameter("bill_date");
	String bill_from=request.getParameter("bill_from");
	String bill_to=request.getParameter("bill_to");
//	java.sql.Date   bill_date=new java.sql.Date( new java.util.Date(request.getParameter("bill_date")).getTime());
//	java.sql.Date   bill_from= new java.sql.Date( new java.util.Date(request.getParameter("bill_from")).getTime());;
//	java.sql.Date   bill_to = new java.sql.Date( new java.util.Date(request.getParameter("bill_to")).getTime());;
	String payee=request.getParameter("payee");
	float bill_amount=Float.parseFloat(request.getParameter("bill_amount"));
	String bill_desc=request.getParameter("bill_desc");
	
	PreparedStatement pst=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		String cmd1="Select Balance_amt from Accounts where account_no='"+account_no+"'";
			st=con.createStatement();
			ResultSet rs1=st.executeQuery(cmd1);
			long a=0,b=0;
			if(rs1.next()){
				a=rs1.getInt(1);
				if(a-300>bill_amount){ 
						a-=bill_amount;
						String cmd2="UPDATE ACCOUNTS SET BALANCE_AMT='"+a+"' where account_no='"+account_no+"'";
						PreparedStatement pstup=con.prepareStatement(cmd2);
						pstup.executeUpdate();
						String cmd="INSERT INTO BILL_PAYMENTS VALUES(?,?,?,?,?,?,?,?,?)";
						pst=con.prepareStatement(cmd);
						pst.setString(1,bill_pay_code);
						pst.setString(2,account_no);
						pst.setString(3,bill_no);
						pst.setString(4,bill_date);
						pst.setString(5,bill_from);
						pst.setString(6,bill_to);
						pst.setString(7,payee);
						pst.setFloat(8,bill_amount);
						pst.setString(9,bill_desc);
						pst.execute();
						out.println("<h1>Bill Payment Accepted</h1>");
						out.println("<h4><a href='billpayment.jsp'>Want to pay Another Payment?</a></h4>");
						out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
				}else{	out.println("Your Balance amount is less to pay your bill");
						out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");}
			}else{	out.println("Check your account no:");
					out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");	}
						//String comm="insert into bill_payments(bill_pay_code,account_no,bill_no,bill_date,bill_from,bill_to,payee,bill_amount,bill_desc) values(?,?,?,?,?,?,?,?,?)";
	}catch(Exception e){ out.println(e);}

%>
	