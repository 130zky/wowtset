<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/about.dwt" codeOutsideHTMLIsLocked="false" -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

      <title>�����ι���ϵͳ</title>

      <link href="css.css" rel="stylesheet" type="text/css">
        <style type="text/css">
          <!--
          body {
          background-image: url();
          background-color: #FFFFFF;
          }
          -->
        </style></head>

        <body>
          <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
            <!--DWLayoutTable-->
            <tr>
              <td height="150" colspan="4" valign="top" ><table width="800" height="150" border="0" cellpadding="0" cellspacing="0">
                <!--DWLayoutTable-->
                <tr>
                  <td width="800" height="150"><img src="../image/title.jpg" width="800" height="150" /></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="35" colspan="4" valign="top" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <!--DWLayoutTable-->
                <tr>
                  <td width="800" height="35"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="800" height="35">
                    <param name="movie" value="../image/daohang.swf">
                      <param name="quality" value="high">
                        <embed src="../image/daohang.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="800" height="35"></embed>
                      </object></td>
                    </tr>
                  </table>      </td>
                </tr>

                <tr  >
                  <td width="222" height="25" valign="top"  ><table width="222" border="0" cellpadding="0" cellspacing="0">
                    <!--DWLayoutTable-->
                    <tr>
                      <td width="222" height="25"  bgcolor="#ECECEC"><div align="center" class="css1" >ϵͳ��¼</div></td>
                    </tr>
                  </table></td>
                  <td width="12" bgcolor="#FFFFFF"  >&nbsp;</td>
                  <td colspan="2" valign="top" bgcolor="#FFFFFF"  ><!-- InstanceBeginEditable name="��Ŀ" -->
                    <div align="center" class="css1">�ճ��������</div>
                    <!-- InstanceEndEditable --></td>
                  </tr>
                  <tr>
                    <td height="176" valign="top"  >
                    					<form id="form" name="form" method="post" action="../servlet?action=login" onsubmit="return check(this);">
						<!-- InstanceBeginEditable name="��½��" -->
						<table width="222" border="0" cellpadding="0" cellspacing="0" bgcolor="#ECECEC">
							<!--DWLayoutTable-->

							<%if (session.getAttribute("islog") == null) {%>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="left">
										��¼����:
										<select name="type">
											<option value="teacher">
												�� ʦ
											</option>
											<option value="monitor">
												�� ί
											</option>
											<option value="student">
												ѧ ��
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="left">
										�û���:
										<input name="username" type="text" size="20" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="left">
										�� �� :
										<input name="password" type="password" size="20" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="center">
										<input type="submit" name="Submit" value="�ύ" />
										&nbsp;&nbsp;
										<input type="reset" name="Submit2" value="����" />
									</div>
								</td>

							</tr>
							<%if (session.getAttribute("error") != null) {
					String msg = (String) session.getAttribute("error");
					out
							.print("<tr valign=center><td><center><font color=red size=2 align=center>"
									+ msg + "</font></center></td></tr>");
				}%>
							<%} else {
					

			%>
						<tr>
							  <td height="35"  valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ӭ���ĵ�½:&nbsp;<%out.print(""+(String)session.getAttribute("name"));%> </td>
							</tr>
							<tr>
							  <td height="35" valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����Ȩ�޼���: &nbsp;<%out.print(""+(String)session.getAttribute("type"));%></td>
							</tr>
							<tr>
							  <td height="35" valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������༶: &nbsp;<%out.print(""+(String)session.getAttribute("class"));%></td>
							</tr>
							<tr>
							  <td valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����Ҫ�뿪��&nbsp;&nbsp;<a href="../servlet?action=logout">�˳���½</a>							  </td>
							</tr>
							<%}%>
							<tr>
								<td height="20"  class="css1"><!--DWLayoutEmptyCell-->&nbsp;
									
									
								</td>
							</tr>
						</table>
						<!-- InstanceEndEditable -->
					</form>
                    
                    </td>
                    <td rowspan="2" bgcolor="#FFFFFF" >&nbsp;</td>
                    <td width="500"  valign="top" bgcolor="#FFFFFF" ><!-- InstanceBeginEditable name="����" -->
                      <%!
      int pageSize =10;//ÿҳ��ʾ�ļ�¼
      int pageCount = 0;//��ҳ��
      int showPage = 1;//��ǰ��ʾ��ҳ��
      %>
                        <%
                       

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
                          
                         sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			 String condition="SELECT * FROM Dailyworkinfo";
                          rs=sql.executeQuery(condition);
                          
                           rs.last();//���α��ƶ������һ��
     
     int lastRow = rs.getRow();//��ȡ���һ�е��к�
     
     pageCount = (lastRow % pageSize == 0) ? (lastRow / pageSize) : (lastRow / pageSize + 1);//�̶��㷨
     String go1=request.getParameter("page");
     if(go1==null)
     { go1="1";
     }
     try{
      showPage=Integer.parseInt(go1);
     }
     catch(NumberFormatException e){
       showPage=1;
       }
     if(showPage<=1)//�����ҳ��С������ʾ��һҳ
     {  showPage=1;
     }
     if(showPage>=pageCount)//�����ҳ��������ҳ������ʾ���һҳ
     {  showPage=pageCount;
     }
     int posion=(showPage-1)*pageSize+1;
     rs.absolute(posion);//�����α��λ��
                          %>
               
                            <table width="560" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="css1"><div align="center">���</div></td>
          <td class="css1"><div align="center">����</div></td>
          <td class="css1"><div align="center">��ʦ���</div></td>
          <td class="css1"><div align="center">ʱ��</div></td>
          <td class="css1"><div align="center">�ص�</div></td>
        </tr>
        <%
                              for(int i=1;i<=pageSize;i++) {%>
                                <tr>
          <td class="css1"><div align="center"><%out.print(""+rs.getString(1));%></div></td>
          <td class="css1"><div align="center"><%out.print(""+rs.getString(2));%></div></td>
          <td class="css1"><div align="center"><%out.print(""+rs.getString(3));%></div></td>
          <td class="css1"><div align="center"><%out.print(""+rs.getString(4));%></div></td>
           <td class="css1"><div align="center"><%out.print(""+rs.getString(5));%></div></td>
          
        </tr>    <%
    boolean beal;
    beal=rs.next();
    if(!beal)
    break;
  }%>
  <% }
      catch (SQLException e) {
        e.printStackTrace();
      }%>
                              </table>
                         
                
                          <div align="right">��<font color="blue" size="4"><%=pageCount%> </font>ҳ&nbsp ��ǰ��<font color="blue" size="4">
       <%=showPage%> </font> ҳ &nbsp
       <%if (showPage>1){%>
       <a href="list.jsp?page=1">[��һҳ]</a>&nbsp;<a href="list.jsp?page=<%=showPage-1%>">[��һҳ]</a>
       <%}else{%>
        [��һҳ]&nbsp;[��һҳ]
        <%}
         if (showPage< pageCount) {%>
         &nbsp;<a href="list.jsp?page=<%=showPage+1%>">[��һҳ]</a>&nbsp;<a href="list.jsp?page=<%=pageCount%>">[���ҳ]</a>
         <%}else{%>
         &nbsp;[��һҳ]&nbsp;[���ҳ]
         <%}%></div>
                        
                            <p align="center"><a href="daily.jsp">�������</a></p>
                        
                            <!-- InstanceEndEditable --> </td>
                            <td width="9" rowspan="2" bgcolor="#FFFFFF" >&nbsp;</td>
                          </tr>

                          <tr>
                            <td height="323" valign="top"  ><table width="100" height="323" border="0" cellpadding="0" cellspacing="0">
                              <!--DWLayoutTable-->
                              <tr>
                                <td width="222" height="302"><table width="222" height="323" cellpadding="0" cellspacing="0" bgcolor="#ECECEC">
                                  <tr>
                                    <td   ><div align="center" class="a01"><a href="student.jsp" class="css1">ѧ��������Ϣ����</a></div></td>
                                  </tr>
                                  <tr>
                                    <td ><div align="center" class="a01"><a href="integral.jsp" class="a01">���ֿ��˹���</a></div></td>
                                  </tr>
                                  <tr>
                                    <td  ><div align="center" class="a01"><a href="daily.jsp" class="a01">�������ճ��������</a></div></td>
                                  </tr>
                                  <tr>
                                    <td   ><div align="center" class="a01"><a href="message.jsp" class="a01">��Ϣ���������԰�</a></div></td>
                                  </tr>
                                  <tr>
                                    <td ><div align="center" class="a01"><a href="popedon.jsp" class="a01">�û�Ȩ�����ù���</a></div></td>
                                  </tr>
                                  <tr>
                                    <td  ><div align="center" class="a01"><a href="log.jsp" class="a01">���롢�ǳ�����</a></div></td>
                                  </tr>
                                </table></td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr  >
                            <td height="112" colspan="4" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                              <!--DWLayoutTable-->
                              <tr>
                                <td width="800" height="112" valign="top" bgcolor="#FFFFFF" class="shixian"><p align="center"><img src="../image/di%20����.jpg" width="800" height="11"><br>
                                  <br>
                                    <span class="css1">Copyright ?2006 All Rights Reserved<br />
                                      ��ҵ��ƹ����� ��Ȩ���� ����:biyesheji@163.com </span><br />
                                    </p>          </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </body>
                        <!-- InstanceEnd --></html>

