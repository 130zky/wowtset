<%@ page contentType="text/html;charset=gb2312" %>
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
      <div align="center" class="css1">班 级 积 分 管 理</div>
    <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td height="176" valign="top"  ><form id="form1" name="form1" method="post" action="">
      <!-- InstanceBeginEditable name="登陆栏" -->
      <table width="222" border="0" cellpadding="0" cellspacing="0" bgcolor="#ECECEC" >
        <!--DWLayoutTable-->
        <tr  >
          <td height="35" valign="top" class="css1" ><div align="left">登录类型:
            <select name="type">
                    <option>教 师</option>
                    <option>班 委</option>
                    <option>学 生</option>
                </select>
          </div></td>
        </tr>
        <tr  >
          <td height="35" valign="top" class="css1"><div align="left">用户名:
            <input name="username" type="text" size="20" />
          </div></td>
        </tr>
        <tr   >
          <td height="35" valign="top" class="css1" ><div align="left">密 码 :
            <input name="password" type="text" size="20" />
          </div></td>
        </tr>
        <tr >
          <td height="35" valign="top" class="css1"><div align="center">
              <input type="submit" name="Submit" value="提交" />
            &nbsp;&nbsp;
            <input type="reset" name="Submit2" value="重置" />
          </div></td>
        </tr>
        <tr >
          <td height="34" bgcolor="#FFFFFF" class="css1"><!--DWLayoutEmptyCell-->&nbsp;</td>
        </tr>
      </table>
      <!-- InstanceEndEditable -->
    </form></td>
    <td rowspan="2" bgcolor="#FFFFFF" >&nbsp;</td>
    <td width="557" rowspan="2" valign="top" bgcolor="#FFFFFF" ><!-- InstanceBeginEditable name="内容" -->
      <form name="form2" method="post" action="../servlet?action=add">
        <table width="100%" height="345"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr class="css1">
            <td width="14%"><div align="left">时间：

            </div></td>
            <td width="38%"><input type="text" name="jtime"></td>
            <td width="14%"><div align="left">班级编号：

            </div></td>
            <td width="34%"><input type="text" name="id"></td>
          </tr>
          <tr class="css1">
            <td><div align="left">卫生：

            </div></td>
            <td><input type="text" name="wsjf"></td>
            <td><div align="left">纪律：

            </div></td>
            <td><input type="text" name="jljf"></td>
          </tr>
          <tr class="css1">
            <td>出勤：</td>
            <td><input type="text" name="cqjf"></td>
            <td>其他积分：</td>
            <td><input type="text" name="otherjf"></td>
          </tr>
          <tr class="css1">
            <td><div align="left">记录人姓名：

            </div></td>
            <td><input type="text" name="recorder"></td>
            <td><div align="left">记录人编号：

            </div></td>
            <td><input type="text" name="recorderid"></td>
          </tr>
          <tr class="css1">
            <td height="178" colspan="4"><p align="left">描述信息：</p>
                <p align="left">
                  <textarea name="infor" cols="50" rows="5"></textarea>
              </p></td>
          </tr>
          <tr class="css1">
            <td colspan="4"><div align="center">
              <input name="add" type="submit" id="add" value="添加">
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

