<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String vehicle_no = request.getParameter("vehicle_no");
String v_model    = request.getParameter("v_model");
String v_name     = request.getParameter("v_name");
String v_manu     = request.getParameter("v_manu");
String engine_cap = request.getParameter("engine_cap");
String wheel_type = request.getParameter("wheel_type");
String weight     = request.getParameter("weight");
String bhpower    = request.getParameter("bhpower");
String brake_type = request.getParameter("brake_type");
String fuel_cap   = request.getParameter("fuel_cap");
String battery    = request.getParameter("battery");
String mileage    = request.getParameter("mileage");
String colors     = request.getParameter("colors");
String price      = request.getParameter("price");
String free_serv  = request.getParameter("free_serv");

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
sql="select max(vehicle_no)+1 from vehicle_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  vehicle_no=Integer.toString(rs.getInt(1));
}
response.sendRedirect("vehicle.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&vehicle_no="+vehicle_no+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into vehicle_details values("
        + ""+vehicle_no+",'"+v_model+"','"+v_name+"',"
        + "'"+v_manu+"','"+engine_cap+"','"+wheel_type+"',"
        + "'"+weight+"','"+bhpower+"','"+brake_type+"',"
        + "'"+fuel_cap+"','"+battery+"','"+mileage+"',"
        + "'"+colors+"','"+price+"',"+free_serv+")";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Inserted')");
out.println("</script>");
out.println(" Record Inserted ");
}
else if(opu.equals("u"))
{
op="u";
/*sql="update vehicle_details set v_model='"+v_model+"',v_name='"+v_name+"',v_manu='"+v_manu+"'"
   +",engine_cap='"+engine_cap+"',wheel_type='"+wheel_type+"',weight='"+weight+"'"
   +",bhpower='"+bhpower+"',brake_type where vehicle_no="+vehicle_no+"";*/
sql="update vehicle_details set "
        + "v_model='"+v_model+"',v_name='"+v_name+"',v_manu='"+v_manu+"'"
        + ",engine_cap='"+engine_cap+"',wheel_type='"+wheel_type+"',weight='"+weight+"'"
        +",bhpower='"+bhpower+"',breake_type='"+brake_type+"',fuel_cap='"+fuel_cap+"'"
        +",battery='"+battery+"',mileage='"+mileage+"',colors='"+colors+"'"
        +",price='"+price+"',free_services='"+free_serv+"'"
        +"where vehicle_no="+vehicle_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from vehicle_details where vehicle_no="+vehicle_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from vehicle_details where vehicle_no="+vehicle_no+"";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  vehicle_no = Integer.toString(rs.getInt(1));
  v_model    = rs.getString(2);
  v_name     = rs.getString(3);
  v_manu     = rs.getString(4);
  engine_cap = rs.getString(5);
  wheel_type = rs.getString(6);
  weight     = rs.getString(7);
  bhpower    = rs.getString(8);
  brake_type = rs.getString(9);
  fuel_cap   = rs.getString(10);
  battery    = rs.getString(11);
  mileage    = rs.getString(12);
  colors     = rs.getString(13);
  price      = rs.getString(14);
  free_serv  = Integer.toString(rs.getInt(15));
}
response.sendRedirect("vehicle.jsp?"
        + "opn=0&opi=0&opu=0&opd=0&ops=0"
        + "&vehicle_no="+vehicle_no+"&v_model="+v_model+"&v_name="+v_name+""
        + "&v_manu="+v_manu+"&engine_cap="+engine_cap+"&wheel_type="+wheel_type+""
        + "&weight="+weight+"&bhpower="+bhpower+"&brake_type="+brake_type+""
        + "&fuel_cap="+fuel_cap+"&battery="+battery+"&mileage="+mileage+""
        + "&colors="+colors+"&price="+price+"&free_serv="+free_serv+"");
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
out.println("<title>VEHICLE</title>");
out.println("<script>");
out.println("function allset()"
+"{"
+"document.getElementById('vehicle_no').value ='"+vehicle_no+"';"
+"document.getElementById('v_model').value    ='"+v_model+"';"
+"document.getElementById('v_name').value     ='"+v_name+"';"
+"document.getElementById('v_manu').value     ='"+v_manu+"';"
+"document.getElementById('engine_cap').value ='"+engine_cap+"';"
+"document.getElementById('wheel_type').value ='"+wheel_type+"';"
+"document.getElementById('weight').value     ='"+weight+"';"
+"document.getElementById('bhpower').value    ='"+bhpower+"';"
+"document.getElementById('brake_type').value ='"+brake_type+"';"
+"document.getElementById('fuel_cap').value   ='"+fuel_cap+"';"
+"document.getElementById('battery').value    ='"+battery+"';"
+"document.getElementById('mileage').value    ='"+mileage+"';"
+"document.getElementById('colors').value     ='"+colors+"';"
+"document.getElementById('price').value      ='"+price+"';"
+"document.getElementById('free_serv').value  ='"+free_serv+"';"
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('vehicle.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&vehicle_no=0&free_serv=0');"
+"}");

out.println("function ins()"
+"{"
+"window.location.replace('vehicle.jsp?opn=0&opi=i&opu=0&opd=0&ops=0&vehicle_no=10');"
+"}");

out.println("function insert_v()"
+"{"
+"v_no    = document.getElementById('vehicle_no').value;"
+"v_model = document.getElementById('v_model').value;"
+"v_name  = document.getElementById('v_name').value;"
+"v_manu  = document.getElementById('v_manu').value;"
+"eng_cap = document.getElementById('engine_cap').value;"
+"wheel   = document.getElementById('wheel_type').value;"
+"weight  = document.getElementById('weight').value;"
+"bhpower = document.getElementById('bhpower').value;"
+"brake   = document.getElementById('brake_type').value;"
+"fuel    = document.getElementById('fuel_cap').value;"
+"battery = document.getElementById('battery').value;"
+"mileage = document.getElementById('mileage').value;"
+"colors  = document.getElementById('colors').value;"
+"price   = document.getElementById('price').value;"
+"free_se = document.getElementById('free_serv').value;"
+"window.location.replace('vehicle.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0"
        + "&vehicle_no='+v_no+'&v_model='+v_model+'&v_name='+v_name+'"
        + "&v_manu='+v_manu+'&engine_cap='+eng_cap+'&wheel_type='+wheel+'"
        + "&weight='+weight+'&bhpower='+bhpower+'&brake_type='+brake+'"
        + "&fuel_cap='+fuel+'&battery='+battery+'&mileage='+mileage+'"
        + "&colors='+colors+'&price='+price+'&free_serv='+free_se);"
+"}");

out.println("function update_v()"
+"{"
+"v_no    = document.getElementById('vehicle_no').value;"
+"v_model = document.getElementById('v_model').value;"
+"v_name  = document.getElementById('v_name').value;"
+"v_manu  = document.getElementById('v_manu').value;"
+"eng_cap = document.getElementById('engine_cap').value;"
+"wheel   = document.getElementById('wheel_type').value;"
+"weight  = document.getElementById('weight').value;"
+"bhpower = document.getElementById('bhpower').value;"
+"brake   = document.getElementById('brake_type').value;"
+"fuel    = document.getElementById('fuel_cap').value;"
+"battery = document.getElementById('battery').value;"
+"mileage = document.getElementById('mileage').value;"
+"colors  = document.getElementById('colors').value;"
+"price   = document.getElementById('price').value;"
+"free_se = document.getElementById('free_serv').value;"
+"window.location.replace('vehicle.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0"
        + "&vehicle_no='+v_no+'&v_model='+v_model+'&v_name='+v_name+'"
        + "&v_manu='+v_manu+'&engine_cap='+eng_cap+'&wheel_type='+wheel+'"
        + "&weight='+weight+'&bhpower='+bhpower+'&brake_type='+brake+'"
        + "&fuel_cap='+fuel+'&battery='+battery+'&mileage='+mileage+'"
        + "&colors='+colors+'&price='+price+'&free_serv='+free_se);"
+"}");

out.println("function delete_v()"
+"{"
+"v_no = document.getElementById('vehicle_no').value;"
+"window.location.replace('vehicle.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&vehicle_no='+v_no);"
+"}");

out.println("function search_v()"
+"{"
+"v_no = document.getElementById('vehicle_no').value;"        
+"window.location.replace('vehicle.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&vehicle_no='+v_no);"
+"}");

out.println("</script>");
out.println("<link rel='stylesheet' type='text/css' href='mycss.css'>");
out.println("</head>");
out.println("<body onload='allset()'>");
out.println("<div class='navbar'>"
+"<a href='home.jsp'>HOME</a>"
+"<a href='customer.jsp'>"
+"CUSTOMER</a>"
+"<a href='vehicle.jsp?opn=0&opi=0&opu=0&opd=0&ops=0'>"
+"VEHICLE</a>"
+"<a href='invoice.jsp?vno=0'>"
+"INVOICE</a>"
+"<a href='all.jsp?brand=0'>ALL PRODUCTS</a>"
+"<a href='contact.jsp?vno=0'>"
+"CONTACT</a>"
+"</div>");
out.println("<br><br><br>");
out.println("<table align='center'>");
out.println("<tr><td>Vehicle No</td><td><input type='text' id='vehicle_no' name='vehicle_no'></td></tr>");
out.println("<tr><td>Vehicle Model</td><td><input type='text' id='v_model' name='v_model'></td></tr>");
out.println("<tr><td>Vehicle Name</td><td><input type='text' id='v_name' name='v_name'></td></tr>");
out.println("<tr><td>Manufacturer</td><td><input type='text' id='v_manu' name='v_manu'></td></tr>");
out.println("<tr><td>Engine Capacity</td><td><input type='text' id='engine_cap' name='engine_cap'></td></tr>");
out.println("<tr><td>Wheel Type</td><td><input type='text' id='wheel_type' name='wheel_type'></td></tr>");
out.println("<tr><td>Weight</td><td><input type='text' id='weight' name='weight'></td></tr>");
out.println("<tr><td>BH Power</td><td><input type='text' id='bhpower' name='bhpower'></td></tr>");
out.println("<tr><td>Brake Type</td><td><input type='text' id='brake_type' name='brake_type'></td></tr>");
out.println("<tr><td>Fuel Capacity</td><td><input type='text' id='fuel_cap' name='fuel_cap'></td></tr>");
out.println("<tr><td>Battery</td><td><input type='text' id='battery' name='battery'></td></tr>");
out.println("<tr><td>Mileage</td><td><input type='text' id='mileage' name='mileage'></td></tr>");
out.println("<tr><td>Color</td><td><input type='text' id='colors' name='colors'></td></tr>");
out.println("<tr><td>Price</td><td><input type='text' id='price' name='price'></td></tr>");
out.println("<tr><td>Free Services</td><td><input type='text' id='free_serv' name='free_serv'></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td><td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td><td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>