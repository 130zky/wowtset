<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="bean.JFBean"%>
<html>
	<head>
		<title>
			modify
		</title>
	</head>
	<jsp:useBean id="modify" scope="page" class="bean.JFBean" />
	<body bgcolor="#ffffff">
		<form method="post" action="modify.jsp">
			<%//设置编码
			request.setCharacterEncoding("GBK");
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String sex = request.getParameter("sex");
			String qinshiid = request.getParameter("qinshiid");
			String longno = request.getParameter("longno");
			String shortno = request.getParameter("shortno");
			String birthday = request.getParameter("birthday");
			String fname = request.getParameter("fname");
			String mname = request.getParameter("mname");
			String address = request.getParameter("address");
			//拼成SQL语句
			String sql = "update student set name='" + name + "'," + "sex='"
					+ sex + "'," + "qinshiid='" + qinshiid + "'," + "longno='"
					+ longno + "'," + "shortno='" + shortno + "',"
					+ "birthday='" + birthday + "'," + "fname='" + fname + "',"
					+ "mname='" + mname + "'," + "address='" + address
					+ "' where id='" + id + "'";
			//执行更新
			int count = modify.execUpdate(sql);
			if (count > 0) {
				out.print("<script>alert('update successful!')</script>");
				out.print("<script>window.location='student.jsp'</script>");
				//response.sendRedirect("student.jsp");
			}

		%>
		</form>
	</body>
</html>
