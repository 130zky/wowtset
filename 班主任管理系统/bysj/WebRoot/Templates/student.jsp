<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ page import="bean.JFBean"%>
<html>
	<!-- InstanceBegin template="/Templates/about.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>
			�����ι���ϵͳ
		</title>
		<link href="css.css" rel="stylesheet" type="text/css">
		<script type="" language="javascript">
          function submitst()
          {
            if(document.form2.findContact.value==""){
              alert("������ѧ��ѧ��");
              form2.findContact.focus();
              return false;
            }
            return true;
          }

          function submit1()
          {
            document.form2.action='modify.jsp';
            document.form2.submit();
          }

             function submit2()
          {
             location.reload(1);
          }
          </script>
	</head>
	<jsp:useBean id="student" scope="page" class="bean.JFBean" />
	<body>
		<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
			<!--DWLayoutTable-->
			<tr>
				<td height="150" colspan="4" valign="top">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td width="800" height="150">
								<img src="../image/title.jpg" width="800" height="150" alt="" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35" colspan="4" valign="top">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td width="800" height="35">
								<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="800" height="35">
									<param name="movie" value="../image/daohang.swf">
									<param name="quality" value="high">
									<embed src="../image/daohang.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="800" height="35"></embed>
								</object>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td width="222" height="25" valign="top">
					<table width="222" border="0" cellpadding="0" cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td width="222" height="25" bgcolor="#ECECEC">
								<div align="center" class="css1">
									ϵͳ��¼
								</div>
							</td>
						</tr>
					</table>
				</td>
				<td width="12" bgcolor="#FFFFFF">&nbsp;
					
				</td>
				<td colspan="2" valign="top" bgcolor="#FFFFFF">
					<!-- InstanceBeginEditable name="��Ŀ" -->
					<div align="center" class="css1">
						ϵ ͳ �� ��
					</div>
					<!-- InstanceEndEditable -->
				</td>
			</tr>
			<tr>
				<td height="176" valign="top">
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
				<td rowspan="2">&nbsp;
					
			  </td>
				<td width="557" rowspan="2" valign="top">
					<!-- InstanceBeginEditable name="����" -->
					<form name="form2" action="student.jsp" method="POST" onsubmit="return submitst()">
						<table width="574" height="400" >
							<%String find = null;
			String sql = null;

			find = request.getParameter("findContact");//�õ����ҵ�����
			String type = (String) session.getAttribute("type");//�õ������˵����,����ʦ,��ѧ��,���ǰ�ί
			String name = (String) session.getAttribute("name");//�õ������˵��û���

			//�ж�����ʦ���һ���ѧ������,���ֱ������Ӧ��SQL���
			if (find == null || find.equals(""))
				sql = "SELECT * FROM student WHERE name = '" + name + "' ";
			else
				sql = "SELECT * FROM student WHERE (id = '" + find + "')";
			int count = student.execQueryName(sql);
			if (count <= 0) {//�ж��Ƿ���ڴ�ѧ��

			%>
							<tr>
								<td  align="center" colspan="3">
									 <font color="red">�޴�ѧ����Ϣ!</font> </td>
							</tr>
							<%}
			ArrayList al = new ArrayList();
			al = (ArrayList) student.getRS();//�õ�DBUtil�ļ�¼��,���������ArrayList����

			for (int i = 0; i < count; i++) {
				HashMap hm = (HashMap) al.get(i);//����ת��ΪHashMap���ұ���

				%>
							<tr class="css1">
								<td width="192">
									 ѧ ��:
									  <input name="id" type="text" size="15" value="<%=hm.get("id")%>" readonly="readonly">								
								   </td>
								<td width="218">
									 �� ����
									  <input name="name" type="text" id="name" size="15" value="<%=hm.get("name")%>">								
								   </td>

								<%//�ж��Ա�,Ҳ��ֱ��д"value="����
				String m = null;
				if (hm.get("sex").equals("��"))
					m = "��";
				else
					m = "Ů";

				%>
								<td width="164">
									 �Ա�
									  <input type="text" name="sex" size="10" value="<%=m%>" />
									  <font color="red"> *(��/Ů)</font>  </td>
							</tr>
							<tr class="css1">
								<td>
									 ���Һţ�
									  <input name="qinshiid" type="text" size="15" value="<%=hm.get("qinshiid")%>">								
								   </td>
								<td>
									 ��ϵ��ʽ��
									  <input name="longno" type="text" size="15" value="<%=hm.get("longno")%>">								
								   </td>
								<td>
									 �̺�
									  <input name="shortno" type="text" size="15" value="<%=hm.get("shortno")%>">								
								   </td>
							</tr>
							<tr class="css1">
								<td>
									 �������ڣ�
									  <input name="birthday" type="text" size="15" value="<%=hm.get("birthday")%>">								
								   </td>
								<td>
									 �� �ף�
									  <input name="fname" type="text" size="15" value="<%=hm.get("fname")%>">								
								   </td>
								<td>
									 ĸ�ף�
									  <input name="mname" type="text" size="15" value="<%=hm.get("mname")%>">								
								   </td>
							</tr>
							<tr class="css1">
								<td  colspan="3">
									 ��ͥ��ַ��
									  <input name="address" type="text" value="<%=hm.get("address")%>" size="30" maxlength="30" />								
								   </td>
							</tr>

							<%}%>
							
							<%if ((String)session.getAttribute("type")=="������") {
			%>
							<tr class="css1">
								<td>
							   ����ѧ��:									 </td>
								<td> 
								  <input type="text" name="findContact" />
								   </td>
							  <td> 
							    <input type="submit" name="submit" value="����" />							  
							     </td>
							</tr>
							<%}%>
							
							<%if ((String)session.getAttribute("type")=="ѧ��"|| (String)session.getAttribute("type")=="��ί"){
			%>
										<tr align="center"class="css1">
								<td colspan="3">
									
										 
										<input type="button" value=" ��  �� " name="button1" onClick="submit1()" />
										&nbsp;
										<input type="button" name="button2" value="ȡ���޸�" onClick="submit2()" />
									     </td>
							</tr>
				
						<%}%>
</table>
				  <!-- InstanceEndEditable -->
				</td>
			</tr>
			<tr>
				<td height="302" valign="top">
					<table width="100" height="323" border="0" cellpadding="0" cellspacing="0">
						<!--DWLayoutTable-->
						<tr>
							<td width="222" height="302">
								<table width="222" height="323" border="0" cellpadding="0" cellspacing="0" bgcolor="#ECECEC">
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="student.jsp" class="a01">ѧ��������Ϣ����</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="integral.jsp" class="a01">���ֿ��˹���</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="daily.jsp" class="a01">�������ճ��������</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="message.jsp" class="a01">��Ϣ���������԰�</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="popedon.jsp" class="a01">�û�Ȩ�����ù���</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="log.jsp" class="a01">���롢�ǳ�����</a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>
			<tr>
				<td height="112" colspan="4" class="shixian">
					<p align="center">
						Copyright ?2006 All Rights Reserved
						<br />
						��ҵ��ƹ����� ��Ȩ���� ����:biyesheji@163.com
						<br />
					</p>
					<div align="center"></div>
				</td>
			</tr>
		</table>
	</body>
	<!-- InstanceEnd -->
</html>

