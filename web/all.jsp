<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String brand = request.getParameter("brand");
String name  = request.getParameter("name");

out.println("<html>");
out.println("<head>");
out.println("<title>ALL PRODUCTS</title>");
out.println("<script>");

out.println("function search_name()"
+"{"
+"var name = document.getElementById('name').value;"        
+"window.location.replace('all.jsp?brand=0&name='+name);"
+"}");

out.println("function search_brand()"
+"{"
+"var name = document.getElementById('name').value;"        
+"window.location.replace('all.jsp?name=0&brand='+name);"
+"}");

out.println("</script>");
out.println("<link rel='stylesheet' type='text/css' href='mycss.css'>");
out.println("</head>");
out.println("<body>");
out.println("<div class='navbar'>"
+"<a href='home.jsp'>HOME</a>"
+"<a href='customer.jsp'>"
+"CUSTOMER</a>"

+"<a href='vehicle.jsp?opn=0&opi=0&opu=0&opd=0&ops=0'>"
+"VEHICLE</a>"
+"<a href='invoice.jsp?vno=0'>"
+"INVOICE</a>"
+"<a href='all.jsp?brand=0&name=0'>ALL PRODUCTS</a>"
+"<a href='contact.jsp?vno=0'>"
+"CONTACT</a>"
+"</div>");
out.println("<br><br><br>");
out.println("<table>");
out.println("<tr>"
        + "<td colspan='2' align='center'>SEARCH PRODUCT"
        + "<input type='text' id='name' name='name'></td>"
        + "<td colspan='2' align='center'>"
        + "<a href='#' onclick='search_brand()'>SEARCH BRAND</a></td>"
        + "<td colspan='2' align='center'>"
        + "<a href='#' onclick='search_name()'>SEARCH NAME</a></td></tr>");
String sql="";

if(brand.equals("0"))
{
 sql="select * from vehicle_details where v_name like '%"+name+"%'";   
}
else if(name.equals("0"))
{
 sql="select * from vehicle_details where v_manu like '%"+brand+"%'";
}
else
{
  sql="select * from vehicle_details";
}

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/showroom","root","");
Statement stmt=con.createStatement();

//sql="select * from vehicle_details where v_manu like '%"+brand+"%'";
//out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
out.println("<tr><th colspan='3'>"
           +"<img src='"+rs.getString(3)+".jpg' height='250' width='500'></th></tr>");
out.println("<tr><th>Vehicle No</th><th>Vehicle Model</th><th>Vehicle Name</th><th>Manufacturer</th>"
        + "<th>Engine Capacity</th><th>Wheel Type</th><th>Weight</th><th>BH Power</th><th>Brake Type</th>"
        + "<th>Fuel Capacity</th><th>Battery</th><th>Mileage</th><th>Color</th><th>Price</th>"
        + "<th>Free Services</th></tr>");

out.println("<tr><td>"+Integer.toString(rs.getInt(1))+"<td>"+rs.getString(2)+"</td>"
        + "<td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td>"
        + "<td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td>"
        + "<td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td>"
        + "<td>"+rs.getString(12)+"</td><td>"+rs.getString(13)+"</td><td>"+rs.getString(14)+"</td>"
        + "<td>"+Integer.toString(rs.getInt(15))+"</td></tr>");
}
}
catch(Exception e)
{ out.print(e);}

out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>