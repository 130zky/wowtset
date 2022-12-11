package bean;

import java.io.IOException;

import java.sql.*;

import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html；charset=gb2312");
		String action = request.getParameter("action");

		// 登陆
		if (action.equals("login")) {
			logIn(request, response);
		}
		// 登出
		if (action.equals("logout")) {
			logOut(request, response);
		}
		//添加记录
		if (action.equals("add")) {
			addOper(request, response);
		} 
		//更新记录
		 if (action.equals("update")) {
			updateOper(request, response);
		} 
		//删除记录
		 if (action.equals("del")) {
			delOper(request, response);
		}

		// 留言
		if (action.equals("message")) {
			message(request, response);
		}

	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request,response);
	}

	// 处理字符串方法
	public String getString(String s) {
		if (s == null)
			s = "";
		try {
			byte a[] = s.getBytes("ISO-8859-1");
			s = new String(a);
		} catch (Exception e) {
		}
		return s;
	}

	private void logIn(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con = null;
		Statement sql = null;
		ResultSet rs = null;
		HttpSession session = request.getSession();
		String type = getString(request.getParameter("type"));
		String username = getString(request.getParameter("username"));
		String password = getString(request.getParameter("password"));
		JFBean jf = new JFBean();
		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		} catch (ClassNotFoundException en) {
			en.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:odbc:bysj", "sa", "");
			sql = con.createStatement();
			// 教师登陆
			if (type.equals("teacher")) {
				String condition = "select * from teacher where id = '"
						+ username + "'AND password = '" + password + "'";
				String condition1 = "select teacher.name,classlist.name,auothinfo.typename from teacher,classteacher,classlist,auothinfo where teacher.id = '"
						+ username
						+ "'AND teacher.id =classteacher.teacherid AND classteacher.classid=classlist.id AND teacher.id=auothinfo.id";
				rs = sql.executeQuery(condition);
				if (rs.next()) {
					session.setAttribute("islog", "yes");
					ResultSet rs1 = sql.executeQuery(condition1);
					rs1.next();
					session.setAttribute("name", rs1.getString(1));
					session.setAttribute("class", rs1.getString(2));
					session.setAttribute("type", rs1.getString(3));

					//						 存入日志
					String logid = getString(request.getParameter("username"));
					;// 登入ID
					String logname = (String) session.getAttribute("name");// 登入姓名
					Date time = new Date();
					time.getTime();
					String logtime = time.toString().substring(4, 20);// 登入时间
					String condition2 = "insert into rzgl (rid,rname,intime) values ('"
							+ logid
							+ "'"
							+ ","
							+ "'"
							+ logname
							+ "'"
							+ ","
							+ "'" + logtime + "')";
					jf.execUpdate(condition2);

					response.sendRedirect("Templates/index.jsp");
				} else {
					session.setAttribute("error", "用户名或密码错误，请重新输入！");
					response.sendRedirect("Templates/index.jsp");
				}
			}
			// 学生登陆
			if (type.equals("student")) {
				String condition = "select * from student where id = '"
						+ username + "'AND password = '" + password + "'";
				String condition1 = "select student.name,classlist.name,auothinfo.typename from student,classlist,auothinfo where student.id = '"
						+ username
						+ "'AND  student.classid=classlist.id AND student.id=auothinfo.id";
				rs = sql.executeQuery(condition);
				if (rs.next()) {
					session.setAttribute("islog", "yes");
					ResultSet rs1 = sql.executeQuery(condition1);
					rs1.next();
					session.setAttribute("name", rs1.getString(1));
					session.setAttribute("class", rs1.getString(2));
					session.setAttribute("type", rs1.getString(3));

					//						 存入日志
					String logid = getString(request.getParameter("username"));
					;// 登入ID
					String logname = (String) session.getAttribute("name");// 登入姓名
					Date time = new Date();
					time.getTime();
					String logtime = time.toString().substring(4, 20);// 登入时间
					String condition2 = "insert into rzgl (rid,rname,intime) values ('"
							+ logid
							+ "'"
							+ ","
							+ "'"
							+ logname
							+ "'"
							+ ","
							+ "'" + logtime + "')";
					jf.execUpdate(condition2);

					response.sendRedirect("Templates/index.jsp");
				} else {
					session.setAttribute("error", "用户名或密码错误，请重新输入！");
					response.sendRedirect("Templates/index.jsp");
				}
			}

			// 班委登陆
			if (type.equals("monitor")) {
				String condition = "select * from student where id = '"
						+ username + "'AND password = '" + password + "'";
				String condition1 = "select student.name,classlist.name,auothinfo.typename from student,classlist,auothinfo where student.id = '"
						+ username
						+ "'AND  student.classid=classlist.id AND student.id=auothinfo.id";
				rs = sql.executeQuery(condition);
				if (rs.next()) {
					session.setAttribute("islog", "yes");
					ResultSet rs1 = sql.executeQuery(condition1);
					rs1.next();
					session.setAttribute("name", rs1.getString(1));
					session.setAttribute("class", rs1.getString(2));
					session.setAttribute("type", rs1.getString(3));

					//						 存入日志
					String logid = getString(request.getParameter("username"));
					;// 登入ID
					String logname = (String) session.getAttribute("name");// 登入姓名
					Date time = new Date();
					time.getTime();
					String logtime = time.toString().substring(4, 20);// 登入时间
					String condition2 = "insert into rzgl (rid,rname,intime) values ('"
							+ logid
							+ "'"
							+ ","
							+ "'"
							+ logname
							+ "'"
							+ ","
							+ "'" + logtime + "')";
					jf.execUpdate(condition2);

					response.sendRedirect("Templates/index.jsp");
				} else {
					session.setAttribute("error", "用户名或密码错误，请重新输入！");
					response.sendRedirect("Templates/index.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void logOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//存入日志
		HttpSession session = request.getSession();
		JFBean jf = new JFBean();
		String logid = getString(request.getParameter("username"));// 登入ID
		String logname = (String) session.getAttribute("name");// 登入姓名
		Date time = new Date();
		time.getTime();
		String logtime = time.toString().substring(4, 20);// 登出时间
		String condition = "insert into rzgl (rid,rname,outtime) values ('"
				+ logid + "'" + "," + "'" + logname + "'" + "," + "'" + logtime
				+ "')";
		try {
			jf.execUpdate(condition);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		session = request.getSession();
		session.invalidate();
		response.sendRedirect("Templates/index.jsp");

	}

	private void message(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		JFBean jf = new JFBean();
		String s1 = (String) session.getAttribute("name");// 留言人名字
		String s2 = getString(request.getParameter("textarea"));// 留言内容
		Date date = new Date();
		date.getTime();
		String a = date.toString();
		String s3 = a.substring(4, 20);// 留言时间

		String s = "'" + s3 + "'" + "," + "'" + s2 + "'" + "," + "'" + s1 + "'";
		String condition = "insert into lyb (ltime,lcontent,lid) values " + "("
				+ s + ")";
		try {
			jf.execUpdate(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Templates/message.jsp");
	}

	private void addOper(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String jtime = request.getParameter("jtime");
		String id = request.getParameter("id");
		String wsjf = request.getParameter("wsjf");
		String jljf = request.getParameter("jljf");
		String cqjf = request.getParameter("cqjf");
		String otherjf = request.getParameter("otherjf");
		String infor = request.getParameter("infor");
		String recorder = request.getParameter("recorder");
		String recorderid = request.getParameter("recorderid");
		try {
			JFBean dbutil = new JFBean();

			String condition = "INSERT INTO scoreinfo VALUES" + "(" + "'"
					+ jtime + "','" + id + "'," + wsjf + "," + jljf + ","
					+ cqjf + "," + otherjf + ",'" + infor + "','" + recorder
					+ "','" + recorderid + "')";
			System.out.println(condition);
			dbutil.execUpdate(condition);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		response.sendRedirect("class_integral_list.jsp");
	}

	private void updateOper(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String jtime = request.getParameter("jtime");
		String id = request.getParameter("id");
		String wsjf = request.getParameter("wsjf");
		String jljf = request.getParameter("jljf");
		String cqjf = request.getParameter("cqjf");
		String otherjf = request.getParameter("otherjf");
		String infor = request.getParameter("infor");
		String recorder = request.getParameter("recorder");
		String recorderid = request.getParameter("recorderid");

		try {
			JFBean dbutil = new JFBean();
			String condition = "update scoreinfo set wsjf=" + wsjf + ","
					+ " jljf=" + jljf + "," + " cqjf=" + cqjf + ","
					+ " otherjf=" + otherjf + "," + "infor='" + infor + "',"
					+ "recorder='" + recorder + "'," + "recorderid='"
					+ recorderid + "'" + " where id='" + id + "'";
			System.out.println(condition);
			dbutil.execUpdate(condition);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		response.sendRedirect("class_integral_list.jsp");

	}

	private void delOper(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String[] id = request.getParameterValues("id");

		try {
			if (id != null) {
				String sqlstr = "delete from student where id in (";
				for (int i = 0; i < id.length; i++) {
					sqlstr += "'" + id[i] + "'" + ",";
				}
				sqlstr = sqlstr.substring(0, sqlstr.length() - 1) + ")";
				System.out.println(sqlstr);
				JFBean dbutil = new JFBean();
				dbutil.execUpdate(sqlstr);
			}
			response.sendRedirect("class_integral_list.jsp");
		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

}
