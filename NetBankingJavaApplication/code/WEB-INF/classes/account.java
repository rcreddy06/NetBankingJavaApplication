import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class account extends HttpServlet
{
	Connection con=null;
	PreparedStatement ps;
	public Connection getConnection() throws ClassNotFoundException,SQLException	{
     Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","orbit","orbit");
	  return con;
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		 PrintWriter out=res.getWriter();
		 String accno=req.getParameter("quest").toUpperCase();
		try{
			con=getConnection();
			ps=con.prepareStatement("select * from accounts where account_no=?");
			ps.setString(1,accno);
			ResultSet rs=ps.executeQuery();
			String buf="<body bgcolor=#ABCDEF ><table width=500 align=center>";
            if(rs.next())
			{
              buf+="<TR bgcolor=linen><TD align=right>Credit Card Number:<Td>"+rs.getString(1)+"</td></tr>";
			  buf+="<Tr bgcolor=mistyrose><TD align=right>Opening Date:<Td>"+rs.getString(4).substring(0,10)+"</td></tr>";
			  buf+="<TR bgcolor=mistyrose><TD align=right>Balance:<Td>"+rs.getString(5)+"</td></tr>";
			  buf+="<Tr bgcolor=linen><TD align=right>Account Holder Name:<Td>"+rs.getString(6)+"</td></tr>";
			}
			else
				buf+="<td><H1>The Account Holder Does not Exits";
			 buf+="</table>";
			 out.println(buf);
		}catch(Exception e){out.println(e);}
    }
}