<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ include file="DBConnection.jsp" %>

<html>
<head><title>Update Final</title></head>
<body background="pink">
<hr color=#bb055E>
<% 
     String cuscode =  request.getParameter("customercode").trim();
     int  appnum =Integer.parseInt(request.getParameter("applnum").trim());
     String accnum = request.getParameter("accnum").trim();
	 String secondappno=request.getParameter("secondappno").trim();
	 String ftname=request.getParameter("ftname").trim();
	 String midname=request.getParameter("midname").trim();
     String lstname=request.getParameter("lstname").trim();
	 String houseno=request.getParameter("houseno").trim();
	 String street1=request.getParameter("street1").trim();
	 String street2=request.getParameter("street2").trim();
	 String area=request.getParameter("area").trim();
	 String city=request.getParameter("city").trim();
	 String pin=request.getParameter("pin").trim();
	 String statecd=request.getParameter("statecd").trim();
	 String resphn=request.getParameter("resphn").trim();
	 String cellphn=request.getParameter("cellphn").trim();
	 String email=request.getParameter("email").trim();
	 int  noyersadds=Integer.parseInt(request.getParameter("noyersadds").trim());
	 String profession=request.getParameter("profession").trim();
	 String orgni=request.getParameter("orgni").trim();
	 String worksin=request.getParameter("worksin").trim();
	 String designation=request.getParameter("designation").trim();
	 String offdoorno=request.getParameter("offdoorno").trim();
	 String offstreet=request.getParameter("offstreet").trim();
	 String offarea=request.getParameter("offarea").trim();
	 String offcity=request.getParameter("offcity").trim();
	 String offpin=request.getParameter("offpin").trim();
	 String offstatecd=request.getParameter("offstatecd").trim();
	 String offphone=request.getParameter("offphone").trim();
	 String pangrin=request.getParameter("pangrin").trim();
	 String gender=request.getParameter("gender").trim();
	 String datebirth=request.getParameter("datebirth").trim();
	 String marstatus=request.getParameter("marstatus").trim();
	 String relshipapp=request.getParameter("relshipapp").trim();
	 String eduquali=request.getParameter("eduquali").trim();
	 float monthincome=Float.parseFloat(request.getParameter("monthincome").trim());
	 String garname=request.getParameter("garname").trim();

   try { 
		  PreparedStatement ps=con.prepareStatement(
                 "update customers set  cust_code=?,applicant_no=?,account_no=?,account_no2=?,cust_fname=?,cust_mname=?,cust_lname=?,house_no=?,street1=?,street2=?,area=?,city=?,pin=?,state_cd=?,res_phone=?,cell_phone=?,email=?,no_years_address=?,profession=?,organization=?,working_since=?,designation=?,off_door_no=?,off_street=?,off_area=?,off_city=?,off_pin=?,off_state_cd=?,off_phone=?,pan_girn=?,gender=?,birth_date=?,mar_status=?,rel_first_app=?,education=?,monthly_income=?,guardian_name=? where account_no=?");
		  ps.setString(1,cuscode);
		  ps.setInt(2,appnum);
		  ps.setString(3,accnum);
		  ps.setString(4,secondappno);
		  ps.setString(5,ftname);
		  ps.setString(6,midname);
		  ps.setString(7,lstname);
		  ps.setString(8,houseno);
		  ps.setString(9,street1);
		  ps.setString(10,street2);
          ps.setString(11,area);
		  ps.setString(12,city);
		  ps.setString(13,pin);
		  ps.setString(14,statecd);
		  ps.setString(15,resphn);
		  ps.setString(16,cellphn);
		  ps.setString(17,email);
		  ps.setInt(18,noyersadds);
		  ps.setString(19,profession);
		  ps.setString(20,orgni); 
          ps.setString(21,worksin);
		  ps.setString(22,designation);
		  ps.setString(23,offdoorno);
		  ps.setString(24,offstreet);
		  ps.setString(25,offarea);
		  ps.setString(26,offcity);
		  ps.setString(27,offpin);
          ps.setString(28,offstatecd);
		  ps.setString(29,offphone);
          ps.setString(30,pangrin); 
          ps.setString(31,gender); 
          ps.setString(32,datebirth);
		  ps.setString(33,marstatus);
	      ps.setString(34,relshipapp);
	      ps.setString(35,eduquali);
          ps.setFloat(36,monthincome);
	      ps.setString(37,garname);
		    ps.setString(38,accnum);

          int n=ps.executeUpdate();
		  if(n>0) {
          out.println("<html><body bgcolor=pink><h2>Updated Successfully"); 
		  %><a href="home.htm">Back to Home Page </a>
		  <%
		  }else
				out.println("<html><body bgcolor=pink><h2>Not Successful");
	
		   ps.close();
           con.close();
         } catch (Exception e) {
			 out.println("Check your Date Format which should be in dd-mmm-yy format");
			 out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
			 }
	 %>
