<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>
      ok
    </title>
  </head>
  <body>
    <%  String typeid=request.getParameter("typeid");
    if(typeid==null){
      typeid="";
    }
    byte Typeid[]=typeid.getBytes("ISO-8859-1");
    typeid=new String(Typeid);

    String dailytime=request.getParameter("dailytime");
    if(dailytime==null){
      dailytime="";
    }
    byte Dailytime[]=dailytime.getBytes("ISO-8859-1");
    dailytime=new String(Dailytime);

    String address=request.getParameter("address");
    if(address==null){
      address="";
      }
      byte Address[]=address.getBytes("ISO-8859-1");
      address=new String(Address);

      String studentid=request.getParameter("studentid");
      if(studentid==null){
        studentid="";
      }
      byte Studentid[]=studentid.getBytes("ISO-8859-1");
      studentid=new String(Studentid);

      String content=request.getParameter("content");
      if(content==null){
        content="";
      }
      byte Content[]=content.getBytes("ISO-8859-1");
      content=new String(Content);

        Connection con=null;
        Statement sql=null;
        ResultSet rs=null;
        try{
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        }catch(ClassNotFoundException e){
          System.out.print(e);
        }
        try{
          con=DriverManager.getConnection("jdbc:odbc:bysj","sa","");
          sql=con.createStatement();
          String condition="insert into Dailyworkinfo values('auto', '"+typeid+"', 'jiaoshi', '"+dailytime+"', '"+address+"', 'phoneno', '"+studentid+"', '"+content+"')";
          sql.executeUpdate(condition);
          sql.close();
          con.close();
        }catch(SQLException e4){
          System.out.print(e4);
        }
       response.sendRedirect("make.jsp");
        %>
        </body>
      </html>
