<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String cust_id    = request.getParameter("cust_id");
String fname     = request.getParameter("fname");
String mname      = request.getParameter("mname");
String lname      = request.getParameter("lname");
String address    = request.getParameter("address");
String phone      = request.getParameter("phone");
String adhaar_no  = request.getParameter("adhaar_no");
String dlicence   = request.getParameter("dlicence");
String pan_no     = request.getParameter("pan_no");
String email      = request.getParameter("email");
String gender     = request.getParameter("gender");

String opn = request.getParameter("opn");
String opi = request.getParameter("opi");
String opu = request.getParameter("opu");
String opd = request.getParameter("opd");
String ops = request.getParameter("ops");
String op="0";
String sql="";
        
try
{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/showroom","root","");
 Statement stmt=con.createStatement();

if(opn.equals("n"))
{
op="n";
sql="select max(cust_id)+1 from customer_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  cust_id=Integer.toString(rs.getInt(1));
}
response.sendRedirect("customer.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&cust_id="+cust_id+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into customer_details values("
        + ""+cust_id+",'"+fname+"','"+mname+"',"
        + "'"+lname+"','"+address+"','"+phone+"',"
        + "'"+adhaar_no+"','"+dlicence+"','"+pan_no+"',"
        + "'"+email+"','"+gender+"')";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Inserted')");
out.println("</script>");
out.println(" Record Inserted ");
}
else if(opu.equals("u"))
{
op="u";
sql="update customer_details set "
        + "fname='"+fname+"',mname='"+mname+"',lname='"+lname+"'"
        + ",address='"+address+"',phone='"+phone+"',adhaar_no='"+adhaar_no+"'"
        +",dlicence='"+dlicence+"',pan_no='"+pan_no+"',email='"+email+"'"
        +",gender='"+gender+"' where cust_id="+cust_id+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from customer_details where cust_id="+cust_id+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from customer_details where cust_id="+cust_id+"";
out.println(sql);

ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  cust_id    = Integer.toString(rs.getInt(1));
  fname      = rs.getString(2);
  mname      = rs.getString(3);
  lname      = rs.getString(4);
  address    = rs.getString(5);
  phone      = rs.getString(6);
  adhaar_no  = rs.getString(7);
  dlicence   = rs.getString(8);
  pan_no     = rs.getString(9);
  email      = rs.getString(10);
  gender     = rs.getString(11);
}
response.sendRedirect("customer.jsp?"
        + "opn=0&opi=0&opu=0&opd=0&ops=0"
        + "&cust_id="+cust_id+"&fname="+fname+"&mname="+mname+""
        + "&lname="+lname+"&address="+address+"&phone="+phone+""
        + "&adhaar_no="+adhaar_no+"&dlicence="+dlicence+"&pan_no="+pan_no+""
        + "&email="+email+"&gender="+gender+"");
}
else
{
  op="Invalid";
}
}
catch(Exception e)
{ out.print(e);}

out.println("<html>");
out.println("<head>");
out.println("<title>CUSTOMER</title>");
out.println("<script>");
out.println("function allset()"
+"{"
+"document.getElementById('cust_id').value    ='"+cust_id+"';"
+"document.getElementById('fname').value      ='"+fname+"';"
+"document.getElementById('mname').value      ='"+mname+"';"
+"document.getElementById('lname').value      ='"+lname+"';"
+"document.getElementById('address').value    ='"+address+"';"
+"document.getElementById('phone').value      ='"+phone+"';"
+"document.getElementById('adhaar_no').value  ='"+adhaar_no+"';"
+"document.getElementById('dlicence').value   ='"+dlicence+"';"
+"document.getElementById('pan_no').value     ='"+pan_no+"';"
+"document.getElementById('email').value      ='"+email+"';"
+"document.getElementById('gender').value     ='"+gender+"';"
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('customer.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&cust_id=0');"
+"}");

out.println("function insert_v()"
+"{"
+"cust_id   = document.getElementById('cust_id').value;"
+"fname     = document.getElementById('fname').value;"
+"mname     = document.getElementById('mname').value;"
+"lname     = document.getElementById('lname').value;"
+"address   = document.getElementById('address').value;"
+"phone     = document.getElementById('phone').value;"
+"adhaar_no = document.getElementById('adhaar_no').value;"
+"dlicence  = document.getElementById('dlicence').value;"
+"pan_no    = document.getElementById('pan_no').value;"
+"email     = document.getElementById('email').value;"
+"gender    = document.getElementById('gender').value;"
+"window.location.replace('customer.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0"
        + "&cust_id='+cust_id+'&fname='+fname+'&mname='+mname+'"
        + "&lname='+lname+'&address='+address+'&phone='+phone+'"
        + "&adhaar_no='+adhaar_no+'&dlicence='+dlicence+'&pan_no='+pan_no+'"
        + "&email='+email+'&gender='+gender);"
+"}");

out.println("function update_v()"
+"{"
+"cust_id   = document.getElementById('cust_id').value;"
+"fname     = document.getElementById('fname').value;"
+"mname     = document.getElementById('mname').value;"
+"lname     = document.getElementById('lname').value;"
+"address   = document.getElementById('address').value;"
+"phone     = document.getElementById('phone').value;"
+"adhaar_no = document.getElementById('adhaar_no').value;"
+"dlicence  = document.getElementById('dlicence').value;"
+"pan_no    = document.getElementById('pan_no').value;"
+"email     = document.getElementById('email').value;"
+"gender    = document.getElementById('gender').value;"
+"window.location.replace('customer.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0"
        + "&cust_id='+cust_id+'&fname='+fname+'&mname='+mname+'"
        + "&lname='+lname+'&address='+address+'&phone='+phone+'"
        + "&adhaar_no='+adhaar_no+'&dlicence='+dlicence+'&pan_no='+pan_no+'"
        + "&email='+email+'&gender='+gender);"
+"}");

out.println("function delete_v()"
+"{"
+"cust_id = document.getElementById('cust_id').value;"
+"window.location.replace('customer.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&cust_id='+cust_id);"
+"}");

out.println("function search_v()"
+"{"
+"cust_id = document.getElementById('cust_id').value;"        
+"window.location.replace('customer.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&cust_id='+cust_id);"
+"}");

out.println("</script>");
out.println("<link rel='stylesheet' type='text/css' href='mycss.css'>");
out.println("</head>");
out.println("<body onload='allset()'>");
out.println("<div class='navbar'>"
+"<a href='home.jsp'>HOME</a>"
+"<a href='customer.jsp'>"
+"CUSTOMER</a>"
+"<a href='vehicle.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&cust_id=0'>"
+"VEHICLE</a>"
+"<a href='invoice.jsp?vno=0'>"
+"INVOICE</a>"
+"<a href='all.jsp?brand=0'>ALL PRODUCTS</a>"
+"<a href='contact.jsp?vno=0'>"
+"CONTACT</a>"
+"</div>");
out.println("<br><br><br>");
out.println("<table align='center'>");
out.println("<tr><td>Customer ID</td><td><input type='text' id='cust_id' name='cust_id'></td></tr>");
out.println("<tr><td>First Name</td><td><input type='text' id='fname' name='fname'></td></tr>");
out.println("<tr><td>Middle Name</td><td><input type='text' id='mname' name='mname'></td></tr>");
out.println("<tr><td>Last Name</td><td><input type='text' id='lname' name='lname'></td></tr>");
out.println("<tr><td>Address</td><td><input type='text' id='address' name='address'></td></tr>");
out.println("<tr><td>Phone</td><td><input type='text' id='phone' name='phone'></td></tr>");
out.println("<tr><td>Adhaar No</td><td><input type='text' id='adhaar_no' name='adhaar_no'></td></tr>");
out.println("<tr><td>DLicence</td><td><input type='text' id='dlicence' name='dlicence'></td></tr>");
out.println("<tr><td>PAN No</td><td><input type='text' id='pan_no' name='pan_no'></td></tr>");
out.println("<tr><td>Email</td><td><input type='text' id='email' name='email'></td></tr>");
//out.println("<tr><td>Gender</td><td><input type='radio' id='gender' name='gender' value='MALE'>MALE</td></tr>");
//out.println("<tr><td></td><td><input type='radio' id='gender' name='gender' value='FEMALE'>FEMALE</td></tr>");
out.println("<tr><td>GENDER</td><td><select id='gender' name='gender'>");
out.println("<option value='MALE'>MALE</option>");
out.println("<option value='FEMALE'>FEMALE</option>");
out.println("<option value='OTHER'>OTHER</option>");
out.println("</select></td></tr>");

out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td><td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td><td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>