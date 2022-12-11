<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/about.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>班主任管理系统</title>

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
          <td width="222" height="25"  bgcolor="#ECECEC"><div align="center" class="css1" >系统登录</div></td>
        </tr>
    </table></td>
    <td width="12" bgcolor="#FFFFFF"  >&nbsp;</td>
    <td colspan="2" valign="top" bgcolor="#FFFFFF"  ><!-- InstanceBeginEditable name="栏目" -->
      <div align="center" class="css1">日常事务管理</div>
    <!-- InstanceEndEditable --></td>
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
					</form></td>
    <td rowspan="2" bgcolor="#FFFFFF" >&nbsp;</td>
    <td width="557" rowspan="2" valign="top" bgcolor="#FFFFFF" ><!-- InstanceBeginEditable name="内容" -->
      <form name="form2" method="post" action="ok.jsp">
        <table width="100%" height="305"  border="0" cellpadding="0" cellspacing="0">
          <tr class="css1">
            <td colspan="2"><div align="left"></div>
              <div align="left">任务：
                <select name="typeid" id="typeid">
                  <option value="001">下寝室</option>
                  <option value="002">与学生谈心</option>
                  <option value="003">与家长联系</option>
                </select>
            <a href="make.jsp">自制任务</a></div>
			</td>
          </tr>
          <tr class="css1">
            <td colspan="2">时间：
            <input name="dailytime" type="text" id="dailytime" size="20"></td>
          </tr>
          <tr class="css1">
            <td width="50%"><div align="left">地点：
                <input name="address" type="text" id="address">
            </div></td>
            <td width="50%">交谈对象：
              <select name="studentid" size="1" multiple id="studentid">
                  <option value="031">小名</option>
                <option value="043">小刚</option>
                            </select>
              <span style="color: #666666; font-size: 10px">或其家长</span></td>
          </tr>
          <tr class="css1">
            <td colspan="2"><div align="left"></div></td>
          </tr>
          <tr class="css1">
            <td colspan="2"><p align="left">交谈内容</p>
                <p align="left">
                  <textarea name="content" cols="50" rows="5" id="content"></textarea>
              </p></td>
          </tr>
          <tr class="css1">
            <td colspan="2"><div align="left">
<input type="submit" name="Submit" value="添加">
<a href="list.jsp">显示</a>
              </div></td>
          </tr>
        </table>
      </form>
    <!-- InstanceEndEditable --> </td>
    <td width="9" rowspan="2" bgcolor="#FFFFFF" >&nbsp;</td>
  </tr>

  <tr>
    <td height="323" valign="top"  ><table width="100" height="323" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr>
          <td width="222" height="302"><table width="222" height="323" cellpadding="0" cellspacing="0" bgcolor="#ECECEC">
              <tr>
                <td   ><div align="center" class="a01"><a href="student.jsp" class="css1">学生基本信息管理</a></div></td>
              </tr>
              <tr>
                <td ><div align="center" class="a01"><a href="integral.jsp" class="a01">积分考核管理</a></div></td>
              </tr>
              <tr>
                <td  ><div align="center" class="a01"><a href="daily.jsp" class="a01">班主任日常事务管理</a></div></td>
              </tr>
              <tr>
                <td   ><div align="center" class="a01"><a href="message.jsp" class="a01">消息公布、留言板</a></div></td>
              </tr>
              <tr>
                <td ><div align="center" class="a01"><a href="popedon.jsp" class="a01">用户权限设置管理</a></div></td>
              </tr>
              <tr>
                <td  ><div align="center" class="a01"><a href="log.jsp" class="a01">登入、登出管理</a></div></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
  <tr  >
    <td height="112" colspan="4" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="800" height="112" valign="top" bgcolor="#FFFFFF" class="shixian"><p align="center"><img src="../image/di%20拷贝.jpg" width="800" height="11"><br>
          <br>
          <span class="css1">Copyright ?2006 All Rights Reserved<br />
            毕业设计工作组 版权所有 邮箱:biyesheji@163.com </span><br />
        </p>          </td>
  </tr>

    </table>
    </td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>

