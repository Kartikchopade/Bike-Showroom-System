<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%@page import="java.io.*;" %>
<%
String invoice_no      = request.getParameter("invoice_no");
String booking_date    = request.getParameter("booking_date");
String delivery_date   = request.getParameter("delivery_date");
String cust_id         = request.getParameter("cust_id");
String full_name       = request.getParameter("full_name");
String address         = request.getParameter("address");
String v_no            = request.getParameter("v_no");
String v_model         = request.getParameter("v_model");
String v_name          = request.getParameter("v_name");
String v_manu          = request.getParameter("v_manu");
String engine_no       = request.getParameter("engine_no");
String chasis_no       = request.getParameter("chasis_no");
String rcbook_no       = request.getParameter("rcbook_no");
String engine_cap      = request.getParameter("engine_cap");
String colors          = request.getParameter("colors");
String free_serv       = request.getParameter("free_serv");
String payment_mode    = request.getParameter("payment_mode");
String bank_name       = request.getParameter("bank_name");
String ifsc_code       = request.getParameter("ifsc_code");
String cheque_date     = request.getParameter("cheque_date");
String cheque_no       = request.getParameter("cheque_no");
String price           = request.getParameter("price");
String first_install   = request.getParameter("first_install");
String second_install  = request.getParameter("second_install");
String third_install   = request.getParameter("third_install");
String cgst            = request.getParameter("cgst");
String sgst            = request.getParameter("sgst");
String balance         = request.getParameter("balance");
String grand_total     = request.getParameter("grand_total");

String opn = request.getParameter("opn");
String opi = request.getParameter("opi");
String opu = request.getParameter("opu");
String opd = request.getParameter("opd");
String ops = request.getParameter("ops");
String opf = request.getParameter("opf");
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
sql="select max(invoice_no)+1 from invoice_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  invoice_no=Integer.toString(rs.getInt(1));
}
response.sendRedirect("invoice.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&opf=0&invoice_no="+invoice_no+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into invoice_details values("+invoice_no+",'"+booking_date+"',"
+"'"+delivery_date+"',"+cust_id+",'"+full_name+"','"+address+"',"+v_no+",'"+v_model+"',"
+"'"+v_name+"','"+v_manu+"','"+engine_no+"','"+chasis_no+"','"+rcbook_no+"',"
+"'"+engine_cap+"','"+colors+"',"+free_serv+",'"+payment_mode+"','"+bank_name+"',"
+"'"+ifsc_code+"','"+cheque_date+"','"+cheque_no+"','"+price+"','"+first_install+"',"
+"'"+second_install+"','"+third_install+"','"+cgst+"','"+sgst+"','"+balance+"',"
+"'"+grand_total+"')";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Inserted')");
out.println("</script>");
out.println(" Record Inserted ");
}
else if(opu.equals("u"))
{
op="u";
/*sql="update invoice_details set booking_date='"+booking_date+"',delivery_date='"+delivery_date+"'"
   +",cust_id="+cust_id+",full_name='"+full_name+"',address='"+address+"',v_no="+v_no+""
   +",v_model='"+v_model+"',v_name='"+v_name+"',v_manu='"+v_manu+"'"
   +",engine_no='"+engine_no+"',chasis_no='"+chasis_no+"',rcbook_no='"+rcbook_no+"'"
   +",engine_cap='"+engine_cap+"',colors='"+colors+"',free_services='"+free_serv+"'"
   +",free_services="+free_serv+",payment_mode='"+payment_mode+"',bank_name='"+bank_name+"'"
   +"where invoice_no="+invoice_no+"";*/
sql="update invoice_details set booking_date='"+booking_date+"',"
+"delivery_date='"+delivery_date+"',cust_id='"+cust_id+"',full_name='"+full_name+"',"
+"address='"+address+"',v_no='"+v_no+"',v_model='"+v_model+"',v_name='"+v_name+"',"
+"v_manu='"+v_manu+"',engine_no='"+engine_no+"',chasis_no='"+chasis_no+"',"
+"rcbook_no='"+rcbook_no+"',engine_cap='"+engine_cap+"',colors='"+colors+"',"
+"free_services="+free_serv+",payment_mode='"+payment_mode+"',bank_name='"+bank_name+"',"
+"bank_ifcs_code='"+ifsc_code+"',cheque_date='"+cheque_date+"',cheque_no='"+cheque_no+"',"
+"price='"+price+"',first_installment='"+first_install+"',second_installment='"+second_install+"',"
+"third_installment='"+third_install+"',cgst='"+cgst+"',sgst='"+sgst+"',"
+"balance='"+balance+"',grand_total='"+grand_total+"'"
+"where invoice_no="+invoice_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from invoice_details where invoice_no="+invoice_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from invoice_details where invoice_no="+invoice_no+"";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  invoice_no    = Integer.toString(rs.getInt(1));
  booking_date  = rs.getString(2);
  delivery_date = rs.getString(3);
  cust_id       = Integer.toString(rs.getInt(4));
  full_name     = rs.getString(5);
  address       = rs.getString(6);
  v_no          = Integer.toString(rs.getInt(7));
  v_model       = rs.getString(8);
  v_name        = rs.getString(9);
  v_manu        = rs.getString(10);
  engine_no     = rs.getString(11);
  chasis_no     = rs.getString(12);
  rcbook_no     = rs.getString(13);
  engine_cap    = rs.getString(14);
  colors        = rs.getString(15);
  free_serv     = Integer.toString(rs.getInt(16));
  payment_mode  = rs.getString(17);
  bank_name     = rs.getString(18);
  ifsc_code     = rs.getString(19);
  cheque_date   = rs.getString(20);
  cheque_no     = rs.getString(21);
  price         = rs.getString(22);
  first_install = rs.getString(23);
  second_install= rs.getString(24);
  third_install = rs.getString(25);
  cgst          = rs.getString(26);
  sgst          = rs.getString(27);
  balance       = rs.getString(28);
  grand_total   = rs.getString(29);
}
response.sendRedirect("invoice.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&opf=0"
+"&invoice_no="+invoice_no+"&booking_date="+booking_date+"&delivery_date="+delivery_date+""
+"&cust_id="+cust_id+"&full_name="+full_name+"&address="+address+""
+"&v_no="+v_no+"&v_model="+v_model+"&v_name="+v_name+"&v_manu="+v_manu+""
+"&engine_no="+engine_no+"&chasis_no="+chasis_no+"&rcbook_no="+rcbook_no+""
+"&engine_cap="+engine_cap+"&colors="+colors+"&free_serv="+free_serv+""
+"&payment_mode="+payment_mode+"&bank_name="+bank_name+"&ifsc_code="+ifsc_code+""
+"&cheque_date="+cheque_date+"&cheque_no="+cheque_no+"&price="+price+""
+"&first_install="+first_install+"&second_install="+second_install+"&third_install="+third_install+""
+"&cgst="+cgst+"&sgst="+sgst+"&balance="+balance+"&grand_total="+grand_total+""
        + "");
}
else if(opf.equals("f"))
{
op="f";
sql="select max(invoice_no)+1 from invoice_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  invoice_no=Integer.toString(rs.getInt(1));
}

sql="select * from customer_details where cust_id="+cust_id+"";
out.println(sql);
rs=stmt.executeQuery(sql);
while(rs.next())
{
  cust_id       = Integer.toString(rs.getInt(1));
  full_name     = rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4);
  address       = rs.getString(5);
}
sql="select * from vehicle_details where vehicle_no="+v_no+"";
out.println(sql);
rs=stmt.executeQuery(sql);
while(rs.next())
{
  v_no          = Integer.toString(rs.getInt(1));
  v_model       = rs.getString(2);
  v_name        = rs.getString(3);
  v_manu        = rs.getString(4);
  engine_cap    = rs.getString(5);
  price         = rs.getString(14);
  colors        = rs.getString(13);
  free_serv     = Integer.toString(rs.getInt(15));
}

response.sendRedirect("invoice.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&opf=0"
+"&invoice_no="+invoice_no+"&booking_date="+booking_date+"&delivery_date="+delivery_date+""
+"&cust_id="+cust_id+"&full_name="+full_name+"&address="+address+""
+"&v_no="+v_no+"&v_model="+v_model+"&v_name="+v_name+"&v_manu="+v_manu+""
+"&engine_no="+engine_no+"&chasis_no="+chasis_no+"&rcbook_no="+rcbook_no+""
+"&engine_cap="+engine_cap+"&colors="+colors+"&free_serv="+free_serv+""
+"&payment_mode="+payment_mode+"&bank_name="+bank_name+"&ifsc_code="+ifsc_code+""
+"&cheque_date="+cheque_date+"&cheque_no="+cheque_no+"&price="+price+""
+"&first_install="+first_install+"&second_install="+second_install+"&third_install="+third_install+""
+"&cgst="+cgst+"&sgst="+sgst+"&balance="+balance+"&grand_total="+grand_total+""
        + "");
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
out.println("<title>INVOICE</title>");
out.println("<script>");
out.println("function allset()"
+"{"
+"document.getElementById('invoice_no').value    = '"+invoice_no+"';"
+"document.getElementById('booking_date').value  = '"+booking_date+"';"
+"document.getElementById('delivery_date').value = '"+delivery_date+"';"
+"document.getElementById('cust_id').value       = '"+cust_id+"';"
+"document.getElementById('full_name').value     = '"+full_name+"';"
+"document.getElementById('address').value       = '"+address+"';"
+"document.getElementById('v_no').value          = '"+v_no+"';"
+"document.getElementById('v_model').value       = '"+v_model+"';"
+"document.getElementById('v_name').value        = '"+v_name+"';"
+"document.getElementById('v_manu').value        = '"+v_manu+"';"
+"document.getElementById('engine_no').value     = '"+engine_no+"';"
+"document.getElementById('chasis_no').value     = '"+chasis_no+"';"
+"document.getElementById('rcbook_no').value     = '"+rcbook_no+"';"
+"document.getElementById('engine_cap').value    = '"+engine_cap+"';"
+"document.getElementById('colors').value        = '"+colors+"';"
+"document.getElementById('free_serv').value     = '"+free_serv+"';"
+"document.getElementById('payment_mode').value  ='"+payment_mode+"';"
+"document.getElementById('bank_name').value     ='"+bank_name+"';"
+"document.getElementById('ifsc_code').value     ='"+ifsc_code+"';"
+"document.getElementById('cheque_date').value   ='"+cheque_date+"';"
+"document.getElementById('cheque_no').value     ='"+cheque_no+"';"     
+"document.getElementById('price').value         ='"+price+"';"
+"document.getElementById('first_install').value ='"+first_install+"';"
+"document.getElementById('second_install').value='"+second_install+"';"
+"document.getElementById('third_install').value ='"+third_install+"';"
+"document.getElementById('cgst').value          ='"+cgst+"';"
+"document.getElementById('sgst').value          ='"+sgst+"';"
+"document.getElementById('balance').value       ='"+balance+"';"
+"document.getElementById('grand_total').value   ='"+grand_total+"';"        
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('invoice.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&opf=0&invoice_no=2');"
+"}");

out.println("function insert_v()"
+"{"
+"invoice_no     = document.getElementById('invoice_no').value;"
+"booking_date   = document.getElementById('booking_date').value;"
+"delivery_date  = document.getElementById('delivery_date').value;"
+"cust_id        = document.getElementById('cust_id').value;"
+"full_name      = document.getElementById('full_name').value;"
+"address        = document.getElementById('address').value;"
+"v_no           = document.getElementById('v_no').value;"
+"v_model        = document.getElementById('v_model').value;"
+"v_name         = document.getElementById('v_name').value;"
+"v_manu         = document.getElementById('v_manu').value;"
+"engine_no      = document.getElementById('engine_no').value;"
+"chasis_no      = document.getElementById('chasis_no').value;"
+"rcbook_no      = document.getElementById('rcbook_no').value;"
+"engine_cap     = document.getElementById('engine_cap').value;"
+"colors         = document.getElementById('colors').value;"
+"free_serv      = document.getElementById('free_serv').value;"
+"payment_mode   = document.getElementById('payment_mode').value;"
+"bank_name      = document.getElementById('bank_name').value;"
+"ifsc_code      = document.getElementById('ifsc_code').value;"
+"cheque_date    = document.getElementById('cheque_date').value;"
+"cheque_no      = document.getElementById('cheque_no').value;"
+"price          = document.getElementById('price').value;"
+"first_install  = document.getElementById('first_install').value;"
+"second_install = document.getElementById('second_install').value;"
+"third_install  = document.getElementById('third_install').value;"
+"cgst           = document.getElementById('cgst').value;"
+"sgst           = document.getElementById('sgst').value;"
+"balance        = document.getElementById('balance').value;"
+"grand_total    = document.getElementById('grand_total').value;"    
+"window.location.replace('invoice.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0&opf=0"
        + "&invoice_no='+invoice_no+'&booking_date='+booking_date+'&delivery_date='+delivery_date+'"
        + "&cust_id='+cust_id+'&full_name='+full_name+'&address='+address+'"
        + "&v_no='+v_no+'&v_model='+v_model+'&v_name='+v_name+'"
        + "&v_manu='+v_manu+'&engine_no='+engine_no+'&chasis_no='+chasis_no+'"
        + "&rcbook_no='+rcbook_no+'&engine_cap='+engine_cap+'&colors='+colors+'"
        + "&free_serv='+free_serv+'&payment_mode='+payment_mode+'&bank_name='+bank_name+'"
        + "&ifsc_code='+ifsc_code+'&cheque_date='+cheque_date+'&cheque_no='+cheque_no+'"
        + "&price='+price+'&first_install='+first_install+'&second_install='+second_install+'"
        + "&third_install='+third_install+'&cgst='+cgst+'&sgst='+sgst+'"
        + "&balance='+balance+'&grand_total='+grand_total);"        
+"}");

out.println("function update_v()"
+"{"
+"invoice_no     = document.getElementById('invoice_no').value;"
+"booking_date   = document.getElementById('booking_date').value;"
+"delivery_date  = document.getElementById('delivery_date').value;"
+"cust_id        = document.getElementById('cust_id').value;"
+"full_name      = document.getElementById('full_name').value;"
+"address        = document.getElementById('address').value;"
+"v_no           = document.getElementById('v_no').value;"
+"v_model        = document.getElementById('v_model').value;"
+"v_name         = document.getElementById('v_name').value;"
+"v_manu         = document.getElementById('v_manu').value;"
+"engine_no      = document.getElementById('engine_no').value;"
+"chasis_no      = document.getElementById('chasis_no').value;"
+"rcbook_no      = document.getElementById('rcbook_no').value;"
+"engine_cap     = document.getElementById('engine_cap').value;"
+"colors         = document.getElementById('colors').value;"
+"free_serv      = document.getElementById('free_serv').value;"
+"payment_mode   = document.getElementById('payment_mode').value;"
+"bank_name      = document.getElementById('bank_name').value;"
+"ifsc_code      = document.getElementById('ifsc_code').value;"
+"cheque_date    = document.getElementById('cheque_date').value;"
+"cheque_no      = document.getElementById('cheque_no').value;"
+"price          = document.getElementById('price').value;"
+"first_install  = document.getElementById('first_install').value;"
+"second_install = document.getElementById('second_install').value;"
+"third_install  = document.getElementById('third_install').value;"
+"cgst           = document.getElementById('cgst').value;"
+"sgst           = document.getElementById('sgst').value;"
+"balance        = document.getElementById('balance').value;"
+"grand_total    = document.getElementById('grand_total').value;"    
+"window.location.replace('invoice.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0&opf=0"
        + "&invoice_no='+invoice_no+'&booking_date='+booking_date+'&delivery_date='+delivery_date+'"
        + "&cust_id='+cust_id+'&full_name='+full_name+'&address='+address+'"
        + "&v_no='+v_no+'&v_model='+v_model+'&v_name='+v_name+'"
        + "&v_manu='+v_manu+'&engine_no='+engine_no+'&chasis_no='+chasis_no+'"
        + "&rcbook_no='+rcbook_no+'&engine_cap='+engine_cap+'&colors='+colors+'"
        + "&free_serv='+free_serv+'&payment_mode='+payment_mode+'&bank_name='+bank_name+'"
        + "&ifsc_code='+ifsc_code+'&cheque_date='+cheque_date+'&cheque_no='+cheque_no+'"
        + "&price='+price+'&first_install='+first_install+'&second_install='+second_install+'"
        + "&third_install='+third_install+'&cgst='+cgst+'&sgst='+sgst+'"
        + "&balance='+balance+'&grand_total='+grand_total);"
+"}");

out.println("function update_v()"
+"{"
+"invoice_no     = document.getElementById('invoice_no').value;"
+"booking_date   = document.getElementById('booking_date').value;"
+"delivery_date  = document.getElementById('delivery_date').value;"
+"cust_id        = document.getElementById('cust_id').value;"
+"full_name      = document.getElementById('full_name').value;"
+"address        = document.getElementById('address').value;"
+"v_no           = document.getElementById('v_no').value;"
+"v_model        = document.getElementById('v_model').value;"
+"v_name         = document.getElementById('v_name').value;"
+"v_manu         = document.getElementById('v_manu').value;"
+"engine_no      = document.getElementById('engine_no').value;"
+"chasis_no      = document.getElementById('chasis_no').value;"
+"rcbook_no      = document.getElementById('rcbook_no').value;"
+"engine_cap     = document.getElementById('engine_cap').value;"
+"colors         = document.getElementById('colors').value;"
+"free_serv      = document.getElementById('free_serv').value;"
+"payment_mode   = document.getElementById('payment_mode').value;"
+"bank_name      = document.getElementById('bank_name').value;"
+"ifsc_code      = document.getElementById('ifsc_code').value;"
+"cheque_date    = document.getElementById('cheque_date').value;"
+"cheque_no      = document.getElementById('cheque_no').value;"
+"price          = document.getElementById('price').value;"
+"first_install  = document.getElementById('first_install').value;"
+"second_install = document.getElementById('second_install').value;"
+"third_install  = document.getElementById('third_install').value;"
+"cgst           = document.getElementById('cgst').value;"
+"sgst           = document.getElementById('sgst').value;"
+"balance        = document.getElementById('balance').value;"
+"grand_total    = document.getElementById('grand_total').value;"    
+"window.location.replace('invoice.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0&opf=0"
        + "&invoice_no='+invoice_no+'&booking_date='+booking_date+'&delivery_date='+delivery_date+'"
        + "&cust_id='+cust_id+'&full_name='+full_name+'&address='+address+'"
        + "&v_no='+v_no+'&v_model='+v_model+'&v_name='+v_name+'"
        + "&v_manu='+v_manu+'&engine_no='+engine_no+'&chasis_no='+chasis_no+'"
        + "&rcbook_no='+rcbook_no+'&engine_cap='+engine_cap+'&colors='+colors+'"
        + "&free_serv='+free_serv+'&payment_mode='+payment_mode+'&bank_name='+bank_name+'"
        + "&ifsc_code='+ifsc_code+'&cheque_date='+cheque_date+'&cheque_no='+cheque_no+'"
        + "&price='+price+'&first_install='+first_install+'&second_install='+second_install+'"
        + "&third_install='+third_install+'&cgst='+cgst+'&sgst='+sgst+'"
        + "&balance='+balance+'&grand_total='+grand_total);"
+"}");

out.println("function delete_v()"
+"{"
+"invoice_no = document.getElementById('invoice_no').value;"
+"window.location.replace('invoice.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&opf=0&invoice_no='+invoice_no);"
+"}");

out.println("function search_v()"
+"{"
+"invoice_no = document.getElementById('invoice_no').value;"        
+"window.location.replace('invoice.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&opf=0&invoice_no='+invoice_no);"
+"}");

out.println("function fill_data()"
+"{"
+"cust_id = document.getElementById('cust_id').value;"
+"v_no    = document.getElementById('v_no').value;"
+"window.location.replace('invoice.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&opf=f&cust_id='+cust_id+'&v_no='+v_no);"
+"}");

out.println("function print_invoice()"
+"{"
+"invoice_no     = document.getElementById('invoice_no').value;"
+"booking_date   = document.getElementById('booking_date').value;"
+"delivery_date  = document.getElementById('delivery_date').value;"
+"cust_id        = document.getElementById('cust_id').value;"
+"full_name      = document.getElementById('full_name').value;"
+"address        = document.getElementById('address').value;"
+"v_no           = document.getElementById('v_no').value;"
+"v_model        = document.getElementById('v_model').value;"
+"v_name         = document.getElementById('v_name').value;"
+"v_manu         = document.getElementById('v_manu').value;"
+"engine_no      = document.getElementById('engine_no').value;"
+"chasis_no      = document.getElementById('chasis_no').value;"
+"rcbook_no      = document.getElementById('rcbook_no').value;"
+"engine_cap     = document.getElementById('engine_cap').value;"
+"colors         = document.getElementById('colors').value;"
+"free_serv      = document.getElementById('free_serv').value;"
+"payment_mode   = document.getElementById('payment_mode').value;"
+"bank_name      = document.getElementById('bank_name').value;"
+"ifsc_code      = document.getElementById('ifsc_code').value;"
+"cheque_date    = document.getElementById('cheque_date').value;"
+"cheque_no      = document.getElementById('cheque_no').value;"
+"price          = document.getElementById('price').value;"
+"first_install  = document.getElementById('first_install').value;"
+"second_install = document.getElementById('second_install').value;"
+"third_install  = document.getElementById('third_install').value;"
+"cgst           = document.getElementById('cgst').value;"
+"sgst           = document.getElementById('sgst').value;"
+"balance        = document.getElementById('balance').value;"
+"grand_total    = document.getElementById('grand_total').value;"    
+"window.location.replace('print_invoice.jsp?"
        + "&invoice_no='+invoice_no+'&booking_date='+booking_date+'&delivery_date='+delivery_date+'"
        + "&cust_id='+cust_id+'&full_name='+full_name+'&address='+address+'"
        + "&v_no='+v_no+'&v_model='+v_model+'&v_name='+v_name+'"
        + "&v_manu='+v_manu+'&engine_no='+engine_no+'&chasis_no='+chasis_no+'"
        + "&rcbook_no='+rcbook_no+'&engine_cap='+engine_cap+'&colors='+colors+'"
        + "&free_serv='+free_serv+'&payment_mode='+payment_mode+'&bank_name='+bank_name+'"
        + "&ifsc_code='+ifsc_code+'&cheque_date='+cheque_date+'&cheque_no='+cheque_no+'"
        + "&price='+price+'&first_install='+first_install+'&second_install='+second_install+'"
        + "&third_install='+third_install+'&cgst='+cgst+'&sgst='+sgst+'"
        + "&balance='+balance+'&grand_total='+grand_total);"
+"}");

out.println("function Calculate_GST()"
+"{"
+"var price = Number(document.getElementById('price').value);"
+"var first_install  = Number(document.getElementById('first_install').value);"
+"var second_install = Number(document.getElementById('second_install').value);"
+"var third_install  = Number(document.getElementById('third_install').value);"
+"var grand_total    = Number(document.getElementById('grand_total').value);"
+"var balance = 0 ;"
+"var totalgst = (price*18)/100;"
+"var c = (totalgst/2);"
+"var s = (totalgst/2);"        
+"document.getElementById('cgst').value = c;"
+"document.getElementById('sgst').value = s;"
+"document.getElementById('first_install').value = first_install;"
+"document.getElementById('second_install').value = second_install;"
+"document.getElementById('third_install').value = third_install;"
+"document.getElementById('grand_total').value = totalgst+price;"
+"document.getElementById('balance').value =grand_total-(first_install+second_install+third_install);"
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
out.println("<table bgcolor='sky blue' border='0' align='center'>");
out.println("<tr><td>Invoice No</td><td><input type='text' id='invoice_no' name='invoice_no'></td></tr>");
out.println("<tr><td>Booking Date</td><td><input type='text' id='booking_date' name='booking_date'></td></tr>");
out.println("<tr><td>Delivery Date</td><td><input type='text' id='delivery_date' name='delivery_date'></td></tr>");
out.println("<tr><td>Customer ID</td><td><input type='text' id='cust_id' name='cust_id'></td></tr>");
out.println("<tr><td>Full Name</td><td><input type='text' id='full_name' name='full_name'></td></tr>");
out.println("<tr><td>Address</td><td><input type='text' id='address' name='address'></td></tr>");
out.println("<tr><td>Vehicle No</td><td><input type='text' id='v_no' name='v_no'></td></tr>");
out.println("<tr><td>Vehicle Model</td><td><input type='text' id='v_model' name='v_model'></td></tr>");
out.println("<tr><td>Vehicle Name</td><td><input type='text' id='v_name' name='v_name'></td></tr>");
out.println("<tr><td>Manufacturer</td><td><input type='text' id='v_manu' name='v_manu'></td></tr>");
out.println("<tr><td>Engine No</td><td><input type='text' id='engine_no' name='engine_no'></td></tr>");
out.println("<tr><td>Chasis No</td><td><input type='text' id='chasis_no' name='chasis_no'></td></tr>");
out.println("<tr><td>RC Book No</td><td><input type='text' id='rcbook_no' name='rcbook_no'></td></tr>");
out.println("<tr><td>Engine Capacity</td><td><input type='text' id='engine_cap' name='engine_cap'></td></tr>");
out.println("<tr><td>Color</td><td><input type='text' id='colors' name='colors'></td></tr>");
out.println("<tr><td>Free Services</td><td><input type='text' id='free_serv' name='free_serv'></td></tr>");
out.println("<tr><td>Payment Mode</td><td><input type='text' id='payment_mode' name='payment_mode'></td></tr>");
out.println("<tr><td>Bank Name</td><td><input type='text' id='bank_name' name='bank_name'></td></tr>");
out.println("<tr><td>Bank IFSC Code</td><td><input type='text' id='ifsc_code' name='ifsc_code'></td></tr>");
out.println("<tr><td>Cheque Date</td><td><input type='text' id='cheque_date' name='cheque_date'></td></tr>");
out.println("<tr><td>Cheque No</td><td><input type='text' id='cheque_no' name='cheque_no'></td></tr>");
out.println("<tr><td>Price</td><td><input type='text' id='price' name='price'></td></tr>");
out.println("<tr><td>1st Installment</td><td><input type='text' id='first_install' name='first_install'></td></tr>");
out.println("<tr><td>2nd Installment</td><td><input type='text' id='second_install' name='second_install'></td></tr>");
out.println("<tr><td>3rd Installment</td><td><input type='text' id='third_install' name='third_install'></td></tr>");
out.println("<tr><td>CGST@9%</td><td><input type='text' id='cgst' name='cgst'></td></tr>");
out.println("<tr><td>SGST@9%</td><td><input type='text' id='sgst' name='sgst'></td></tr>");
out.println("<tr><td>Balance</td><td><input type='text' id='balance' name='balance'></td></tr>");
out.println("<tr><td>Grand Total</td><td><input type='text' id='grand_total' name='grand_total'></td></tr>");

out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td>");
out.println("<td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td>");
out.println("<td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='search_v()'>SEARCH</a></td>");
out.println("<td align='center'><a href='#' onclick='fill_data()'>FILL DATA</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='Calculate_GST()'>Calculate GST</a></td>");
out.println("<td align='center'><a href='#' onclick='print_invoice()'>PRINT INVOICE</a></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>