<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ page import="bean.JFBean"%>
<html>
	<!-- InstanceBegin template="/Templates/about.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>
			班主任管理系统
		</title>
		<link href="css.css" rel="stylesheet" type="text/css">
		<script type="" language="javascript">
          function submitst()
          {
            if(document.form2.findContact.value==""){
              alert("请输入学生学号");
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
									系统登录
								</div>
							</td>
						</tr>
					</table>
				</td>
				<td width="12" bgcolor="#FFFFFF">&nbsp;
					
				</td>
				<td colspan="2" valign="top" bgcolor="#FFFFFF">
					<!-- InstanceBeginEditable name="栏目" -->
					<div align="center" class="css1">
						系 统 公 告
					</div>
					<!-- InstanceEndEditable -->
				</td>
			</tr>
			<tr>
				<td height="176" valign="top">
					<form id="form" name="form" method="post" action="../servlet?action=login" onsubmit="return check(this);">
						<!-- InstanceBeginEditable name="登陆栏" -->
						<table width="222" border="0" cellpadding="0" cellspacing="0" bgcolor="#ECECEC">
							<!--DWLayoutTable-->

							<%if (session.getAttribute("islog") == null) {%>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="left">
										登录类型:
										<select name="type">
											<option value="teacher">
												教 师
											</option>
											<option value="monitor">
												班 委
											</option>
											<option value="student">
												学 生
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="left">
										用户名:
										<input name="username" type="text" size="20" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="left">
										密 码 :
										<input name="password" type="password" size="20" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="35" valign="top" class="css1">
									<div align="center">
										<input type="submit" name="Submit" value="提交" />
										&nbsp;&nbsp;
										<input type="reset" name="Submit2" value="重置" />
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
							  <td height="35"  valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您的登陆:&nbsp;<%out.print(""+(String)session.getAttribute("name"));%> </td>
							</tr>
							<tr>
							  <td height="35" valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的权限级别: &nbsp;<%out.print(""+(String)session.getAttribute("type"));%></td>
							</tr>
							<tr>
							  <td height="35" valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您所属班级: &nbsp;<%out.print(""+(String)session.getAttribute("class"));%></td>
							</tr>
							<tr>
							  <td valign="top" class="css1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果您要离开请&nbsp;&nbsp;<a href="../servlet?action=logout">退出登陆</a>							  </td>
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
					<!-- InstanceBeginEditable name="内容" -->
					<form name="form2" action="student.jsp" method="POST" onsubmit="return submitst()">
						<table width="574" height="400" >
							<%String find = null;
			String sql = null;

			find = request.getParameter("findContact");//得到查找的内容
			String type = (String) session.getAttribute("type");//得到登入人的身份,是老师,是学生,还是班委
			String name = (String) session.getAttribute("name");//得到登入人的用户名

			//判断是老师查找还是学生登入,并分别分配相应的SQL语句
			if (find == null || find.equals(""))
				sql = "SELECT * FROM student WHERE name = '" + name + "' ";
			else
				sql = "SELECT * FROM student WHERE (id = '" + find + "')";
			int count = student.execQueryName(sql);
			if (count <= 0) {//判断是否存在此学生

			%>
							<tr>
								<td  align="center" colspan="3">
									 <font color="red">无此学生信息!</font> </td>
							</tr>
							<%}
			ArrayList al = new ArrayList();
			al = (ArrayList) student.getRS();//得到DBUtil的记录集,并将其存在ArrayList里面

			for (int i = 0; i < count; i++) {
				HashMap hm = (HashMap) al.get(i);//将其转化为HashMap并且遍历

				%>
							<tr class="css1">
								<td width="192">
									 学 号:
									  <input name="id" type="text" size="15" value="<%=hm.get("id")%>" readonly="readonly">								
								   </td>
								<td width="218">
									 姓 名：
									  <input name="name" type="text" id="name" size="15" value="<%=hm.get("name")%>">								
								   </td>

								<%//判断性别,也可直接写"value="属性
				String m = null;
				if (hm.get("sex").equals("男"))
					m = "男";
				else
					m = "女";

				%>
								<td width="164">
									 性别
									  <input type="text" name="sex" size="10" value="<%=m%>" />
									  <font color="red"> *(男/女)</font>  </td>
							</tr>
							<tr class="css1">
								<td>
									 寝室号：
									  <input name="qinshiid" type="text" size="15" value="<%=hm.get("qinshiid")%>">								
								   </td>
								<td>
									 联系方式：
									  <input name="longno" type="text" size="15" value="<%=hm.get("longno")%>">								
								   </td>
								<td>
									 短号
									  <input name="shortno" type="text" size="15" value="<%=hm.get("shortno")%>">								
								   </td>
							</tr>
							<tr class="css1">
								<td>
									 出生日期：
									  <input name="birthday" type="text" size="15" value="<%=hm.get("birthday")%>">								
								   </td>
								<td>
									 父 亲：
									  <input name="fname" type="text" size="15" value="<%=hm.get("fname")%>">								
								   </td>
								<td>
									 母亲：
									  <input name="mname" type="text" size="15" value="<%=hm.get("mname")%>">								
								   </td>
							</tr>
							<tr class="css1">
								<td  colspan="3">
									 家庭地址：
									  <input name="address" type="text" value="<%=hm.get("address")%>" size="30" maxlength="30" />								
								   </td>
							</tr>

							<%}%>
							
							<%if ((String)session.getAttribute("type")=="班主任") {
			%>
							<tr class="css1">
								<td>
							   输入学号:									 </td>
								<td> 
								  <input type="text" name="findContact" />
								   </td>
							  <td> 
							    <input type="submit" name="submit" value="查找" />							  
							     </td>
							</tr>
							<%}%>
							
							<%if ((String)session.getAttribute("type")=="学生"|| (String)session.getAttribute("type")=="班委"){
			%>
										<tr align="center"class="css1">
								<td colspan="3">
									
										 
										<input type="button" value=" 修  改 " name="button1" onClick="submit1()" />
										&nbsp;
										<input type="button" name="button2" value="取消修改" onClick="submit2()" />
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
												<a href="student.jsp" class="a01">学生基本信息管理</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="integral.jsp" class="a01">积分考核管理</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="daily.jsp" class="a01">班主任日常事务管理</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="message.jsp" class="a01">消息公布、留言板</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="popedon.jsp" class="a01">用户权限设置管理</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" class="a01">
												<a href="log.jsp" class="a01">登入、登出管理</a>
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
						毕业设计工作组 版权所有 邮箱:biyesheji@163.com
						<br />
					</p>
					<div align="center"></div>
				</td>
			</tr>
		</table>
	</body>
	<!-- InstanceEnd -->
</html>

