package bean;

import java.sql.*;
import java.util.*;
public class JFBean {

  private Connection 	con 	= null;				//数据库连接
  private ResultSet 	rs   	= null;				//原始结果集
  private Statement     stmt      = null;
  //连接参数
  private final String        DBURL   = "jdbc:odbc:bysj";
  private final String        DBUSER  ="sa";
  private final String        DBPASSWORD  ="";

  private ArrayList result = new ArrayList(); //存放结果集
  String[] colName = null;
  private int colLen = 0; //列数
  private String empty	= "";	//替换结果集中的空字符

  public JFBean() {
  }

public void ini() throws SQLException {
    try {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      if ( (con == null) || con.isClosed())
        con = DriverManager.getConnection(DBURL,DBUSER, DBPASSWORD);
      stmt = con.createStatement();
    }
    catch (SQLException e) {
      throw e;
    }catch(Exception e){
      System.out.println("load driver error");
    }

  }

  public ArrayList getRS() {
    return result;
  }


  /**
   * 执行数据查询,结果集以数组(每一行的内容)形式存放在ArrayList中
   *
   * @param sqlStatement String 查询的SQL语句
   * @retrurn rownum
   *
   */
  public int execQuery(String sqlStatement) throws SQLException {
    int recounter = 0;
    clearResult();
    try {
      ini();
      rs = stmt.executeQuery(sqlStatement);
      ResultSetMetaData rsmd = rs.getMetaData();
      String self = null;
      colLen = rsmd.getColumnCount() ;
      while (rs.next()) {
        String[] colValue = new String[colLen];
        for (int i = 0; i < colLen; i++) {
          colValue[i] = ( (self = rs.getString(i + 1 )) == null ?empty :
                         self.trim().length() == 0 ? empty : self.trim());
        }
        result.add(colValue);
        recounter++;
      }
      return recounter;
    }
    catch (SQLException e) {
      throw e;
    }
    finally {
      closeConn();
    }
  }

  /**
   * 执行数据查询,结果集以HashMap(每一行的内容)形式存放在ArrayList中
   *
   * @param sqlStatement String 	查询的SQL语句
   * @retrurn rownum
   */
  public int execQueryName(String sqlStatement) throws SQLException {
    int recounter = 0;
    clearResult();
    try {
      ini();
      rs = stmt.executeQuery(sqlStatement);
      ResultSetMetaData rsmd = rs.getMetaData();
      String self = null;
      colLen = rsmd.getColumnCount() ;
      colName = new String[colLen];
      for (int i = 0; i < colLen; i++) {
        colName[i] = rsmd.getColumnName(i + 1);
      }
      while (rs.next()) {
        HashMap colValue = new HashMap();
        for (int i = 0; i < colLen; i++) {
          colValue.put(colName[i],
                       (self = rs.getString(i + 1 )) == null ? empty :
                       self.trim().length() == 0 ? empty : self.trim());
        }
        result.add(colValue);
        recounter++;
      }
      return recounter;
    }
    catch (SQLException e) {
      throw e;
    }
    finally {
      closeConn();
    }
  }

  /**
   * 执行一条没有返回结果集的SQL
   *
   * @param sqlStatement String SQL脚本
   * @retrurn int 成功与否标志
   *
   */
  public int execUpdate(String sqlStatement) throws SQLException {
    try {
      ini();
      int recounter = stmt.executeUpdate(sqlStatement);
      return recounter;
    }
    catch (SQLException e) {
      throw e;
    }
    finally {
      closeConn();
    }
  }
  /**
   * 清空自定义的结果集
   */
  public void clearResult() {
    if (result.size() > 0)
      result.clear();
  }


  // Release the SQL statement resources
  private void closeConn() throws SQLException {
    try {
      if (con != null) {
        stmt.close();
        con.close();
        stmt = null;
        con = null;
      }
    }
    catch (SQLException e) {
      throw e;
    }
  }




}
